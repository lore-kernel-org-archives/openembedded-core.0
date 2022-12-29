Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4128C4708E
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.204762.1672319511782018790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 05:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bimu3Mx+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0362fa9fb2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BTDB6Ys011217
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=w13CmxypeYKJGLQvumAbdLidTezkXIoG4uF+uf08Cl4=;
 b=Bimu3Mx+wrAnfyQFfZZplURKDmgFWxGW4A3WlOEaFad/8oAUxec41MYW/BmsqdTaZK7E
 5HOk50lJvjTMTIEbb2k4CuZMhkav8V8j7Isrc98jLem+9ReYvRpHkQxSMJuMheA3/E95
 3YRqBtYN2H4zn192k+cjDAmzDWuLh6gTPL896Ezuenh8odp3mg/Htt2bqvaiCoDr2gJn
 F35siPGZCzRpYO+84I6rNEfqhP1rq4rYGVoiTboWueZZA4xqPFwJ9aTl2tM3NcN31gu0
 qzj1vXyabP/8hwB0GPVz/2uZlB59b9BkgHlOECea6wBdNkmfaNCGIHorbz3s1tlxdwHY OA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk8auxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 29 Dec 2022 05:11:48 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 29 Dec 2022 05:11:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] xorg-lib-common.inc: set default value of XORG_EXT
Date: Thu, 29 Dec 2022 21:11:44 +0800
Message-ID: <20221229131147.26534-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Vac9G4T37F98Ojyss9I0BL1e_rTfxkJF
X-Proofpoint-ORIG-GUID: Vac9G4T37F98Ojyss9I0BL1e_rTfxkJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_06,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=777 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212290109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175098

From: Kai Kang <kai.kang@windriver.com>

It replaced tar.bz2 tar archieves with tar.xz from the middle of 2021 on
page https://www.x.org/releases/individual/lib/. So set the default
value of XORG_EXT with 'tar.xz', and update related recipes accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb        | 3 ++-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb    | 2 --
 meta/recipes-graphics/xorg-lib/libice_1.1.1.bb        | 1 -
 meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb   | 1 -
 meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb       | 1 -
 meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb | 1 -
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb    | 1 -
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb      | 1 -
 meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb       | 1 -
 meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb     | 1 +
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb     | 1 -
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb      | 1 +
 meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb        | 1 -
 meta/recipes-graphics/xorg-lib/libxi_1.8.bb           | 1 +
 meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb   | 1 -
 meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb    | 1 -
 meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb        | 1 -
 meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb       | 1 -
 meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb     | 1 -
 meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb   | 1 -
 meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb       | 1 -
 meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb | 1 -
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb  | 1 -
 meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb         | 1 +
 meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb       | 1 -
 meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb        | 1 -
 meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb    | 1 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc    | 2 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb        | 2 ++
 29 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
index 66172cb30c..3634d53208 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
@@ -15,6 +15,7 @@ DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
+XORG_EXT = "tar.bz2"
+
 SRC_URI[md5sum] = "d2f1f0ec68ac3932dd7f1d9aa0a7a11c"
 SRC_URI[sha256sum] = "253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243"
-
diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
index 297bfbe4e6..056a29af25 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-XORG_EXT = "tar.xz"
-
 SRC_URI[sha256sum] = "c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
index 5c8f732fa3..d5e3d28e06 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
@@ -20,7 +20,6 @@ XORG_PN = "libICE"
 
 BBCLASSEXTEND = "native nativesdk"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
index 309354e872..54bdb08976 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
@@ -7,7 +7,6 @@ require xorg-lib-common.inc
 
 SRC_URI += "file://0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
 
 LICENSE = "MIT & MIT"
diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
index e2c06fd14a..f1b492c39f 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
@@ -17,7 +17,6 @@ PROVIDES = "xau"
 PE = "1"
 
 XORG_PN = "libXau"
-XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
index cd7d56e810..77b3db5cf9 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
@@ -24,5 +24,4 @@ XORG_PN = "libXcomposite"
 
 SRC_URI += " file://change-include-order.patch"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87"
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
index 1d297ecd80..279d6c33dc 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
@@ -23,7 +23,6 @@ PE = "1"
 
 XORG_PN = "libXdamage"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
index a3f9c04e68..bf5d2d6721 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
@@ -19,7 +19,6 @@ PROVIDES = "xdmcp"
 PE = "1"
 
 XORG_PN = "libXdmcp"
-XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
index d4d4119485..7d0597ef1d 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
@@ -19,7 +19,6 @@ PROVIDES = "xext"
 PE = "1"
 
 XORG_PN = "libXext"
-XORG_EXT = "tar.xz"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[sha256sum] = "db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
index 3a8543171e..018138f11d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
@@ -16,5 +16,6 @@ DEPENDS += "virtual/libx11 xorgproto"
 PE = "1"
 
 XORG_PN = "libXfixes"
+XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 59d63e7150..535e7f629e 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 
 XORG_PN = "libXfont2"
-XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 27e686b087..fa6585d6dc 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -15,6 +15,7 @@ PROVIDES = "xfont"
 PE = "1"
 
 XORG_PN = "libXfont"
+XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
index da25b0a05a..ad126d2092 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
@@ -20,7 +20,6 @@ PROVIDES = "xft"
 
 PE = "1"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71"
 
 XORG_PN = "libXft"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
index 2aa75148d1..a6cf9b3002 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
@@ -16,6 +16,7 @@ DEPENDS += "libxext xorgproto libxfixes"
 PE = "1"
 
 XORG_PN = "libXi"
+XORG_EXT = "tar.bz2"
 
 SRC_URI[sha256sum] = "2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
index 966edf6792..421b64e68d 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
@@ -15,7 +15,6 @@ PROVIDES = "xinerama"
 PE = "1"
 
 XORG_PN = "libXinerama"
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
index 6494d5e0f1..58dec8ae95 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
@@ -13,5 +13,4 @@ DEPENDS += "virtual/libx11 xorgproto"
 PE = "1"
 
 BBCLASSEXTEND = "native"
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1"
diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
index 22632aa5a7..3aae4030b7 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
@@ -18,7 +18,6 @@ PROVIDES = "xmu"
 PE = "1"
 
 XORG_PN = "libXmu"
-XORG_EXT = "tar.xz"
 
 LEAD_SONAME = "libXmu"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
index 1eafd8dbf9..2740341807 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
@@ -16,7 +16,6 @@ DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
-XORG_EXT = "tar.xz"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
index b74459263e..98572bd969 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
@@ -16,7 +16,6 @@ DEPENDS += "virtual/libx11 xorgproto libxrender libxext"
 PE = "1"
 
 XORG_PN = "libXrandr"
-XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
index 302cc56e86..e138764dff 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
@@ -18,6 +18,5 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
index cddecbb9d2..72b28d9107 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
@@ -16,5 +16,4 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f"
diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
index b69727b696..1b407f52f0 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
@@ -19,5 +19,4 @@ PE = "1"
 
 XORG_PN = "libXScrnSaver"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe"
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
index 6b9ed20ae7..0a7da938e1 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
@@ -15,7 +15,6 @@ EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
 
 SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
index eef561dbba..f56e106ee1 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
@@ -21,6 +21,7 @@ PROVIDES = "xt"
 PE = "1"
 
 XORG_PN = "libXt"
+XORG_EXT = "tar.bz2"
 
 SRC_URI += "file://libxt_fix_for_x32.patch"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
index 7ed8f3d89d..db0621ba2e 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb
@@ -15,7 +15,6 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
index c587000c28..7f9c5e5cbc 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
@@ -14,6 +14,5 @@ DEPENDS += "libxext xorgproto"
 
 XORG_PN = "libXv"
 
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
index a586159ee3..16fd29ebcd 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb
@@ -15,7 +15,6 @@ DEPENDS += "libxext xorgproto"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
-XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 68137c4147..15c7ecf782 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
-XORG_EXT ?= "tar.bz2"
+XORG_EXT ?= "tar.xz"
 
 SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index 83f11769f5..cd5aedb59d 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -12,6 +12,8 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49347921d4d5268021a999f250edc9ca"
 
+XORG_EXT = "tar.bz2"
+
 SRC_URI += "file://multilibfix.patch"
 
 PE = "1"
-- 
2.17.1


