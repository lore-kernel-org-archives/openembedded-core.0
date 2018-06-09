Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id AC7A3748DA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:26:40 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id DDD45100CDA;
	Sat,  9 Jun 2018 15:27:10 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 14:26:24 +0800
Message-Id: <20180609062628.32364-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2 0/4] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Sat, 09 Jun 2018 06:26:40 -0000

I read the ARMv8 manual again, it looks the hardware float is mandatory
in Linux Distributions and toolchain libraries. Even some cortex
processors can be configured without FPU/NEON hardware, but I don't
think they would be used in openembeded core.

So I can assume the NEON(SIMD) would exist all the time. Leaving only the
crc and crypto instructions are optional here.


Randy Li (4):
  arch-armv8a.inc: add tune include for armv8
  tune-cortexa35: add tunes for ARM Cortex-A35
  tune-cortexa32: add tunes for ARM Cortex-A32
  tune-cortexa72: add tunes for ARM Cortex-A72

 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 22 ++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa32.inc  | 15 +++++++++++++++
 meta/conf/machine/include/tune-cortexa35.inc  | 15 +++++++++++++++
 meta/conf/machine/include/tune-cortexa72.inc  | 12 ++++++++++++
 5 files changed, 64 insertions(+), 1 deletion(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa32.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa72.inc

-- 
2.14.3


