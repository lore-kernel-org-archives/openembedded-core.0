Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13F527C864
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q1so2393800wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dZitQoOUJa9QElE2mLiDOnzu/4Iugz8nf0PREOmFuhw=;
	b=GF0LCN9sabgXeKJdOn/ITzWI8O0SpWTO93xzjhCfh8dvm8QsVIwVEUqS6qBy2OlYjV
	fV86aGiHDz4mdokt1OAjJB5fUjqe667afG7w26ZENuRYGtz2eiqcUo0OO2d/Nybb0MZK
	90U93F0UJgBcA81kD/HgXefJmrsTzlS4cezrgv2CjSt7pMcFnWpH3Kxhd36zR9ovXydV
	DbK4GO1bLcZXlk9NjVgrIZnDahOBsli43bUrZrVTQtx5QXnw7ELpottj3Oqc0JBgebkQ
	8HDG/dCGcOljTvgX22B+EPXBsWzhnQ3aY3xAeZOFLDe1Cp8WDbUnT+ag54DGgyR003rH
	eYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dZitQoOUJa9QElE2mLiDOnzu/4Iugz8nf0PREOmFuhw=;
	b=rxMbWKtan7k1VVUCj1uDZ7EeVZcz5J83yAW4KKgTyzXyc1YjISm3CpLKeJ7IxuZQvH
	ceGRT+2RFPag9qHUpvXCj0I149iZO0X1TyLwI1NweGWVoOr50Cgdohl5k90QF1366PZZ
	iywLxagqUkwI08GvDuxPmD14EQyELiYtggMP1g639agp1fAdCAKpmsHKVvovsMRecVHT
	5iaFwOlnGsrmqIDc4EP9aTThQK1PoC4mHzklrZAp9bvWFetbJpbjBn+l3FiZ5B7wd2Mt
	QWee2NFKQwjdPzuPUqc68AyXPfem641S/w+zvDmRC7gjVg3Tg/VIAirLsH/ffRqvJhma
	lVSw==
X-Gm-Message-State: APjAAAUyl59Rso+jCbQPJfnCySrIB6Z/ltxYomWPGt+PYUTgF473N8yI
	xnizKfJkvTubT+357ee9HrMmWYLU
X-Google-Smtp-Source: APXvYqzgJ7pHym9NdzmoOSZ5vcIuLQlImFBK+h/q0SoS/g1IjPN96kPLnenikA2lqA7b0RUr6ZCROw==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr8864389wrn.80.1551612482738; 
	Sun, 03 Mar 2019 03:28:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:47 +0100
Message-Id: <20190303112752.16353-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/9] qemu: add a gtk+ frontend to target builds
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:02 -0000

sdl frontend remains enabled and available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 3c404d408d0..26a33b4d860 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -14,7 +14,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
-- 
2.17.1


