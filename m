Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 710C060C70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 16:31:33 +0000 (UTC)
IronPort-SDR: kFeu4sMMfOKyLNeprJw8gBY6PZkURYm811RyHbnHYtpR+h+cldJM4tK7YE5G9uTy5lDFzifJfp
	1kkhXef3y45g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Mar 2020 09:31:34 -0700
IronPort-SDR: hC5mq4B1Dp0CfNW2XjYJZydynBLi+g8srbJTz+IeTlYKDbJlo78yGO16dF3FO8lgUITUvrJfwr
	MUihFck7jB4A==
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="390745667"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.148.157])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:31:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:31:03 +0800
Message-Id: <3c40cfe7433999272e1698e2c914d6d190f76b63.1584375668.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584375668.git.anuj.mittal@intel.com>
References: <cover.1584375668.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH][zeus 5/7] python3: Upgrade 3.7.6 -> 3.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2020 16:31:33 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

THE LICENSE checksum changed in this update due to copyright notice
added for 2020.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3_3.7.6.bb => python3_3.7.7.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.6.bb => python3_3.7.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.6.bb
rename to meta/recipes-devtools/python/python3_3.7.7.bb
index b33b7028d4..823eb2f8fd 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
-SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
+SRC_URI[md5sum] = "172c650156f7bea68ce31b2fd01fa766"
+SRC_URI[sha256sum] = "06a0a9f1bf0d8cd1e4121194d666c4e28ddae4dd54346de6c343206599f02136"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.24.1


