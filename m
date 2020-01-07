Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 133C17FDD7
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:35:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z16so27847189pfk.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=nyceOmPvyiNsQelrhkiVuJd0bIPJuM61h5aS9EIQb58V8yTMyW4k4SqNcctiKHIcLB
	ubKZI5PBIvPqA5aJARWahcpVeOif9Wt1F+2QCuabzkQtboXmkNNTZn/NFN37CQzRYzxp
	uGyH29TdG6oqKQecixicK9uqoc//kvFBKT8GYv5TqwfpUrwtjc/iTpyiEpF+rVn6Ka2l
	pV2BfxLQVkS2k9zB3ga9wCpWq8vD73YyAdTNDpris8b98JhUKZ6P3xjI8fDtEifdID3P
	HIpzd5LKacqw00F6R0OXF6HHcIClz87ohlCEL08dVJOvNjN87gUCSks8aCFj8O6i6ZwF
	rNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=Kci+eyjjuE90MAjGKMMNSP6nckQeV37sKeDwl5S6UO/vyNukk7OBtv9uLIv7vZGnr7
	WddQ6vLL9y9a7gp3JK0vemgLaY0Bdusd5SldVpOLS4odSd3pesxYuvS2CZovQHJGp6qv
	j/NZYu7JxkQrJ58iU+pFDN15+RHDb1BecJUVq/Xh8tTeWvXWGcsfQGI1xxaLvCMYOIjk
	0ipdZeEJC8hF1eWeD0nc3iLSH+/NiqOsq+8vdi0pI7rEcVSGsBq5KZ6jq0+BJJBgJdds
	ES2xuOYbO4MBU5m3OxVHTvqtAbKUTO9Boq+hVLUQb85kyM2nT+iHQ2X2Aq60r6Y8m35o
	IGjA==
X-Gm-Message-State: APjAAAWe3MtjflM3O49GLsm8IaU56oZbqNg2aEe6Yx1zbWOdP3AoovWz
	bgyn6AwEhLzCuJv0HezhyVAi10QC
X-Google-Smtp-Source: APXvYqwkQY6ixxlxchsc9Ky9nACbm3TgxnuXisn0xbp72AVlD80Sv1zyd7qeQHv4lCcdEH9YmYV0BQ==
X-Received: by 2002:aa7:9633:: with SMTP id r19mr115568432pfg.90.1578364505086;
	Mon, 06 Jan 2020 18:35:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:33 -0800
Message-Id: <9f925fb9608de1310e2a2580d8879859ffae7be0.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 28/28] libsdl2: fix failure appeared in bitbake libsdl2-native
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:04 -0000
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


