Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 8A59C6E446
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 02:29:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3N00FGZ2X41L20@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 06 Apr 2014 21:29:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C5D1C200BA; Sun,
	06 Apr 2014 22:29:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 06 Apr 2014 22:29:12 -0400
Message-id: <1396837755-4659-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/4] cryptodev-linux: move to recipes-kernel to be shared with module and tests
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
X-List-Received-Date: Mon, 07 Apr 2014 02:29:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl => recipes-kernel/cryptodev}/cryptodev-linux_1.6.bb           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{recipes-connectivity/openssl => recipes-kernel/cryptodev}/cryptodev-linux_1.6.bb (100%)

diff --git a/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
similarity index 100%
rename from meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
-- 
1.9.1


