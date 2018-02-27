Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14D3C607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 15:37:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 07:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,401,1515484800"; d="scan'208";a="30117752"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2018 07:37:47 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 948785803CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 07:37:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 17:40:40 +0200
Message-Id: <1519746041-44662-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] webkit: add missing Upstream-Status to patch
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
X-List-Received-Date: Tue, 27 Feb 2018 15:37:47 -0000

Add missing Upstream-Status to the following patch:
        0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

Upstream-Status is fetched from the first commit of the patch:
commit id: 700b846ba0e0f31b06459aee3ebb3ce5f1715918

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
index dfdc116..9fc1421 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -16,6 +16,7 @@ and ends up with compile errors e.g.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Upstream-Status: Pending
 ---
  Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
  Source/WebCore/PlatformGTK.cmake           | 6 +++---
-- 
2.4.0


