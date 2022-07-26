Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F8DC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 23:11:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.13549.1658877110304232579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 16:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QNBldO024605
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 18:11:49 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Various fixes for master
Date: Tue, 26 Jul 2022 18:11:43 -0500
Message-Id: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 23:11:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168518

While working on forward porting microblaze support I ran into the following patches.

default-distrovars.inc change, we've been doing this in our petalinux distro
-- but it seems like a better idea to do it generically.

The runqemu one is a missing space in code that I THINK is only used by
microblaze systems currently.  (Or at least Xilinx systems with the custom
qemu-xilinx.)

The other two are simple recipe updates.

Mark Hatle (4):
  runqemu: Add missing space on default display option
  default-distrovars: seccomp doesn't support microblaze
  openssl: Move microblaze to linux-latomic config
  elfutils: Microblaze does not support symvers

 meta/conf/distro/include/default-distrovars.inc    | 3 +++
 meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 4 ++--
 meta/recipes-devtools/elfutils/elfutils_0.187.bb   | 3 +++
 scripts/runqemu                                    | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.25.1


