Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D51D7FDF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p17so4287168wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zE6g2NntZRTIbvQj7Gm8wId+hBMm1fzMEz/MrAuwcSc=;
	b=K8hiGMkjBLhOEe8WpidR12J1o5WuomI/wY7j3xQCSXANw0bv9MYe0W809lbY4gePlS
	eial1sCezdlcmGGJCsQv9BK9PGGdZYk8DjlfaNJ1xv4Uill0Tsmtqh3kMn9KWccPfRKN
	k9PhfomuIC9Qz+qsBhAjuvDT85l03dgbipr54G6pcJe6rwDKc19awfqtuvcI8yQT+MO4
	sxqxEgm7Et9aTrYGlrL7suwPPPtCfBL/5oUxWgdjw/gD2OBzv2WY75tlf2t/9mlJAe8i
	4BLMN9Ex6S2CzwsFLnaex6BNQb+PpqZghCM34mB6NzX4V01GZDhIg6nz7/9RSfOvwoE/
	Ro0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zE6g2NntZRTIbvQj7Gm8wId+hBMm1fzMEz/MrAuwcSc=;
	b=LRw7D/VIsG2t2UjdkxC86j1gO5EqxZzcg5VUh0pfrvhvf25oa9EjSDCYlMEjXxdd+6
	ce5SgvmzxwfhvQiFvURc+F3as/RMJi+TWVWKf6bR3+kv4XcLanURdpbq27CAl4vwRcrU
	RgLiCqanLKFdCiZMEhGiqw8JaRFP8XAjE/+h7um8oUpyDspHTC9ibBl9GBMadERxBu+g
	IWYDA1Q564SW7gt62rGLaizmsqsplmG7pDKabvxHbDlTPoBjVOHzMAA2tj1sgU9LIl9j
	y1kXlh3QJHvS5mSfyuV8i6LUQAwhimwaXiAMvBu8pV5wVv2ZypWHQabQappm1c1q1ur1
	WhcQ==
X-Gm-Message-State: APjAAAUyAujul750NJ+/a/b+1HiusJA9bVEcNiIh2cyxWiQlUq2YQBXI
	du3v8+XEwKiHjFyumuzntvOgqMlH34o=
X-Google-Smtp-Source: APXvYqyC/dB2wJrW6Uy4CzS7uI8vumhXNrRC/BRHsfP9JAgMewt1PZfeHv+7So5Ns9gxzrL7UNcEAw==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr6319651wmb.17.1578601603850; 
	Thu, 09 Jan 2020 12:26:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:23 +0100
Message-Id: <20200109202623.28936-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] gcr: add mime-xdg to inherit
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index 272112dd12..9853b3f416 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


