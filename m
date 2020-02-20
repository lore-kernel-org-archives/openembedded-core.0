Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A25F760FCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 00:29:05 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g3so2611508wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PIsexjUYM6pe+MErKjVbpGZdP1g39y69gWn4pdgrUXY=;
	b=U9IPrMVveQmszhY6XOZ+jgAjjxqI8FH6izCy5hnxqWaeVkNuc92Nce+Lc5Z+bC1U9b
	VcVb+UPLPqbM77M9sb1AkrpDP3Ad2S4+DD8U2Y8FqyW6d86E5zYQwO7DYGPQuiEaMaYu
	mdVavFFiiDaIKEwBTCqF4Z0MrmuPJi76l9MCctHUQyhXZMnhA8VbTGKcvdfeOd4ebM2R
	Cp5HX6cSzwq2vrIyn82YV7n4MOClFOKumoiNShRHlRmcH7mUucwGtpTkdF0aS00XCt0C
	ycGBZEJb+rg75/plEmmmIrlQ2zejO3RmZF6xN2d0+9QM6exJeofmhUB54xFWa9tlOGiY
	O5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PIsexjUYM6pe+MErKjVbpGZdP1g39y69gWn4pdgrUXY=;
	b=Ivx1mVX23z5o93PMJ3QSSfYvvRn3ncZSvzbTX0q5C1d4i+2uCg+L68n7kSiCVhE8pk
	60B2RLyis39reAQYjGkBK3ZkAUGEG4uS1aNgGkcssksAJMkiQvczVGPudvMdT1D0PPgF
	RLSo+a/aX0pCagMa9rxvkPPWU/VUEB4ykz21lFLQp2dhHaFeRmookNWiZBNU7zR3nAfo
	7MCKwfubvH8JHFnlrnCeq9GA9mOlYFfbA58iaiaIW35Djpiz9us5g5pTd5CnRy6gJjW3
	nMmPKMrxX3j19XitRRwWmeaFVApFhEYwLdRn6YEJ5xF7TMqIKmRauxjl4IsJajWeXRVS
	EA2g==
X-Gm-Message-State: APjAAAU4OrooKUFfj32/YkGk2NL7kQcmFnVvhyfoodErXetm1ozLKl1K
	/LNBHoYGkugsHcNa2T3mnEg+j2qf
X-Google-Smtp-Source: APXvYqwQ300AHmVkG81tl8ADYO+5lAk2Du10IUbPzEkCascmR7OUyOUYn7GWTX6+M8VguJNlvhJkCg==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr40686149wrc.175.1582158545977;
	Wed, 19 Feb 2020 16:29:05 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F063D826F0F6E2A39C68FB4.dip0.t-ipconnect.de.
	[2003:f0:7f06:3d82:6f0f:6e2a:39c6:8fb4])
	by smtp.gmail.com with ESMTPSA id r6sm2014910wrq.92.2020.02.19.16.29.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 16:29:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 01:28:49 +0100
Message-Id: <20200220002849.9126-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 00:29:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable if 'gobject-introspection-data' is in DISTRO_FEATURES. This is what
gobject-introspection.bbclass does automatically for projects build with
autotools and meson.

It was checked: there are webkitgtk and libdnf inheriting gobject-introspection
and cmake. Since libdnf cannot configure gir, webkitgtk seems the only project
requiring gir-auto-enabling. So handle at recipe / no common magic at
gobject-introspection.bbclass required.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

This patch applies on top of master-next/Alex's patches sent

 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 585723772e..d5085620d2 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -39,6 +39,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'gobject-introspection', '' ,d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
                    libsecret \
@@ -46,6 +47,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
+PACKAGECONFIG[gobject-introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
-- 
2.21.0


