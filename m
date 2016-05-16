Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF3D062136
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:30 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id f74so14547345qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=bhcCVKL152FbHlObdH5g6hBRvNbBupb2RWzdyRIv0DI=;
	b=CNGTIsIaTnOF1xLbNSLeOHdXsCXGE/EhSHyGjrYpLiCA2MC0fDTJcMZHBsrLN+ohiR
	4WZ7trIUbY0zKVvExiHdj+EUqy/DSRbcrA4B/anA77enL42FfFKk6Nxbr+tkeFK2bMzV
	Mw3vf3nlqw/BkjqrvM4/5A2YWIrohCA36p3MpjTgAI0aS/p1C+yy7eeK0LSVEZ9WTMNB
	fKuzdWD3JU6MRsGKMPgEZEyrfBM9YcPliS9hHwjeBaon/EftwSi/jgcc1eex2R7ZV2rS
	NpAiIcMJ1tDSS9+JqRHzK+pb/Ssx63qSUpb0ZA1M5izqkJjhuRxXger/ThCIW7VO+gL9
	HZkw==
X-Gm-Message-State: AOPr4FXEIqzEpWbX/DziNi+2o+zGSnP5jx0Z3x2kP2NnH8Npn3Sg45M2gHjjxE8cVul05w==
X-Received: by 10.140.99.109 with SMTP id p100mr30397432qge.97.1463426011448; 
	Mon, 16 May 2016 12:13:31 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	f19sm15424051qgd.21.2016.05.16.12.13.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:13:30 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:13:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:04 -0300
Message-Id: <1463425932-10080-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 06/14] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 May 2016 19:13:31 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11 and Wayland.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 1e89a8e..0b881ee 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -69,8 +69,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
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


