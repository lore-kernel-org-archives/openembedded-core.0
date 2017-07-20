Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id D910D782E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=o10C0ub0vCDvi1t4MoXpG5mgS/jd08Lff4R3XQgEuz8=; 
	b=X1KxW2YLvwui9tiOXSccepMbjt7RZwiqdSwGh/4F8a81Fe+rk6pJ09rDZkynutJ2nPeFFV7UMWMf/85eLJUq0uGEI3LUHI1xeivTI04T5iHP9ClY6bUFV9wryk+JY/VnjoAEmLDrIDY3CVurY+EFl+Y6aGHB+jsCQruXofs4CIEMQ0c+slPGo8vM+aBQfeqlKBdnkehU9fYz9u+wgRmk+bsndgHqkfZ5shjRFgLDGw69v0YB1b/AVhNx+bhKXfiR6qDg1lfCo52xH/qsi1YgmO859d1Uxkw6rhV8LXRYI++jjhnTcqn5O56hj+J0zTTb/ICqf91QgwAgLq2xwJxojA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005MF-Sz; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003RR-RV; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:55 +0300
Message-Id: <1500556991-11471-8-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 07/23] gcc-common.inc: set CVE_PRODUCT to gcc
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:26 -0000

All recipes which include this are using gcc as product name in NVD like

https://nvd.nist.gov/vuln/detail/CVE-2015-5276

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 3d484ef..b5975b5 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -5,6 +5,8 @@ LICENSE = "GPL"
 
 NATIVEDEPS = ""
 
+CVE_PRODUCT = "gcc"
+
 inherit autotools gettext texinfo
 
 BPN = "gcc"
-- 
1.9.1


