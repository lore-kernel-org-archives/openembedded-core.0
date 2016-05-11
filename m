Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4110A70034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n62so2851802qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=umAzseeeKiNqmrk2XwlMA0Fopm4+mgw6KLGENB1PJSg=;
	b=H9lToIoB47vgJHkGxmYK590Zlv/l/N7a8/fTw+t52V8eegYe2K3OjEflFWA/VQAZ9j
	3waDYWRwLvrQIMbaEWMIr+OhBFIc6JsC2cx3BOfSAEVEVUVlc70LNTzdblVwUVZGr/UK
	vRhrUZcIbaOhLNp50YFNdUSx3nuiiVtKRFK43BljO7bCrk6XEID8/flUUnGW2T3B9Bgf
	Owrh+XIsVxu03Ahyd9wwRdh8sxMLqnXfyzo+wuGU6PKHRFvwzv5NUN7zfw4e2zY4Offu
	SlhNcVYfnjMLGRUUQwC2+dT/jPbD5xmi6nuwKbXmmcwmXYbWutjuXQINx80woAXLReFL
	n5uA==
X-Gm-Message-State: AOPr4FU0X9bIGloajL3hdCnsvMoJqKQ8dfxWRh8nSZgrPOv+xJt605k32TKJbDpVkvHZkQ==
X-Received: by 10.55.76.15 with SMTP id z15mr3834598qka.32.1462977088948;
	Wed, 11 May 2016 07:31:28 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id b18sm3583984qkc.9.2016.05.11.07.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:27 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:36 -0300
Message-Id: <1462977042-7436-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 05/11] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Wed, 11 May 2016 14:31:28 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11 and Wayland.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index beaa3f2..8b48f5f 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -71,8 +71,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
-# Weston with Xwayland support
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
+# Weston with Xwayland support (requires X11 and Wayland)
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 # Clients support
-- 
2.8.2


