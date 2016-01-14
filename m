Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF1A607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 15:41:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 07:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="881349626"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 07:41:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 17:38:52 +0200
Message-Id: <1452785932-32245-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] openssh: update to 7.1p2
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
X-List-Received-Date: Thu, 14 Jan 2016 15:41:36 -0000

This fixes a number of security issues.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssh/{openssh_7.1p1.bb => openssh_7.1p2.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.1p1.bb => openssh_7.1p2.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_7.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index d81127c..ac824ee 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -24,8 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "8709736bc8a8c253bc4eeb4829888ca5"
-SRC_URI[sha256sum] = "fc0a6d2d1d063d5c66dffd952493d0cda256cad204f681de0f84ef85b2ad8428"
+SRC_URI[md5sum] = "4d8547670e2a220d5ef805ad9e47acf2"
+SRC_URI[sha256sum] = "dd75f024dcf21e06a0d6421d582690bf987a1f6323e32ad6619392f3bfde6bbd"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.6.4


