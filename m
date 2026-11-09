Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3701.1794253688406538284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lt4vdIMz;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aa9606ddadso694190eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253687; x=1794858487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qc9A3xDZL0PLR2xUGS0JajTq0EAjpbSucIh696uA48=;
        b=lt4vdIMzKmTJcZkpH1pPjYtS6uY5QR+5Q5f4c7bjIS7+fc2+KoP5N3jC6ZGb11TF3D
         0xL2DweHBoJbtpH3VjAX38FwtTIpptHS3bO8cp2uA0erWTIjKUgfXUFkYuLQtkWZwozk
         oFbmBkpBVmO5DxuMwkYnofZ5bJ6TDnvv4+VHr9ZKeUTfuo0A8BMMcH3X1pb2i/RPq4DQ
         NOFvQYp7AgoCbe8G/nCiCp5paOB5OPRnqeYCD5hvGhYM5ujnYJBe59JvOBdl6+0gcOID
         51XukbRVrDfWIrqnKlq7qCtrpekwD0W87esCaPQsHu9Fme6rWcJDj+zTolml8Fy0anFX
         26yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253687; x=1794858487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qc9A3xDZL0PLR2xUGS0JajTq0EAjpbSucIh696uA48=;
        b=EwZ5a5CbsfcCoVMckJnQ3YQHySdsOalNMLmJNgd7GXMwnUXsrrX3AXZFB/3vDLmUIM
         cET17Q7v72VHCvwOdyLf3f74xnHvVfIPAx9mkMgX0XTIO4/S+AQPWhboHHR6u4sZfkji
         VQ1mcF+HjxwiCO06I+uNAIlGj771ppW7lEZ+P0WKQwDWrmO1+JXOQiyYKRWWXXKXP+/G
         /ZiCjd77zyr3RGZCxEq0PrsMpv20fBd++5GFfVzvgyXs2eLvXK6EN8YgFTE+KXr2Wgrk
         /Q96D/l+m+skdFfzs/wHXZ7V4l/jquLW3GBt4bHu3spxEQDk5Jm2XHDEECad2dFQwpD7
         va8w==
X-Gm-Message-State: APuU4Z+oDx/hE7em32LpwuQpUKfclxFB9n0utET13eUHVTPw2ZWgc5jU
	Yxmb+UCIPzZ/fmWuHb94A+h8bP0vnapThG5QyM7C13z+rb11KJ28lBuB5Vej6Q==
X-Gm-Gg: AYBFou1ARG+syDUcRRmD6xhJOADynleAbKdGicyf3zQymtzNFuPKH7gkFPbS3ibXY3d
	HwisHMu/ZNQ12yFll3+ACnWbII3+AzUg6lb7tiQmtbteBYCXnE0NwSv80RsdLv+pVm4eJI3O7pF
	rZ29iEVxeHRAlLottfCyppyKi4/JFBCwYD9H0aKl39qoh0qzaqUv6McO5U/rAWUzpZpDFvZPv2b
	Ix6Jdrpn+qpRHV/W9UJ6NZj+08XfBMi5wBowWD5USam8Ek9k1FgftuZIax1h9CK96JTUW1OTw52
	p72yXVKxGrvCNqBXSS+XeeYZo8gUdqdwx7FTbP7TfplI6nt7Ispkw1wMmMk/nOQIVrDW4FUsh/u
	HSA+0oEczOs16aO7qWTBHwhNePEJKn83lgSoglQodDEFHjr6kcucpUXwNVjf4c2TMlY8fTDN9Oy
	n4Ds6Wm/qpKcefWNawE4V1FWQI6R3hX1QNEaBB36/0rc6OE31ZKNmoD7nXvFdfxk7skfilKdOji
	k3thKo5OinCiq0Jq5yoUjfZzEQoKb2x1MpO64hkMHZq5SOuP/xOL2qxWnbjTI9+l9AI03toZliK
	z0gnOafIWqwHxDiBexxzKifah54=
X-Received: by 2002:a05:6820:1395:b0:6b7:8415:d78f with SMTP id 006d021491bc7-718a5f4034bmr100677eaf.58.1794253687564;
        Mon, 09 Nov 2026 11:48:07 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:07 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 7/9] layer.conf: Fix initramfs-framework not knowing which udev it has
Date: Mon,  9 Nov 2026 12:45:43 -0700
Message-ID: <20261109194759.550935-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249872
Content-Type: text/plain; charset="utf-8"

The SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS from initramfs-framework to eudev
and systemd meant that it would not correctly update when switching udev
providers (for example, when switching from the "poky" distro to
"poky-altcfg" distro). Fix this by removing both entries.

This also requires that the recipe no longer be allarch since it will
change based on distro, which in turn requires
initramfs-module-setup-live to exclude it from signature generation so
that it can remain allarch.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf                                       | 3 +--
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 13c920be6c..67fef79154 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -59,8 +59,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
-  initramfs-framework->eudev \
-  initramfs-framework->systemd \
   initramfs-module-install-efi->dosfstools \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
@@ -69,6 +67,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install->grub \
   initramfs-module-install->parted \
   initramfs-module-install->util-linux \
+  initramfs-module-setup-live->initramfs-framework \
   initramfs-module-setup-live->udev-extraconf \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 2ec03bc34c..2c5ff10813 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-inherit allarch
-
 SRC_URI = "file://init \
            file://exec \
            file://nfsrootfs \
-- 
2.56.0

