Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE1D7807D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id z5so3355289plo.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L1fLdGSDIjGx39Lw5qBU9AaznpL3XE0MaY5JHnUkT9g=;
	b=l/DsnXx87T0OqyW82GvBN3Z59d6DKPUjXqbrnwXxHKLDRoXldK68gkckkdSFOKW2w1
	0SAq0Tmb3dTmOuJwocrQ9EhrkYrxVu2g5pAsgE0iOlE3vA5fIaprwEyvl7sCtPFotVXP
	s7H3Vv3R4Pw41KPOTby5yXucHHetWG/XAEd8lyuMK7dWG9vPLwV76zvPo7eDgSOEit55
	UcMd/faeuQoLTaKQLnux1w6qDD4IkK34Gn7nxUTxm8442JrHpB4f9My/CXO//qh3ye//
	DTHM39p1qDPVwIggGcj7ETB0Y5wATrO7Q2RB+HjLAjCVluoxc2Q4U1cw7FkKTKhj7CwC
	Klpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L1fLdGSDIjGx39Lw5qBU9AaznpL3XE0MaY5JHnUkT9g=;
	b=PxTuVSbZcZKq6btVlR+jgJOkZuVgsG31WP9SgV3aB6zUz1YOCPJThgxQGWPC6BDksd
	rjYPUMg8O8iMimYeKuROf2pJUSj9JGEOGNtYMXhWsbrHStMvKUyk5G7iD153VVSrwgV1
	WXjg3x8DnudK0d9dmdx2+4IW7oZCuxM8+s9yxkAkQNikn3Dy8bPYKRmOavJgUWzkIT8f
	DbMpZKW66KoyoNHaR2Z2I8i6UoEMTnOLngpqDCmzuiYbWsPrFdn6WWJ/z3RR1FgCENf5
	dlqNwVCi5XC7zvGkjykf3yswckPYrFNhnkbjgJnZi7aq0JyrGwZa78brdIATic1W+W7Z
	VbrA==
X-Gm-Message-State: AKGB3mIPW6e77DYsS1sCmfUuIIqV56npRT15YQCm48QgyeLpNwGgPHBf
	GkFM9v9krmKZZOTpFqhAKw25mw==
X-Google-Smtp-Source: ACJfBotTzhMWkvGW7WB0taeKdk+PHdTjxOTeFaS5vxBRqRIiR2GQBYFuGB96/BGqY+bd8+R9UIcSdA==
X-Received: by 10.159.194.197 with SMTP id u5mr19652227plz.448.1513528485403; 
	Sun, 17 Dec 2017 08:34:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:33 -0800
Message-Id: <3c3a502d9bb624426e17b261dcd493eba12485b9.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 4/8] libxfont: update 1.5.4 with sec fix
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:44 -0000

From: Armin Kuster <akuster@mvista.com>

Includes CVE-2017-16611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxfont_1.5.3.bb => libxfont_1.5.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.3.bb => libxfont_1.5.4.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 5b15a4e..79f77fc 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -18,8 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "9ba75bf38ba62a6ad52550ab716da9b3"
-SRC_URI[sha256sum] = "ab85c10fd2683481dfef672a77fe60e6a2039558cbc0e9bf56b5e1df471c93d0"
+SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
+SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


