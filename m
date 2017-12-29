Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 41F6378292
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 15:38:23 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j28so22237515pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=grqtXMTpop1MD8NotQSwqWpAWrSGXQJKvdgJEnkWdhk=;
	b=ITR9k4PgdBVvJo7yJ/YNj/YI/EPdmrtixDVkLO0KMr47SdKoD6yVAXkCQo77VTcllU
	WyojoBfoxNwor2V6cbJeDmLQBMb9W5Wsib3W1kf0gLK8rFqJuh1P0HvI/t3cDmywn9gE
	X+WaLx+hy57I5U3WDjnh7OK/xlRy/tF0hrfkHbGuY0Bp9iutpBxKBxirS6i0XicpvuvF
	KzYi8DTAQfDyU+3X7q34QrViJTmamCSA/2DghAAeSRLbtJXiQzws16a+5NtL0wIE1XUe
	pEQb5XyPUiLkv6+94hzwkMP4RoB3hKUtQNbNNTrACLkwMsx6yvA1C+F3rW+Aef/OzBWT
	+PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=grqtXMTpop1MD8NotQSwqWpAWrSGXQJKvdgJEnkWdhk=;
	b=CGbQlakxcVL1vw6pWsm6qTWTB2FEOIc10/LKY0tGI3uZy7ApICr/JX/3VNURuuOclh
	xdbUi3TP0u9l42taXaLGnJt2E9pgq/qe1XnW+Vl3K2XQRsPsvOAeyumeAo1Z42pHGtZB
	VK4blXzsz8cE5W8l4M0cri/V2PP1A48xFe0cifRo8+AkIeRamALGmXpI9KpuVslqjopW
	adcpcQdaM4ItemBK+oPr8m1dF7NLgJTY82tJikVSIzJoo9m40TnXco/m59hRpxPnrO70
	ROeMb4bRRgKSEmmpPjO1iLtxa8nhNTd6OTWaCxRVeLt5J1w0RLdAvkEK/k2qT5jO6eiM
	MEIg==
X-Gm-Message-State: AKGB3mJK6pSKRqHKjDkHq0IuTl1vQ+sC7kMBR4sF7WktgpWCjysJxBJe
	fmNUl4Wqf3tyZX+66h9vydM=
X-Google-Smtp-Source: ACJfBovtz6KHLctDNwRDcxb7L2H0eMbyjo/TBasqJ6+WAVOGbP5EatoXkABJOFKher9TkcszDnOtEQ==
X-Received: by 10.99.43.5 with SMTP id r5mr31574141pgr.348.1514561905388;
	Fri, 29 Dec 2017 07:38:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:c82b:a19d:3b8b:50bc])
	by smtp.gmail.com with ESMTPSA id f4sm61374766pgo.1.2017.12.29.07.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Dec 2017 07:38:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Dec 2017 07:38:22 -0800
Message-Id: <1514561902-6067-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514561902-6067-1-git-send-email-akuster808@gmail.com>
References: <1514561902-6067-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] libxkbcommon: update to 0.8.0
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
X-List-Received-Date: Fri, 29 Dec 2017 15:38:24 -0000

From: Armin Kuster <akuster@mvista.com>

see https://lists.freedesktop.org/archives/wayland-devel/2017-December/036291.html for details

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxkbcommon_0.7.2.bb => libxkbcommon_0.8.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.7.2.bb => libxkbcommon_0.8.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb
index e32dc80..050d0b7 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f53fa65beb5ae4b6a6b7f08f9dedabc4"
-SRC_URI[sha256sum] = "28a4dc2735863bec2dba238de07fcdff28c5dd2300ae9dfdb47282206cd9b9d8"
+SRC_URI[md5sum] = "7d0e4c4a137d0ac45bf6b328c84c3a81"
+SRC_URI[sha256sum] = "e829265db04e0aebfb0591b6dc3377b64599558167846c3f5ee5c5e53641fe6d"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.7.4


