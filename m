Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 070F170179
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:03 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id j68so24316052qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=7OyYsHhRYmaSsX/Cd9kX0wF6t3UgrpnQtDIzhQqHY3c=;
	b=lAYIl18PAQGdx+fgYD94He3OdgGUZOnKCQRpKZDVHw0qbxxnatr0vYhdTdb+3cecwC
	QerwbJkvjz0RkJo+Fbh6zna4JizGFVHiXOimbtOe+3gzAQdGetLVUZvdFpCEhDsojUVn
	jZjog2BMPk0JDKdVTcmDC+wc/Q7kp1ayLR6m9fmvYISmmTbH0ERlwpy2OOMVVNKppPLG
	1XEXCL1PM0ibexh8GMFAkCzz1dRJel+hheRSDCOdk9Uh03A8aioRS+nNB9XhaNPvQ2kN
	mP1f7KSmcpnzA7mfP/vFBdzYMbYwAaLKq2qewFf9gJKPHaYwbHRsMvxbtJW2kqOfGg9E
	aVrA==
X-Gm-Message-State: AOPr4FW3ooLq7vr5Lmo1gPpiajomeXa0nnvaqFhvTvmyxcZbDCIntZ9DmCg2HKxSTrInaA==
X-Received: by 10.233.222.4 with SMTP id s4mr1905192qkf.19.1462402204523;
	Wed, 04 May 2016 15:50:04 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x107sm1862198qgx.6.2016.05.04.15.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:03 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:49:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:34 -0300
Message-Id: <1462402180-16861-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 2/8] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Wed, 04 May 2016 22:50:04 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11 and Wayland.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
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


