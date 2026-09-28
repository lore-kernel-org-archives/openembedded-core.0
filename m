Return-Path: <BhavikkumarGirishbhai.Ronvelia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5819C9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:36:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54487.1790591808277409476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dh8p4BiG;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild14.wrs.com, ip: 205.220.166.238, mailfrom: prvs=4731b4ae23=bronveli@oak-lpgbuild14.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SA1qgT1450029;
	Mon, 28 Sep 2026 03:36:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=P6CM6JGZ8
	q8RJwc6+ZXsTNXQpmZ0kpsWOQbzuWPDCN0=; b=dh8p4BiGYKrOFftXo0fkbO1lG
	Fu8QQuClAOTepDSw5OmBQgjizNPwFnvj25u/RtnHL3j580cHKwnWQmb/8Laz03Fv
	ksUwo6OcQzPAnfd2hGrBmWngDCrPmE7U90IdtLOQpAkXzIvXLgowx5RhlkTqMTNl
	6VM2s2Z3hixx6Q0elDDiUGOJOik1cJBsZE2ZOJx/p/o3rsf4yTvuVJEGBKUiooLv
	dNNXgCsAZUA2T3ai+kv54AN3Ue48AlVQUR+VwryvbjhRM7XZcq0ONZX6mbu+J1a1
	AeAldSd9JJEoHmQe8H/u5aiVnYAICCUz8sFQff5y7sEA5oEP7FHv96rjaOwwQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx9b1t8dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Sep 2026 03:36:43 -0700 (PDT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 28 Sep 2026 03:36:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.46; Mon, 28 Sep 2026 03:36:42 -0700
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 28 Sep 2026 03:36:42 -0700
Received: by oak-lpgbuild14.wrs.com (Postfix, from userid 1762447622)
	id 864116D003C6; Mon, 28 Sep 2026 10:36:42 +0000 (UTC)
From: Bhavikkumar Girishbhai Ronvelia
	<BhavikkumarGirishbhai.Ronvelia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>,
        Bhavikkumar Girishbhai Ronvelia
	<BhavikkumarGirishbhai.Ronvelia@windriver.com>
Subject: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C for locale variant
Date: Mon, 28 Sep 2026 10:36:25 +0000
Message-ID: <20260928103639.816523-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX3HbriOdksR+B
 yNCWpbRiWzIQImytLn9dAWrqIHYLGfeYJaa6jOtEblMttT7EoPqQ2cTjeq/aoAl/xH0XSCtQxAi
 nozYFlBa1VnZsDwKIlUKd8SCBjEja5QP2nDGkBuDOzAa/bPdv8EF1NynVPUywseZEazb9XDfge8
 GqkBdNpSvk6+pdE3R3Dk0yRPOj6nJTHcex6nJJloQ5FruBg1g8SymOBnZytizAypE4DMqS+arQr
 6OrwG7x4e7NzMO1nAexAwJmHPs1Bk7wnBBU9lQKnpvvs5ML0HLmx7+qE7KkYcuv4yWseWjjrfr7
 /lMNWryatYeqexXHBMthn9hOpuI42nfOkKprifF+pCWipn5DSvrLgk7/X0yDsDYz5tIWMWhXjdX
 SEBJN2rfSYStlxvmivPaAJCAQMkT5oRzmphn5LS4Q/IUEifj5p4HfRFd9QOK9dMpey3GAKO+yrn
 ZXdsEJF/3I2cGcVDxAQ==
X-Authority-Analysis: v=2.4 cv=bvrZl0ai c=1 sm=1 tr=0 ts=6aba433b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=qf4gfuq51q0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Mol9FZS-AAAA:20
 a=t7CeM3EgAAAA:8 a=E1vIkGs344s48IwGCw0A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 4mQ_iF77Tc0gZ5QUt7irKs4daMs0vmd1
X-Proofpoint-GUID: 4mQ_iF77Tc0gZ5QUt7irKs4daMs0vmd1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX9IflBeNNL4+f
 nt65P1phZyllU4GqGryTBFKkTCPTpupjCCM6CC5rOpc00m9BWVBcEPIFdZ7YyM7F7hwyqaf6aJm
 pfv8ZXQn+/KwiJt5MsVnoU8et2UWUng974ngBEWoKQcQmbSq8aGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68SA1qgT1450029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246748

Test 3 (locale-specific features) fails because testoutput3C is missing
from the PCRE2 10.48 release tarball. It exists on upstream main branch
and will be in the next release. This carries it until OE bumps to that
version.

On systems where glibc fr_FR locale does not classify extended Latin-1
bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic, none of the existing
expected outputs (3, 3A, 3B) match, causing Test 3 to fail.

testoutput3C was generated on the target by running:
  ./RunTest 3
  cp testoutput8/testoutput3 testdata/testoutput3C

The file is installed into the ptest testdata directory at package time,
following the same pattern as the existing run-ptest file.

Signed-off-by: Bhavikkumar Girishbhai Ronvelia <BhavikkumarGirishbhai.Ron=
velia@windriver.com>
---
 .../libpcre/libpcre2/testoutput3C             | 174 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.48.bb |   2 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C

diff --git a/meta/recipes-support/libpcre/libpcre2/testoutput3C b/meta/re=
cipes-support/libpcre/libpcre2/testoutput3C
new file mode 100644
index 0000000000..05bb20fc44
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/testoutput3C
@@ -0,0 +1,174 @@
+# This set of tests checks local-specific features, using the "fr_FR" lo=
cale.=20
+# It is almost Perl-compatible. When run via RunTest, the locale is edit=
ed to
+# be whichever of "fr_FR", "french", or "fr" is found to exist. There is
+# different version of this file called wintestinput3 for use on Windows=
,
+# where the locale is called "french" and the tests are run using
+# RunTest.bat.=20
+
+#forbid_utf
+
+/^[\w]+/
+\=3D Expect no match
+    =C9cole
+No match
+
+/^[\w]+/locale=3Dfr_FR
+    =C9cole
+No match
+
+/^[\W]+/
+    =C9cole
+ 0: \xc9
+
+/^[\W]+/locale=3Dfr_FR
+\=3D Expect no match
+    =C9cole
+ 0: \xc9
+
+/[\b]/
+    \b
+ 0: \x08
+\=3D Expect no match
+    a
+No match
+
+/[\b]/locale=3Dfr_FR
+    \b
+ 0: \x08
+\=3D Expect no match
+    a
+No match
+
+/^\w+/
+\=3D Expect no match
+    =C9cole
+No match
+
+/^\w+/locale=3Dfr_FR
+    =C9cole
+No match
+
+/(.+)\b(.+)/
+    =C9cole
+ 0: \xc9cole
+ 1: \xc9
+ 2: cole
+
+/(.+)\b(.+)/locale=3Dfr_FR
+\=3D Expect no match
+    =C9cole
+ 0: \xc9cole
+ 1: \xc9
+ 2: cole
+
+/=C9cole/i
+    =C9cole
+ 0: \xc9cole
+\=3D Expect no match
+    =E9cole
+No match
+
+/=C9cole/i,locale=3Dfr_FR
+    =C9cole
+ 0: \xc9cole
+    =E9cole
+No match
+
+/\w/I
+Capture group count =3D 0
+Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
+  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x =
y z
+Subject length lower bound =3D 1
+
+/\w/I,locale=3Dfr_FR
+Capture group count =3D 0
+Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
+  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x =
y z
+Subject length lower bound =3D 1
+
+# All remaining tests are in the fr_FR locale, so set the default.
+
+#pattern locale=3Dfr_FR
+
+/^[\xc8-\xc9]/i
+    =C9cole
+ 0: \xc9
+    =E9cole
+No match
+
+/^[\xc8-\xc9]/
+    =C9cole
+ 0: \xc9
+\=3D Expect no match
+    =E9cole
+No match
+
+/\xb5/i
+    =B5
+ 0: \xb5
+\=3D Expect no match
+    \x9c
+No match
+
+/=FF/i
+    \xff
+ 0: \xff
+\=3D Expect no match
+    y
+No match
+
+/(.)\1/i
+    \xfe\xde
+No match
+
+/\W+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<<=20
+ 0: >>>\xba<<<
+
+/[\W]+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<<=20
+ 0: >>>\xba<<<
+
+/[^[:alpha:]]+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<<=20
+ 0: >>>\xba<<<
+
+/\w+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<<=20
+No match
+
+/[\w]+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<<=20
+No match
+
+/[[:alpha:]]+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<<=20
+No match
+   =20
+/[[:alpha:]][[:lower:]][[:upper:]]/IB
+------------------------------------------------------------------
+        Bra
+        [A-Za-z]
+        [a-z]
+        [A-Z]
+        Ket
+        End
+------------------------------------------------------------------
+Capture group count =3D 0
+Starting code units: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
+  a b c d e f g h i j k l m n o p q r s t u v w x y z
+Subject length lower bound =3D 3
+
+# End of testinput3=20
diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.48.bb
index d5daff03c0..56791171c2 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.48.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.md;md5=3D6720bf3bc=
ff57543b915c2b22e526df0 \
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2=
 \
            file://run-ptest \
+           file://testoutput3C \
 "
=20
 GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
@@ -63,6 +64,7 @@ BBCLASSEXTEND =3D "native nativesdk"
 do_install_ptest() {
     t=3D${D}${PTEST_PATH}
     cp -r ${S}/testdata $t
+    cp ${UNPACKDIR}/testoutput3C $t/testdata/testoutput3C
=20
     for i in pcre2posix_test pcre2grep pcre2test; do
         "${B}/libtool" --mode=3Dinstall install "${B}/$i" "$t"
--=20
2.43.0


