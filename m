Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 4751F7518E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 03:22:34 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id B5F1C1025AA;
	Fri, 15 Jun 2018 12:23:12 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 11:22:21 +0800
Message-Id: <20180615032226.9899-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
Subject: [PATCH v3 0/5] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Fri, 15 Jun 2018 03:22:34 -0000

I mistake some thing wrong in the previous version, I have verified
this version and it works.

I have not found a way to support big little.

Randy Li (5):
  arch-armv8a.inc: add tune include for armv8
  tune-cortexa32: add tunes for ARM Cortex-A32
  tune-cortexa35: add tunes for ARM Cortex-A35
  tune-cortexa53: add tunes for ARM Cortex-A53
  tune-cortexa72: add tunes for ARM Cortex-A72

 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa32.inc  | 15 ++++++++++++++
 meta/conf/machine/include/tune-cortexa35.inc  | 15 ++++++++++++++
 meta/conf/machine/include/tune-cortexa53.inc  | 15 ++++++++++++++
 meta/conf/machine/include/tune-cortexa72.inc  | 12 ++++++++++++
 6 files changed, 85 insertions(+), 1 deletion(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa32.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa72.inc

-- 
2.14.4


