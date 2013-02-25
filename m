Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UA0E9-0006Jq-1t
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 16:44:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2013 07:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,735,1355126400"; d="scan'208";a="267296574"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 07:28:07 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 17:29:15 +0200
Message-Id: <1361806155-28141-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] augeas: change SRC_URI
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
X-List-Received-Date: Mon, 25 Feb 2013 15:44:29 -0000

- replace http://augeas.net/download/${BP}.tar.gz with
http://download.augeas.net/${BP}.tar.gz

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/augeas/augeas.inc      | 2 +-
 meta/recipes-extended/augeas/augeas_1.0.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index a0aa9dd..c956621 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -5,7 +5,7 @@ BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
-SRC_URI = "http://augeas.net/download/${BP}.tar.gz \
+SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
            file://add-missing-argz-conditional.patch \
           "
 
diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
index 2f7061a..82bda19 100644
--- a/meta/recipes-extended/augeas/augeas_1.0.0.bb
+++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
 SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"
-- 
1.7.11.7



