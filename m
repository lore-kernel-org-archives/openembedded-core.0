Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA7A6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707063970"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:13 +0200
Message-Id: <60df677e0c4e344460b5a6ad0d11bc79f8579763.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/20] libidn: add native and nativesdk support
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:01 -0000

This is needed because gnutls now requires libidn.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/libidn/libidn_0.6.14.bb | 3 +++
 meta/recipes-extended/libidn/libidn_1.32.bb   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index 4df1d08..c681560 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -31,3 +31,6 @@ do_install_append() {
 	rm -rf ${D}${libdir}/Libidn.dll
 	rm -rf ${D}${datadir}/emacs
 }
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta/recipes-extended/libidn/libidn_1.32.bb b/meta/recipes-extended/libidn/libidn_1.32.bb
index d9ee346..4d6e885 100644
--- a/meta/recipes-extended/libidn/libidn_1.32.bb
+++ b/meta/recipes-extended/libidn/libidn_1.32.bb
@@ -32,3 +32,6 @@ EXTRA_OECONF = "--disable-csharp"
 do_install_append() {
 	rm -rf ${D}${datadir}/emacs
 }
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.6.2


