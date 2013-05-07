Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZlbW-0003hM-Ea
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:23:09 +0200
Received: by mail-ea0-f173.google.com with SMTP id d10so457962eaj.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Gq+qShrs1rtebHB1f/f8wo3eJxtcXNSdPpltGeIQZ/0=;
	b=tcVHnHEbBsPvFl2FW5C1STILyNtkKwqHFtRUr/Zy9geiZNQrOQsFBQ94/PinFmzPiV
	UI+D8LKJ0nrHwZEfO98jjbC8O4lb+m49L4tSon18mnDMr1pN+UUjt4euAYPiGgquL0cB
	2ySUYqqZi46ZAGylUTxIx4Wed0P3ZooBls6c/AVzedveopq+DqmoEvRgF0Zr69VjFV6q
	qT86MZF4Z4RHMneWR5elAGHrEsjSwz/rpNCMuqiInMzUJvc99A5CBjQRtaGyglNCbC+I
	2iZkSjwuQfdQMsD1NIOwJff9q+KR7WJ1GR3g+U28R4ls8ZvoiZSNXf9snpHYZSH2t7Wj
	dtGA==
X-Received: by 10.14.205.194 with SMTP id j42mr7144147eeo.41.1367946276988;
	Tue, 07 May 2013 10:04:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i3sm40611359eev.1.2013.05.07.10.04.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 10:04:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 19:04:28 +0200
Message-Id: <cover.1367946177.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 0/2] tune-* fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 17:23:27 -0000
X-List-Received-Date: Tue, 07 May 2013 17:23:27 -0000

The following changes since commit 94e3f18214e2e35076c52ed27252073f788ec01f:

  build-appliance: Update to latest dylan revision for release (2013-04-18 22:02:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/for-dylan
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/for-dylan

Martin Jansa (2):
  tune-thumb.inc: Remove, replaced by arm/feature-arm-thumb.inc
  conf/machine: use .= instead of += in TUNE_CCARGS

 meta/conf/machine/include/arm/arch-armv4.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |  4 +--
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc       |  6 ++--
 meta/conf/machine/include/mips/arch-mips.inc       | 10 +++----
 meta/conf/machine/include/powerpc/arch-powerpc.inc |  6 ++--
 .../machine/include/powerpc/arch-powerpc64.inc     |  2 +-
 meta/conf/machine/include/sh/arch-sh.inc           |  2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |  2 +-
 meta/conf/machine/include/tune-arm920t.inc         |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |  2 +-
 meta/conf/machine/include/tune-c3.inc              |  2 +-
 meta/conf/machine/include/tune-core2.inc           |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |  4 +--
 meta/conf/machine/include/tune-cortexr4.inc        |  4 +--
 meta/conf/machine/include/tune-ep9312.inc          |  2 +-
 meta/conf/machine/include/tune-i586.inc            |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |  2 +-
 meta/conf/machine/include/tune-mips32.inc          |  2 +-
 meta/conf/machine/include/tune-ppc476.inc          |  2 +-
 meta/conf/machine/include/tune-ppc603e.inc         |  2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |  2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |  2 +-
 meta/conf/machine/include/tune-ppce500.inc         |  4 +--
 meta/conf/machine/include/tune-ppce500mc.inc       |  2 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |  4 +--
 meta/conf/machine/include/tune-ppce5500.inc        |  2 +-
 meta/conf/machine/include/tune-ppce6500.inc        |  2 +-
 meta/conf/machine/include/tune-sh3.inc             |  2 +-
 meta/conf/machine/include/tune-sh4.inc             |  4 +--
 meta/conf/machine/include/tune-strongarm1100.inc   |  2 +-
 meta/conf/machine/include/tune-thumb.inc           | 32 ----------------------
 meta/conf/machine/include/tune-xscale.inc          |  2 +-
 43 files changed, 56 insertions(+), 88 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc

-- 
1.8.2.1



