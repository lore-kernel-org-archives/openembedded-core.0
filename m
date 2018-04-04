Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 465BB74834
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:35 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c21-v6so8158497plz.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+a4o3Co3C6M2ptuunGksxltBcJgT/YBg6RuaTkKb0ww=;
	b=tvFb0I92j5Yt7TzeC8lUgSX5+gEBhhSwjqbJ0EPPw8AYMb6ulihbonPyDY67Om8+iJ
	9lj2UvhK1Xma7J185vfjaLR8x4eSiSnr6gMhN278stymQ9BLQB0ArfGuuBgkD0a9Ch2Z
	B77Y53rO2jRrY3fMmt7KVhKSNP8296kzy3ceGt2h8N+Civr79jUg92Ov8YibAcCZECRN
	9D6H9tZ1y6jrYN/NJVFRLeA1xS/cI8oiwXZ/wjLDiFPcPc1NBCXKQGgn+m7Psl0uqxZ0
	z88nR/QGOO5XudEx7CDMvhaAb0rYXWRYwL836GBl4gmJJRVsWeh3s1xxH/H598VjARlV
	K7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+a4o3Co3C6M2ptuunGksxltBcJgT/YBg6RuaTkKb0ww=;
	b=IGaLtt2S9ioC92Lcrf4Q7UIgftSdjZlLgF/8UjDX1dtNprfUWkCdGLwGlntfXB6OJ4
	hENlYzNx23f67CXSEUZKB2aE5dVMGGvGlvKtL86+GwV0dVr3op93rn51GBzfsgeh6Iw/
	YX6U5f6ppvWdqR1ChyTgJr1WWMyVHiw3+950zRJk12LchBpU+VPAInuh1YSivlcWi15t
	78oregRe0/+s5QP0ScB3hutJqYIni2mgz1xEJ80kVMX1OWmk+IHcTurIEBvrfvxh3QoB
	uTb5XwYqFIKWUlFo7w3Al81tD/KIeQVEDKe+7he98QklTi30qyXyAJwfZtet3dwgvnf2
	oK1Q==
X-Gm-Message-State: AElRT7HqjcxWYCLIZG+00GhFJ4EcKkO/D6MS7pR6JnOZCM7JhQsTOGMF
	dmMQVY2rtBGzPEjBZHKDcdOLIw==
X-Google-Smtp-Source: AIpwx499ldCsidgAslx9Y2wYMKIlyVycgRy5WapyAz+VgggnQj7HPg9gWIuZFQEvlmD2VxzfNO2Nag==
X-Received: by 10.99.100.197 with SMTP id y188mr10509390pgb.277.1522806576277; 
	Tue, 03 Apr 2018 18:49:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:12 -0700
Message-Id: <a4c40ee2e3468aa8e1a3fc36faff27f87290e208.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 13/21] mkfontscale: update to 1.1.3
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:35 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
index 31cf186..88c88f1 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
@@ -14,5 +14,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "9bdd6ebfa62b1bbd474906ac86a40fd8"
-SRC_URI[sha256sum] = "8c6d5228af885477b9aec60ca6f172578e7d2de42234357af62fb00439453f20"
+SRC_URI[md5sum] = "987c438e79f5ddb84a9c5726a1610819"
+SRC_URI[sha256sum] = "1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a"
-- 
2.7.4


