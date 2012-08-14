Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCD-0000Xj-8R
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181066"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:13:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:50 +0300
Message-Id: <cfb09cb85aad6310bd1efc925a0f3702de46464a.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 03/64] openssh: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:06 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 8757f82..31202d4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -101,10 +101,6 @@ CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 
 ALTERNATIVE_PRIORITY = "90"
-
 ALTERNATIVE_${PN}-scp = "scp"
-ALTERNATIVE_LINK_NAME[scp] = "${bindir}/scp"
-
 ALTERNATIVE_${PN}-ssh = "ssh"
-ALTERNATIVE_LINK_NAME[ssh] = "${bindir}/ssh"
 
-- 
1.7.7.6



