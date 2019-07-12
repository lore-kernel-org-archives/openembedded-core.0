Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id DAE567F14E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:22:29 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v85so7254397lfa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CcBZ7z+f0Frj/dqTf+N/P+dQ2wxQ5q0bLcs6/NoDLjQ=;
	b=yie60YSyvWfpkoQMoAGH8raJ6wAR2q54ZAgu4jxiP1e+lZj3N2fzLltHV5aZmQxZjO
	D4WBSoJ8lcQyCltbz3DiYvhbun87KBG+nXpCwDOw38gTfPJZ7IeQ5Px2Rd03tN2hQGAD
	4h1/3YPdH6BRkVYrNj5B/n5TQBCuzMCmXpCek+9FWlip7etErQRH3zwpCd2L84qWwL4C
	tuxALU/Xgg9MhklgzujXtKchwwfQ1sLlCWC2t6LV+zV3pBUSxQLfIvDtaszxkXfJaDm9
	DnW9JUAp+34JHFwGn+NybfBpsdJHQufQRby3rT+HFZROLeMfYOmfO7rVrqCEyGRokztj
	K8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CcBZ7z+f0Frj/dqTf+N/P+dQ2wxQ5q0bLcs6/NoDLjQ=;
	b=hFl86PS0AGbZ/ktqMstoygmYqkXT4yHOaRVr40sYisDN5byk9yo2MGVOl8N+f/2+JL
	imnXAz1aIPl2GZYXSzQBJsX1pZ32s2gbAsXMYDbLEieJ5dNPlHog5MByztH9DRIIsCt+
	BDdjoQ6NzmlVqvvdXOEyqQwIUiEkKzzEHMMOkJsYTspBBMJ6WAXIO4WZZsZqUnEbpAs2
	AR12nHxDIDJS+Bl2h9xu6PBlI5WOmN/ywI+6iSC+wEFFD/CTuHDjGxkDNE3eG/j9BcBH
	qx7/NtSfrsH57WyvNfQUoj4RZfBarFQ1OlGDvum0exXLyMd4VIeOVENl7rR5pyIN6nKd
	LYow==
X-Gm-Message-State: APjAAAWyT3Z0P6Jv23RLpMXgSUxm9v/R8+W55HXOSlJ4PMMULX7G0akD
	RxTNORLLNuN7i5K/QUQUHBZn/a0H
X-Google-Smtp-Source: APXvYqwvcZjHjXe4rQ39ru4+lQks2FsfKF1AhqHBMYI4bJNCm9ouR1eB1U17sA9pDglHsFC38cJQBQ==
X-Received: by 2002:ac2:5e9b:: with SMTP id b27mr5284944lfq.45.1562962950454; 
	Fri, 12 Jul 2019 13:22:30 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z85sm1608746ljb.101.2019.07.12.13.22.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:22:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:22:16 +0200
Message-Id: <20190712202216.29218-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
References: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 3/3] libx11: update to 1.6.8
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
X-List-Received-Date: Fri, 12 Jul 2019 20:22:30 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libx11-diet_1.6.7.bb => libx11-diet_1.6.8.bb}   | 0
 meta/recipes-graphics/xorg-lib/libx11.inc                     | 4 ++--
 .../xorg-lib/{libx11_1.6.7.bb => libx11_1.6.8.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.7.bb => libx11-diet_1.6.8.bb} (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.7.bb => libx11_1.6.8.bb} (100%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index ea2ebfb8b9..53c9e436e3 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -10,8 +10,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
+SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
-- 
2.17.1


