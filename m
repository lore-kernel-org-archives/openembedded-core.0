Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE02601AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 11:34:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jun 2013 04:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,821,1363158000"; d="scan'208";a="313691312"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2013 04:34:33 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 14:35:28 +0300
Message-Id: <1370604929-27618-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssh : upgrade to 6.2p2
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
X-List-Received-Date: Fri, 07 Jun 2013 11:34:35 -0000

upgrade from 6.2p1 -> 6.2p2

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../openssh/{openssh-6.2p1 => openssh-6.2p2}/init  |    0
 .../{openssh-6.2p1 => openssh-6.2p2}/nostrip.patch |    0
 .../openssh-CVE-2011-4327.patch                    |    0
 .../{openssh-6.2p1 => openssh-6.2p2}/ssh_config    |    0
 .../openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd  |    0
 .../{openssh-6.2p1 => openssh-6.2p2}/sshd_config   |    0
 .../openssh/{openssh_6.2p1.bb => openssh_6.2p2.bb} |    5 +++--
 7 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.2p1.bb => openssh_6.2p2.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/init
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.2p2/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.2p2/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/sshd b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p1.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_6.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index 20502c4..06297da 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -29,8 +29,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "7b2d9dd75b5cf267ea1737ec75500316"
-SRC_URI[sha256sum] = "58690267d7455f444e87c2f8cd9be91fc686ffc0c02d1ebd0be2ab68149f7160"
+SRC_URI[md5sum] = "be46174dcbb77ebb4ea88ef140685de1"
+SRC_URI[sha256sum] = "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
+
 inherit useradd update-rc.d update-alternatives
 
 USERADD_PACKAGES = "${PN}-sshd"
-- 
1.7.9.5


