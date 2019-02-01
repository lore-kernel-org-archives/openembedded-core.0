Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 646087C2F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p4so6998978wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=EUqjIzqAyc2ddq9Cweb5pDMSBTXJjFaop0FJcgNMuh3SZsSvVebfOmupS31v4sXGO2
	f4PXj6ma5oeP9+ACO4csYmPKBcFVtbeI/3jrGroDfMtRojLXUCOqwDMbe6RSmax6/OH/
	qMnqdrY7Wy9Fq9ry5ibod5wiqj9eytqSiQHq/Vd0svdZgHPnlyfCDH7e2T/iRlTlaP4f
	JrNR+MWfwe5YwDQDJkk7OIArFnE2zYxrFlK+1i/mJwr/AspbCJbpuY7eiDok40U5hIMh
	8bqtetg5z4FAiydtR6P8Pky2JYAlLXo84DCySnKaRS+slZIjHGCjFfu+KokqXn5nlD7D
	FZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=Ld1zkU5X2iFYJy3piR+ownc8Tz9r3CA/pCBf8WK/bjpbyjK5n+O2XUlG/QnfnuF0od
	6jDU04X+9sXf+YKA7w2bibokhDrfdNdVXqK5lREcpJM6/v/TJDbwFYnaBTqDDOszx/PC
	tuRESyDRgKdoiin5bbwKnon8r18hBPGd9SUTP7ZoaAf5eBCjciU8BhoYK8cUWboEs9Sg
	cpkoimd8FO8omemLTLqJ/ZKBw5ZE4zWq3E+FpkUWo/b1at4EsDd5unTQeimkwt+lxG5L
	I6drPDYSaJnYx0yEVbJ/sxB4qDz0uLMorsRjLZFHQlVOsUGKf96VaME5hEHNkoTs7vFm
	pUJg==
X-Gm-Message-State: AJcUukdzVgZS6XuIlVfkArXhEA+iQnWoF5LX6CsqYaWGa0grzJ3KO0WX
	y5Ey+NPy5h8mdK5B/IWk7+ytjpMG
X-Google-Smtp-Source: ALg8bN4WWw651CUyPelb26RaUJU+tNYK3aw+qfPLgE40QNunj92UKQ+ypRJQgcumP6eXAT69gsd8LA==
X-Received: by 2002:adf:df01:: with SMTP id y1mr40101246wrl.127.1549026363436; 
	Fri, 01 Feb 2019 05:06:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:43 +0100
Message-Id: <20190201130554.90094-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/13] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:03 -0000

Except for ming32/darwin, which do not support them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1cee9eb..b6c98a4923b 100644
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


