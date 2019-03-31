Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 625936C3AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 15:50:21 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so5870064lja.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hTDBruNI4s0Oly5ZTerlUDUKru2pOTLdNUd/lL3ru3I=;
	b=wQuanUBI9F2Ug2Nv3KsjP25hqR8in/nxmlvMyxkvxHPKyI0fxXFvjhS1Owb4ZQltXk
	Vcq0SACFvz4QqTVJKPxTNbx5R+W3uAYXfJRhDK5kCxtJzdLmcAM45Yo4AC7J0oX+l91T
	6NGvl1aZG5pqepbBsYaatDDAB3CmNooJfOobsIjWjKJoijFSEJvHvAgOqXVhaVhiQcue
	Ag1pk1sckLd/xnNM281u85AbBRqcEVHirjTFgnrumS9dEjiOeXZxaO9IcIV9Qat24N5O
	ktciqBJ0mqB2mxZjEHgiYR79UojV4Y5DzZG09Q7VSXNTibMBGoE+N13obiAt+IwqlHPQ
	yTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hTDBruNI4s0Oly5ZTerlUDUKru2pOTLdNUd/lL3ru3I=;
	b=XjXBa/7rc1d4MuJBE3wVyU6jevVR6Gv+kGcAcNLvtARkLxGju9/rJtcHu+8J5WvEeX
	8jzC7aT1JMi3+zYx5eZGIf6I8zvxXDDT8YzVouhr6VjpS5/OB+A7ih3RM7mCAzi8oyLc
	C7eXPNFle3FE6Gj1/RGt7cTgutSPYRFjozlPsY8aIWCJn+NF8mf1al/O9ZV8mglpS5Bb
	jy1/f2Hy/ONFuER73aMLyLa2B95WuF5I/6bI5BFcwGeKT2ivPIU5RaED5sCBAi5jfEJq
	xRLHEfY7y6qMTkFao7QBHA5RnJefg9PKDdxXnoMCEIsX4Tb1TaILlUr2bwZK4bYsnm1k
	N+oQ==
X-Gm-Message-State: APjAAAVkG/J/RyH6FE6sHvcP1SyC+iaKgPSDKJRCBbrWe1zl1OhECD64
	2sCowXaEitFAdi9MP69nDn3K4V4SCJU=
X-Google-Smtp-Source: APXvYqzmMT7PMRWsBTgJ8fEpue1fTsQYKHTHRv3MrmbOlN1BLUQgBiUNfqW/K+xM2Y9IaFKi8GzrHQ==
X-Received: by 2002:a2e:94c7:: with SMTP id r7mr17974471ljh.91.1554047421575; 
	Sun, 31 Mar 2019 08:50:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e3sm1351549lfn.80.2019.03.31.08.50.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 08:50:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 17:50:12 +0200
Message-Id: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 15:50:21 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb}          | 0
 meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb}   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb} (98%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1097.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.1.1017.bb
rename to meta/recipes-support/vim/vim-tiny_8.1.1097.bb
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1097.bb
similarity index 98%
rename from meta/recipes-support/vim/vim_8.1.1017.bb
rename to meta/recipes-support/vim/vim_8.1.1097.bb
index 7627d2844b..4de1bc3807 100644
--- a/meta/recipes-support/vim/vim_8.1.1017.bb
+++ b/meta/recipes-support/vim/vim_8.1.1097.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
            file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
 "
-SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
+SRCREV = "4fc8e2f8bb3eb42df0f72cfcc1f8f8e567e7ce4f"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.17.1


