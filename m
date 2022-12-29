Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87AEC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.203402.1672319513385340788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 05:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bVdZrRkz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0362fa9fb2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BTD12xt017481
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=CCKyZkKIyZB1I3/zusQyg7sKJfGo/Q4FoP8dickpX1g=;
 b=bVdZrRkzIaa2u+VRuFZ9WlohIdjARLe8NC8i85XMiFw4+qE9yLUlLDzFltEFNcmKidCu
 hsl1EwXv3u6QPZhJPvKBFVat3cPz/ORDgRNJ4qsO5j9ZuPBcoFVpsMn9ZTzmTMRkwU9u
 kZQZBjliswfQ7jk2n3fiFA89DiQ1N4P2/OAG4fCxWLKEP5UTEvcgQz7qgkmz4IAa4NeQ
 FZlrRY7x3tnCV8bUqK6PATGHUFiBcVU8tvZg0bWik+B1badaO2JZK485V9G3YG2Bby+I
 ppfy0O8dZ+W95oLh/DWPhT4y+tOSWWDX/zAN1exu+eebUskzEaTDb1cNNlvFFmdn3mMf BQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk8auxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 05:11:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 29 Dec 2022 05:11:50 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 29 Dec 2022 05:11:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] libx11: 1.8.1 -> 1.8.3
Date: Thu, 29 Dec 2022 21:11:46 +0800
Message-ID: <20221229131147.26534-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221229131147.26534-1-kai.kang@windriver.com>
References: <20221229131147.26534-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: QxlkWK6TEMIGh0fgEPyWWyNLCcPSOYfK
X-Proofpoint-ORIG-GUID: QxlkWK6TEMIGh0fgEPyWWyNLCcPSOYfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_06,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=703 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212290109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175099

From: Kai Kang <kai.kang@windriver.com>

Update libx11 from 1.8.1 to 1.8.3.

* add LICENSE 'ISC' which is added by
  https://github.com/freedesktop/xorg-libX11/commit/a04b84f0
* adjust the ordering according to
  https://www.openembedded.org/wiki/Styleguide#Ordering_and_grouping

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libx11_1.8.1.bb => libx11_1.8.3.bb}      | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.1.bb => libx11_1.8.3.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb
index 9ff196c897..06519df5da 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb
@@ -6,31 +6,29 @@ basic functions of the window system."
 
 require xorg-lib-common.inc
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
+LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d49cdd2b386c5db11ec636d680b7116"
 
-PE = "1"
+DEPENDS += "xorgproto \
+            xtrans \
+            libxcb \
+            xorgproto-native \
+            autoconf-archive \
+            "
 
-# temporarily override SRC_URI which is hard-coded in xorg-lib-common.inc
-# since new versions of packages use a new compression format - .tar.gz
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
+PROVIDES = "virtual/libx11"
 
-SRC_URI += "file://disable_tests.patch \
-            file://0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch \
-           "
-SRC_URI[sha256sum] = "1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
-PROVIDES = "virtual/libx11"
+PE = "1"
 
 XORG_PN = "libX11"
-LICENSE = "MIT & MIT & BSD-1-Clause & HPND & HPND-sell-variant"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-DEPENDS += "xorgproto \
-            xtrans \
-            libxcb \
-            xorgproto-native \
-            autoconf-archive \
-           "
+SRC_URI += "file://disable_tests.patch \
+            "
+SRC_URI[sha256sum] = "e31565c84006b6b8e01dc9399c806085739710bc2db2e0930f1511ed9d6585bd"
+
+inherit gettext
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
@@ -40,8 +38,6 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
 PACKAGES =+ "${PN}-xcb"
 
-inherit gettext
-
 FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
-- 
2.17.1


