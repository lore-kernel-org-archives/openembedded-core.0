Return-Path: <pbarker@toganlabs.com>
X-Greylist: delayed 1422 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 02 Apr 2017 22:03:56 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 88C6F6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Apr 2017 22:03:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 879C747B46A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Apr 2017 23:32:30 +0200 (CEST)
Received: from mfilter12-d.gandi.net (mfilter12-d.gandi.net [217.70.178.129])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id 03F3CC5A49;
	Sun,  2 Apr 2017 23:32:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter12-d.gandi.net
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by mfilter12-d.gandi.net (mfilter12-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id Qf6mdPGn79Aw; Sun,  2 Apr 2017 23:32:26 +0200 (CEST)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 60F7EC5A46;
	Sun,  2 Apr 2017 23:32:26 +0200 (CEST)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id 93965416B162; Sun,  2 Apr 2017 22:31:55 +0100 (BST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Apr 2017 22:31:35 +0100
Message-Id: <20170402213135.21193-1-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Sun, 02 Apr 2017 22:03:58 -0000

The md5sum & sha256sum for ethtool-4.8.tar.gz have changed upstream :(

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta/recipes-extended/ethtool/ethtool_4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.8.bb b/meta/recipes-extended/ethtool/ethtool_4.8.bb
index 4ca88d766c..afaf2e2f71 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.8.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
            "
-- 
2.11.0


