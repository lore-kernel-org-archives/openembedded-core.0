Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC8A971633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 11:10:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 28 Aug 2015 04:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792759312"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2015 04:10:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 14:12:07 +0300
Message-Id: <1440760327-3449-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssh: Upgrade 7.0p1 -> 7.1p1
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
X-List-Received-Date: Fri, 28 Aug 2015 11:10:29 -0000

This is a bugfix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../openssh/{openssh_7.0p1.bb => openssh_7.1p1.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.0p1.bb => openssh_7.1p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_7.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index 67abe57..eeeb4b4 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -24,8 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "831883f251ac34f0ab9c812acc24ee69"
-SRC_URI[sha256sum] = "fd5932493a19f4c81153d812ee4e042b49bbd3b759ab3d9344abecc2bc1485e5"
+SRC_URI[md5sum] = "8709736bc8a8c253bc4eeb4829888ca5"
+SRC_URI[sha256sum] = "fc0a6d2d1d063d5c66dffd952493d0cda256cad204f681de0f84ef85b2ad8428"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.1.4


