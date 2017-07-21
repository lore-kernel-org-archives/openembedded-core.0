Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 89EFD783E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 09:09:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 02:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="1175028416"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2017 02:09:09 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 2ACDC580386
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 02:09:06 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 12:09:52 +0300
Message-Id: <1500628192-35279-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] bluez5: update patch status
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
X-List-Received-Date: Fri, 21 Jul 2017 09:09:09 -0000

Update the status of following patch from Pending to Accepted:
        a) 0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
index 7bd5bbc..4679438 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
@@ -9,7 +9,7 @@ From the log in .bcm43xx_load_firmware():
 
 But timespec tm_mode is real is 50us. Correct the delayed timer count.
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=76255f732d68aef2b90d36d9c7be51a9e1739ce7]
 
 Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
 ---
-- 
2.4.0


