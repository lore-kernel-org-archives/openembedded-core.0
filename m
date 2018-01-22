Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EE5A678685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 10:52:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g38so8110169wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KjXoNq6vIt5CLBvj+YRsmQtfXxnqwRsKhBueIepPffU=;
	b=F2YatK7CNNVozWUbzDRcKz0cG/GHdkUdicOlVhycX+HCnOm4wXClzbYpUL/4oDlTwJ
	+as2RI02XSjO+9k5CFO2mVEA6xgjO96BzOcP17JSIOyLCctsyhPStkl9F6uLn675QXkT
	OzAjEgzjeW1d4NoUCaustqoSbfHaSbwQByPG4LMD8IvISpg428D82VxSPFWYQvQ30OoT
	quwtTOLq/QdF1j0tEBefg/D9StglJH7p67Z3qHBqec0yxtv1ZXuB8H4CxvumNZ7yyelC
	AyhSLiu7KIH71UmRickstsVDOmCJ9D3UwuhPwFDo9tE+ccBX/gujl6VUe3Ecs43cD0QW
	hcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KjXoNq6vIt5CLBvj+YRsmQtfXxnqwRsKhBueIepPffU=;
	b=YyNCcnSpiJnaNJ19lIsJDivGslr4x7a+wMNK6OpEh8Ij6LMW99rdevF6ByhtSl8c4m
	q7kpaH7ExQxstsVdJ7KJM+jFJRm/sLfpZwXzq4rviJKQQlrI9YqUoFCrTS/uKjR15ORS
	25t/oVeQCYNjLACD0yxZadLL7y67G5vS02DHl3iwlfGGLhiNKUSyfl7KlFBqD4oxWEO6
	CZiCZHUvZdXHpx+L99pxP7ltXLNYJzvq7cVtaTgKZ9S2XskItEujT97eYNJe+4jcfIAC
	g/GGuQoCdEr0I2T/kCvGDtla01hbz2HeRHh9oHlx4YysmQXgzHKbnn0jn2qsSZVIaVkh
	ttAA==
X-Gm-Message-State: AKwxytditmwD/6/MGJYedTvKV18Fey7Gl+TR/IxXDBLmlHIX+QNfN0v4
	jFxMQKojp83xWR2xuwmGhkQaaw==
X-Google-Smtp-Source: AH8x226bzTVIqmWnh7fCCuqFLQSYHwt5ENlvc/2dXMvLlUBJfqpQ8IEZYOfmGP0cv0yKeYwjHy9jRA==
X-Received: by 10.223.160.209 with SMTP id n17mr6385552wrn.25.1516618329304;
	Mon, 22 Jan 2018 02:52:09 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b9sm5838241wmc.14.2018.01.22.02.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 02:52:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 10:52:05 +0000
Message-Id: <20180122105205.434-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
References: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
Subject: [PATCH] gettext: fix PACKAGECONFIGs
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
X-List-Received-Date: Mon, 22 Jan 2018 10:52:09 -0000

* add --with-*-prefix variables to prevent configure trying to search in host paths
* fixes:
  ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
  gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning: include location /usr/include/glib-2.0 is unsafe for cross-compilation [-Wpoison-system-directories]

* not sure if it's worth adding other prefixes for curses related PACKAGECONFIG
  PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"

  --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include and DIR/lib
  --without-libncurses-prefix     don't search for PACKLIBS in includedir and libdir
  --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and DIR/lib
  --without-libxcurses-prefix     don't search for PACKLIBS in includedir and libdir
  --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and DIR/lib
  --without-libcurses-prefix     don't search for PACKLIBS in includedir and libdir

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 97083c0da2..8a8a34cca8 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -43,10 +43,10 @@ PACKAGECONFIG ??= "croco glib libxml libunistring"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[croco] = "--without-included-libcroco,--with-included-libcroco,libcroco"
-PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
-PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
-PACKAGECONFIG[libunistring] = "--without-included-libunistring,--with-included-libunistring,libunistring"
+PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/.. --without-included-libcroco,--with-included-libcroco,libcroco"
+PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/.. --without-included-glib,--with-included-glib,glib-2.0"
+PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/.. --without-included-libxml,--with-included-libxml,libxml2"
+PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/.. --without-included-libunistring,--with-included-libunistring,libunistring"
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
 
 acpaths = '-I ${S}/gettext-runtime/m4 \
-- 
2.15.1


