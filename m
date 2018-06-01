Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF2475063
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 19:23:21 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id BAB89100CDA;
	Sat,  2 Jun 2018 04:14:45 +0900 (JST)
From: ayaka <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 03:14:07 +0800
Message-Id: <20180601191410.4795-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 0/3] Add tune for ARMv8 and cortex a35
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
X-List-Received-Date: Fri, 01 Jun 2018 19:23:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I saw there is a patch serial that try to add tuning for ARMv8 a year
ago, but at that time, there is not much tune opinions, even the NEON
FPU is not optional in all the cortex.

But when the A35 comes and gcc support more opinions on them, I think it
is necessary to add support those thing in armv8.

I have no idea how to support those big.little combo, there is too much
pattern, I would like to only create tuning file for echo cortex IPs first.

This patch is just sending for early check, whether it would be welcome.

ayaka (3):
  [WIP]: arch-arm64.inc: allow soft fpu configure
  arch-armv8a.inc: add tune include for armv8
  tune-cortexa17: add tunes for ARM Cortex-A35

 meta/conf/machine/include/arm/arch-arm64.inc  |  2 +-
 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 49 +++++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa35.inc  | 24 +++++++++++++
 4 files changed, 74 insertions(+), 2 deletions(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc

-- 
2.14.3


