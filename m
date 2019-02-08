Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCEA47C5B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a62so3677249wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eE+e52cM5R4nKW0VrjHAG6R5Bw2bK1JhSFj/ZxTAuJI=;
	b=nerSO36UErfth4cOov/iYlxpj49jxuKocctiot4aZbrQ43AWVfr1mbRBWNALqcyzUM
	hSclglIvHyR52oLIcSqpN1oCqfx3TTRbrDF4fRSif40fCK2uY00HN0yQ2+S3f7wFApeO
	GSohOUV1Qn4lzc8BoOqRgbzUbT5HlXFFy5bweAncEa4zeaeAU6quSGOJkNFBUGbM4CGx
	ClHm9K49+1ib+w8nuXgMspbo0eK2Y2uNTowSFw0qQk5hf83CvOqkkdhuHnOqLCzq7M3z
	ZQniKCYMWpqPd6xXmOG071sBfGgB21D0pH6MPnlXrguTIWx+bYPvBYa9M+BknB4Ybmnb
	ZcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eE+e52cM5R4nKW0VrjHAG6R5Bw2bK1JhSFj/ZxTAuJI=;
	b=gwnH/Ytcw61bNT0Bha8LjO3/6lc1UMB/GPoaMI0UwEUhRRxZlwD/8HJlGcYCnVItB4
	4pl5h+WO1dZbU5H4a6iOanmyDGlNnq3Ya54cZfzdrzIzy5UElHOP2h1pZR76ywxvbVaA
	ZubYGi/v78DYgdQU4pF90HskV40ZquoFDhZ7c7R77R7/h2YmWmZaN5QStqZv5ICfZmkC
	1pUjX9ZnSn1J4SzOQ9ZXvKzLjHhnAmdo2GJ+O0fmTTgj9UWUcXEvOr+3g3GB0sP7bJZI
	SqPJlfo6MuOJrB5tKjfvdBit7ZBO0fhfQy9zwsstOj2VtjaRvmnH4t+qh/WJWQSXqn6E
	6IuQ==
X-Gm-Message-State: AHQUAuYCxpyx8ne9y+ZFqhHfo7X8j+r/cm4kMX6ZbzF/6KpJ+GVc16f+
	miHvHvdltdRRauwR8uZp1wPoCF+f
X-Google-Smtp-Source: AHgI3IaUyNhxogXS9OQi0kU40I3xFpKvNJ39No7bsaAfaXItI+/CILUjkkLETcIOAMlQrBVeLG8Y6Q==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr12787557wmg.48.1549637162201;
	Fri, 08 Feb 2019 06:46:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:43 +0100
Message-Id: <bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:02 -0000

Except for ming32/darwin, which do not support them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c127434b020..95e9e0ede77 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
 
-# Disable kvm on targets that do not support it
-PACKAGECONFIG_remove_darwin = "kvm"
-PACKAGECONFIG_remove_mingw32 = "kvm"
+# Disable kvm/virgl/mesa on targets that do not support it
+PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
+PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl --with-sdlabi=2.0,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
-- 
2.17.1


