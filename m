Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqs-00085L-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578079"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:07:00 -0700
Message-Id: <e72830d9588ce03954d4a5e6d67e69c52e31c898.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 10/12] ed (GPLv2): remove --disable-silent-rules
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
X-List-Received-Date: Fri, 20 May 2011 07:10:27 -0000

Older version of configure in ed does not like this option, so remove it from CONFIGUREOPTS

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/ed/ed_0.5.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
index e14bf0e..a652332 100644
--- a/meta/recipes-extended/ed/ed_0.5.bb
+++ b/meta/recipes-extended/ed/ed_0.5.bb
@@ -5,7 +5,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
                     file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
 
-PR = "r0"
+PR = "r1"
 SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
 
 inherit autotools
+
+CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
-- 
1.7.3.4



