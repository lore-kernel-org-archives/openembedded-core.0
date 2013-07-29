Return-Path: <djszapi@archlinux.us>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0F660958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:16:13 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id j13so2458204wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XJk4fX3N7BeI+ILIZ29r/EpAw8G7IpWeUTK/F9A/Uho=;
	b=DoJRIdflE2zb+YGqBAuZ9PS9XIrGRRycAdVcJ2UP2opazaZd/OwCjYvw3xw62Zj2wm
	4aT33TXOF1PQcJi5Lj5bcN2zNqnNXNhKVelsRcihGtikqNBEboy/rEfCrRZGMxGaCueJ
	Rfptt52N5j35rczWFh5nZJKoD6AXahr9KmTjZmFscmqZ8TkqiKNjuAVkdLDqrL01VXYt
	36tS89UC1rmMOqpISQN9LGPVqpBzZWv8ZaZz9Jx2POabl8Fhtw/98+e/qYw+c9Ofnd8P
	cY8mio4UUq/6UV1SciQrLIS26efHi+0wHsb8f/Y1Uaq0xO8d4/M/TrwXKFHF4w/NnPa5
	kJxQ==
X-Received: by 10.180.149.134 with SMTP id ua6mr4525136wib.51.1375082173439;
	Mon, 29 Jul 2013 00:16:13 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31]) by mx.google.com with ESMTPSA id
	dt17sm14799194wic.1.2013.07.29.00.16.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 00:16:12 -0700 (PDT)
Sender: Laszlo Papp <djszapi@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Mon, 29 Jul 2013 08:16:25 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 08:16:24 +0100
Message-Id: <1375082184-14871-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
X-Gm-Message-State: ALoCoQnOPVpcc3uDrfOrYysc31H856JjkMnbE3iuPfgGV0Jz+RHBJIhyNzbuTOOmT8TjHMGbFhzz
Subject: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 07:16:13 -0000

This is necessary to get the build going, for instance with older Code Sourcery
compilers.

It is also disabled in upstream due to this very reason. The details can be
found on the following links:

http://comments.gmane.org/gmane.linux.busybox/30999
http://git.busybox.net/busybox/commit/?h=1_21_stable&id=1cd769a154b04f4b058beed482a5dd7192437cdc

[YOCTO #4932]

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
 meta/recipes-core/busybox/busybox.inc              | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
index bdfdadf..e77a817 100644
--- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
@@ -705,7 +705,7 @@ CONFIG_MICROCOM=y
 # CONFIG_MT is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
-CONFIG_RFKILL=y
+# CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
 # CONFIG_SETSID is not set
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index acd2bfb..0e84f4c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -66,8 +66,6 @@ def features_to_busybox_settings(d):
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
-	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
-- 
1.8.3.4


