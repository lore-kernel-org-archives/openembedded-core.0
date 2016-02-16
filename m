Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83D0A731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:28:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1GESjbs011226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 06:28:45 -0800 (PST)
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Feb 2016 06:28:44 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Feb 2016 16:28:37 +0200
Message-ID: <1455632918-31605-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ARMv8 32-bit compiler tunings
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
X-List-Received-Date: Tue, 16 Feb 2016 14:28:50 -0000
Content-Type: text/plain

Hello!

Starting with linux-yocto-4.1, Intel provides kernel support for its
ARM v8 Axxia platforms, both on 32-bit and 64-bit.
Poky already contains arm 64-bit compiler tunings, so I added 32-bit
tunings based on those for armv7.

The patch that I send you is a draft. Please review it and if it's ok
I will return with thumb and big-endian tunings.

Thank you,
Cristian Bercaru (1):
  add tunings for 32-bit ARMv8-a

 meta/conf/machine/include/arm/arch-armv7a.inc      |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc      | 65 ++++++++++++++++++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |  3 -
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 59 ++++++++++++++++----
 4 files changed, 112 insertions(+), 16 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
 delete mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc

-- 
1.9.1


