Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E03CB6AEC6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:07:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 14:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,821,1367996400"; d="scan'208";a="342090545"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2013 14:07:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 14:07:37 -0700
Message-Id: <4ca09701bf1d43bf060be7ba53480ea9a0d04847.1375736784.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] mc: upgrade to 4.8.10
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
X-List-Received-Date: Mon, 05 Aug 2013 21:07:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.9.bb => mc_4.8.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.9.bb => mc_4.8.10.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.9.bb b/meta/recipes-extended/mc/mc_4.8.10.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.9.bb
rename to meta/recipes-extended/mc/mc_4.8.10.bb
index b3838cb..51b6772 100644
--- a/meta/recipes-extended/mc/mc_4.8.9.bb
+++ b/meta/recipes-extended/mc/mc_4.8.10.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e701cc5ced4beed38e1977eba26dad50"
-SRC_URI[sha256sum] = "7e184cf5ed3ff8b93fcbfff16608c1444920f523beda2fcc586878d619ea11da"
+SRC_URI[md5sum] = "eb4bdc23abd4fdfa14911d53d65c8186"
+SRC_URI[sha256sum] = "5f4166fe78fbf4b42f51ed526ca7f79fea8c77d04355c2b97d4df2a6bd2a1b1a"
 
 inherit autotools gettext
 
-- 
1.8.1.4


