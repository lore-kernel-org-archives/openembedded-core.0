Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B71C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6273.1750250619064733432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAutRB010611;
	Wed, 18 Jun 2025 12:43:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790284gkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 12:43:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:33 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Markus Volk <f_l_k@t-online.de>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 6/7] glib-2.0: update 2.84.0 -> 2.84.1
Date: Wed, 18 Jun 2025 18:12:55 +0530
Message-ID: <20250618124256.3261625-6-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX4NXvhmSjwVUj CazmZA4q5aKTKqkbf0S8bu58rr77ZLnHQZCdKdQxpcGSBSjg9aG7roPG9RYWMN+oJpelM3riaEJ 7QaUJ2o1O8rKZjQimzsi9d1Brtu4XyikMDwuBYQZ4iyfu7/3af0QBBS9HVvSMXMmagTaDdHUmdT
 KC6WZ9jox+lvROlURAWzdY3N7MTb5e5OxHN57eMmV17Jep9r2MSqHMQD6MsQUXGP5/IoaxZCxKg 6TCu/7sbVntCNPyhEyew0l1gOLogEUhBy2JfjVfzxXefXf70+FPtOozggoZWrzWCQdcgMi/vUAV W7a+Jj0SfO1m2Wozt0z4FGe7M7Q39ZUqLIekAPtT7gZ1OXD/uE7unpR/dB26uLUpM/c3Y583YJd
 JUmLlEYVCJtlNOgYA8YNgig6ASxc+5oWR3/Asxj6kp8vDLxHSDHa8gnyEHw+JX3AGAH8neFL
X-Proofpoint-GUID: JR0DUXZbgLA8ahYpOPloqsLLhvcajdMN
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=6852b479 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=aiIX5UjjAAAA:8
 a=QX4gbG5DAAAA:8 a=iQbgzQUOMq_IBnEbN_sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: JR0DUXZbgLA8ahYpOPloqsLLhvcajdMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55IAutRB010611
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219005

From: Markus Volk <f_l_k@t-online.de>

- remove backport patch

Overview of changes in GLib 2.84.1, 2025-04-03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix test failure when building against gobject-introspection =E2=89=A51=
.83.4 (#3634,
  work by Philip Withnall)

* Bugs fixed:
  - #3630 2.84.0 build failure on Linux: ../gio/gnetworkmonitornetlink.c:=
47:10:
    fatal error: netlink/netlink_route.h: No such file or directory (Phil=
ip
    Withnall)
  - #3634 test failure with gobject-introspection 1.83.4: warning: elemen=
t
    doc:format from state 3 is unknown, ignoring (Philip Withnall)
  - #3636 gio/trash does not handle special characters well
  - #3642 `g_cancellable_connect()` documentation incorrect (Marco Trevis=
an
    (Trevi=C3=B1o))
  - #3643 g_cancellable_connect(): is it safe to unref cancellable from
    callback? (Marco Trevisan (Trevi=C3=B1o))
  - #3649 Crash with some registry key values in GWin32AppInfo (Philip Wi=
thnall)
  - !4484 Memory sanitizer fixes
  - !4489 gobject: Be consistent in using atomic logic to handle the
    GParamSpecPool
  - !4541 gsettings: Port docs to gi-docgen format, add missing annotatio=
ns and
    make various improvements
  - !4544 tests: Don't install runner scripts without installed_tests
  - !4545 Update French translation
  - !4547 Update Catalan translation
  - !4548 Update Turkish translation
  - !4551 Updated Danish translation
  - !4552 Update Persian translation
  - !4553 docs: Document GSignalFlags members added after 2.0
  - !4554 Update Indonesian translation
  - !4555 tests: Add a test for g_object_freeze_notify() being called too=
 often
  - !4557 gfileinfo: Slightly expand docs for
    g_file_info_get_attribute_as_string()
  - !4558 gi: Dynamically set doc-format
  - !4561 tests: Various fixes to create temporary files in /tmp rather t=
han the
    build directory
  - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
  - !4563 giounix-private: Fix macro for checking for epoll_create1()
  - !4565 Fix LGPL in header
  - !4567 gutils: make documentation of g_set_prgname() clearer
  - !4568 docs: Add some detail
  - !4569 Update Romanian translation
  - !4570 gspawn-win32: Fix potential integer overflows in argv handling
  - !4571 gvarianttype: Improve docs on type validation

* Translation updates:
  - Catalan (Jordi Mas)
  - Danish (Ask Hjorth Larsen)
  - French (Vincent Chatelain)
  - Indonesian (Andika Triwidada)
  - Persian (Danial Behzadi)
  - Romanian (Antonio Marin)
  - Turkish (Sabri =C3=9Cnal)

(From OE-Core rev: 676b9acbe94f055a351da3bdcfbe457411e1877c)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 ...664e6f1a29e0d5f301979f6d168b08435a61.patch | 75 -------------------
 ...l_2.84.0.bb =3D> glib-2.0-initial_2.84.1.bb} |  0
 ...{glib-2.0_2.84.0.bb =3D> glib-2.0_2.84.1.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 4 files changed, 1 insertion(+), 77 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f3=
01979f6d168b08435a61.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.0.bb =3D> glib-=
2.0-initial_2.84.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.0.bb =3D> glib-2.0_2.84=
.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6=
d168b08435a61.patch b/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5=
f301979f6d168b08435a61.patch
deleted file mode 100644
index 28bce02dc3..0000000000
--- a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08=
435a61.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From aee0664e6f1a29e0d5f301979f6d168b08435a61 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 10 Mar 2025 15:21:15 +0000
-Subject: [PATCH] girparser: Ignore new doc:format element in GIR files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-As of gobject-introspection 1.83.2, a new `<doc:format name=3D"=E2=80=A6=
"/>`
-element is supported (as a child of `<repository>`) in GIR files.
-
-For the moment, this information isn=E2=80=99t needed in libgirepository=
 =E2=80=94 but
-the GIR parser does have to know about the element in order to not throw
-an error claiming it=E2=80=99s invalid.
-
-This is a slightly tweaked version of the code added to
-gobject-introspection.git in commit
-9544cd6c962fab2c3203898779948309833e2439 by Corentin No=C3=ABl
-<corentin.noel@collabora.com>, reformatted slightly to fit in with
-GLib=E2=80=99s style guidelines.
-
-This is backwards compatible and does not require a new
-gobject-introspection version.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3634
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
aee0664e6f1a29e0d5f301979f6d168b08435a61.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- girepository/girparser.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/girepository/girparser.c b/girepository/girparser.c
-index 63143718d9..be88d871a4 100644
---- a/girepository/girparser.c
-+++ b/girepository/girparser.c
-@@ -107,7 +107,8 @@ typedef enum
-   STATE_ALIAS,
-   STATE_TYPE,
-   STATE_ATTRIBUTE,
--  STATE_PASSTHROUGH
-+  STATE_PASSTHROUGH,
-+  STATE_DOC_FORMAT,  /* 35 */
- } ParseState;
-=20
- typedef struct _ParseContext ParseContext;
-@@ -3159,6 +3160,11 @@ start_element_handler (GMarkupParseContext  *cont=
ext,
-           state_switch (ctx, STATE_PASSTHROUGH);
-           goto out;
-         }
-+      else if (strcmp ("doc:format", element_name) =3D=3D 0)
-+        {
-+          state_switch (ctx, STATE_DOC_FORMAT);
-+          goto out;
-+        }
-       break;
-=20
-     case 'e':
-@@ -3843,6 +3849,10 @@ end_element_handler (GMarkupParseContext  *contex=
t,
-           state_switch (ctx, ctx->prev_state);
-         }
-       break;
-+    case STATE_DOC_FORMAT:
-+      if (require_end_element (context, ctx, "doc:format", element_name=
, error))
-+        state_switch (ctx, STATE_REPOSITORY);
-+      break;
-=20
-     case STATE_PASSTHROUGH:
-       ctx->unknown_depth -=3D 1;
---=20
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 2cc48f0a06..d00bfe4c65 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -229,13 +229,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
-           file://aee0664e6f1a29e0d5f301979f6d168b08435a61.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "f8823600cb85425e2815cfad82ea20fdaa538482ab74e729=
3d58b3f64a5aff6a"
+SRC_URI[sha256sum] =3D "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab=
6bb73396bf30789a"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.40.0


