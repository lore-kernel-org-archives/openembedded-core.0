Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC6A5731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:35:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u27EZQUO015151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Mar 2016 06:35:26 -0800 (PST)
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 06:35:26 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 16:34:50 +0200
Message-ID: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: otavio.salvador@ossystems.com.br
Subject: [master][PATCH] ARMv8 32-bit compiler tunings
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
X-List-Received-Date: Mon, 07 Mar 2016 14:35:28 -0000
Content-Type: text/plain

Hello!

This is a new version for the patch, against master branch:
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117603.html

@Martin, I pushed the results from testing with your script in a personal repo:
Tune results without the patch - clean open-embedded (master branch):
	https://github.com/ddragomi/tune_test/tree/3f4054dd96e9d96c18e1eb9c5fef9f5ebc77f4a3/tune

Tune results with this patch:
	https://github.com/ddragomi/tune_test/tree/ff9c904fa6fff38efdc72c604e6d5677b64f76a5/tune

And a diff between those here:
        https://github.com/ddragomi/tune_test/commit/ff9c904fa6fff38efdc72c604e6d5677b64f76a5

NOTE: I also added a new fake-machine (axxiaarm) that require arch-arm8a.inc
to test/parse armv8a tunes:
DEFAULTTUNE ?= "armv8a-neon"
require conf/machine/include/arm/arch-armv8a.inc

Previous message:
Starting with linux-yocto-4.1, Intel provides kernel support for its
ARM v8 Axxia platforms, both on 32-bit and 64-bit.
Poky already contains arm 64-bit compiler tunings, so I added 32-bit
tunings based on those for armv7.

The patch that I send you is a draft. Please review it and if it's ok
I will return with thumb and big-endian tunings.

Daniel Dragomir (1):
  Add tune for 32-bit ARMv8-a

 meta/conf/machine/include/arm/arch-armv8a.inc      | 111 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

-- 
1.9.1


