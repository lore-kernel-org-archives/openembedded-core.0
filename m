Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94A1CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 06:53:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15014.1756364008295764702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 23:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q3iOvnC4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0335805c8a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S5iiZj2229758
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vMyDYEAez83nNHjZRLyL
	8tpeOqMaImoqRqOjEKdNUEo=; b=Q3iOvnC4jf/y1QxL2u0oJzIY858qD7DOkhYi
	R6IeQdlb4P6c5SOWn9cL11RYOIVuGQkKitdfVDxKwu0xN7vdzx+pp6mwhgkm7zey
	WXoDRcZQhHTIaeZiaCn9fI+skl7tPw7ZL+Xj8DKar03Czzbzg3dNT5YDiCT06a4Y
	bvcEKL4GSoMwkF0HzdJcgxQYiy7YeGHmO32WYx/Be9TO1kUohEl5gDqnrvtk6TrF
	6XjRDKkNN5pmCXhgqI4Sfa6ZlUJ0UwUg265RNbZ5GQl7Ibp+vTAn/KegCooqXLA7
	pi0DhC5W+XGtKNdiHoxejFP4Em+WSW0iJ9lZi0ny1OCgspPXyQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1dhw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:53:26 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 Aug 2025 23:53:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] tiff: update 4.6.0 -> 4.7.0
Date: Thu, 28 Aug 2025 12:22:50 +0530
Message-ID: <20250828065250.3327228-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: M0WCc5-937X5GNOmMLkVDJn_q2Q5iwDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA1NiBTYWx0ZWRfX0QPVJNHhuoDi
 sJMzApNWs+OcB5R26z5OQKKx6M+z/6vtUweUm7rsudifUUNeV/nxkjAlb2kGkSrpdtklmJyynQJ
 uTLRErXUzFkJBJwQSAYTwHwGc28l3D7e3eTbNhY/UTszWnULxJXyJEkMnyvJwSAErhA3JNJaD/9
 XY2uGWCi86aPzmvD1giI7It1C4Ny/C0jGLJUTFjklOCpgIcF4wO6vBVFhTPvHXy49W83MASOFRa
 aBgmOy6efNQq/jbNKW3Hn+Kv8iygiZLp8dDI7KoQNLV7ECS8ptLF4uzqGA+NsjJ32Wu8OJSm7oE
 N4Whv5Godx823wXdQaE2lS5fLU7r5qwT1FIEABWuz+wZe0scZ67A9nE1W5KETs=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68affce6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=64SeUrbXAAAA:8 a=fk1lIlRQAAAA:8 a=HTDimwkPQ-oSuU4pdEQA:9
 a=2RI-P_CD-DMi8uG0:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-MsOl3yrPmtpHepMbiy1:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=HLuTerElwpHB00cmObDT:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-GUID: M0WCc5-937X5GNOmMLkVDJn_q2Q5iwDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57S5iiZj2229758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222545

From: Alexander Kanavin <alex@linutronix.de>

Drop all CVE backports.

(From OE-Core rev: 1c227185c7a89df04f81c08881fd5e28aa185a21)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2023-52355-0001.patch    | 238 ------------------
 .../libtiff/tiff/CVE-2023-52355-0002.patch    |  28 ---
 .../libtiff/tiff/CVE-2023-52356.patch         |  49 ----
 .../libtiff/tiff/CVE-2023-6228.patch          |  31 ---
 ...277-Apply-1-suggestion-s-to-1-file-s.patch |  27 --
 ...ompare-data-size-of-some-tags-data-2.patch |  36 ---
 ...-compare-data-size-of-some-tags-data.patch | 162 ------------
 .../libtiff/tiff/CVE-2024-7006.patch          |  65 -----
 .../libtiff/{tiff_4.6.0.bb =3D> tiff_4.7.0.bb}  |  15 +-
 9 files changed, 3 insertions(+), 648 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0=
001.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0=
002.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.p=
atch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.pa=
tch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Ap=
ply-1-suggestion-s-to-1-file-s.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At=
-image-reading-compare-data-size-of-some-tags-data-2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At=
-image-reading-compare-data-size-of-some-tags-data.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.pa=
tch
 rename meta/recipes-multimedia/libtiff/{tiff_4.6.0.bb =3D> tiff_4.7.0.bb=
} (79%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.pat=
ch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
deleted file mode 100644
index f5520fcafd..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
+++ /dev/null
@@ -1,238 +0,0 @@
-From 335947359ce2dd3862cd9f7c49f92eba065dfed4 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Thu, 1 Feb 2024 13:06:08 +0000
-Subject: [PATCH] manpage: Update TIFF documentation about TIFFOpenOption=
s.rst
- and TIFFOpenOptionsSetMaxSingleMemAlloc() usage and some other small fi=
xes.
-
-CVE: CVE-2023-52355
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3=
35947359ce2dd3862cd9f7c49f92eba065dfed4]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- doc/functions/TIFFDeferStrileArrayWriting.rst |  5 +++
- doc/functions/TIFFError.rst                   |  3 ++
- doc/functions/TIFFOpen.rst                    | 13 +++---
- doc/functions/TIFFOpenOptions.rst             | 44 ++++++++++++++++++-
- doc/functions/TIFFStrileQuery.rst             |  5 +++
- doc/libtiff.rst                               | 31 ++++++++++++-
- 6 files changed, 91 insertions(+), 10 deletions(-)
-
-diff --git a/doc/functions/TIFFDeferStrileArrayWriting.rst b/doc/functio=
ns/TIFFDeferStrileArrayWriting.rst
-index 60ee746..705aebc 100644
---- a/doc/functions/TIFFDeferStrileArrayWriting.rst
-+++ b/doc/functions/TIFFDeferStrileArrayWriting.rst
-@@ -61,6 +61,11 @@ Diagnostics
- All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
- Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR=
` routine.
-=20
-+Note
-+----
-+
-+This functionality was introduced with libtiff 4.1.
-+
- See also
- --------
-=20
-diff --git a/doc/functions/TIFFError.rst b/doc/functions/TIFFError.rst
-index 99924ad..cf4b37c 100644
---- a/doc/functions/TIFFError.rst
-+++ b/doc/functions/TIFFError.rst
-@@ -65,6 +65,9 @@ or :c:func:`TIFFClientOpenExt`.
- Furthermore, a **custom defined data structure** *user_data* for the
- error handler can be given along.
-=20
-+Please refer to :doc:`/functions/TIFFOpenOptions` for how to setup the
-+application-specific handler introduced with libtiff 4.5.
-+
- Note
- ----
-=20
-diff --git a/doc/functions/TIFFOpen.rst b/doc/functions/TIFFOpen.rst
-index db79d7b..adc474f 100644
---- a/doc/functions/TIFFOpen.rst
-+++ b/doc/functions/TIFFOpen.rst
-@@ -94,8 +94,9 @@ TIFF structure without closing the file handle and aft=
erwards the
- file should be closed using its file descriptor *fd*.
-=20
- :c:func:`TIFFOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFOpen`=
,
--but options, such as re-entrant error and warning handlers may be passe=
d
--with the *opts* argument. The *opts* argument may be NULL.=20
-+but options, such as re-entrant error and warning handlers and a limit =
in byte
-+that libtiff internal memory allocation functions are allowed to reques=
t per call
-+may be passed with the *opts* argument. The *opts* argument may be NULL.
- Refer to :doc:`TIFFOpenOptions` for allocating and filling the *opts* a=
rgument
- parameters. The allocated memory for :c:type:`TIFFOpenOptions`
- can be released straight after successful execution of the related
-@@ -105,9 +106,7 @@ can be released straight after successful execution =
of the related
- but opens a TIFF file with a Unicode filename.
-=20
- :c:func:`TIFFFdOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFFdO=
pen`,
--but options, such as re-entrant error and warning handlers may be passe=
d
--with the *opts* argument. The *opts* argument may be NULL.=20
--Refer to :doc:`TIFFOpenOptions` for filling the *opts* argument.
-+but options argument *opts* like for :c:func:`TIFFOpenExt` can be passe=
d.
-=20
- :c:func:`TIFFSetFileName` sets the file name in the tif-structure
- and returns the old file name.
-@@ -326,5 +325,5 @@ See also
-=20
- :doc:`libtiff` (3tiff),
- :doc:`TIFFClose` (3tiff),
--:doc:`TIFFStrileQuery`,
--:doc:`TIFFOpenOptions`
-\ No newline at end of file
-+:doc:`TIFFStrileQuery` (3tiff),
-+:doc:`TIFFOpenOptions`
-diff --git a/doc/functions/TIFFOpenOptions.rst b/doc/functions/TIFFOpenO=
ptions.rst
-index 5c67566..23f2975 100644
---- a/doc/functions/TIFFOpenOptions.rst
-+++ b/doc/functions/TIFFOpenOptions.rst
-@@ -38,12 +38,17 @@ opaque structure and returns a :c:type:`TIFFOpenOpti=
ons` pointer.
- :c:func:`TIFFOpenOptionsFree` releases the allocated memory for
- :c:type:`TIFFOpenOptions`. The allocated memory for :c:type:`TIFFOpenOp=
tions`
- can be released straight after successful execution of the related
--TIFF open"Ext" functions like :c:func:`TIFFOpenExt`.
-+TIFFOpen"Ext" functions like :c:func:`TIFFOpenExt`.
-=20
- :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` sets parameter for the
- maximum single memory limit in byte that ``libtiff`` internal memory al=
location
- functions are allowed to request per call.
-=20
-+.. note::
-+    However, the ``libtiff`` external functions :c:func:`_TIFFmalloc`
-+    and :c:func:`_TIFFrealloc` **do not apply** this internal memory
-+    allocation limit set by :c:func:`TIFFOpenOptionsSetMaxSingleMemAllo=
c`!
-+
- :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` sets the function pointer =
to
- an application-specific and per-TIFF handle (re-entrant) error handler.
- Furthermore, a pointer to a **custom defined data structure** *errorhan=
dler_user_data*=20
-@@ -55,6 +60,43 @@ The *errorhandler_user_data* argument may be NULL.
- :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` but for the warning handle=
r,
- which is invoked through  :c:func:`TIFFWarningExtR`
-=20
-+Example
-+-------
-+
-+::
-+
-+    #include "tiffio.h"
-+
-+    typedef struct MyErrorHandlerUserDataStruct
-+    {
-+        /* ... any user data structure ... */
-+    } MyErrorHandlerUserDataStruct;
-+
-+    static int myErrorHandler(TIFF *tiff, void *user_data, const char *=
module,
-+                          const char *fmt, va_list ap)
-+    {
-+        MyErrorHandlerUserDataStruct *errorhandler_user_data =3D
-+            (MyErrorHandlerUserDataStruct *)user_data;
-+        /*... code of myErrorHandler ...*/
-+        return 1;
-+    }
-+
-+
-+    main()
-+    {
-+        tmsize_t limit =3D (256 * 1024 * 1024);
-+        MyErrorHandlerUserDataStruct user_data =3D { /* ... any data ..=
. */};
-+
-+        TIFFOpenOptions *opts =3D TIFFOpenOptionsAlloc();
-+        TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
-+        TIFFOpenOptionsSetErrorHandlerExtR(opts, myErrorHandler, &user_=
data);
-+        TIFF *tif =3D TIFFOpenExt("foo.tif", "r", opts);
-+        TIFFOpenOptionsFree(opts);
-+        /* ... go on here ... */
-+
-+        TIFFClose(tif);
-+    }
-+
- Note
- ----
-=20
-diff --git a/doc/functions/TIFFStrileQuery.rst b/doc/functions/TIFFStril=
eQuery.rst
-index f8631af..7931fe4 100644
---- a/doc/functions/TIFFStrileQuery.rst
-+++ b/doc/functions/TIFFStrileQuery.rst
-@@ -66,6 +66,11 @@ Diagnostics
- All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
- Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR=
` routine.
-=20
-+Note
-+----
-+
-+This functionality was introduced with libtiff 4.1.
-+
- See also
- --------
-=20
-diff --git a/doc/libtiff.rst b/doc/libtiff.rst
-index 6a0054c..d96a860 100644
---- a/doc/libtiff.rst
-+++ b/doc/libtiff.rst
-@@ -90,11 +90,15 @@ compatibility on machines with a segmented architect=
ure.
- :c:func:`realloc`, and :c:func:`free` routines in the C library.)
-=20
- To deal with segmented pointer issues ``libtiff`` also provides
--:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemmove=
`
-+:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemcmp`
- routines that mimic the equivalent ANSI C routines, but that are
- intended for use with memory allocated through :c:func:`_TIFFmalloc`
- and :c:func:`_TIFFrealloc`.
-=20
-+With ``libtiff`` 4.5 a method was introduced to limit the internal
-+memory allocation that functions are allowed to request per call
-+(see  :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` and :c:func:`TIFFOp=
enExt`).
-+
- Error Handling
- --------------
-=20
-@@ -106,6 +110,10 @@ routine that can be specified with a call to :c:fun=
c:`TIFFSetErrorHandler`.
- Likewise warning messages are directed to a single handler routine
- that can be specified with a call to :c:func:`TIFFSetWarningHandler`
-=20
-+Further application-specific and per-TIFF handle (re-entrant) error han=
dler
-+and warning handler can be set. Please refer to :doc:`/functions/TIFFEr=
ror`
-+and :doc:`/functions/TIFFOpenOptions`.
-+
- Basic File Handling
- -------------------
-=20
-@@ -139,7 +147,7 @@ a ``"w"`` argument:
-     main()
-     {
-         TIFF* tif =3D TIFFOpen("foo.tif", "w");
--        ... do stuff ...
-+        /* ... do stuff ... */
-         TIFFClose(tif);
-     }
-=20
-@@ -157,6 +165,25 @@ to always call :c:func:`TIFFClose` or :c:func:`TIFF=
Flush` to flush any
- buffered information to a file.  Note that if you call :c:func:`TIFFClo=
se`
- you do not need to call :c:func:`TIFFFlush`.
-=20
-+.. warning::
-+
-+    In order to prevent out-of-memory issues when opening a TIFF file
-+    :c:func:`TIFFOpenExt` can be used and then the maximum single memor=
y
-+    limit in byte that ``libtiff`` internal memory allocation functions
-+    are allowed to request per call can be set with
-+    :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
-+
-+Example
-+
-+::
-+
-+    tmsize_t limit =3D (256 * 1024 * 1024);
-+    TIFFOpenOptions *opts =3D TIFFOpenOptionsAlloc();
-+    TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
-+    TIFF *tif =3D TIFFOpenExt("foo.tif", "w", opts);
-+    TIFFOpenOptionsFree(opts);
-+    /* ... go on here ... */
-+
- TIFF Directories
- ----------------
-=20
---=20
-2.40.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.pat=
ch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
deleted file mode 100644
index 19a1ef727a..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 16ab4a205cfc938c32686e8d697d048fabf97ed4 Mon Sep 17 00:00:00 2001
-From: Timothy Lyanguzov <theta682@gmail.com>
-Date: Thu, 1 Feb 2024 11:19:06 +0000
-Subject: [PATCH] Fix typo.
-
-CVE: CVE-2023-52355
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1=
6ab4a205cfc938c32686e8d697d048fabf97ed4]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- doc/libtiff.rst | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/libtiff.rst b/doc/libtiff.rst
-index d96a860..4fedc3e 100644
---- a/doc/libtiff.rst
-+++ b/doc/libtiff.rst
-@@ -169,7 +169,7 @@ you do not need to call :c:func:`TIFFFlush`.
-
-     In order to prevent out-of-memory issues when opening a TIFF file
-     :c:func:`TIFFOpenExt` can be used and then the maximum single memor=
y
--    limit in byte that ``libtiff`` internal memory allocation functions
-+    limit in bytes that ``libtiff`` internal memory allocation function=
s
-     are allowed to request per call can be set with
-     :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/=
meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
deleted file mode 100644
index 75f5d8946a..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 1 Feb 2024 11:38:14 +0000
-Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation=
 of
- col/row (fixes #622)
-
-CVE: CVE-2023-52356
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/5=
1558511bdbbcffdce534db21dbaf5d54b31638a]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- libtiff/tif_getimage.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
-index 41f7dfd..9cd6eee 100644
---- a/libtiff/tif_getimage.c
-+++ b/libtiff/tif_getimage.c
-@@ -3224,6 +3224,13 @@ int TIFFReadRGBAStripExt(TIFF *tif, uint32_t row,=
 uint32_t *raster,
-     if (TIFFRGBAImageOK(tif, emsg) &&
-         TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg))
-     {
-+	if (row >=3D img.height)
-+        {
-+            TIFFErrorExtR(tif, TIFFFileName(tif),
-+                          "Invalid row passed to TIFFReadRGBAStrip().")=
;
-+            TIFFRGBAImageEnd(&img);
-+            return (0);
-+	}
-
-         img.row_offset =3D row;
-         img.col_offset =3D 0;
-@@ -3301,6 +3308,14 @@ int TIFFReadRGBATileExt(TIFF *tif, uint32_t col, =
uint32_t row, uint32_t *raster,
-         return (0);
-     }
-
-+    if (col >=3D img.width || row >=3D img.height)
-+    {
-+        TIFFErrorExtR(tif, TIFFFileName(tif),
-+                      "Invalid row/col passed to TIFFReadRGBATile().");
-+        TIFFRGBAImageEnd(&img);
-+        return (0);
-+    }
-+
-     /*
-      * The TIFFRGBAImageGet() function doesn't allow us to get off the
-      * edge of the image, even to fill an otherwise valid tile.  So we
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/m=
eta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
deleted file mode 100644
index 2020508fdf..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Wed, 17 Jan 2024 06:57:08 +0000
-Subject: [PATCH] codec of input image is available, independently from c=
odec
- check of output image and return with error if not.
-
-Fixes #606.
-
-CVE: CVE-2023-6228
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1=
e7d217a323eac701b134afc4ae39b6bdfdbc96a]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tools/tiffcp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index aff0626..a4f7f6b 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -846,6 +846,8 @@ static int tiffcp(TIFF *in, TIFF *out)
-     if (!TIFFIsCODECConfigured(compression))
-         return FALSE;
-     TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
-+    if (!TIFFIsCODECConfigured(input_compression))
-+	    return FALSE;
-     TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
-     if (input_compression =3D=3D COMPRESSION_JPEG)
-     {
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-s=
uggestion-s-to-1-file-s.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-=
2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
deleted file mode 100644
index 5d15dff1d9..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggesti=
on-s-to-1-file-s.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e1640519208121f916da1772a5efb6ca28971b86 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Tue, 31 Oct 2023 15:04:37 +0000
-Subject: [PATCH 3/3] Apply 1 suggestion(s) to 1 file(s)
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_re=
quests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index fe8d6f8..58a4276 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5306,7 +5306,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFF=
DirEntry *dir,
-     {
-         uint64_t space;
-         uint16_t n;
--        filesize =3D TIFFGetFileSize(tif);
-         if (!(tif->tif_flags & TIFF_BIGTIFF))
-             space =3D sizeof(TIFFHeaderClassic) + 2 + dircount * 12 + 4=
;
-         else
---=20
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-=
reading-compare-data-size-of-some-tags-data-2.patch b/meta/recipes-multim=
edia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-som=
e-tags-data-2.patch
deleted file mode 100644
index 9fc8182fef..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading=
-compare-data-size-of-some-tags-data-2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f500facf7723f1cae725dd288b2daad15e45131c Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Mon, 30 Oct 2023 21:21:57 +0100
-Subject: [PATCH 2/3] At image reading, compare data size of some tags / =
data
- structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) =
with
- file size to prevent provoked out-of-memory attacks.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-See issue #614.
-
-Correct declaration of =E2=80=98filesize=E2=80=99 shadows a previous loc=
al.
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_re=
quests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index c52d41f..fe8d6f8 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5305,7 +5305,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFF=
DirEntry *dir,
-     if (td->td_compression !=3D COMPRESSION_NONE)
-     {
-         uint64_t space;
--        uint64_t filesize;
-         uint16_t n;
-         filesize =3D TIFFGetFileSize(tif);
-         if (!(tif->tif_flags & TIFF_BIGTIFF))
---=20
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-=
reading-compare-data-size-of-some-tags-data.patch b/meta/recipes-multimed=
ia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-=
tags-data.patch
deleted file mode 100644
index d5854a9059..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading=
-compare-data-size-of-some-tags-data.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From b33baa5d9c6aac8ce49b5180dd48e39697ab7a11 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Fri, 27 Oct 2023 22:11:10 +0200
-Subject: [PATCH 1/3] At image reading, compare data size of some tags / =
data
- structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) =
with
- file size to prevent provoked out-of-memory attacks.
-
-See issue #614.
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_re=
quests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 90 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 90 insertions(+)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 2c49dc6..c52d41f 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -1308,6 +1308,21 @@ TIFFReadDirEntryArrayWithLimit(TIFF *tif, TIFFDir=
Entry *direntry,
-     datasize =3D (*count) * typesize;
-     assert((tmsize_t)datasize > 0);
-=20
-+    /* Before allocating a huge amount of memory for corrupted files, c=
heck if
-+     * size of requested memory is not greater than file size.
-+     */
-+    uint64_t filesize =3D TIFFGetFileSize(tif);
-+    if (datasize > filesize)
-+    {
-+        TIFFWarningExtR(tif, "ReadDirEntryArray",
-+                        "Requested memory size for tag %d (0x%x) %" PRI=
u32
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated, tag not read",
-+                        direntry->tdir_tag, direntry->tdir_tag, datasiz=
e,
-+                        filesize);
-+        return (TIFFReadDirEntryErrAlloc);
-+    }
-+
-     if (isMapped(tif) && datasize > (uint64_t)tif->tif_size)
-         return TIFFReadDirEntryErrIo;
-=20
-@@ -5266,6 +5281,20 @@ static int EstimateStripByteCounts(TIFF *tif, TIF=
FDirEntry *dir,
-     if (!_TIFFFillStrilesInternal(tif, 0))
-         return -1;
-=20
-+    /* Before allocating a huge amount of memory for corrupted files, c=
heck if
-+     * size of requested memory is not greater than file size. */
-+    uint64_t filesize =3D TIFFGetFileSize(tif);
-+    uint64_t allocsize =3D (uint64_t)td->td_nstrips * sizeof(uint64_t);
-+    if (allocsize > filesize)
-+    {
-+        TIFFWarningExtR(tif, module,
-+                        "Requested memory size for StripByteCounts of %=
" PRIu64
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated",
-+                        allocsize, filesize);
-+        return -1;
-+    }
-+
-     if (td->td_stripbytecount_p)
-         _TIFFfreeExt(tif, td->td_stripbytecount_p);
-     td->td_stripbytecount_p =3D (uint64_t *)_TIFFCheckMalloc(
-@@ -5807,6 +5836,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uin=
t64_t diroff,
-             dircount16 =3D (uint16_t)dircount64;
-             dirsize =3D 20;
-         }
-+        /* Before allocating a huge amount of memory for corrupted file=
s, check
-+         * if size of requested memory is not greater than file size. *=
/
-+        uint64_t filesize =3D TIFFGetFileSize(tif);
-+        uint64_t allocsize =3D (uint64_t)dircount16 * dirsize;
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(
-+                tif, module,
-+                "Requested memory size for TIFF directory of %" PRIu64
-+                " is greather than filesize %" PRIu64
-+                ". Memory not allocated, TIFF directory not read",
-+                allocsize, filesize);
-+            return 0;
-+        }
-         origdir =3D _TIFFCheckMalloc(tif, dircount16, dirsize,
-                                    "to read TIFF directory");
-         if (origdir =3D=3D NULL)
-@@ -5921,6 +5964,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uin=
t64_t diroff,
-                           "directories not supported");
-             return 0;
-         }
-+        /* Before allocating a huge amount of memory for corrupted file=
s, check
-+         * if size of requested memory is not greater than file size. *=
/
-+        uint64_t filesize =3D TIFFGetFileSize(tif);
-+        uint64_t allocsize =3D (uint64_t)dircount16 * dirsize;
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(
-+                tif, module,
-+                "Requested memory size for TIFF directory of %" PRIu64
-+                " is greather than filesize %" PRIu64
-+                ". Memory not allocated, TIFF directory not read",
-+                allocsize, filesize);
-+            return 0;
-+        }
-         origdir =3D _TIFFCheckMalloc(tif, dircount16, dirsize,
-                                    "to read TIFF directory");
-         if (origdir =3D=3D NULL)
-@@ -5968,6 +6025,8 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint=
64_t diroff,
-             }
-         }
-     }
-+    /* No check against filesize needed here because "dir" should have =
same size
-+     * than "origdir" checked above. */
-     dir =3D (TIFFDirEntry *)_TIFFCheckMalloc(
-         tif, dircount16, sizeof(TIFFDirEntry), "to read TIFF directory"=
);
-     if (dir =3D=3D 0)
-@@ -7164,6 +7223,20 @@ static int TIFFFetchStripThing(TIFF *tif, TIFFDir=
Entry *dir, uint32_t nstrips,
-             return (0);
-         }
-=20
-+        /* Before allocating a huge amount of memory for corrupted file=
s, check
-+         * if size of requested memory is not greater than file size. *=
/
-+        uint64_t filesize =3D TIFFGetFileSize(tif);
-+        uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_t);
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(tif, module,
-+                            "Requested memory size for StripArray of %"=
 PRIu64
-+                            " is greather than filesize %" PRIu64
-+                            ". Memory not allocated",
-+                            allocsize, filesize);
-+            _TIFFfreeExt(tif, data);
-+            return (0);
-+        }
-         resizeddata =3D (uint64_t *)_TIFFCheckMalloc(
-             tif, nstrips, sizeof(uint64_t), "for strip array");
-         if (resizeddata =3D=3D 0)
-@@ -7263,6 +7336,23 @@ static void allocChoppedUpStripArrays(TIFF *tif, =
uint32_t nstrips,
-     }
-     bytecount =3D last_offset + last_bytecount - offset;
-=20
-+    /* Before allocating a huge amount of memory for corrupted files, c=
heck if
-+     * size of StripByteCount and StripOffset tags is not greater than
-+     * file size.
-+     */
-+    uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_t) * 2;
-+    uint64_t filesize =3D TIFFGetFileSize(tif);
-+    if (allocsize > filesize)
-+    {
-+        TIFFWarningExtR(tif, "allocChoppedUpStripArrays",
-+                        "Requested memory size for StripByteCount and "
-+                        "StripOffsets %" PRIu64
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated",
-+                        allocsize, filesize);
-+        return;
-+    }
-+
-     newcounts =3D
-         (uint64_t *)_TIFFCheckMalloc(tif, nstrips, sizeof(uint64_t),
-                                      "for chopped \"StripByteCounts\" a=
rray");
---=20
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch b/m=
eta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
deleted file mode 100644
index 785244bdea..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 8ee0e7d2bdcc1a5a5a3241904b243964ab947b7b Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Fri, 1 Dec 2023 20:12:25 +0100
-Subject: [PATCH] Check return value of _TIFFCreateAnonField().
-
-Fixes #624
-
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/8=
18fb8ce881cf839fbc710f6690aadb992aa0f9e]
-CVE: CVE-2024-7006
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- libtiff/tif_dirinfo.c |  2 +-
- libtiff/tif_dirread.c | 16 ++++++----------
- 2 files changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
-index 0e705e8..4cfdaad 100644
---- a/libtiff/tif_dirinfo.c
-+++ b/libtiff/tif_dirinfo.c
-@@ -887,7 +887,7 @@ const TIFFField *_TIFFFindOrRegisterField(TIFF *tif,=
 uint32_t tag,
-     if (fld =3D=3D NULL)
-     {
-         fld =3D _TIFFCreateAnonField(tif, tag, dt);
--        if (!_TIFFMergeFields(tif, fld, 1))
-+        if (fld =3D=3D NULL || !_TIFFMergeFields(tif, fld, 1))
-             return NULL;
-     }
-=20
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 58a4276..738df9f 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -4275,11 +4275,9 @@ int TIFFReadDirectory(TIFF *tif)
-                                 dp->tdir_tag, dp->tdir_tag);
-                 /* the following knowingly leaks the
-                    anonymous field structure */
--                if (!_TIFFMergeFields(
--                        tif,
--                        _TIFFCreateAnonField(tif, dp->tdir_tag,
--                                             (TIFFDataType)dp->tdir_typ=
e),
--                        1))
-+                const TIFFField *fld =3D _TIFFCreateAnonField(
-+                    tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
-+                if (fld =3D=3D NULL || !_TIFFMergeFields(tif, fld, 1))
-                 {
-                     TIFFWarningExtR(
-                         tif, module,
-@@ -5153,11 +5151,9 @@ int TIFFReadCustomDirectory(TIFF *tif, toff_t dir=
off,
-                             "Unknown field with tag %" PRIu16 " (0x%" P=
RIx16
-                             ") encountered",
-                             dp->tdir_tag, dp->tdir_tag);
--            if (!_TIFFMergeFields(
--                    tif,
--                    _TIFFCreateAnonField(tif, dp->tdir_tag,
--                                         (TIFFDataType)dp->tdir_type),
--                    1))
-+            const TIFFField *fld =3D _TIFFCreateAnonField(
-+                tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
-+            if (fld =3D=3D NULL || !_TIFFMergeFields(tif, fld, 1))
-             {
-                 TIFFWarningExtR(tif, module,
-                                 "Registering anonymous field with tag %=
" PRIu16
---=20
-2.44.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.7.0.bb
similarity index 79%
rename from meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 6bf7010ba2..474fe1e8fd 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -8,18 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d=
6db1386b4689c8121531c3"
=20
 CVE_PRODUCT =3D "libtiff"
=20
-SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2023-6277-At-image-reading-compare-data-size-of-so=
me-tags-data.patch \
-           file://CVE-2023-6277-At-image-reading-compare-data-size-of-so=
me-tags-data-2.patch \
-           file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
-           file://CVE-2023-6228.patch \
-           file://CVE-2023-52355-0001.patch \
-           file://CVE-2023-52355-0002.patch \
-           file://CVE-2023-52356.patch \
-           file://CVE-2024-7006.patch \
-           "
-
-SRC_URI[sha256sum] =3D "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e1088=
0c360a77e4b5d99a"
+SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+
+SRC_URI[sha256sum] =3D "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d=
2e486bcecb6ba976"
=20
 # exclude betas
 UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.40.0


