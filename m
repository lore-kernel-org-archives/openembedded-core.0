Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49AB16C4A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:03:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j2so6482247wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3o3+T7/hFUV6EUQ3GdtDtr0r7z1ztOMl8pCOWkbx+F8=;
	b=QTpDkEPjthaQvoSeWtzpJHYWXHW04dv30Do7tJwfzZ/X7xJ+GAH/lK8mAg0egNF4Re
	kgil9bvfliJpixWyf7IuJ38nJyckgqjqDd77WuP2PgluQvJV6NBcQo75igvO6O6F8zaY
	uwfCxEwjGNtqUV/CWD5uvxgAbBRa2IhtAVPiW6XHQq18PoA6TqRp2mn0gJ5fIb72afiW
	BnqBGtYhgDHRqIZr+JiiLxxre5p9EXfqkvQa+DTLJQ7RqBWVu0Q8BEXxjU3AblozpLwQ
	4p3M/zH+n/VhjxmOI1t+Uhc95wGX1VR2ZkBhwFIjdBsskEcNgK+mjTfLcAufHF6tpI6M
	up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3o3+T7/hFUV6EUQ3GdtDtr0r7z1ztOMl8pCOWkbx+F8=;
	b=iZkmEL51O7XZ7TsPR0VB/H2tsK1raXehsUMQFjiZk/ORWyJvqJbKnnQR9kwWH7HIWV
	1fkBiqouUIbQUGy0b/yO89clXMjbY6J5ZdQdUyS0kRQpOiPR14iL4V8BNcmFNs666m5N
	bP0CtPp08M+vwgoUY96Lhqx+ZO7XyVfO+jlRQetmg6cplNEI/+jPtCkr7UlTxRG5Bv4T
	yiULLTfykZC0CRmAMbnFZgSz/7tn5GttXNsCSqH4ubSLNotxqAPsV+tikYTexEgAzGsJ
	keTAUhWMT7BwmNZOD/xYMY5HEEXIgZGiwRtGKEMLQgaoQshqt5Xif3Vh1xqFzFJ4HVJA
	/K6Q==
X-Gm-Message-State: AA+aEWYM8fVUKiuOCSJIALcdnbWPa83jzQKUnMQL+61zSCEgv6umPyRY
	L1Pqpz8UZt/t9ZZaVh1FjW90D1+k
X-Google-Smtp-Source: AFSGD/WxeAXXeBbAut4ehAM0ztehBpmkx/Pi6GduETmdBjNcTMjbCRxiHgzWEdixqtfw/ZztIQb7JQ==
X-Received: by 2002:a05:6000:10d1:: with SMTP id
	b17mr2031458wrx.306.1542819787627; 
	Wed, 21 Nov 2018 09:03:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x12sm24076122wrt.20.2018.11.21.09.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:03:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 18:02:57 +0100
Message-Id: <20181121170259.10557-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121170259.10557-1-alex.kanavin@gmail.com>
References: <20181121170259.10557-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/4] epiphany: update to 3.30.2
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:07 -0000

libdazzle is a new requirement

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.28.3.1.bb => epiphany_3.30.2.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.28.3.1.bb => epiphany_3.30.2.bb} (80%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.30.2.bb
similarity index 80%
rename from meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.30.2.bb
index b46c9d3b468..3dd699d4fe4 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.30.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas libxml2-native \
-	   glib-2.0 glib-2.0-native json-glib"
+	   glib-2.0 glib-2.0-native json-glib libdazzle"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "31a4a443e8e22f085a10f80b7e41d5f3"
-SRC_URI[archive.sha256sum] = "690546a701f046c5c2b3a092659589ea6e17cb0f9a81ec3fdb3046b00cede6f7"
+SRC_URI[archive.md5sum] = "1b7c072880562c33f52a3347a94bfe6c"
+SRC_URI[archive.sha256sum] = "8c7ef1e51b9fa825a43a603265ce8b06cacc42229e9337c8611c357bc65a8104"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-- 
2.17.1


