Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8p-0002b4-Tq
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189771"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:39 -0800
Message-Id: <e793462541ea6ecfc76947b67c2c8fd5ace79b01.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/18] less: Update to 444
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../less/{less_443.bb => less_444.bb}              |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_443.bb => less_444.bb} (87%)

diff --git a/meta/recipes-extended/less/less_443.bb b/meta/recipes-extended/less/less_444.bb
similarity index 87%
rename from meta/recipes-extended/less/less_443.bb
rename to meta/recipes-extended/less/less_444.bb
index 0928ad4..c78dbaa 100644
--- a/meta/recipes-extended/less/less_443.bb
+++ b/meta/recipes-extended/less/less_444.bb
@@ -15,9 +15,8 @@ PR = "r0"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "47db098fb3cdaf847b3c4be05ee954fc"
-SRC_URI[sha256sum] = "a4c3e8af81fd0944941ee7c74eecc7759422a227df52335e899e69de5eae30ca"
-
+SRC_URI[md5sum] = "56f9f76ffe13f70155f47f6b3c87d421"
+SRC_URI[sha256sum] = "be64ad3e22d6d4aa19fe7024d998563a1ce1671ee3625f8851d26b16dedcdeeb"
 
 inherit autotools update-alternatives
 
-- 
1.7.6.4



