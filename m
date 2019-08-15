Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id CA3397F23C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 01:16:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k3so506544pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 18:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N3UZzhZKQMuIRjI2I5aC3QQEYCV+biJi3ycyUORasYU=;
	b=jnOhAQxuVZUCBdYj8iygQWFP2dxe9z4pyUM5i7gVTjwLHVaDtnt9D2PaHud76HDLde
	7NyiEeaEYMZX54s43jADSrKUD4wPd2Hd7WoirfKCNAqzn8qIkDsRLlUMcIgTOfsy/zJ1
	H405XXB9Kb0t8tTS9gCMOYQNZAuZUAbFatSFuUN2A+286rS3eSD2c2iK/F7oACZwfhIe
	tk5YAyRlzmKdlJ/UF3XXLiWKbuZDDsNjZW1hexVoVpQS9hfj8YobTowH3XgO+nXNxpri
	c3dp8/50WEQeohIFj/mvgtsrWnkJ0/yjF8cgGSbKcWYUvUysKSB/gDDakwftQRHB4sBo
	+ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N3UZzhZKQMuIRjI2I5aC3QQEYCV+biJi3ycyUORasYU=;
	b=UACu5sKfvos32gWLJxLXBwPmMVK0JEMgB8/zCuGfXd5lFGeqFP48cjsGH2ActouFKr
	URjiXaEkx01H+o7CnmHqeVpyv/vzeS2IAPsyH01ovKTQHQgfrP+UrRUegXbAQYnGhQKS
	Bq+yOqFry0rmjzryILIabn1OtPFpU9gwuL69dNFm95zDJVfUdso0lsQ7ZCZo/UKKVt36
	2Y+mnGFs9pi9C7uGYUUICd2kUahY7EGp7bH1RoGIIhfnvnD9P07AV7EDfGembUQpq3pb
	k0iRGXbrgyfmUinEEtqNLZ0bBoXoWvQEpm960bEJQ2xfts3j8cZpk2stfPMX9Sp7HnT3
	HfrA==
X-Gm-Message-State: APjAAAUz8tGqGKbZ6/4qTTOHnv8HXkrmEOK7eMKXO95wy2NyRAkv1Fg2
	vxhdnfowC2l1hrTFYBrdlrxJkZQEVVM=
X-Google-Smtp-Source: APXvYqxmpd+WpPdiDz0PZ3oDI0qwPrVvtkoLPI+WItm60nyJyFbipbPSa9dndtKCqYGeci6l1D+18g==
X-Received: by 2002:a17:90a:8591:: with SMTP id
	m17mr713029pjn.100.1565831815252; 
	Wed, 14 Aug 2019 18:16:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k5sm1201154pfg.167.2019.08.14.18.16.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 18:16:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 18:16:42 -0700
Message-Id: <20190815011644.24474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/3] musl: Update to latest tip
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
X-List-Received-Date: Thu, 15 Aug 2019 01:16:56 -0000
Content-Transfer-Encoding: 8bit

Fixes build regressions on risc-v
Detailed changelog is here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=d0b547dfb5f7678cab6bc39dd736ed6454357ca4..29e8737f81ccc9fbadcf61a75318aa3d0516aafa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 6425b5cd36..64aee6c448 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "d0b547dfb5f7678cab6bc39dd736ed6454357ca4"
+SRCREV = "29e8737f81ccc9fbadcf61a75318aa3d0516aafa"
 
 BASEVER = "1.1.23"
 
-- 
2.22.0


