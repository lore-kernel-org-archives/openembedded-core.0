Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id CA0927855C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From;
	bh=ZvGmzrAJLYQaVKQhU04wCvcTZR5qido71wCZvk/YIy4=; 
	b=fhWmg2frYVVo5KxlbxpGmeBWgQIBk1uMFzFev3O4SprBV5M1xOjc24BuNxPTsihQnOVe7rsfgcoedpCzafaLV5X8AeSN5ctaJu6taXbfMGQKA+P1h8okoGPmaCxaqL4KkymLfz10Xe4DjZtMD86jRzky+ZvZ9OqaU1imyB3X1BmNwg/t636L69kesH40DVewfSzMIAOLFL75IGtxh1YMs8vGvMZnfv71GidtCA2Re1R3A1bNQfQvNPyW9bOss5yQSBZStD86BPuFkAKVVhtbm8bqhgNq/pH2hRgsXPEsb8Wb8O6/RBHDBosH6hcmHDrQpe71zt/LYlqVvngeoQjWZQ==;
Received: from [2001:67c:1be8::1] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1f0Qlf-0008WU-4l; Mon, 26 Mar 2018 14:58:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1f0QlL-0004Z5-3J; Mon, 26 Mar 2018 14:58:07 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 14:57:57 +0300
Message-Id: <1522065479-15840-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_20,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH 1/3] ncurses: change SRC_URI from Debian anonscm to salsa
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
X-List-Received-Date: Mon, 26 Mar 2018 12:31:46 -0000

Debian anonscm service in Alioth is shutdown and thus
fetching ncurses sources fails.

https://wiki.debian.org/Alioth

"Alioth is broken, and there is nobody around to fix it. Don't ask the remaining people who give it life support to implement fixes and changes. It is being replaced by a cocktail of ?GitLab (see Salsa), read-only repos and keep-alive mechanisms. See below for more information."

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 9d06987..01e41d5 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://anonscm.debian.org/collab-maint/ncurses.git"
+SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
 
 EXTRA_AUTORECONF = "-I m4"
 CONFIG_SITE =+ "${WORKDIR}/config.cache"
-- 
1.9.1


