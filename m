Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A48C3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.204763.1672319512608113098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 05:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W9oS1N3V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0362fa9fb2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BTCgMfF006977
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=cdRFteNmqfGMSoeIo8Gs3H08yZuLUQCibZbbW6qF/p4=;
 b=W9oS1N3VVgwAmMSZ1Yyv4ECIrPl7hSgi0l2QW5FeREgCazYyh7JqDmSGyiGhmBt28FCE
 8iA7JQ9b+wEWlX5FxVnX1WiWslSLlIhMA8E4T9IN/BUcdBrnH5wRNbR8jErLXZZCkRW6
 lrhkPTcznX5JrC1YixCLhVThOUUZHCLkGRmjLSRjWY+QYgD7TQWMKLjcpOAzoqKFRYQR
 LWYKKwSHarPcyUlMecDXT5CNt75jFy/Q3+58JRhmD2DmlScZWqHV8eYhlFT+RBQ2KMEs
 dr6oYzlOhPkXCi5i/SF3P50+t7dq+IM1MlJ8wnUONTTf7N5V2jhzyaCwvqn8FHGKrXUl 9A== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk8auxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 29 Dec 2022 05:11:49 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 29 Dec 2022 05:11:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] libx11-compose-data: 1.6.8 -> 1.8.3
Date: Thu, 29 Dec 2022 21:11:45 +0800
Message-ID: <20221229131147.26534-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221229131147.26534-1-kai.kang@windriver.com>
References: <20221229131147.26534-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: APiVdM8xSmmZJy9leWIaUK1r4U8pK1mW
X-Proofpoint-ORIG-GUID: APiVdM8xSmmZJy9leWIaUK1r4U8pK1mW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_06,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212290109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175097

From: Kai Kang <kai.kang@windriver.com>

Update libx11-compose-data from 1.6.8 to 1.8.3

* add 'ISC' to LICENSE because of commit
  https://github.com/freedesktop/xorg-libX11/commit/a04b84f0
* adjust ordering according to
  https://www.openembedded.org/wiki/Styleguide#Ordering_and_grouping

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Drop-x11-dependencies.patch          | 12 ++++++++----
 ..._1.6.8.bb => libx11-compose-data_1.8.3.bb} | 19 +++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-compose-data_1.6.8.bb => libx11-compose-data_1.8.3.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
index 46a53a17f2..61af98d95e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
@@ -6,12 +6,16 @@ Subject: [PATCH] Drop x11 dependencies
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Ming Liu <ming.liu@toradex.com>
+
+Rebase for version 1.8.3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  configure.ac | 44 --------------------------------------------
  1 file changed, 44 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5fd706..b42488c 100644
+index 33d0102..50e2d93 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -76,27 +76,8 @@ fi
@@ -20,7 +24,7 @@ index a5fd706..b42488c 100644
  # Checks for pkg-config packages
 -
 -# Always required
--X11_REQUIRES='xproto >= 7.0.17 xextproto xtrans xcb >= 1.11.1'
+-X11_REQUIRES='xproto >= 7.0.25 xextproto xtrans xcb >= 1.11.1'
 -X11_EXTRA_DEPS="xcb >= 1.11.1"
 -
  PKG_PROG_PKG_CONFIG()
@@ -42,7 +46,7 @@ index a5fd706..b42488c 100644
  # Check for dlopen
  AC_MSG_CHECKING([if run-time linking is supported])
  AC_SEARCH_LIBS(dlopen,[dl svld])
-@@ -237,30 +218,6 @@ AC_SUBST(XTHREAD_CFLAGS)
+@@ -255,30 +236,6 @@ AC_SUBST(USE_THREAD_LIBS)
  
  AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
  
@@ -73,7 +77,7 @@ index a5fd706..b42488c 100644
  AC_ARG_ENABLE(xcms,
                AS_HELP_STRING([--disable-xcms],
                  [Disable Xlib support for CMS *EXPERIMENTAL*]),
-@@ -340,7 +297,6 @@ X11_LIBDIR="${libdir}/X11"
+@@ -358,7 +315,6 @@ X11_LIBDIR="${libdir}/X11"
  AX_DEFINE_DIR(X11_LIBDIR, X11_LIBDIR, [Location of libX11 library data])
  AC_SUBST(X11_LIBDIR)
  
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
rename to meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb
index b231f8b34d..e734a215fd 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.3.bb
@@ -8,22 +8,19 @@ python () {
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT & BSD-1-Clause & HPND & HPND-sell-variant"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
+LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d49cdd2b386c5db11ec636d680b7116"
 
-SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
-SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
+XORG_PN = "libX11"
 
 SRC_URI += "file://0001-Drop-x11-dependencies.patch \
            "
 
-XORG_PN = "libX11"
-
-EXTRA_OECONF += "--disable-xkb"
+SRC_URI[sha256sum] = "e31565c84006b6b8e01dc9399c806085739710bc2db2e0930f1511ed9d6585bd"
 
-PACKAGES = "${PN}"
+REQUIRED_DISTRO_FEATURES = ""
 
-FILES:${PN} = "${datadir}/X11/locale ${libdir}/X11/locale"
+EXTRA_OECONF += "--disable-xkb"
 
 do_compile() {
     oe_runmake -C nls
@@ -33,4 +30,6 @@ do_install() {
     oe_runmake DESTDIR=${D} -C nls install
 }
 
-REQUIRED_DISTRO_FEATURES = ""
+PACKAGES = "${PN}"
+
+FILES:${PN} = "${datadir}/X11/locale ${libdir}/X11/locale"
-- 
2.17.1


