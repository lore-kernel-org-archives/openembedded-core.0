Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1F19976DBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:49:18 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id e32so67315563qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dMwDoN08hbTL3r5165MmH+/AAe1PIzVLzKxXCl8wms8=;
	b=EF3mZz1uCecfe6oCShd+/g6BzgNxfyMpecTAIhoDKyT7YaxAlIsNiZksreM4U8jsnf
	vS9XtsPWnRlXDuzyhLTe6re0glKb9SL0iW5K0ZZwoEDV/1gjUUZjAH/Ou3MFCY217c3b
	TI4NheifDAzJSFH/2H+aZW/5suU/cFfdNwEhJfteUYq7mPwKMp/F46zh/p7AZsn00QKZ
	74SbdBKrBJ93Yc/GgwLpI8w3577vvkX/im27qe9rhhYn/jhER0kewKHPzQcqTRXWuFIp
	fQkYfkC8aZHtUg186avKx30dYFy4b8jyUNb4BDr0O1SheVS+TdZ+JYIjo9jUlRj+sJKs
	owYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dMwDoN08hbTL3r5165MmH+/AAe1PIzVLzKxXCl8wms8=;
	b=Cvq599nnwxYOYHZj6aRPvD0PaRfOhjXBgCLlMwvBGq/fiuOyGQGEt87IxWqry6yc+h
	6ksEqqH0IN+JJUPrWkq7i31+nNSYgTfYwsUBaoepFl1bc8mJhu4ISYzGy/B7SqfNKA9g
	IV+yDzbP50dwmLBar+4M9vnQ12jGQJXVR9xHvr4ks988eMi5P6uRAioDMZAukrvNNtMr
	RlOhSo5n7mSSuI2cMmmx08dWlppVNPchDH3fmEj3oKzpdtPER1n6fC2/m4K4JEx/VmOk
	VVM99PeGD+WqSbVV3fpCYDwvvuA8wYefWJcBCD7tprEojuwAKPIQEgxncJ7Dfo5xXert
	Ebfg==
X-Gm-Message-State: AG10YOSDHRAvhYmOuS4G3Pkyud4aG5i0qKmYiak7NuYmXg3ssiJglsg5wV5w9nGXT6ylrw==
X-Received: by 10.140.101.119 with SMTP id t110mr6401394qge.68.1453495759059; 
	Fri, 22 Jan 2016 12:49:19 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	j23sm3486276qge.23.2016.01.22.12.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 12:49:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 20:49:10 +0000
Message-Id: <1453495750-104494-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] local.conf.sample: Document HOW-TO enable systemd or busbox to replace sysvinit
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
X-List-Received-Date: Fri, 22 Jan 2016 20:49:19 -0000

OE core provides systemd,busybox as options for system init system along
with sysvinit being the default. Document the needed settings to enable
systemd and busybox as options if user wishes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/local.conf.sample | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index a662f4d..b760546 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -209,6 +209,23 @@ PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 #ASSUME_PROVIDED += "libsdl-native"
 
+#
+# Use busybox/mdev for system initialization
+#
+#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+#VIRTUAL-RUNTIME_login_manager = "busybox"
+#VIRTUAL-RUNTIME_init_manager = "busybox"
+#VIRTUAL-RUNTIME_initscripts = "initscripts"
+#VIRTUAL-RUNTIME_keymaps = "keymaps"
+#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+
+#
+# Use systemd for system initialization
+#
+#DISTRO_FEATURES_append = " systemd sysvinit"
+#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+#VIRTUAL-RUNTIME_init_manager = "systemd"
+#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.7.0


