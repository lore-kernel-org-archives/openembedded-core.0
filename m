Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 94D5D70100
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 05:23:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so18084327pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 21:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SWf2ONbIvYhJQ7Y1drPgrc2LI2l7ft81a/Hn5F/64sw=;
	b=yE/459hjguOxxPAtxnCukn5SQzDd3UE/Ke6fNxThKVA7Mq84uSQkKPEvpY56WgSEId
	r9nElTCKw7xa4rOhwa8p0yC/eVmDZ6rrigxdWUGqYT5SO3KURlHPGAUEtJ3qVfnzvsXw
	Q14TDHOyh7NVsf7GONrwWy7YnTIJkt7fdd0vO/w0S5uWgps1CHkT7Q6PfngMppSiPyvu
	OO18UbfwM4ayWPbHbhxl/049013ULCp3QrzN2UB87Yg6FrHmG900p6cruaeL913y4G0n
	Ej1To9MOQDfF3w7wG5o/h7xDyLMurxXaTI27L5IiF1szXCG2GRvjbfIc7GkLqv+za8NW
	6odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SWf2ONbIvYhJQ7Y1drPgrc2LI2l7ft81a/Hn5F/64sw=;
	b=Z+5OftJCUFaDvS/xkGvo8Lnzq8RN6QplncfB9zH3Hl6uLZMMLkamRKccBd4PZ3IUP3
	mYMaEO7dzoxLcRBvTEIcDraMp15Cb61tGGrDqU7p6FanGsNFGazUJyTQSuO1hhlFScQT
	UyzThODdKt6+8hLIiXjd7hIEa8qliMn1Yim6wINrS7n9cA4o0+CPqqZ+CWZgl03B/Emz
	nJ0rhnnkdKtwCJI8dtySk1C0yE4ExK/Pv9lTYTpFEj3q7cyI/vm3RgHLHJmQDW/Ws42E
	inZbFy4xuPub6DZv0yYvgG4ZayyR4PdUhZjD4U1Y/BDVjak5DcP+8un6RCfC5sli8Wzv
	z4EQ==
X-Gm-Message-State: ABUngvdvMZUgGRa0OgctgKSUhI3R/NusqFoH70gsaOophDICixqeVWmF1PHSt1VlLVz0/A==
X-Received: by 10.98.18.6 with SMTP id a6mr20340972pfj.184.1478582610733;
	Mon, 07 Nov 2016 21:23:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	cp2sm44658693pad.3.2016.11.07.21.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 21:23:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 21:23:25 -0800
Message-Id: <20161108052325.11907-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] x264: Update to latest on stable branch
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
X-List-Received-Date: Tue, 08 Nov 2016 05:23:33 -0000

- Switch URI to use github mirror for reliabality
- Disable openCL code, its not used
- TEXTRELs are fixed, therefore dont skip QA check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../x264/x264/don-t-default-to-cortex-a9-with-neon.patch    | 13 ++-----------
 meta/recipes-multimedia/x264/x264_git.bb                    |  9 +++------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
index bf72fca..73f2aac 100644
--- a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
+++ b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
@@ -5,10 +5,10 @@ Upstream-Status: Pending
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
 diff --git a/configure b/configure
-index 2916036..f4ece40 100755
+index 9d1586c..3109ec4 100755
 --- a/configure
 +++ b/configure
-@@ -773,9 +773,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
+@@ -874,9 +874,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
  fi
  
  if [ $asm = auto -a $ARCH = ARM ] ; then
@@ -18,12 +18,3 @@ index 2916036..f4ece40 100755
      if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
          cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
          cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
-@@ -788,8 +785,6 @@ if [ $asm = auto -a $ARCH = ARM ] ; then
- fi
- 
- if [ $asm = auto -a $ARCH = AARCH64 ] ; then
--    # set flags so neon is built by default
--    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu|-arch)' || CFLAGS="$CFLAGS -arch arm64 -mfpu=neon"
- 
-     if  cc_check '' '' '__asm__("cmeq v0.8h, v0.8h, #0");' ; then define HAVE_NEON
-         ASFLAGS="$ASFLAGS -c"
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 393310f..8a239e1 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "yasm-native"
 
-SRC_URI = "git://git.videolan.org/x264.git \
+SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            "
 
-SRCREV = "c8a773ebfca148ef04f5a60d42cbd7336af0baf6"
+SRCREV = "86b71982e131eaa70125f8d0e725fcade9c4c677"
 
 PV = "r2491+git${SRCPV}"
 
@@ -34,6 +34,7 @@ EXTRA_OECONF = '--prefix=${prefix} \
                 --enable-static \
                 --disable-lavf \
                 --disable-swscale \
+                --disable-opencl \
                 --enable-pic \
                 ${X264_DISABLE_ASM} \
                '
@@ -47,7 +48,3 @@ AS = "${TARGET_PREFIX}gcc"
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
-
-# PIC can't be enabled for few BSP's
-INSANE_SKIP_${PN}_append = " textrel"
-
-- 
2.10.2


