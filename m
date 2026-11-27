Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3715.1795810328342066033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=G1AxPAx9;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so87131285e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810326; x=1796415126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khjDybmGBqbhpSsrnzIt+KoV8/Ap+drtflUOe4TyF38=;
        b=G1AxPAx95IjkBxNalNP9Rn2V+1mOjOI3QIJvWOWUg8d5PwVqzYRK7FYMMY3FtCo991
         K+sp4vueARPnOfhtgRhOvZNAyJgs+kG9FFtCkoul5rtyP/vKyYqrVPops+jPwmN1DCv5
         ffkmrxPLU6r1N81AACNyYWGXbaNOxyBMfIunuZ2pEwTDEPkimw7jE/No8tsBI+xSXUJ2
         RTTOcVfoaWmKfJx1EfAy7ZSzDXxHXKuitmSyo2Bgis5ZJVeHleeH2PszkUJ2GN6DLoRD
         Jt8WbVhrI1W7PLVdwI2KZy+g2WHFssIB/YcThpNlc1dAKm0usW0up0cpS6oNP0cMTw72
         j/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810326; x=1796415126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khjDybmGBqbhpSsrnzIt+KoV8/Ap+drtflUOe4TyF38=;
        b=UROy4+J2sBXe7Hv5WJN9c/jWgvBcs1ze7+nzoxDAAyUcZOg4ETDm8D6TB+mMdnWU7v
         abW95P6xrVg3k2ODCSiGmiyD0rkkuBHxyqI+ltfYAvQpod3JrvQbO6nlrGev55d1IZEz
         epyuWrX3eIbvyTbOEQimf68AGvZsU9+U9WukkVADuVL8FwbtyJr04jscWuSPaWM6VkrC
         yVsSL5JO1GlJUdSY5VVFEL8b3Vsb1yPna58nNVZx72N06xhEWKwKc4vb14HDjb1Lzdzh
         opAX6mUrmOoEUU5G4+nds8ogTZMdm8k+kgpqUgPv5In3hUmzafUcaLaZjm38z8RUfckz
         IG1Q==
X-Gm-Message-State: APuU4Z8QYGix5d9FnTtlJiYmG/woH6dswZrMUOwuoDJV/RAZ6Ma3RNO2
	2g0TbJlyD6pqAN2c+SWbXKGmQG+cY/mrVKTReb2pBf7Uzw29ETnMj7qofBTK3w==
X-Gm-Gg: AZFdTZe1RhK01wX27ts7HcxMxCAFOMJTdyywHyincdPq2YZKdQGoidnQEcMt7IGj2fL
	S8cj2H7hqJiNl+oFpbba59mHB7z/HM+hkzU1lOqFbK2+2zg5xEqHeDyXFa5yL8J5fI4aJD9Z0fn
	euvcqNJtbXOfR2Huyp6OvnduOjPDSaS1YTp/YeHpT7wZrYTE9yudhPqF1u3CjTAW4axoWvjLrpg
	6uSrrdAcmHL0M38Y6328jhIFkcVgtmVeKaKUCrvp6ZI1qkhZYGx7TAIDDzNyvasMFNJrzYcoE7q
	VZldXe+hgIBwdlMBsNnvIkBT4ncsr5FBkRwd1jrf9HZhOjR6uC+LupJOOTqRpX2lmaRLSmaRBrO
	3oVp/fYks35kXqP0IUVuZ7P/B5weCGOqybyM0qivu8GpRJOKq7NkDltYk7ZcjhqBIXTi5D8KPl8
	jkScIagPwBfGAx81LmM/dgcdIBNxhFh6fAnoa00T0d5XwA43l4sLDWH4zaI3GY82gtlPL876bK3
	A8DB3MnqJNrsOw8DQzt/AsmLy/eXu/mH68bb8xlIpSN7vj6aCdC7meY/JXmFoN+E6i0XqVwmZ6P
	iz34GgBTD+DIqZ+Zk44qB3qiv3S02amMXkGcD2DWh7oWbNYBY09H1wSUWmh/o1W8sIxXs8gJKj2
	49bTh0goD/3c=
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr535775205e9.23.1795810326467;
        Fri, 27 Nov 2026 12:12:06 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] qemu: add a pipewire PACKAGECONFIG
Date: Fri, 27 Nov 2026 21:11:56 +0100
Message-ID: <20261127201159.914833-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201159.914833-1-alex.kanavin@gmail.com>
References: <20261127201159.914833-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251449
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

I've reviewed everything that mentions pulseaudio in oe-core;
qemu is the only component with pulseaudio support that also has
pipewire support, but does not (yet) include that in the recipe.

Everything else either already has enabled pipewire (subject
to DISTRO_FEATURE) or has only pulseaudio.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu.inc       | 1 +
 meta/recipes-devtools/qemu/qemu_11.1.3.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e16fd86c915..02f782ef8e1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -224,6 +224,7 @@ PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
+PACKAGECONFIG[pipewire] = "--enable-pipewire,--disable-pipewire,pipewire"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulseaudio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
diff --git a/meta/recipes-devtools/qemu/qemu_11.1.3.bb b/meta/recipes-devtools/qemu/qemu_11.1.3.bb
index b9646e51791..286ad622fed 100644
--- a/meta/recipes-devtools/qemu/qemu_11.1.3.bb
+++ b/meta/recipes-devtools/qemu/qemu_11.1.3.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)
 
 PACKAGECONFIG ??= " \
     fdt sdl pixman kvm pie slirp \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio xen', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire pulseaudio xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-- 
2.47.3

