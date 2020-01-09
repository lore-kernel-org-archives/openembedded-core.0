Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFBC7FE6D
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:19 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a6so586873pjh.2
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=l9HZAhQU0mH3mXd93/ZB9yzAIH+54aEsNrfllcaP7S3N3G12QrFaEXSDrlEmwc5zPz
	trxxY7QtuZ1Yt0xeKBa/F5grjpCuegN7lYGWBkjRIdnTKpak7QUpUURj1doUOj1ed4J9
	Ni45FWzWQ+C0FbHWsx+T9YcY9CR8UgkyW3aGgRt/BPMidYGrA1+/DtR8QxANDdu93COK
	uHnes1LvsE8IL79pAknBzoM6a0RJaU9u9pPh1Z5JzNcKgCAAJuPNPO+FoNktG1GB4G5m
	Y0V5uyXaevRDeHtN8DiPQXQdvTQaNihgwxq0RuQT5Sv7hQY2/6jHV2JM3dK7b/9LX/FF
	cCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GkAvNFN178Kc+Rv/jY/v22nz66x611i5esvLgxDKFgc=;
	b=gOja00yDoGKZYUZs9sI1suijKLAWkOexcJXLyZ3OYk6KImxPc+f1OCOnGz19mJOsR1
	TooHyKRI6fpUDsbXts6cfJwHhsXkRnYnJpj38Mtqi6ZiLKQEYcOhTZwfu0slr/y0tWaP
	WtYmbfyeOaY7OBb3XZmV0AHNU4KDAh+CBiigAL++Nxq9FkIuvOF9KtgLd0qoicuIqkJw
	q+DQKWpv4AxkMfj+G92IYKtIwcB2W1d4/nI9F7mpqVrWLYu7vdi5qaaBMlrZKxpIe0OS
	P4iW3cCJ66e8RqjfZ1oCa7lTabewV9oa4FZBLFFwDQnOlawKMIGjsifaRpyBHzXErd72
	nvRQ==
X-Gm-Message-State: APjAAAUrM/sw0RIY7y+gjYXRZFmkUFr1rMGWQJqaoO8bxbrUMIkkmeyJ
	YH8BoQ4tYpUtBsebtuUSbG88Ubg4
X-Google-Smtp-Source: APXvYqx1wCBWhiAuljZsvJ1BojP8oCSIpcJKL5FuvVHv7RnuVcjaqXPrhupyHPIv23KpQPXR9zhfGw==
X-Received: by 2002:a17:902:694c:: with SMTP id
	k12mr9333868plt.329.1578545420580; 
	Wed, 08 Jan 2020 20:50:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.19
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:46 -0800
Message-Id: <f48ab4268746a2780ee0fdc84e5c39afe593ade7.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 27/28] libsdl2: fix failure appeared in bitbake libsdl2-native
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:21 -0000
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


