Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E01F7C8DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:00:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n125so4924657pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hc9Y85axZTdrkOta48oupoWhYLM46xcRd0HTd3E/S8I=;
	b=qfy3foc2wgEDmGZ8vEK26MLjXIE5LXu9I+bifODFWC1RxxuYo1mVwWi2shpugtTqLy
	lEAusstG/oyXKKkmZRnruZhN5Ka5zdTvRleXxIRWEbpkTByRpKpNfjgqOvmLjaceZ8Rb
	+kZMiunXhf0Yf/1AI3KaR1pPFW/LZdkcGfCVnja00FBpu5lfWjPPt7L76Q0FgeFzN8UU
	T0PFQGggsIQAufF7o18yYdo0x1PgxXPtZj/JiCBIEWkUg75JhOOC5dWmJhQK36ApojM1
	mLN75Vju79l1ds1iIzGCPIkKM98RAgIMpmF61pzpFX0dorukuwTWUVbOGq7+o9FmdnmG
	3ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hc9Y85axZTdrkOta48oupoWhYLM46xcRd0HTd3E/S8I=;
	b=Q1eRY98MT5rCvdjErvKz++k09OTGRvtqkXD/fID+gaYY0+Mx16RrcF4KbIw31OuAhs
	3heECFRRqT2gwrPa6bWS8WIrdbeamzdg4n+NSlxnqfHyv1AnNp0ndDL4dGjSNXTDUjwO
	0WFNr7Kl1zeIyjQ+gDKDF22/PQWotIiNijXc+Z/tOiLkVqaHxi5qzCUq/VeChLhBkAON
	6cspjNGeQE3G5CPb3HtKnCqQZw104OdwhNC2JybcbMWgydSYxTxlafSjAlRX+6X3Tsws
	mEzPnD8rxMzLNeD2dZTjeXeTJFAOq5LkqOmdeyGI7fPm5ewu19K4QbSGVUsbw3XeM4UX
	zQiw==
X-Gm-Message-State: AHQUAubi6aBYdWNrZhDfGG50o0JFUNY7wxTfLPZ9Uu+dL1/blk6kY6Wu
	x2e3spp7kiBToBfd/l/kcdIyUxbd
X-Google-Smtp-Source: AHgI3Ibp4TqmWBhmGUE69xaGs0xMSz+Q6Bq59icPJEPL/Ppn2QVbgWP8qHE+NgvUnk1sfgE5FyRQUg==
X-Received: by 2002:a63:6cc1:: with SMTP id
	h184mr20616946pgc.151.1551121203652; 
	Mon, 25 Feb 2019 11:00:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id
	h79sm23383044pfj.186.2019.02.25.11.00.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 11:00:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:59:54 -0800
Message-Id: <20190225185954.15628-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Mon, 25 Feb 2019 19:00:03 -0000
Content-Transfer-Encoding: 8bit

After eglibc was merged into glibc, Kconfig support was also dropped so
these libc features therefore are not effective anymore and can be
removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 10 +---------
 meta/conf/local.conf.sample.extended            | 16 ++--------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 76edff6480..35da7f10e1 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -11,15 +11,7 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
 DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
-DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-					libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
-					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-					libc-posix-wchar-io"
-DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 010bf6ca6f..91e321047f 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -24,22 +24,10 @@
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
 
-
-# glibc configurability is used to reduce minimal image's size.
-# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
-# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
-# and DISTRO_FEATURES definitions to local.conf to enable the options.
-#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \
-#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
-#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-#               libc-posix-wchar-io"
-
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
-- 
2.20.1


