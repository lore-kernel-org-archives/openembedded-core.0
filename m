Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD13719F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:43:38 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g65so4261760pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 22:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NzkWaqQqOlAY6j9dZ0QSi7vG6hk25K3CzcYiO7aiLIQ=;
	b=WcL3oeI5o8tK4yTKc8zchzSZXhcTLJBGtx3D8gfLTmOnN3wVxZOFPfY5Zn/u1i/uly
	X/yIXN5fdl8HF7fWl2FL9zTkk/0dBKXjJgUUak6k2HRXuuOqRXQcktHJ+aMBQQ+A91Yw
	7vkDznV5h5wgSnl6jsiAtTlfAmtQ4K8E262RlcGefw6S5UXDf3He8ss4EGbzq13v6/x9
	oVmRJnO4gSXwTAuv6fk9uhfwO3Cjmr1y9jJY07jaydn4taCRyizRUblBx6SzVvJTUph7
	eYV0JXr9btAq5wgkdVTMUqVLK/0+SO8U0OTcN/erwJGg1TE4C/2lSaowuzOYRHqTbagh
	Q59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NzkWaqQqOlAY6j9dZ0QSi7vG6hk25K3CzcYiO7aiLIQ=;
	b=lFS8Vli1+aO8kU/VAIkriPSrrHd1UPGCNca4uYijeJamDG9oArN1jheaEUBAUFKRam
	BavzIli4z0YqVblWULKf5Ymh0YBioRm7cHPe+54sdfA9sWmeTmNQlvsE17QuM2W51yZP
	k4CyEY1by6v1AZM+9xkCiRdrQdELKQRWiPtwEJNbxo3KCNCOEGeYj7/XkrAKzaoDy+uD
	1aRMo6MfbJVLeSuvAIJ47aSQgfkH1N1KzVo0uW0DmnP1AAN2AYS2FVfkIHUrBot/a4ui
	81tpXevxlxV+bXajZb+DeADyEB/zfeuEd34Jo5sQ8+5EyJLNol5h+WYAXu7MIapB0OI7
	2igg==
X-Gm-Message-State: AHPjjUhXO04EyuGqODivkmaRL4azL3ktOXFWT6N3UeflYHpVlzyaKUql
	t5gDxWLKVfSZzHQo
X-Google-Smtp-Source: ADKCNb76APnsKfbTiw3YM5xQ1Kfs6aMZAerX7yQhWTpl9JI5Als/WQUq4JzlKnUspA46yAIe0xUBYw==
X-Received: by 10.99.186.89 with SMTP id l25mr10786083pgu.212.1505108620029;
	Sun, 10 Sep 2017 22:43:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id g5sm8957799pfe.94.2017.09.10.22.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 22:43:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Sep 2017 22:43:31 -0700
Message-Id: <20170911054331.15383-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] musl: Upgrade to latest master
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
X-List-Received-Date: Mon, 11 Sep 2017 05:43:39 -0000

Alexander Monakov (3):
      overhaul environment functions
      free allocations in clearenv
      fix OOB reads in Xbyte_memmem

Bartosz Brachaczek (1):
      handle whitespace before %% in scanf

Rich Felker (6):
      fix erroneous stop before input limit in mbsnrtowcs and wcsnrtombs
      fix erroneous acceptance of f4 9x xx xx code sequences by utf-8 decoder
      fix signal masking race in pthread_create with priority attributes
      don't treat numeric port strings as servent records in getservby*()
      fix glob descent into . and .. with GLOB_PERIOD
      work around incorrect EPERM from mmap syscall

Szabolcs Nagy (4):
      s390x: add bits/hwcap.h
      add a_clz_64 helper function
      arm: add HWCAP_ARM_ hwcap macros
      make syscall.h consistent with linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 88769f4e0b..8b6a2e3454 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "5f7efb87a28a311ad377dd26adf53715dedb096d"
+SRCREV = "da438ee1fc516c41ba1790cef7be551a9e244397"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.14.1


