Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1325E7D19E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:34:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a28so7396201lfo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PQuLcu2AyI3g1/U7WVhyySJhGb6zWy/1vMohVk7a8XI=;
	b=0DZQJYYrHckJ6B7mmlearZZ5KHFDdmjezJOzUMgBqBNtxZ/lEzawP+KwLrStGvXxy0
	bqeAovEmh/ATFn9v5iYvyE2y+rlCGor/t3eU6epJPnOG07NmtWRbty4zKN2C7THL9dyb
	4vigFDzqgSFpR5iti+JCgryXy6YfkAek52warQkuoo+6mXoVhXRpq+CvKlDGrChdZyTi
	/0/3QSaHUiITMD7TJhKbD8Nvq7kTjFiJlnD2c6TnOH7okTJOxl2mkR414FSqE1McA7pN
	58D9uaSblR4AZlM/NQ/QitrbuExkwqVdZaSh9jURddHaB5py3FH7LfGe540yxQ7gkBqB
	Pe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PQuLcu2AyI3g1/U7WVhyySJhGb6zWy/1vMohVk7a8XI=;
	b=mnpPZFeamZiKcZpB4W5twFL7xdg97KWFhPThN97BxqUJNeOevtaU0MAn8VlGMMzqTV
	4gb2D3qAUS+/KwYA4vLsLWb/FJ9uHad3Dobcc+DaEXndfikusn35SaeGBKs1aM3zGr7s
	PZT8OGktGlAwu0O7lRwqcpPq76qig4K0nSJaGz+K2/yqPxhMhaiKKVdYx9XG7QfCjksB
	obpq2rvWM4+RnPCI09m9z2hUOahpIxqNSBnDGwkEzjrXGqU+hFLJVgn2Tx5mem2/fEWE
	r6kIHUfzK/CPRBkvLchkTc9PB6yljfr/yu5WoIp286rz5bUVowroRr1Ihq1Rcvlt3GBJ
	HMeg==
X-Gm-Message-State: APjAAAXlTccILNnTwv9uVVhFfo1gjJh7eX4rf3L5CUPoBquw9lCA2nQ+
	/lmC5PC5wCBpGIunHUOOMeTtUARA0zo=
X-Google-Smtp-Source: APXvYqy//3HItqD2N4/f/YnvE92Va0rPNvztTN5goVIgfgt0qsuL49a8ujErE7hfQQVy2ay73GyLFQ==
X-Received: by 2002:a05:6512:248:: with SMTP id
	b8mr25783478lfo.140.1554154455350; 
	Mon, 01 Apr 2019 14:34:15 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	g24sm2128163lfb.49.2019.04.01.14.34.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:34:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:34:04 +0200
Message-Id: <20190401213404.18639-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxft: update to 2.3.3
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
X-List-Received-Date: Mon, 01 Apr 2019 21:34:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxft_2.3.2.bb => libxft_2.3.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.2.bb => libxft_2.3.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
index 4565ae2626..65bd9ae494 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
@@ -20,8 +20,8 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[md5sum] = "331b3a2a3a1a78b5b44cfbd43f86fcfe"
-SRC_URI[sha256sum] = "f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c"
+SRC_URI[md5sum] = "4a433c24627b4ff60a4dd403a0990796"
+SRC_URI[sha256sum] = "225c68e616dd29dbb27809e45e9eadf18e4d74c50be43020ef20015274529216"
 
 XORG_PN = "libXft"
 
-- 
2.17.1


