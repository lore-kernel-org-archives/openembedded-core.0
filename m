Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCP-0000ex-HT
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181268"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:08 +0300
Message-Id: <35c20aefc40fa54099f1a163b02746030f0c9161.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 21/64] msmtp: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 2d2ee52..08566ca 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
-PR = "r2"
+PR = "r3"
 
 
 #COPYING or Licence
@@ -21,7 +21,7 @@ inherit gettext autotools update-alternatives
 
 EXTRA_OECONF += "--without-gnome-keyring"
 
-ALTERNATIVE_NAME = "sendmail"
-ALTERNATIVE_PATH = "${bindir}/msmtp"
-ALTERNATIVE_LINK = "${sbindir}/sendmail"
+ALTERNATIVE_${PN} = "sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.7.6



