Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8315.1793225180361915245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=i8sq7/xK;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1fd5f572so749496eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225179; x=1793829979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCDQnNDI3a2nbYfBkQMM38pAkt4zcIW62FFBDBOz91U=;
        b=i8sq7/xK2AUdShbXwVz0h0wgIQofXA2kYrJJPhLmrE8H5Ub33YSMbalozNkCF8KDBJ
         /sLi+2zmzQ0k200izm5ugKRE2mWv/4eqFaKWbe1Iwbytkix0k/fngdWwabTN18tcG5iP
         91SgCSh48jySwgsP9lnNiXdUgKyA5p5zZ++Spk9WBp9MX5F3amR9MWupHKsPeedlnuAO
         NC4eKTx93iMQvTbzfwVDds9y9njMBOQrSUsU/lLIeFQpiZFYvQq0jKxhTgxVNIIRorXL
         5S/WE7zIqqRAdYiskxCn/SzSsGGjzQkZ+vMHW0HSJ7he8KSkArT9bHrU++XCPOeY7/Ob
         vMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225179; x=1793829979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCDQnNDI3a2nbYfBkQMM38pAkt4zcIW62FFBDBOz91U=;
        b=kXXhsFfpotjlyE67x7LaYsZi45E1+4wuhIQrF02xtRmTHAJ/D1Yv9DvG7iSXYkmEiX
         Jp8LjYUdZVXWvt1BsHOwnKwKUuX5DydUOqQZCxWXQu8taYBKaKeARzRzvMSzrA5/oHbK
         76qg6bSx0AdAuOp2bLE5tMcTQqVo2ol55c0banEtFkkaur7FHq2xD65+UnfNhaYInPPW
         2vIjiH0CuUamPG1i8lMoXQ/AYKcWmTu7rxOo7Xc8d6vhR6pJTbHKWpwwMqk7AOZFXpam
         OSbAZ/l99Ve/amo3BL3fFgctDtUQMhDrC1cWipPB8IRpgefqtH1avKbLlgDCOlo7ote0
         JQ+Q==
X-Gm-Message-State: AFq9FYIIm45468bJccENsII99v7iaoV/PBDSbIVu1geKopWB/EQ/S3a6
	J3qqmdGpD7LEEdjEjLh+e9UySX6viRl1l+cfA9ig9tvfTFXIfGbueRIJMyR+bQ==
X-Gm-Gg: AYBFou0Y9s67SZUDLBkLGVLHrqnRbVi8SqZPLWRBGFXWpYGAq2JSjWZsnXSR13GphWh
	+luWyaqQPBPEAMRhSVUnlWuq6NwzMUYtpYeuUaGfyFavaMKe0OHgVKngfRUXiE2shgw3Cg/2boB
	NH95GDhTZTtyeOVucLB5UjGw6KwfGBCAKjMFoS90nNPVhaDACUfyj0hZZeYJjXdr5MXk8KaVOBy
	FNcSB5Vkrbr3scVG7efOaI5zZyOYmcQZuY0Yj6qcp51wsgkXimaBoq7b/SIqQhd3xAj0C3UnICJ
	9txI4o4MpW+qoVRZXBjGNuTzANry7xQ0+yJkHkE8kJhKUZacjhruMetaNAp2aOikAX/i2wAeWvU
	XIWn/dyGXe1WP5XpJ95ot6kuti6Ur1s7f4PUJNW+w2N5ZrpFSh/p6eqhNrCL2u0CGzyxiBIm1AX
	jw37eY8YbOqjfgjbpiW40fMWLxg8gqmW3iKUsmGuwOQ+e0VaXsl6GfR6x6qmJkNJvt+GfzgAO3C
	anQ14Ism3jK5IgENnTeif+SEgiBdG1mUytm+cWe6DsX7Wz+WLUK1mccD/l+DeRFgzdaju6ALkAV
	CAEAuG0V0UXBhv1J4tTl8dqRt/c=
X-Received: by 2002:a05:6820:3413:10b0:713:e433:aa9d with SMTP id 006d021491bc7-713ec60ad2bmr1457269eaf.8.1793225179475;
        Wed, 28 Oct 2026 15:06:19 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 7/8] layer.conf: Fix initramfs-framework not knowing which udev it has
Date: Wed, 28 Oct 2026 16:04:38 -0600
Message-ID: <20261028220609.1348489-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248844
Content-Type: text/plain; charset="utf-8"

The SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS from initramfs-framework to eudev
and systemd meant that it would not correctly update when switching udev
providers (for example, when switching from the "poky" distro to
"poky-altcfg" distro). Fix this by removing both entries.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

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
-- 
2.56.0

