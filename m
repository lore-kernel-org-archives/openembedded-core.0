Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1006C515
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 13:57:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r11-v6so5591679wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z2VMAokIeTPaowmaSsmTQPR/k64aU32x10DFtef+9Yo=;
	b=U4EhJATX+jyvJCSWFQ4BoUSvvIgOj82Fm+0tp9Fj8jZzceTjn/wFi/S0pc6zmXLRG8
	EY2A2PVycyyaPzAE8vY1bbMFcGk9+QP5gf773cJMLUMCF8VGTXhxbi6zLYi1l64BgaaR
	+j+3orCjlJMlcNsi+etnnG5L9dp3MIrsUNPvQwPw90mMLh+Kqp/Fpsjr3IvxV0j8C8XH
	7/itzCN+WynLf5oMVxNS1ayd1LluZa6w4U4pT+dHqGP4M5+tQL5RbBuSDobowWwUMqkf
	M9/yWdVVEva0E5J7wV1g6N785a9DoB9AwTsQRZq6buNmNTypOHOgbDTxQtVBQ/pTOQsT
	DHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z2VMAokIeTPaowmaSsmTQPR/k64aU32x10DFtef+9Yo=;
	b=RCFgHoUp5GV0/QEjxzW1I0BPvk7RbonaSMTWtctZ3K+mSZ6h0+FJqAOb8/W3L0e1PB
	VunUsMncU65gePhrepKMlhljyhitlwNJUwRRunctm4OpFwUPGkYFPMWbdR7fdGBxcOqJ
	tMxphokM8PgwHBQTgEAh7xb40J5vwfF/b+gldvibLo67ASvqCkPAt1m1ilfpVZh/Rfah
	hyVYga0K14vNz5nL+/712y0mdUnoTO30PRAZmZ8ddhLQp7/x3rK1JUrVLor4SI5VDGI4
	5lYiZQu+YERYpu8p7prJ+Ncx7BKRNXZf2vT8GZeDkhMxaO91ge/NA95OZaGAXk6SY7xK
	pgng==
X-Gm-Message-State: AGRZ1gIJLD4B+T8yzmL05FX68c+WgE6ht8B82lq40hmGZFSbyKHzTRvi
	36DsrQuTf4T3Qaa30XKhSRuE5UbP
X-Google-Smtp-Source: AJdET5ch2YCLIqvU5qpqGJlc8soy1QGXJcgmBPkPHOTezknxrOb56qKtjHU050Vj8uaTS+8VRgwQ0Q==
X-Received: by 2002:a7b:c003:: with SMTP id
	c3-v6mr5455076wmb.133.1542808659411; 
	Wed, 21 Nov 2018 05:57:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm11203560wrx.15.2018.11.21.05.57.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 05:57:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 14:57:24 +0100
Message-Id: <20181121135727.115509-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121135727.115509-1-alex.kanavin@gmail.com>
References: <20181121135727.115509-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/7] libsolv: update to 0.7.1
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
X-List-Received-Date: Wed, 21 Nov 2018 13:57:39 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsolv/{libsolv_0.6.35.bb => libsolv_0.7.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.35.bb => libsolv_0.7.1.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.1.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.6.35.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.1.bb
index 12dfc5d3a2b..9e0952128e8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "38c5374d4712667b0b6ada4bf78ddbb343095d0c"
+SRCREV = "aae08b819742abba7c44510797077c5f25f3ed00"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


