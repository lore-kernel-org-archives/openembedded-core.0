Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2kmy-00058q-6d
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Sep 2011 16:13:40 +0200
Received: by fxi1 with SMTP id 1so1498648fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2011 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=PRuC304ydodIhz/+k7xPY0iZ3urStoqdtW2Db5tmTLE=;
	b=YM1h7hCPIepGDhDWcqGr7o6mGWA5KS0svUNTFxZPpKgAEWAaDB3EH+A3hIYAHk/Ayq
	gDsrxZuuVfWKCePYOnMB4rgL8CaCNdgF0uk6UfbWOBDte7Mbi6A+opXFFhZYL9qWwaAE
	P8TG1RK/Knzl1CaRwVpJxCGbZJFJMmQXKMoRQ=
Received: by 10.223.37.26 with SMTP id v26mr816973fad.100.1315750113265;
	Sun, 11 Sep 2011 07:08:33 -0700 (PDT)
Received: from localhost.localdomain
	(host145-0-dynamic.18-79-r.retail.telecomitalia.it [79.18.0.145])
	by mx.google.com with ESMTPS id a1sm6481238fae.23.2011.09.11.07.08.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Sep 2011 07:08:32 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Sep 2011 16:08:21 +0200
Message-Id: <1315750101-5078-1-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] [meta-oe] connman: use KERNELORG_MIRROR in SRC_URI
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
X-List-Received-Date: Sun, 11 Sep 2011 14:13:40 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
index b132f4b..9d65345 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
@@ -19,7 +19,7 @@ EXTRA_OECONF += "\
 "
 
 SRC_URI  = "\
-  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
+  ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
   file://connman \
 "
 
-- 
1.7.4.1



