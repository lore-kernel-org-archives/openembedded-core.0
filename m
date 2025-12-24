Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACBDE74907
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 03:16:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114010.1766546215143204604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 19:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O9IpAdk2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453656b1c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO0sOAZ689657;
	Tue, 23 Dec 2025 19:16:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nZBEN5xKTUcZqQmV08i5
	67acb88FWGQ1ExH4E01PAqc=; b=O9IpAdk2sAJzE5z+DsoPTaRFc9oWww9zZTQE
	XrNuySAKSwmQEP7qUnHruzXYkjoWIQbhR565QUrjXI5qKAJQbsEJMV3oAAA2Zug6
	yy1s4pZRW0kE2CbK915EX2jors4qDD4Ua8iU2vRJs+0bItOXADWWT/Tz9DmWShru
	+PWXpCfjepWAIJS92o181U1Xt7J8N4zID4eaf6o24r5sz55EJYs2uHfEcUgi4MUe
	esyV7/HFL5D/RIJXNyiAHD+dHOWzet66rkC3aHAH7A3zq8f/PgcmjKL0FP8A+8Lp
	0FN4/VsUs7LI9imFReJ3+p0Q+uu71KFDkBbaExjK9x0l+9Xj3g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hbfwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Dec 2025 19:16:53 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Dec 2025 19:16:53 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Dec 2025 19:16:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [PATCH v2] vte: fix build failed for ppc64
Date: Wed, 24 Dec 2025 11:16:44 +0800
Message-ID: <20251224031644.535650-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfX0kNm3FiTRy2v
 EL/W+o5Y2fHPBz8ymLPvVzufESidbIdNYp3bQgLJ53HlFM7j2tkTeyn04UK0oxuUWybuVdb56lB
 XZRluxv5E9qferzdxZ5TRCVGUfJ3BnCRvbm6hr+r4w2EECj8xyT91uZLx5yzqagK/k6PwKar00l
 DjQcOVJdnE3oHM0fD2Z5Kg+J73HOugxjc5sJ9qRs8HfFWjCdGMPjbjv41cVkMQl6n8dQn8yxUr0
 MixmLmWCQAm2bRzEyV0ZXicJHQMcUoy55vawLM0YvzIxXIpRLiCaZvvlqn5zKf8qRuPkC+hQuIl
 INSqkOdn+/e3fO1I/tnerJPTswxX0+hasuXi4E5zMgFXVHiB+3kfvj/nXV6PS+u12yXa6fjUW5Z
 nqYR9ymS7eD0frQPX2uR6PVVNZ2xzGhRTXfVCHTFCS2XYtA0iwK4H0nkHhkJ14sDHOO6lp9edEL
 kTB+gEpz1FKDcIPGaXw==
X-Proofpoint-GUID: AYjnSSnJFsbo5R3i4IkUU0gnllIhun2_
X-Proofpoint-ORIG-GUID: AYjnSSnJFsbo5R3i4IkUU0gnllIhun2_
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694b5b25 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=3cCsK628I2U-VFOQBP4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228514

$ echo 'MACHINE = "qemuppc64"' >> conf/local.conf
$ bitbake vte
...
|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

The source file subprojects/simdutf/simdutf.cpp is generated by python3 script
singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8 and
ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
--with-utf16 and --with-latin1

[1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-fix-compile-simdutf-failed-on-ppc64.patch | 57 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.82.1.bb        |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch

diff --git a/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
new file mode 100644
index 0000000000..d84630c164
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
@@ -0,0 +1,57 @@
+From 26e55adb9bd03fbd50bdce63aef8effc2d02b634 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 23 Dec 2025 18:28:29 -0800
+Subject: [PATCH] build: fix compile simdutf failed on ppc64
+
+...
+|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
+|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
+|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
+|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
+|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+...
+
+The source file subprojects/simdutf/simdutf.cpp is generated by python3
+script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
+and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
+--with-utf16 and --with-latin1
+
+Add option --with-utf16 and --with-latin1 by default.
+
+[1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2926]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ subprojects/packagefiles/simdutf/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/subprojects/packagefiles/simdutf/meson.build b/subprojects/packagefiles/simdutf/meson.build
+index 330ee89f..ab934c30 100644
+--- a/subprojects/packagefiles/simdutf/meson.build
++++ b/subprojects/packagefiles/simdutf/meson.build
+@@ -41,11 +41,12 @@ simdutf_amalgamate = [
+   '--no-zip',
+   '--no-readme',
+   '--with-utf8',
+-  # '--with-utf16',
++  '--with-utf16',
+   '--with-utf32',
+   # '--with-base64',
+   # '--with-detect-enc',
+   '--with-ascii',
++  '--with-latin1',
+ ]
+ 
+ if get_option('debug')
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index b5d6f2fb62..0a2535f21e 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -19,6 +19,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
+            file://0001-build-fix-compile-simdutf-failed-on-ppc64.patch \
 "
 
 SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
-- 
2.34.1


