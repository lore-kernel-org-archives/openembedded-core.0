Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 640017DF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j187so9851982wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3XHOkztN77p4HC7OxZvSCYxfHm6G/rqhxlYabHQsAU=;
	b=AWi3OaXZhY3kS1KAAIzFruf6JfBgqb0fHK/6R9a2mo5sst6z4iFY9efQHKV+JljhAU
	eSACI9bm0mje+htYgPdDbtbYrxlu2hRELvsPZyKW36gz1weAdbpw+CWyaeMkKHXiHpiY
	5qlZlcmurwcJryYkQMkb/uapqEdJ4AYszvOMepRt9d82nHXvJiuS6U+sy9pZPk8hE8xy
	Q4YYxxNfRhEg22HYc3PvbTtaDuNDCzSy7KcViqeRhlqFBLqyAEsOZ7q6e2phZFX4XEdR
	ObSL8CTJuMF3FI0cHBB0sTo27tEoLqFTLW7qsgOk1JEkCPlFjO4xZIvy9dzUmBbHqSew
	TIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3XHOkztN77p4HC7OxZvSCYxfHm6G/rqhxlYabHQsAU=;
	b=iBUTZIC0j/OPGVOumkE12DVHrzzEO18yvu81unl98D5QRlbL3kXcnEhos1bAiRJFvQ
	hMJmj+vfnP2V/TKOCkzeQ6Ul5+MasB4EeJ5iX19k7UAfK/qmqs1xvd7/bzXTx8oCwNfO
	UeuX6WCfI9hSb0xDDOtqME4KyCfVRES3KKg398B/TiHVNaEUKpwNh+RD82hJPIbiWtZ+
	H1s9y3sAbiwGngt0ozES0TqZiAA0S6WHh+3Qf2rSy5Il3fo7JXn2eKq4yv1yNd2zVVXd
	jjgg0olKRpPiSTmTrqQa1j+b/BBFjDiIMtxkX25g2fZemAS1eF7dgeOlPxGX7xE5eKLp
	2Azg==
X-Gm-Message-State: APjAAAU1qByDN9KQeo5DDCBnYp4hU9ORyZMfLOaf0ngdVcQwV2WrK03l
	DkXZ//2qlclD6R4DafdK5/3NEXuf
X-Google-Smtp-Source: APXvYqx69XP3MF8IalMGcrwyWvUKgF/zTBgJDXtYIEV4zHVN12PCVKEGGaHslqh5N61lggcv75iP8g==
X-Received: by 2002:a1c:1a47:: with SMTP id a68mr3076671wma.88.1558116742074; 
	Fri, 17 May 2019 11:12:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:41 +0200
Message-Id: <20190517181151.44001-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 27/37] libsoup-2.4: upgrade 2.66.1 -> 2.66.2
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
X-List-Received-Date: Fri, 17 May 2019 18:12:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup-2.4_2.66.1.bb => libsoup-2.4_2.66.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.1.bb => libsoup-2.4_2.66.2.bb} (90%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
similarity index 90%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index f0043f80b3e..c4715a04125 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -12,8 +12,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
            "
-SRC_URI[md5sum] = "5f04c09a06f6dbe4c4d3f003992145ce"
-SRC_URI[sha256sum] = "4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7bee3c7e355c43ff"
+SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
+SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.17.1


