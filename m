Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE956606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:17:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y10so5239145plp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Ex2SPINhIwxnmCPEJKX0ru9FWQq6LsJgAf6rfoV1xY=;
	b=UIDY+FrqooqAGpMd2EjKVTQYIPZKNASIs4+RBiRYlww7jWxWAt+jJS4Ki/MedHGwOW
	F8nK2L8WIl6HvpWxsBEIBRtT0m3HJijPH/Uc/rFLCPP2rGXy1Oh/UPwlVsk413xezvcf
	bRxKinNo3LqwsXsLnW2uLrIp54RfjthdquauRxaswUzoUBP04ubKSWriqVDjnFQXi7Pu
	TrZm6HzDi1jkjPhhy1Oed4IgK120PM5bF2l6L0MxPYCY4mq2GnFgx4hxm93/F9O+5Ftv
	UPOOJASb3FeBr7THFHpUZJjGxuJqgJ1Ru79cbYGg0OYVQVTcjryDIbXgRq5AnLs8LOJ6
	4j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Ex2SPINhIwxnmCPEJKX0ru9FWQq6LsJgAf6rfoV1xY=;
	b=XjSFlMtbYQNdBX8rY+w9i1LAuBCdj/FpG8AyPayVtKXq+SsJAlGcjiwtNrJhiUuYhT
	AUR/hQA9/FLi5i1IjgffdA7bi36RKtgg5XBmr4RU/9hGBkbzbWGRxlsNRCTozhgIfKBj
	7QbSqCoaKj2xc1r6IK6skXCZAzO6EL3k5PoYetmhwbiha5QXij0ed2WZlHSqZcnv9gyJ
	XPSCqfqvi5psqwZGJwSBqAQPIDtaQp6FSMyXZ4+YinWAkrGZOc74nLraQFCKpj1z3Ok1
	LE+t3sqDYrOk99cktv7pMkriUT+91Ok0glg3YzZ+dlsL3AtTDZi3QjknGaG2xFpx8epv
	e+NA==
X-Gm-Message-State: AHQUAuby2ozrdkzD3fxmaMlVcJJAjDDZ7cywZUGdeVegiDoiA/By05Su
	7H/T9TXplD1vMbpOmTV+6VFJgKcv
X-Google-Smtp-Source: AHgI3IbQ/5SVt3kQLu3HEvvw8go+XeI+IOQIYeJk20MvWd3CrPa0Y4Plx+wlQEkPiZBWOqUlCUHvOQ==
X-Received: by 2002:a17:902:9304:: with SMTP id
	bc4mr23308205plb.81.1551136676202; 
	Mon, 25 Feb 2019 15:17:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id 23sm14148599pfn.2.2019.02.25.15.17.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 15:17:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 15:17:41 -0800
Message-Id: <20190225231742.13855-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2 1/2] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Mon, 25 Feb 2019 23:17:56 -0000
Content-Transfer-Encoding: 8bit

After eglibc was merged into glibc, Kconfig support was also dropped so
these libc features therefore are not effective anymore and can be
removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Add ipv4 and ipv6 to default distro features, they are not libc
  specific anyway
- Remove DISTRO_FEATURES_DEFAULT as this is redundant now

 meta/conf/distro/include/default-distrovars.inc | 11 +----------
 meta/conf/local.conf.sample.extended            | 16 ++--------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 76edff6480..d57329ec17 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,16 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
-DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
-					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-					libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
-					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-					libc-posix-wchar-io"
-DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 010bf6ca6f..0743fefece 100644
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
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
-- 
2.20.1


