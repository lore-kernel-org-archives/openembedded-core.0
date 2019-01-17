Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id 087C57C1F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id y14so8239101lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LRGgusZsagvbfSAn6tw1ZuYsp2F9WjPiRUypvPXWE9A=;
	b=If98bNXNtMnw/kCFBgXJaKs6DivrAE3Jf8yvU510c7QJg/A+g1hTWO7MeakRHJvjtD
	T64A9nlDH9AdL3EQ/sFf4ClUINh97Bv7+d4YAOfAWhTOTh9YQIHVdHfbBuYOHrlGFk0x
	ECH6ojndJ0Yv48/dAWOQXhC0V9NtvxsNgZWAzukGUOrRPoTDynNJrF6IparWH+gH3KCK
	tMu/bgLDrBTYba1jWoeYaJPWk+xHkXj6nYa0FkuEH7qwX3ml3yu75hHZ8IwnMSwIQEr+
	6GXcOK1LM+FG/KrfTjeRWHzfnhj+mIuVRrZe7JO5hHEHod+hDJ/LC6tE56y6VV7JCtYO
	VKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LRGgusZsagvbfSAn6tw1ZuYsp2F9WjPiRUypvPXWE9A=;
	b=VIKHNTr1p4hjDMESwdH4YT1FBjwl72ieISu9tnyqqbm0vNpvCQYe98SiYBwljBQT+2
	eQfqhx7fxXdzq70F0x32l1c8Y0SMdR9pYygCJR1fcC4kFtiScx42x42Z3bI4+oLPCUSK
	SA1VnSOZEgoS932EBfARJuD9ErIuE7KREC9hDWZS/sMZiPhcB2NnlgvRbExZgvN9SJJp
	fKpl9A6LqQMHp3R4vzDPqYFV0LQjPny9RmoR0+O8wbopvep3/12AIr+EGCUYti9302ii
	USzk1yyOlJ/hSInssC2e9wRYGFlpqkT0zeeijCxhjF9/nO1bg+Eu8Bs/bt94o0Itsmg5
	kVYg==
X-Gm-Message-State: AJcUukdUGGfwH6uH5Wxyk07mu7pGExrhbbA9AsYSBJQhxNDKeYYpnY5g
	36TKomLrSENgUA0kZJfzPzGZmkJm
X-Google-Smtp-Source: ALg8bN4aKaue+rE+yqtJxFg8GECvdRVi7djOQkqssFYy7xGeS2FzOJOl9z7kTRXDjJemmqWxXqFcyQ==
X-Received: by 2002:a19:d381:: with SMTP id
	k123mr11010962lfg.101.1547742432236; 
	Thu, 17 Jan 2019 08:27:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:53 +0100
Message-Id: <20190117162659.24997-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/11] pcmanfm: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pcmanfm/{pcmanfm_1.3.0.bb => pcmanfm_1.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.3.0.bb => pcmanfm_1.3.1.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
index 356da02d235..a5e3a1ad334 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "827838f7f6b17dc97e1690c07da8fdb3"
-SRC_URI[sha256sum] = "5a693e9bf3f3294f0ee7264c1c1a600a88ee27d1572e7dd5c4b0e84aa7778ffb"
+SRC_URI[md5sum] = "d32ad2c9c7c52bff2004bbc120b53420"
+SRC_URI[sha256sum] = "6804043b3ee3a703edde41c724946174b505fe958703eadbd7e0876ece836855"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.17.1


