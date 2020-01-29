Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id F0361605F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:33:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y11so4052558wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=05iEAMoFn5YPSGTX6xji4As+kfys0iUFzx4LoNH1YvE=;
	b=lW26jHsjikVTzIje74NasWRD07+RYRqfzNHYIInOsTVel/G4wtp+PNc0i6Lc3azYuS
	ek6N2oG1kKmuY6SX2LnvC+gctGFqT/soktj8Np4GeDKhnCtadJU5cwHKVIwxQSxELOxH
	tR/dw+rUa1alc+ZfzA49oa0MleOp33C5gXcu1kXOquRUQ2w3O02u8MzSb4BFazP2IRo2
	BFRsphsx2I47Wd89m+rxnzMwdzuMqCAfMfuPX72EH5qHV2W/cPAGrJZJs1DRyIha/1SM
	tGUQsk1uMgPsFc6YaWCOPUDS2viim+yJzYHEHmh9jPEBqe+rNSWuuDm80O3FD8cPILgI
	lGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=05iEAMoFn5YPSGTX6xji4As+kfys0iUFzx4LoNH1YvE=;
	b=GXrPv2hd/cpJFyFid3yHUVGlre9b5q+5IoIKr6t6qL8zM63p0wrzk7Y6GKbPRzMmY+
	YC5JvAwjHEZO6rmvySedtKAopoPbOjWBQF1hZfQSRJo3TM8nfzn+EG+aYJN3yrpfUtfo
	O52UCk7pBLc+2QFlwXB9FrOFrZf7UkNN6uvTflAXFCA7/sQoIGDBjBMosX0s5MEDocYi
	IZ+ZPRkvpJ4bxKf6wDUHFgCb09fBsX07OAwVcVk/gT0WXpbPsUNXIBIMV8w1fAi+H06y
	psekKwR53yMTskrIRF8Jv2nW1eBkQXq4cy9eUT4QtGB+tYoE8KCVcZbcDBT2UcXsXZoZ
	Pdpw==
X-Gm-Message-State: APjAAAWZADuNovTDXXDqX/UXkDJ6ZgCUBORvjRZ7fVu/X2dHr3OCPT9q
	fU8YLa5VzbGqbsgxmBud7NuBS5z7
X-Google-Smtp-Source: APXvYqyQfeatQehMlNhPah1JB87pRMlNnp0lhhTh3/mQ4DoHTAiHoL82MIgGto6ca1gb+JxOJ42zeA==
X-Received: by 2002:adf:f7c9:: with SMTP id a9mr4355572wrq.168.1580288901813; 
	Wed, 29 Jan 2020 01:08:21 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:33 +0100
Message-Id: <20200129090738.1398-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/24] gnu-config: upgrade to latest revision
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 1630c128235..48b7e6d4a61 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "b98424c249119b79d3f709e26eb86f2fd4d5e5f3"
-PV = "20190501+git${SRCPV}"
+SRCREV = "5256817ace8493502ec88501a19e4051c2e220b0"
+PV = "20200117+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.25.0


