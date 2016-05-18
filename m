Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id C317A77085
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:56 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b14so4640324qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=uGEbYpA/WE5AqKJLb2ocdA6h/GBs+lwB7wcCbdk8UaI=;
	b=BUBzvMD+uI6BSBKn4+6E/obU4TfEwH1A0bwPKsVSZVK/DbDgVfq83ALUDb6rhHI2mf
	sq5Jg8AFoUCaOSaqIp91s4COz0t2h8JFwDYCzTIeIeoEQESO5pCFiTlOoxlY1FpFfYJo
	SNzIk9vl4NwKhWOPuxS+YFmPZ6FD5gFTnn0RRrQBp9RbuNlWJzCN/lk5aSzqRc5Mldx6
	w7SwKt7CzIbO+Yv2cMEMdPu3N5M3OX20HruL8KCrfsSm+3eRPCcI0zEsWxbuNInwe7jM
	2iMSgmwarJ6mZa7ZwhDG+BB01l46WzfH72CtIHg58DGTGAyg0yoxT/bNzAVOSYeHGjVS
	caSA==
X-Gm-Message-State: AOPr4FV2VZ49P7WXlAjzpeGTV2BtzdZ6I80E+pE20aG/yBzlu3SJjV5lxBp6b16hyFyAgg==
X-Received: by 10.140.85.106 with SMTP id m97mr8442190qgd.41.1463589717534;
	Wed, 18 May 2016 09:41:57 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 18sm4547716qgx.19.2016.05.18.09.41.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:56 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:41:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:40 -0300
Message-Id: <1463589648-28641-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 05/13] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Wed, 18 May 2016 16:41:56 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11 and Wayland.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 5771249..f6f87d9 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
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


