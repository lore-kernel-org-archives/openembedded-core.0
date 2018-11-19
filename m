Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5CD6C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:42:01 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a14so10095563plm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3D2cLHQVqnaElzIRBn7lTGvbkakU5H6CV8GiChFEQ/M=;
	b=Ra9xOQ62WlR17v9qFNDOCbOagAb6P3mFkKhe6Vp3iaMGooinZ5WSXEp+52z0aA4kdI
	Tf2vhExXwCQBJ6C1crfA+/e/9xlMyYv7wZcl51BNVXbo2MzGfBjiayuoig7+drRrNM2t
	AETLIA+E1ZNBw+DuBTeTidNsn1ufZcBULSe0YAYwPzwFCzl3QTZMzlzCZsKnm5kn+V+H
	1InQ1FKaRetPmSFlXoqBQXm5Bza07Niqrw6AFR8SwZEbYE9p1RD0lOPkRFfurn7GV6gq
	RPwAcB/x5FmrACFUQpZZfvdEexrTYxo29/NSbFEDy+0viPeynefJRDOg5WlLTUza0o5x
	ZkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3D2cLHQVqnaElzIRBn7lTGvbkakU5H6CV8GiChFEQ/M=;
	b=LhS0w6FnQdUGise9dD6d0JpFEzSwEMRcUOosMYEShbpBY5y5YE+bIM5Mx5vT63qyCN
	UdB1GZfM5zMHFihUvdAQTutrJConn2sKDlffrP6J5EXkHO/icnaD5IcTj6xp/AZc1fak
	xwOQZmscooa4E6cNnmHe/zn/GtSGhnSCimApDMihV1E/m13MCgE5TaBzOgLRI1/h9zIF
	KAm2O71Ce4nPechDPUVyTJy3pVNc/zvUl1aN/K7XkrjqSn8HikQE+W4ZIbOxzNxqTF7z
	Vaf1E088YBkncrx3nqQgjx+1KkWV5pn7Zs5J8EATdvdDZpe0Iod9IxhqMqHule8Nr21W
	EF7A==
X-Gm-Message-State: AGRZ1gLeIZwerVZMupXEKs+7RbA23WrMukpA6Qq5ex3L6i067F7tPydw
	Iage+pb5EOuefuE1HcG6uQM=
X-Google-Smtp-Source: AJdET5d0oC4/Nd3FM20+DFsOzWQn4U4nzBCqlbIRe0wl9eg/cbrH6+yxOwiGTeHRJLlimI4RwaCqmA==
X-Received: by 2002:a17:902:bb0a:: with SMTP id
	l10-v6mr23049514pls.230.1542638522447; 
	Mon, 19 Nov 2018 06:42:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:cd6c:2c60:eff2:335a])
	by smtp.gmail.com with ESMTPSA id
	w136sm26777300pfd.169.2018.11.19.06.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 06:42:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 06:41:56 -0800
Message-Id: <1542638517-19735-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
References: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/5] libx11: move hashes to inc
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
X-List-Received-Date: Mon, 19 Nov 2018 14:42:01 -0000

This should help keep libx11 and libx11-diet in sync
by throwing an error when building

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb | 3 ---
 meta/recipes-graphics/xorg-lib/libx11.inc           | 3 +++
 meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb      | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
index 0bc08fc..9c773a0 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
@@ -11,9 +11,6 @@ SRC_URI += "file://X18NCMSstubs.patch \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
-
 EXTRA_OECONF += "--disable-xlocale"
 
 PACKAGECONFIG ??= ""
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 36c950a..ea2ebfb 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -10,6 +10,9 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
 
+SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
+SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
index f0f1bfd..6141f57 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
@@ -1,8 +1,5 @@
 require libx11.inc
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
-
 SRC_URI += "file://disable_tests.patch \
             file://Fix-hanging-issue-in-_XReply.patch \
            "
-- 
2.7.4


