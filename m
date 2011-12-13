Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbq-0007YT-5x
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612749"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:14:02 -0800
Message-Id: <cc6a93f73b7678c22b31f1e5406b83a687106fa7.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
Subject: [PATCH 03/10] ed: Add SRC_URI Checksums for GPLv2
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
X-List-Received-Date: Tue, 13 Dec 2011 08:21:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/ed/ed_0.5.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
index a652332..706c0af 100644
--- a/meta/recipes-extended/ed/ed_0.5.bb
+++ b/meta/recipes-extended/ed/ed_0.5.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
 PR = "r1"
 SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
 
+SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
+SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
+
 inherit autotools
 
 CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
-- 
1.7.6.4



