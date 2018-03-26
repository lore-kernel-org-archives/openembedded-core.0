Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 402F2606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:04:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 02:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,364,1517904000"; d="scan'208";a="40645297"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2018 02:04:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9C6655803BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 02:04:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 11:59:22 +0300
Message-Id: <1522054762-537-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] mesa: update Upstream-Status of a patch
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
X-List-Received-Date: Mon, 26 Mar 2018 09:04:37 -0000

replace_glibc_check_with_linux.patch was accepted upstream with
modifications.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
index 98f910f..30f55f4 100644
--- a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
+++ b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
@@ -1,7 +1,7 @@
 From: Otavio Salvador <otavio@ossystems.com.br>
 Subject: [PATCH] endianness check is OS wide and not specific to libc
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [https://cgit.freedesktop.org/mesa/mesa/commit/?id=cbee1bfb34274668a05995b9d4c78ddec9e5ea4c]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-- 
2.4.0


