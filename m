Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 790AD731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:15 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id xk12so14406111pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=CeIPHO6qhZxZ1rWovosxdM6IqD07fNzFanXzos79qOo=;
	b=c60lrlUcGwPCRWRH+J3rJSjlNzECck33RhSn7MjF7PtgOZJy+ss4Erxlm+Ln0k6C3e
	qqJNtYbb6woYoixbyaWUXp2j0RoKW807TBqJfgmcNeIcHet5Rk4/AwSFtUQq2QSiZgzb
	/9GDIx8q/5ZmrOlXZHSyEPb2jCAa4Vg7TuaTN9W8Om4yjhaMlfnpZMVlZhF9/nE+cPaC
	ft/Z0JToi4rIGbdzgCW0FENeChGeqshCZJ17r4ZODXhruIwP7Y7XhPci02SPNAoN/rXd
	Giq/XRqUJ3dGFkVKBxXPPVmJ4V5f8TTeXjtNH1KHLKmeZv3tOF92nVd2pGM38imxpDvK
	AX4A==
X-Gm-Message-State: AOPr4FWhFR8a6hclYRv0KIWBgs8y99X96QUlUmM6cb6/2pAT//w3i/zJfPfAcSxmHu+ODg==
X-Received: by 10.66.138.16 with SMTP id qm16mr6284498pab.28.1462305676567;
	Tue, 03 May 2016 13:01:16 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id i6sm70093pfc.65.2016.05.03.13.01.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:15 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:46 -0300
Message-Id: <1462305651-16593-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 2/7] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 May 2016 20:01:17 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11 and Wayland.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 124a16c..2e42880 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -73,8 +73,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
-# Weston with Xwayland support
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
+# Weston with Xwayland support (requires X11 and Wayland)
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
-- 
2.8.2


