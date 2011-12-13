Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbu-0007Yf-28
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612769"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:14:09 -0800
Message-Id: <13a2307ec7b321687a0c3a814be66d88dc50f11c.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
Subject: [PATCH 10/10] ed: remove unsupported option
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
X-List-Received-Date: Tue, 13 Dec 2011 08:21:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/ed/ed_0.5.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
index 706c0af..205822f 100644
--- a/meta/recipes-extended/ed/ed_0.5.bb
+++ b/meta/recipes-extended/ed/ed_0.5.bb
@@ -13,4 +13,6 @@ SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056f
 
 inherit autotools
 
+CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-dependency-tracking', ' ')}"
 CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
+
-- 
1.7.6.4



