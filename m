Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11869.1793806545574063074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Hr1two/v;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-845788309b4so321252a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806545; x=1794411345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgGgrsdYcAYFv20+scFd1l2zyAhrCHmz+MgfiomwYHo=;
        b=Hr1two/vebX1SyR2U8kkplC2jb97eNDW4/EwxFuRcB/5vs9JmlY7rIZNgQB30W/eAE
         UDuD2kk5BU3XIOJr39sssrGFvHoovj3c9f8cGtXQqw3PoDsY251SjQd/XY1qqA0KrtgQ
         pPQj/9b1swrHkFqhDi/NAfS0gj1QbO0JfLCL5uNsYaSlIeNIu6nKsc3L2i76lNU8KS/Z
         R3wAGki33zIlCL7GBlWCkGUzuFhKF8E9gSAkLjey952LC9CtQgD4R2uVI2cqe2haTMMX
         C7JqyyBGIcnEj4I1JGwFnrj4P0fwpXBsHQBGBqq/nPJ/ltEpVwwRtVQbfVTwKUN0g3XA
         /Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806545; x=1794411345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgGgrsdYcAYFv20+scFd1l2zyAhrCHmz+MgfiomwYHo=;
        b=I3goZeKwIiZy1vR1RO2hLLhygMsfMykjsyMEvWkZds5QUMy7Zic0NqO8KE2H3y2ZMv
         /mFRtovRV3PwqHcnGdEOxC8Vtk4bz1roK4VoZUDO/XdRwS+ol0mvfADb51sVQwFMAOAV
         jbJd9E4OAtJCpjPnHBd79TrFALLONAtoedIikCYkFmKfONxdhnhOP0kxW87KYZtYGOlZ
         ZvTdo8QPceD+VblqvEisv3KNmXyLQNaUvQxHrKNf49aPHXLTtHogA3RJ1bWpizkCV7pB
         8lNKLkQ+R355Xk1bscpu4PqHqq1xZimhseZ7vlqa5NrbW7rQMaWFQfJOeqNeeMge6llU
         stgQ==
X-Gm-Message-State: APuU4Z+/giZx+9TQGms+zxYdvVUlFAPf8eWR1hupDqF+2k0NJIvLmFWn
	Ku/st/7lYDHTGAvVPicuLgqhDQlPeuA1zpCgP++ondoC3oLx7VY5TzKBdHWNEw==
X-Gm-Gg: AYBFou1kIDpw/hA3foo3OQ44vhkStEU1QogdOjREWDqs/JeWkTGM2Ftyj+Osrqnt3A1
	JtRKWczZAgE+ypd3rUpyYucgSEGOjM9R4j8rfG4wU4xbNsxGIx8GdgTCWhkvfrJA6iAT/tag6nY
	YfC4qOUHVutJP9p2V6C39pYGi9ia2R3tnPG4qNeItR4GoityilVJy74+bSkhjiL/Y7mx2doOg7Q
	gb03ED3Falvtp/URYIZxLU0x4eq1TGLi2S4ZiiKOWaSoIeYp/pu0/bW+f6d/o1+NGdT6Jc3zWHS
	mZE4JrVajpYXlndOdfYV6ucpr9p1ernRXStx7jiW4+8hWjJNFGxjwPEsfZqpbjZwGW/mSKln0qv
	PEZ1MtjsRYOIr2byh05Imuq1xrAlxUgOqlroSi/1wvfrLzJ0jfLCNhEdZzwGo/XGOu2k9L03P2V
	07GgAj18lpo/0dQZw/2vzD/v1pwAEBawhWd3yqFlkGxddY//z9sF2gk9Rp01c3DRa102su4XZHO
	bpkatpWlkGrWfMCVlscFotzJverfQgxjkWA8Y+vVbFaxUiTizGezWLtAD0O3MIrArbd1OQdo7Ct
	Z19pfMQ6c6GL7NNIFtAfUivcgh/inOu9w/n6u6e65N0I3uz3
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-5640de625damr11693287b6e.58.1793806544558;
        Wed, 04 Nov 2026 07:35:44 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 7/9] layer.conf: Fix initramfs-framework not knowing which udev it has
Date: Wed,  4 Nov 2026 08:34:00 -0700
Message-ID: <20261104153535.3184146-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249401
Content-Type: text/plain; charset="utf-8"

The SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS from initramfs-framework to eudev
and systemd meant that it would not correctly update when switching udev
providers (for example, when switching from the "poky" distro to
"poky-altcfg" distro). Fix this by removing both entries.

This also requires that the recipe no longer be allarch since it will
change based on distro.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf                                       | 2 --
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 13c920be6c..b55d50c60c 100644
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

