Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2099.1794933755070633914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 08:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NNCIOiqL;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso493775e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794933753; x=1795538553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGGBxXE63XGAYbS2DKIFu0mIK1GWgHU7L4bY1h8plZ0=;
        b=NNCIOiqLZY2uXgXiu0mmH1rIDSAjJXE8Gs+dwO6BWhwux3MIuId3Ey6Y0XqHvGRPhU
         myvbeVyDg9u85MZUnBMd0cf2bsNQqTMtmeyRGneERjlpaw+zcZAXWHXnUvXqggW+826g
         HT2j5S09yV2w6LM5YD7BVz3IbfXuIO+dhUzAH+R4PHtJ85NjkcFsb+NlkEuWm2MpS47c
         dhFd3zE/mmfQg/dVf9YptSm5bRCDUR1SBRKuq+jHVdd2fhzGw+sYgY3y6mn5sGaE07R+
         TCuoWciP7BFnuho+6Jz54A+jFxxmPtv66DUvHQFFtREsY9GulBEEd4fbvDqEbX4ZaJI1
         OPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933753; x=1795538553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGGBxXE63XGAYbS2DKIFu0mIK1GWgHU7L4bY1h8plZ0=;
        b=DXX0x88K1PXjlrUCxSYoHVOuq4KE8GZ842l7PGoYRcX6sQ0KaXWdWAvJKiCxEowTTS
         pJVeyniTB6dWQKPOaaev1UlHFhD3rEReQOgUOs/6nTgyXug9um+ATO0YxKHu/lwrwwPX
         T8e8yEidCCND+MsVGmgpCE9lPUuCaNQq5+9H1ND/sDcAs0oXaN/yRroDrzPbNNYY7toF
         RRncCwiRljtScA7jOThBCgDJBDYFTsWo7am0b5G//0gfGnwtNAX2BGSgOdOJTkn0txgx
         OQ+u1PtsgC3PcXDjiNoRh0yK0XTB9o/rvXw7ugmUcpgX/BtwXkw1nc38O+2tmIMxONT6
         MKHA==
X-Gm-Message-State: APuU4Z8sBjsaMom1k2Er+EcjUFzKzzGZiZZYU+uLHBlbKJWY4ouO+pXu
	vKo9/e/M/mUzI0dXEFcsW/WDV/4dI/XB4SAVTXYDa3ZHPNFj+cifSPAkGULbULj/o1zXppqmVY4
	qnPXHL3M=
X-Gm-Gg: AYBFou3WhZeuR+U+JGYaRX5chAjLvGJCkAfkEM9WnLiWFZjJK5XXDv6m8fU7i52SJtZ
	5y2yv63xHuCJO1QYb/4AbLsBomw/BNihhCvIuKLT3HBAmUSgRidHtGTMfbXGiAgB7OlfzTkrLmA
	iUUQLePeh0jEOJQYoD/S7W40LC54/92mYoNSUqQ4sr7xIANFEc9rDNc/mg52YuYIf95ID51MYmh
	vpYa+ZIO90NhvgGnybYPP/HkksofJX4lvslFql0W95tNxqfApzvvHVPkP80GmJwNkoUDiCyiqL9
	vW38F8zoDtn6shvzKqnLg4uQg/+GzuHefwCmiekDB16RahvxCtf4OOgc5OaCjn9XH3DZ8HeRFPy
	JI5oHgftr/ZRM6Ctp4bWNr077eX7PSeEfyFhScgPBsc+WPQU+PwaVIEswDjCsrk934E3M9gaf9R
	RsIsNwV+L9KYh/wTmJdGzVj+PdnQ8a88JHihAPLyIRzcEdlblYsStR3wWcpwnxMMwwHmAGAfK8u
	DhuAmOSFxuLR5U8I+T3Vx0K2FtmcPbQKcJC2c46TZe1daEMjw1LAA58inx3JKkBUCGgvpbBxyPc
	OSYScD4grNc+DePW7QLuG1D5AMDh3XdNt4UWsLXKbQ5DTB3xjv+36cDyHCGbM6PMrhvNE36XIZf
	lkQRAnzmTDsppBaBdgzMKcWTOTSchTs8UhBuFX9M5ThscHLehuW4=
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr315325225e9.32.1794933753128;
        Tue, 17 Nov 2026 08:42:33 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00feac723419d59c8a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:feac:7234:19d5:9c8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm29241987f8f.22.2026.11.17.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:42:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] pseudo: inherit upstream-stable-release-point
Date: Tue, 17 Nov 2026 17:41:51 +0100
Message-ID: <20261117164151.1362220-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 16:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250462
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on it.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index ba946ef9c97..dabf7a63007 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -19,7 +19,7 @@ PROVIDES += "virtual/fakeroot"
 MAKEOPTS = ""
 MAKEOPTS:class-native = "'RPATH=-Wl,--rpath=XORIGIN/../../../sqlite3-native/usr/lib/'"
 
-inherit siteinfo pkgconfig
+inherit siteinfo pkgconfig upstream-stable-release-point
 
 do_configure () {
 	:
