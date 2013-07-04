Return-Path: <nathan.rossi@xilinx.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe004.messaging.microsoft.com [216.32.181.184])
	by mail.openembedded.org (Postfix) with ESMTP id ABC4F6077F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 07:43:25 +0000 (UTC)
Received: from mail122-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.22; Thu, 4 Jul 2013 07:43:25 +0000
Received: from mail122-ch1 (localhost [127.0.0.1])	by
	mail122-ch1-R.bigfish.com (Postfix) with ESMTP id ECA373201B4;
	Thu,  4 Jul 2013 07:43:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzzz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h906i1155h192ch)
Received-SPF: pass (mail122-ch1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail122-ch1 (localhost.localdomain [127.0.0.1]) by mail122-ch1
	(MessageSwitch) id 1372923776844910_348;
	Thu,  4 Jul 2013 07:42:56 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail122-ch1.bigfish.com (Postfix) with ESMTP id
	C18684A0093;	Thu,  4 Jul 2013 07:42:56 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server id 14.1.225.23; Thu, 4 Jul 2013
	07:42:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1UueBs-00011h-CN;
	Thu, 04 Jul 2013 00:42:56 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 17:42:26 +1000
X-Mailer: git-send-email 1.7.5.4
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: meta-xilinx@yoctoproject.org
Subject: [PATCH 0/2] scripts/runqemu: 'qemuzynq' and 'qemumicroblaze'
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
X-List-Received-Date: Thu, 04 Jul 2013 07:43:25 -0000
Content-Type: text/plain

The following patches add support to the runqemu scripts to allow for
the machines named 'qemuzynq' and 'qemumicroblaze' to be booted within
qemu. These target machines reside in the 'meta-xilinx' layer.

Regards,
Nathan

Nathan Rossi (2):
  scripts/runqemu: Add support for 'qemuzynq' machine
  scripts/runqemu: Add support for 'qemumicroblaze' machine

 scripts/runqemu          |    9 ++++++++-
 scripts/runqemu-internal |   28 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletions(-)

-- 
1.7.5.4



