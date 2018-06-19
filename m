Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id A173A7558D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:29:56 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 7D7CB1025B1;
	Wed, 20 Jun 2018 04:30:39 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:29:36 +0800
Message-Id: <20180619192945.9168-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
Subject: [PATCH v4 0/5] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Tue, 19 Jun 2018 19:29:56 -0000

changelog:
v4:
update the tune file for thunderx
v3:
fix the wrong defines in armv8a.inc
v2:
add tune files for cortex-a72
v1:
begin this work

Randy Li (5):
  arch-armv8a.inc: add tune include for armv8
  ThunderX: update the armv8a rules
  tune-cortexa35: add tunes for ARM Cortex-A35
  tune-cortexa32: add tunes for ARM Cortex-A32
  tune-cortexa72: add tunes for ARM Cortex-A72

 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 22 ++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa32.inc  | 15 +++++++++++++++
 meta/conf/machine/include/tune-cortexa35.inc  | 15 +++++++++++++++
 meta/conf/machine/include/tune-cortexa72.inc  | 12 ++++++++++++
 meta/conf/machine/include/tune-thunderx.inc   |  4 ++--
 6 files changed, 66 insertions(+), 3 deletions(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa32.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa72.inc

-- 
2.14.4


