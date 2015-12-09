Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A0A216FFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661889"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:24 +0200
Message-Id: <d5df55488b78fb2054fd285131a9d35ef1c64dde.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/10] nspr: update to 4.11
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} (93%)

diff --git a/meta/recipes-support/nspr/nspr_4.10.8.bb b/meta/recipes-support/nspr/nspr_4.11.bb
similarity index 93%
rename from meta/recipes-support/nspr/nspr_4.10.8.bb
rename to meta/recipes-support/nspr/nspr_4.11.bb
index bc60018..e579d0b 100644
--- a/meta/recipes-support/nspr/nspr_4.10.8.bb
+++ b/meta/recipes-support/nspr/nspr_4.11.bb
@@ -13,8 +13,11 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
 
 SRC_URI += "file://nspr.pc.in"
 
-SRC_URI[md5sum] = "8d7c5bd0a5b0a7d0e705be66479030a0"
-SRC_URI[sha256sum] = "507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15"
+UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
+
+SRC_URI[md5sum] = "4f24b2fb88ca03b5d6d6931d6a67ef9a"
+SRC_URI[sha256sum] = "cb320a9eee7028275ac0fce7adc39dee36f14f02fd8432fce1b7e1aa5e3685c2"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
@@ -137,8 +140,6 @@ TESTS = " \
     xnotify \
     zerolen"
 
-PR = "r1"
-
 inherit autotools
 
 do_compile_prepend() {
-- 
2.6.2


