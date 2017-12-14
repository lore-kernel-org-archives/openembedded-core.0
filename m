Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6D078678
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 00:27:01 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id k134so2241276pga.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=249ryGpOz+Jy9T6SkXpg7QGjW0jfHm67bFGuJr/8apY=;
	b=up3jvBae5uy58zZBdtesazhSM/UX7sC+233FudPIDzChjBfOxE+lTdGD4ZbYvsohNw
	+MaDtGYgmlXj8jBFSlyepIKD7m+NU48sKhCNnWNcOfVTMXcdunMtK3XGML0aZijffXne
	cu6Kw9BbxyawQ/N+UeUEhlHF64DokHBkZ5vr7oYTirXGNJMrqKN7lOqojmos/+hdDVX4
	xgYgmvxTQlyIbHEG1pXIBEqavMsmLoysQxnY48RCO4ippNfSM1SfqwXEpysB+AMOYDmn
	ztGZ42R/SkCZYwwqvCFAt2lfFshAmNamU5FZVFGCqxlMjAjl6vZ4HycaaEv+B9XwsHXt
	ttjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=249ryGpOz+Jy9T6SkXpg7QGjW0jfHm67bFGuJr/8apY=;
	b=j7FfR3/d88nQksur9xA1i1zx/G8aqmtfmJ8dRYL+tBUPD5A2R+FEsCCn4ODF/koC6K
	3ayWSUitkP3LXFO9+aZrfosvzmvzlUusw9hiZKWqLnIUM3qgoRTYMCo0cQgeL32/K2vo
	KuvdK8q5b3nh5FkMvKIj7ulmeTbZL67Yy4emiRgxtsXfQO22e+vwayN61QLw/srJpLfK
	+CiRbca3JSz8yIePvj1/e1nYVs4rCXD4rw7BCk1UlhUsqQ09tRPhUV7DnDomPuAIQZm8
	IpAFMSOP7p2XkRly9YUxtJCfRC7aMJOUUYWl1SpiRQJkP45La28BAsCAS17r7kKqDv6P
	MR2g==
X-Gm-Message-State: AKGB3mKQ717Vbw2G9IsMp3R1UcPsUJzuw5a2deDvZIO6tEpLxA/B4x08
	176mLn4t0HZuR0ceEqPHKZOG0g==
X-Google-Smtp-Source: ACJfBoutpOEGR1qPm03uis+T2DYW5NPpbpPAH/I2PslYGMeXLOSEqCWFn+22Fe56M28kzU+r1CUolg==
X-Received: by 10.84.133.67 with SMTP id 61mr3022509plf.20.1513211222982;
	Wed, 13 Dec 2017 16:27:02 -0800 (PST)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69])
	by smtp.gmail.com with ESMTPSA id b8sm5124989pff.26.2017.12.13.16.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 16:27:02 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Dec 2017 00:26:50 +0000
Message-Id: <1513211210-73090-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: 4.13.0 -> 4.14.1
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
X-List-Received-Date: Thu, 14 Dec 2017 00:27:02 -0000

- This release features JSON output for many commands and greater
  support of offloading to hardware.

- Config is changed to config.mk

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc                   | 2 +-
 .../iproute2/0001-libc-compat.h-add-musl-workaround.patch         | 8 ++++----
 .../iproute2/{iproute2_4.13.0.bb => iproute2_4.14.1.bb}           | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.13.0.bb => iproute2_4.14.1.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index a578eb3..b404eed 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -21,7 +21,7 @@ EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/ipr
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
     # Explicitly disable ATM support
-    sed -i -e '/TC_CONFIG_ATM/d' Config
+    sed -i -e '/TC_CONFIG_ATM/d' config.mk
 }
 
 do_install () {
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 3d324c9..50c4bfb 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -15,13 +15,13 @@ https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-work
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- include/linux/libc-compat.h | 4 +++-
+ include/uapi/linux/libc-compat.h | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
 index f38571d..30f0b67 100644
---- a/include/linux/libc-compat.h
-+++ b/include/linux/libc-compat.h
+--- a/include/uapi/linux/libc-compat.h
++++ b/include/uapi/linux/libc-compat.h
 @@ -49,10 +49,12 @@
  #define _LIBC_COMPAT_H
  
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
index 32bf0d5..81e2e4a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "69dc9e3ece3296890278f0de478330c8"
-SRC_URI[sha256sum] = "9cfb81edf8c8509e03daa77cf62aead01c4a827132f6c506578f94cc19415c50"
+SRC_URI[md5sum] = "1075423d7029e02a8f23ed4f42b7e372"
+SRC_URI[sha256sum] = "d43ac068afcc350a448f4581b6e292331ef7e4e7aa746e34981582d5fdb10067"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


