Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7683F6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:19:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so19881473pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=N469bRhOSuOzfr+Dco1QrMTgL3VZNl4HoYu2P7jwF60=;
	b=yjCqrwbQ1Dv7ByjolAw9ClH0qQTpSz1omUKctHdo01Z3yMBm2egEGFx9Dej0okuomQ
	6pq5fMsNGmus/sv7/KUvrg2cpgJ0kA5+Qc6yK1cpAzj8VEeTcRVibR22umSsFQoZRxQP
	bScCh7tJWgZpkLtI6+kI59xdPDmhg7SuS2Ac5XAuYZ8kYa4p5pX0Q/56hiZr54W0aazW
	O2UOrHiCNzkTY8cqVCqF4k6V+raGNw7COmc8qXMxrM1fssP3L5woKQRUsop3/Rr5ZhhG
	SVAUR8rmi9XTARZ68q51cWFjeSpgCfmRXsgSawWyE5CngCvvmb3yJ6mZVaZ3kIWNnHf7
	6fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N469bRhOSuOzfr+Dco1QrMTgL3VZNl4HoYu2P7jwF60=;
	b=XHpbxi6BuC23um7NsWAlFZ+ao8ru7GF98I8aJCTw3byynMZ7KuzyvZSDaPKzWNP6CK
	izWb06cPInFtwgOv7AGu9pgnCvSt9Iyb6HJ3h8nhbeebzoqRip+ykKeJDyfqAuuD0s5C
	KsAa2WwzowPSHXCD6DFzmteQaGNq42uz1UZnelHwIEMKJTT8O/jCoAb3i5qpi3CjJ1s7
	bO9mI28a5vvYRKl3sDkwscBkyxP04+Jor8zdVS8AG1sUoKjnB1ZTuqA57TmlJwm9Y0YB
	HJ2LVPTo+6PjYs/LYK51BqBDohZUk5bvwjPtT9wfetAK4frolEq0i3QC/lQl+kQ9XsYZ
	jS+Q==
X-Gm-Message-State: ABUngvethq243nZFKveW59ANqavwlvm/tv1iPFkKBcAj26qvazTVXczMs2nuAsVGfuOEAA==
X-Received: by 10.98.66.214 with SMTP id h83mr24066502pfd.67.1478618378249;
	Tue, 08 Nov 2016 07:19:38 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	dc3sm14187134pad.32.2016.11.08.07.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:19:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 07:19:32 -0800
Message-Id: <20161108151932.6599-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V2] x264: Update to latest on stable branch
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
X-List-Received-Date: Tue, 08 Nov 2016 15:19:37 -0000

- unexport AS variable
- Switch URI to use github mirror for reliabality
- Disable openCL code, its not used
- TEXTRELs are fixed, therefore dont skip QA check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- unexport AS variable

 .../x264/x264/don-t-default-to-cortex-a9-with-neon.patch    | 13 ++-----------
 meta/recipes-multimedia/x264/x264_git.bb                    | 11 ++++-------
 2 files changed, 6 insertions(+), 18 deletions(-)

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
index 393310f..e790681 100644
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
@@ -42,12 +43,8 @@ do_configure() {
     ./configure ${EXTRA_OECONF}
 }
 
-AS = "${TARGET_PREFIX}gcc"
-
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-# PIC can't be enabled for few BSP's
-INSANE_SKIP_${PN}_append = " textrel"
-
+AS[unexport] = "1"
-- 
2.10.2


