Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D6FDD7F89C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:37 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f20so20175662plj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=vSbPA3577L83hFyRO+9lu6X2EWojXBN33L1RwRACI5Qfu/gb196/naOvFY3Auour7Z
	1ApxF9EeHHVLnKfP0BcSoyKlviaKziIirRRlTLIqhxCG/QV64Utg5S8Hg75JSthz35Wd
	FuWFz2B4o5rITzSCr5OfaLGQDklfwuiBVeSABsfzuqePXQPPQ8STy9qCynq5tWTL7ElP
	vKmbZ/smznyQcrk1PltOf3qHacN2OfSL4n42Ewke3TdhDK6OV8+akwT2wBfX9HZx2OT0
	qMCDwtZm5Ck07XlIXVelb/DVYPQag6mwsyNUmN9QrrsftSCGTDWczloxqfZtVhomC/7h
	HxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=aG4Npd3VIbTMAIhBGTDd/Z2ComK6QFXqSxdaG8lq3rklzCaqAvBripzqnGsbqartkZ
	x+O/RNrrN+ifq2H5IvIYypzdC5vOLhPX3/mWWFm3pTV/Mipvw8iQFcvtj6Jtljf3ndyy
	JFTXnEiKM2GXpCJJB7AAQ3JEdPBQZwf/3QHNBHxgjFt0KV5Buar51SUxkWjX6PhZNJWi
	zHL6HjjJ/emBA+SOob4boPW2oIYgLS2fWiNQ8aZuWe+8VWpPDl8EUFfgaZgDQdkChQWG
	kDBjvGF2tGHN9JlEkSzMk3VP6g1k6y8eXL8qmqvo1o7L+JlEdagZilkmkWqAv9KBUNsU
	Fw0g==
X-Gm-Message-State: APjAAAWMTFv995FIqR3lvZ3Wcm3UF4de9lUbLwPhk2aehxM8zW/CPoWJ
	gw5ZlrMK4h8wAHFX1HgsoWKUqRJl6as=
X-Google-Smtp-Source: APXvYqwFisugVynVWwF/RsOToO6gand3nvmlGwoWiFGKhYIRkgeCknog9tXMfziSPu2srWdGTbtLMw==
X-Received: by 2002:a17:902:9a8f:: with SMTP id
	w15mr96710044plp.149.1578155198862; 
	Sat, 04 Jan 2020 08:26:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:09 -0800
Message-Id: <9f925fb9608de1310e2a2580d8879859ffae7be0.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 28/29] libsdl2: fix failure appeared in bitbake libsdl2-native
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

When you bitbake libsdl2-native and your host had installed fcitx
or ibus, it may cause you bitbake failed in do_compile.

Disable fcitx and ibus check with EXTRA_OECONF in bb file.

-------------snip---------------------
  CC     build/SDL_sysfilesystem.lo
  CC     build/SDL_syshaptic.lo
  CC     build/SDL_systimer.lo
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:52:5:
error: unknown type name ‘SDL_DBusContext’
     SDL_DBusContext *dbus;
     ^~~~~~~~~~~~~~~
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:121:8:
error: unknown type name ‘DBusHandlerResult’
 static DBusHandlerResult
        ^~~~~~~~~~~~~~~~~
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:122:20:
error: unknown type name ‘DBusConnection’;
------------snip----------------------

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit eb286172e413e9d6449dc13ccec1b78c04481eb5)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index ab514f0533..ed87cd71c3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -36,6 +36,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-sndio \
+                --disable-fcitx --disable-ibus \
                 "
 
 # opengl packageconfig factored out to make it easy for distros
-- 
2.17.1


