Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id B30227C1EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id c16so8292381lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=spa2n6UNJpzNmGGiLQXdaxOAju2ZEzMrdJUdgUj6VEBuxifBJjBDVFWPwod40Qqv7K
	Zfmi2iUAq/Gr4xLNH+HIQNqqaL5fPlgvJELxJauBA/fGgAUOLOwlgy3tbAF+TFT4w29J
	ppLn6CmX03TMN+UVL7qB8aThQDwApmi39/dJ16hkAzRTLw/KmlUdV+m6Bj/x8rdWWVES
	XfJzhbNsjJl0N6x0BUFmG0mV5jgWlDE2tnpMHEOf2fyfLrYxP2ZUr0V/wPbeCX1RQXnW
	7c9x2k72WMJ/8Zy85AfPBMRw5tnJEvhifBKmljmkPlgwKqnrRchrgfyqI79UuCU/hCHY
	vCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=SO/ICpZhidRpNgekdZeWRhiqREBlX//VuRn/jn86rjTXvJ1w3Blwy/XbSdAB9JRTqm
	Xn4M7AbZXWZ9qgKsgspp8TKm2sIgFZS2apQM+Yqapz3AFHEzsSenBHbtir8uYjkUQ3O9
	wNpQ67n/fUkk5YDBwhUVtqJIBpk/mPHpPYH36RRl3pPDq/ajKxoPOKvt3CRio+msoBuc
	k+GzWgiHnTT2Y6VH9jS4pK51pLELgsZ0+9p6HKNvRkX1PUmipuy/GoCwI+cO9Pa1PiUM
	2qGCxEPkdCA4zCDzijsnT7gCyTKz0giYVBhRbrH2XYlWr1p+qFcE7cju23/4iL1xedVz
	akuQ==
X-Gm-Message-State: AJcUukeh/upFiWDw7I1ZWjH7Iz9MfyRe7yOuJZW83qRzWRYJkRuEaxYe
	JBemZYeUb87da21xioOBVl1PDPOp
X-Google-Smtp-Source: ALg8bN714KtEC637EDKI7NtoMjaa+vJkB1WJfWhO2sjDpmFFUDHY9vFoJykQZ/zW++cb4g0yMCccMA==
X-Received: by 2002:a19:2906:: with SMTP id p6mr10410099lfp.17.1547743234739; 
	Thu, 17 Jan 2019 08:40:34 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:54 +0100
Message-Id: <526e37cc4625f80616ecada13f6b9a9fed58b22d.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 09/27] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:35 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1cee9eb..f943b9ee5a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,8 +74,8 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


