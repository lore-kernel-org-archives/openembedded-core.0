Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1US5hJ-0002bZ-Ug
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 15:13:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Apr 2013 05:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="323064440"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2013 05:54:43 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 15:55:24 +0300
Message-Id: <1366116924-11474-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssh : upgrade to 6.2p1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 13:13:24 -0000

from 6.1p1 -> 6.2p1

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../openssh/{openssh-6.1p1 => openssh-6.2p1}/init  |    0
 .../{openssh-6.1p1 => openssh-6.2p1}/nostrip.patch |    0
 .../openssh-CVE-2011-4327.patch                    |    0
 .../{openssh-6.1p1 => openssh-6.2p1}/ssh_config    |    0
 .../openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd  |    0
 .../{openssh-6.1p1 => openssh-6.2p1}/sshd_config   |    0
 .../openssh/{openssh_6.1p1.bb => openssh_6.2p1.bb} |    4 ++--
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.1p1.bb => openssh_6.2p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/init b/meta/recipes-connectivity/openssh/openssh-6.2p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/init
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.2p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.2p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/sshd b/meta/recipes-connectivity/openssh/openssh-6.2p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.2p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.1p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.2p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_6.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.2p1.bb
index 0cffd23..20502c4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p1.bb
@@ -29,8 +29,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "3345cbf4efe90ffb06a78670ab2d05d5"
-SRC_URI[sha256sum] = "d1c157f6c0852e90c191cc7c9018a583b51e3db4035489cb262639d337a1c411"
+SRC_URI[md5sum] = "7b2d9dd75b5cf267ea1737ec75500316"
+SRC_URI[sha256sum] = "58690267d7455f444e87c2f8cd9be91fc686ffc0c02d1ebd0be2ab68149f7160"
 inherit useradd update-rc.d update-alternatives
 
 USERADD_PACKAGES = "${PN}-sshd"
-- 
1.7.9.5



