Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 236696FF93
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id s2so16875838iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CH+QiBuPeCJmRbEOHSv6wAGW8EQw1V9uJHcAv3y0ld4=;
	b=HBJHarHq5HPsmF8Qe1Y+YheWqIt+DxJNXvxA0jemx01jjkujPcNW/kTETyCWNwU/Cc
	xXAB+51FLmgVXLuFrRNkg/FdHKBIRkrZLfc2tuK7LlwvdxVba2hvi4vkPE1EL2FGOqk5
	4M8xCo5H3m3eqWYNtyFplbZUI2JF0r8dMZBujN9QkIS4zZeRbTlD4SaR2Pfg6CUaiJiz
	fRbXScgTJw8UNHsYKec7xrTKiV+4pQ0b3YlNPa8gTSYzeB6S4XwOlkxPp+O0BHYMYdFN
	mGUITVsnVTfmkB9ytsP+bgxCyWCEo2LV9f2/wixDauRtmFtwlyJTw4EUznirp9m9zkYE
	aN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CH+QiBuPeCJmRbEOHSv6wAGW8EQw1V9uJHcAv3y0ld4=;
	b=PQ34b1JhZ4/TWJM7qYjX9XBD11XHyA69CS5yeuyduZKZuUTqCylfITj+fDZixxm0e0
	Mpacx7t9+lIydUdnSTETv8HdHqaDWhEdPiV5lKovv2TSumk2XDbvqp1f1QSKq2YMVvNz
	2EAqfPq5lLpC5vk/ty1L5iUcZlJoGhDa5Z3TjeioD8wKbTUUDB5Pj0phOkUi5sfBStCu
	PSKhwOgNFJu8Ak7E7c/7JZAw+9m35fgEEK6HP/pkhsFZdwy+7CMvW5UZWgRtDbKbtzoM
	kASLKik622KEBY3VoMmHz1TKU/uj7MDvPjKZMm4vt9MgEfpTICL+I/pqcbqNfj3uY4om
	i01g==
X-Gm-Message-State: AOPr4FU6iY+Hg9CcmkmWXnzjVMq5NrEWrfb7vUT/CSxd1nns3EXav8Zng3iwFveveh8oFg==
X-Received: by 10.107.137.101 with SMTP id l98mr15416396iod.31.1460764818081; 
	Fri, 15 Apr 2016 17:00:18 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:57 -0700
Message-Id: <1460764798-12701-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 6/7] harfbuzz: update 1.2.4 -> 1.2.5
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:17 -0000

Overview of changes leading to 1.2.5
Monday, April 4, 2016
====================================

- Fix GDEF mark-filtering-set, which was broken in 1.2.3.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.2.4.bb => harfbuzz_1.2.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.4.bb => harfbuzz_1.2.5.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb
index 27001ec..078b3e5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "3898b890f13dce5ac7a01c5446021729"
-SRC_URI[sha256sum] = "449dbdf12a8f94aedbdefaac831d8b1bf45e7decaa9192eaa4f74104ef9de491"
+SRC_URI[md5sum] = "cf1eca3bdcdcfb818c7ebb4644b4cc0d"
+SRC_URI[sha256sum] = "cfca0b6ba42c36a1f7b03fffb926dc4d137be2aa2a2ad8930259072e43a347d5"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


