Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Se0hB-0000dB-R6
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 11:13:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Jun 2012 02:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110598383"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jun 2012 02:03:23 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 17:02:30 +0800
Message-Id: <ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339405061.git.lianhao.lu@intel.com>
References: <cover.1339405061.git.lianhao.lu@intel.com>
Subject: [PATCH 1/3] openssh: Allow empty passwords login.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 09:13:59 -0000

Allow empty passwords login so that the default root user can login in
through openssh.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../openssh/openssh-6.0p1/sshd_config              |    2 +-
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
index 4f9b626..175e8f3 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
@@ -59,7 +59,7 @@ Protocol 2
 
 # To disable tunneled clear text passwords, change to no here!
 #PasswordAuthentication yes
-#PermitEmptyPasswords no
+PermitEmptyPasswords yes
 
 # Change to no to disable s/key passwords
 #ChallengeResponseAuthentication yes
diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 04fd6a9..ad62511 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
1.7.0.4



