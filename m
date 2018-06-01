Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2A738745C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 10:29:49 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id v13-v6so24156831wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6v3qvkFhBfdlLkvBrHfAguBQtQznEhNVGAbTL7iingw=;
	b=R+j9xQKBLCkg77T7Xztut2XWILSquXWKfYqkZhTi9qnEumTu43EbPeKlBLYBcIlPFO
	yuNBkmQT/SxHPYLpZb9sU8GDGxO6NpJPMLdWmUm89SrL4uYWvbr8/QSb6cYJ+Ckh3YHB
	fmufSZjInWMdTAbsn3WFi6O8ee+EMLZSRGJUNRYLQSYI6FLG9GTvLUhpmN9MpCK5D+gP
	fyhuVZ3Uq7LGFac9/hV63SmD6Y1sknj4YaivUhUghwZHGKWwB66kBiP7d0dgdN3oGEYV
	MFdpR8ELVBVCS/xkcjF10HGkaXM86u+oi8HPJNvxYtKl/pYRBx+56dbR6GWF1q9RPxiS
	dGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6v3qvkFhBfdlLkvBrHfAguBQtQznEhNVGAbTL7iingw=;
	b=XQCIFIuTGnlnrAjBhJunVE4HwSowWvh+o0kCYup6MJbvIZZ6xfjoRkBsAGI2COW9Aw
	SYpZAWm7QQdhhv3i7y7jKRNbj+l8GkwikzzzrjG5eK4Bi4PwFax+GHmjV9OzaZtfz/Wt
	SD8WLD3FUo4RNw0jNk1hLSBw5MTUQ9i1QyTH153RwXzXbfUinfuJR5dYU3fjpVnlDr6n
	Ui0KkxweG8Eo0hOsxkLfmAmq15M3wqtziZ4xIvqKipiD5QN8FGjczug6hPO+RGqNakpR
	Myi8Zs+GxJ6mXKHWFdJCVykTd+Nf9DZTClmonerjAi2d9c1/m7Smcsxe6w7mzOwXcdw0
	SlHQ==
X-Gm-Message-State: ALKqPwcsaEdDVGK0+Ra4o5OSveCtGeZNx6XBNRjw2lRxAKBHdNuJC+vs
	AQg99NC9hOHoMWnWQp1n+mSUBQ==
X-Google-Smtp-Source: ADUXVKLSQ/U/Lj92rOy4NULE9t3xNetY7WH8jVkWWmA5UWdeUwesSqGdD2RAiUKBE829ECeFNEt0JQ==
X-Received: by 2002:adf:ee0e:: with SMTP id
	y14-v6mr8377684wrn.63.1527848990465; 
	Fri, 01 Jun 2018 03:29:50 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k126-v6sm2118431wmd.45.2018.06.01.03.29.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 03:29:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 10:29:41 +0000
Message-Id: <d12d358c9e0e31ca3ec94755d92c2448133214d4.1527848868.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527848868.git.Martin.Jansa@gmail.com>
References: <cover.1527848868.git.Martin.Jansa@gmail.com>
Subject: [master][PATCH 4/4] qemu: use sdl2 instead of sdl1
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
X-List-Received-Date: Fri, 01 Jun 2018 10:29:50 -0000

* sdl1 since qemu-2.12.0 depends on x11 in DISTRO_FEATURES, switch to sdl2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 773ac81a6e..faaea781cd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -87,7 +87,7 @@ PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/includ
 PACKAGECONFIG_remove_darwin = "kvm"
 PACKAGECONFIG_remove_mingw32 = "kvm"
 
-PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
+PACKAGECONFIG[sdl] = "--enable-sdl --with-sdlabi=2.0,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
-- 
2.17.0


