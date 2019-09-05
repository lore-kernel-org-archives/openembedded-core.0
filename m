Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 883907F29D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:32:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id x18so3001263ljh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EHMx2+TXSCkJ8ZVV5HeLZ+2zBXnojf/Hvbz8ksOAa3I=;
	b=x1Z4K1SOjaVBe137UkzbPFPLrcP6iKFFG6m0vhi+h1T413I7jG8lzOdh/1kX2Oz1++
	RU8+tLrRzD7e0lHCH0dS2zXlnS7FKrL4L+0vJrlBYfEZQXrX6S28q9oxUFXVFiUWuk5H
	yrOY3yKrfeExilLD13OVh/9iHREm6zKiEEQd5QV+3xX3Y6SobCev4pXbimYlmuQ0qWz9
	yAeEEu5dW06pIgCEPaoIS6hM57cDOez5mvARN0BkWw8jnK7NunMlGc+d3pLQVxr6u2ao
	hS7F8PuN18nJf8I+Sp+pbHXckp4PGlc3tQRr8INvGvYC/9nsAMvqrHnq82Q4r1mfQwnY
	j2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EHMx2+TXSCkJ8ZVV5HeLZ+2zBXnojf/Hvbz8ksOAa3I=;
	b=RBMYWuYA6x3ZoViEL5PVuj9xJOvaUtL4HG/IpGaKs8i5RTnQSUkL88Oc9/y1yttJ3h
	h7mwS5EXCJqjV4mi+xMMubWGciX3NTG5E2pinfrr4BtP0uDPwEU/CvSgut+GoggkQG5s
	Fb8H66EyNHjp4y0VD8/F2pc14VtI6N6BC4z5dT047ti8HXEKbWPlW4hYQxCaObBKClSf
	1231tWn1b3mHzJl/FwRB2pRfBNSamq3ZE/pjRmd9ifx+PsX8xcbRd55RtVUyF7bvSUpV
	vYMWB4wGTkEswS4NWHLtpq5hE3Wxko1kXGVFNtcqs3AHLQXFxUiT4dJiZMR7Hg47LzEZ
	6HZg==
X-Gm-Message-State: APjAAAVXK6Wlx+P0rumR108IYaPOIDXYLfBPw0XJqQhzNsA+xV9pFWD1
	1ZjOUTGQ5bVs3UTIgSFDYhYRq8KWC0M=
X-Google-Smtp-Source: APXvYqz8lSOL1nQfFcAEDIlsMOSMu69FOotPrZ3VGN2wlv/YogUgDFymQoBI+yK5r+UH+Hha/etOHg==
X-Received: by 2002:a2e:8942:: with SMTP id b2mr2555071ljk.38.1567697540729;
	Thu, 05 Sep 2019 08:32:20 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id g1sm417486ljl.31.2019.09.05.08.32.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:32:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:32:18 +0200
Message-Id: <20190905153218.18564-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libsecret: 0.19.0
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
X-List-Received-Date: Thu, 05 Sep 2019 15:32:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libsecret/{libsecret_0.18.8.bb => libsecret_0.19.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.8.bb => libsecret_0.19.0.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.8.bb b/meta/recipes-gnome/libsecret/libsecret_0.19.0.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.8.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.19.0.bb
index 4af47fedeb..7da8e90084 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.8.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.19.0.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "fee403988442f497f3c1dfe7b128869c"
-SRC_URI[archive.sha256sum] = "3bfa889d260e0dbabcf5b9967f2aae12edcd2ddc9adc365de7a5cc840c311d15"
+SRC_URI[archive.md5sum] = "483d293e73e7257c6d9fc18579b0e1ea"
+SRC_URI[archive.sha256sum] = "8049b09a4e737911aa647e50aee3d06b5db7aa902608ca43a0dd10d83e1d67f9"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


