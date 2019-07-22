Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 078297ECC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:18:22 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h10so35775506ljg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W5vUHe+SiHi7AkDmq5dtuOqjCyD1wHyU6HIHyU1fG94=;
	b=j46u88Cozr4bH5+iti3Juj1z7m5HPUSD6Gwrbz7N3sRrVot4M+KItAJucfafx7qaZg
	SPcHcYzPHpS4MQggwzI2tBFYTSgY5jjfwABAk15sh2mrRT29DSjLfm90f6ED5sL0PLD0
	Pa4NUwcWRCZzqZ27R1U6Yro4U79L2HMA7bZOxexwujR4Gs8kjGw30OZwpkE3nEmYb9WC
	D3KkzuIjEz1RS7ly62y7lBSbww3Gn5mND9cA2gLsBHYiWwLMjv1nddRrO9ck9Xfgd9z5
	s+OcJ0B5Zka25b/eEI+zr8MiaIw5YNcAGBtz+IUAcWQvE6tTMjXk4x+93E7LluhR+HSY
	nC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W5vUHe+SiHi7AkDmq5dtuOqjCyD1wHyU6HIHyU1fG94=;
	b=JsH+bLObGgOecqdGEN8doXni+gWZFr4POphDIt2r/tAgARhZrsAYZ7KLlmFuKLdZP7
	90cbi8sfaxT/INqtdeiR3UKj4AO7O2PWfazG8gpuHgw3q2DYx7kP7+ivSGJSjs+FTZ/G
	w145XQuwCU1fjBBALPI8p8MIgCtxaaAQAF/58ffeCjTq0hvb+z4q5LNkYtdjmnzeTwIf
	ZKURmp9630Bszg1LaUdt0KEiUPYKlTDGIROXK3PNekavAXkeEx+UeS3VbvN76ksYhA5h
	mt/N6NiDThYUcTGQxldAChuEAtv8ujbwltIfPtDjMeIz9hH456SbSYSeBJFbNEadmMdi
	8QVg==
X-Gm-Message-State: APjAAAWnqVXdQRJY2jkBhWCITrJGB1IkJTiO0IKN++QJf6Ug6a73XKMg
	7w6cbTdKNOkwvL1W1UCKl3KrKJTM
X-Google-Smtp-Source: APXvYqxP9mHDdxlOIGaO+xqHiMK7WIk1ViEAz25GAhLtxToaq4IBOQdTaf+cHfEyUHHGroKpN4GBbw==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr20858329lja.87.1563754702643; 
	Sun, 21 Jul 2019 17:18:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5771826lfc.73.2019.07.21.17.18.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:18:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:18:08 +0200
Message-Id: <20190722001812.14947-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/6] python3-scons: update to 3.1.0
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
X-List-Received-Date: Mon, 22 Jul 2019 00:18:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n3-scons-native_3.0.5.bb => python3-scons-native_3.1.0.bb} | 0
 .../python/{python3-scons_3.0.5.bb => python3-scons_3.1.0.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons-native_3.0.5.bb => python3-scons-native_3.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-scons_3.0.5.bb => python3-scons_3.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb b/meta/recipes-devtools/python/python3-scons-native_3.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
rename to meta/recipes-devtools/python/python3-scons-native_3.1.0.bb
diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-scons_3.0.5.bb
rename to meta/recipes-devtools/python/python3-scons_3.1.0.bb
index 7fb75a627e..f1545dade6 100644
--- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.1.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
-SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
+SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
+SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
 
 S = "${WORKDIR}/scons-${PV}"
 
-- 
2.17.1


