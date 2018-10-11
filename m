Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3FAE745D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:41:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 01:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,367,1534834800"; d="scan'208";a="271454747"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.232])
	by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2018 01:41:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 16:41:09 +0800
Message-Id: <20181011084111.11619-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] init-install-efi.sh: improve info message
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
X-List-Received-Date: Thu, 11 Oct 2018 08:41:17 -0000

Let users know that the installation was successful and that pressing
Enter would lead to a reboot.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 82b0aa819e..b6855b5aac 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -291,7 +291,7 @@ umount /boot
 
 sync
 
-echo "Remove your installation media, and press ENTER"
+echo "Installation successful. Remove your installation media and press ENTER to reboot."
 
 read enter
 
-- 
2.17.1


