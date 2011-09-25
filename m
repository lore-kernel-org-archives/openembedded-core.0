Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1R7uhJ-0007tc-JQ
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 21:49:09 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D900811001DF;
	Sun, 25 Sep 2011 21:37:51 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E04DB1100104;
	Sun, 25 Sep 2011 21:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225144251.adsl.alicedsl.de
	[92.225.144.251]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 25 Sep 2011 21:37:50 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7A3C830001; Sun, 25 Sep 2011 21:37:50 +0200 (CEST)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 21:37:44 +0200
Message-Id: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.6.3
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 0/3] adding cortexa9 tune file and feature for arm socs whithout neon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Sep 2011 19:49:09 -0000

Hi,

the series adding the tune file for cortexa9 which is in pandaboard or
tegra2. It also adds a feature for socs like the tegra2 which has no
neon unit and enables it for cortexa8 and cortexa9

Bye Henning

Henning Heinold (3):
  tune-cortexa9.inc: add tunefile for cortexa9 socs
  feature-arm-d16.inc: add feature for arm cores which do not have a
    neon unit or no support for it in the kernel
  tune: enable d16 feature for cortexa8 and cortexa9

 meta/conf/machine/include/arm/arch-armv7.inc      |   25 +++++++++++++++---
 meta/conf/machine/include/arm/arch-armv7a.inc     |   24 +++++++++++++++---
 meta/conf/machine/include/arm/feature-arm-d16.inc |    3 ++
 meta/conf/machine/include/tune-cortexa8.inc       |    8 ++++-
 meta/conf/machine/include/tune-cortexa9.inc       |   28 +++++++++++++++++++++
 5 files changed, 78 insertions(+), 10 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-d16.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa9.inc

-- 
1.7.6.3


