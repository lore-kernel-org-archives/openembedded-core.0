Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlbW-0000Th-LQ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:36:42 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3514715wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bUbmISl1vZCR4YtFYhIUv8n7hYG/bxhJeyJ54iTT3Q0=;
	b=OVAjRgKijzL+V0N8Lhw28atORwCBb5EKVA+oNbGIx1f/xO/nbfwNZH9FoCuGfwu1Mt
	o/F5gylTAnILCN8k/8dmMoTuinxyXXth1mQ7OjA+FVaC8brKV69CgD4fUycu/FPoU4fq
	vPL1A9xG5K6Y8LMxTeVrIpP+tKHJwJdUtdWqePNKX59XffBrszK4MX+ASdIwN8ZsPApW
	ZYibrDFCZJ/Np6mGdzyvacHM0TeZz6ZiOHMXV1CYPisCCXStDDVRi2zrywbnN8TRaqeJ
	kzccCMLEKqLkAYPgoT0PM934BVGOzvtkcpBuh6u2bFZFt+2q2YmeM3zwG+9TS5QlaDAd
	t2IA==
Received: by 10.216.210.1 with SMTP id t1mr3439107weo.16.1349357021869;
	Thu, 04 Oct 2012 06:23:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm14647561wiy.4.2012.10.04.06.23.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:23:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:34 +0200
Message-Id: <cover.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [PATCH 0/7] conf/machine: fix arm tune files
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
X-List-Received-Date: Thu, 04 Oct 2012 13:36:42 -0000

Tested with sstate-diff.sh script and fake machine configs added in this branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test

Fixes [YOCTO #3219]

The following changes since commit df2b756436b90f8f9ff229ba64d0af30d9d4f923:

  common-licenses: Adding bzip (2012-10-04 14:09:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/tune2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune2

Martin Jansa (7):
  tune-xscale: replace TUNE_CCARGS for webkit-gtk and cairo only with
    xscale in TUNE_FEATURES
  bitbake.conf: add TUNE_CCARGS[vardepvalue]
  tune-cortexr4: fix march value
  arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes
  arch-arm: define different ARMPKGARCH when different CCARGS are used
  tune-*: define more generic DEFAULTTUNE to share feed between
    machines
  scripts/sstate-diff.sh: add simple script to compare sstate checksums
    between MACHINEs

 meta/conf/bitbake.conf                           |  1 +
 meta/conf/machine/include/arm/arch-arm.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv4.inc     |  6 +++--
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 12 +++++++++
 meta/conf/machine/include/arm/arch-armv5.inc     | 14 +++++++++--
 meta/conf/machine/include/arm/arch-armv6.inc     | 10 ++++++--
 meta/conf/machine/include/arm/arch-armv7a.inc    | 18 +++++++++++--
 meta/conf/machine/include/tune-arm1136jf-s.inc   |  3 ++-
 meta/conf/machine/include/tune-arm920t.inc       |  3 ++-
 meta/conf/machine/include/tune-arm926ejs.inc     |  4 +--
 meta/conf/machine/include/tune-arm9tdmi.inc      |  3 ++-
 meta/conf/machine/include/tune-cortexa8.inc      |  8 +++++-
 meta/conf/machine/include/tune-cortexa9.inc      |  8 +++++-
 meta/conf/machine/include/tune-cortexm1.inc      |  3 ++-
 meta/conf/machine/include/tune-cortexm3.inc      |  2 +-
 meta/conf/machine/include/tune-cortexr4.inc      |  4 +--
 meta/conf/machine/include/tune-ep9312.inc        |  4 +--
 meta/conf/machine/include/tune-iwmmxt.inc        |  4 +--
 meta/conf/machine/include/tune-strongarm1100.inc |  3 ++-
 meta/conf/machine/include/tune-xscale.inc        |  8 +++---
 scripts/sstate-diff.sh                           | 32 ++++++++++++++++++++++++
 21 files changed, 122 insertions(+), 30 deletions(-)
 create mode 100755 scripts/sstate-diff.sh

-- 
1.7.12



