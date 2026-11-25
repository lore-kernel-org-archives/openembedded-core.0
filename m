Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45126.1795622911157063767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Q6OF4TkA;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-92116a3ef3cso76649286d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622910; x=1796227710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWUf5+wgjZL2tlRhG8lJp1A1fqmPhaN8WQNrV19HrPE=;
        b=Q6OF4TkA+kHCGhBDlHEj5K4u3DkZbz0SginjPDVgE+EpGUycP3rToXSoFgWQvSK35j
         XVIersfCrnRQpyGtEWG2d2AsLIipxKiUosNKoR61nE941ECx5e2OZRDlvmVS4N+IVpci
         gbWgVcGbFY0krOU29qhbjuyCoZ+XMMUueX4qARKt6Bp8XGrN2gMokkxd13dS6sMYcfWW
         13T64uCulV2HMlgoQlX1Gc+ERqJJ2Kz11LAi8p/9qTUrYIyuB89Wl0HbV7crWP7Bxp7m
         zkvMwxLvqXMr8Zxr+6b6czmyyaoAJ0u6ISn9nBX6mpriMoQKhsoNPL7Cb5/tfDWPDsMY
         ZL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622910; x=1796227710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VWUf5+wgjZL2tlRhG8lJp1A1fqmPhaN8WQNrV19HrPE=;
        b=eZfbs0yxz3HWYa3Qd02gG0sDJx98oKMcOEtmnPd3DrE/4xJC1KNof1BUO+1ZTxXsGV
         dRSry7t40asmPRisaNLPK1UESVxRBXDK5JIMCAUGY4Pami9W/IF/NPhRYCvMdsj7MByg
         e2WNAR8bmPkCLEdvbJeGEz9vOQKaOqgWyYD4u5dP74L+CXFxYkd1wb7phQh6YQu0UlKV
         v+JXpXmp98/OmEawnA7SZE44QfWBNtdlkORPZT57ubsGY9P2OM1xTrnd0/iTUqy+kbl5
         ck4rhRXUCmxls+UFgOjLa80o+Cw0keGnYrbGXozf3FNbulLjVt6VvCimPIkRaz9kFB2y
         Irzg==
X-Gm-Message-State: APuU4Z/uX7DUczykyToqwXqLW5IiB5LPddOmIu6ytxoDe8BHDz81MUXK
	8zz6cnoJwNuJ1i57Cf2SqtdYebbxEaXwgMzilAHsBlokeu5/Kron4YSAyPD+/ACI61s2ZoJMvae
	B/yvL
X-Gm-Gg: AZFdTZdHQRYqLnJZWQ4Puuqql6o0v0vdzLP80mR1g5d+HqAkqhYew65IwkswsklRmjZ
	JhoWnrrDrk+EflILDMrorX/pUh1f20BJnypGnYTRlBFJ04AalxEoBwOtpnXs4zruqpuqI5/MV9G
	Hn/2x6V+p18UOgx4RwEj4qeFVBHURHctGPEtMe3OrvVgYAgNBT/tWoSjmFxjr5svtwA2kTTvw5M
	IXylmmcJSaWQ/AQ69mhq0/HuJPF2FXwxT8LALQrIZ/xJkomsih5rVnqxuqM5T5hOGJMGgww8W6p
	zBPjt6r9PNEzcS7tq/Jxjwu96bi/jHe73ooPn9+1echJmc0XSeyr7pUeF2STFJEfxQwJL991kJ4
	99BLh25xiN85xtT+i+8s6sW+AGm2zEoYji71uD1ZvMSbAP/pSu18ToBMDTcndAzq6McWRF1OyjX
	oJtMZ0XrBXr8JfP3QIw/Ij9hsd/2pw3HRfzubIbTLru/jTi3Jl7HPkOsQIT23lIeKU/x7hgLife
	Y0JO4aKR3brAZCU4MCKS//HDwMwLfMDOqkl3HZlTbhdnSsZJKkzTVcqWDncbArq6FsEuEWt+g6f
	qqYKYrr1OkGDUOa6zvtSdFDJPza6yf+ImlCD6pE0vRZL7mvrj3FuFrAoak+TgGssECLAFhBBosU
	q3KhUYB4fuw==
X-Received: by 2002:a05:6214:8615:b0:921:8254:7a84 with SMTP id 6a1803df08f44-92182547be4mr11009096d6.23.1795622909893;
        Wed, 25 Nov 2026 08:08:29 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:29 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6 v2] librsvg: make ptest symlink creation idempotent
Date: Wed, 25 Nov 2026 11:08:20 -0500
Message-ID: <20261125160821.3028875-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251210
Content-Type: text/plain; charset="utf-8"

do_install_ptest:append() for librsvg was creating a link for 'ptest'
outside of PTEST_PATH, so it wasn't being removed during cleanup and
would remain present on rebuild. This created a self-referencing link,
leading to errors like:

|     1509:             follow_symlinks=follow_symlinks)
|     1510:
|     1511:def get_terminal_size(fallback=(80, 24)):
|     1512:    """Get the size of the terminal window.
|Exception: OSError: [Errno 40] Too many levels of symbolic links: '/home/tgamblin/workspace/ypbuilds/riscv-maint/build/tmp/work/x86-64-v3-oe-linux/librsvg/2.63.4/image/usr/lib/librsvg/ptest/ptest'
|
|ERROR: Logfile of failure stored in: /home/tgamblin/workspace/ypbuilds/riscv-maint/build/tmp/work/x86-64-v3-oe-linux/librsvg/2.63.4/temp/log.do_install_ptest_base.2703564
|ERROR: Task (/home/tgamblin/workspace/ypbuilds/riscv-maint/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_install_ptest_base) failed with exit code '1'

Treat the link name as a normal file if it's a directory ('-n'; i.e.
don't follow the link) and force-overwrite it ('-f') so that the link
gets recreated on subsequent runs.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.63.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
index 6e88270075..a6fd4cea28 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
@@ -87,7 +87,7 @@ do_install_ptest:append() {
 	# the api tests look for the required files in rsvg folder, so simulate it
 	# with a symlink that points to the current folder
 	ln -s . ${D}${PTEST_PATH}/rsvg
-	ln -s ptest ${D}${PTEST_PATH}/../rsvg
+	ln -snf ptest ${D}${PTEST_PATH}/../rsvg
 }
 
 PACKAGES =+ "librsvg-gtk rsvg"
-- 
2.56.1

