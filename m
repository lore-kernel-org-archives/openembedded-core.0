Return-Path: <nathan.rossi@xilinx.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe003.messaging.microsoft.com [216.32.181.183])
	by mail.openembedded.org (Postfix) with ESMTP id C3A7360667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:32:47 +0000 (UTC)
Received: from mail135-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Mon, 17 Jun 2013 07:32:48 +0000
Received: from mail135-ch1 (localhost [127.0.0.1])	by
	mail135-ch1-R.bigfish.com (Postfix) with ESMTP id BE64540298;
	Mon, 17 Jun 2013 07:32:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzzz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h906i1155h192ch)
Received-SPF: pass (mail135-ch1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail135-ch1 (localhost.localdomain [127.0.0.1]) by mail135-ch1
	(MessageSwitch) id 1371454366111936_12589;
	Mon, 17 Jun 2013 07:32:46 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.233])	by mail135-ch1.bigfish.com (Postfix) with ESMTP id
	08E574C0086;	Mon, 17 Jun 2013 07:32:46 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server id 14.1.225.23;
	Mon, 17 Jun 2013 07:32:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1UoTvh-0003AH-7Y;
	Mon, 17 Jun 2013 00:32:45 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 17:31:35 +1000
X-Mailer: git-send-email 1.7.5.4
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <977a89b7-68ef-4bdd-aea5-00a5491a85bf@CH1EHSMHS031.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: meta-xilinx@yoctoproject.org
Subject: [RFC 0/2] scripts/runqemu: 'qemuzynq' and 'qemumicroblaze'
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
X-List-Received-Date: Mon, 17 Jun 2013 07:32:48 -0000
Content-Type: text/plain

This is a request for comments regarding implementation of runqemu for
machine targets that are not in oe-core but are provided by a different
layer, in this case meta-xilinx. Also note that there is some additional
qemu patches that apply specifically to these architectures/machines.

The following patches add support to the runqemu scripts to allow for
the machines named 'qemuzynq' and 'qemumicroblaze' to be booted within
qemu.

The question is if this is the approach taken by other qemu targets that
are not in oe-core? I noticed the 'akita' and 'spitz' machines exist in
the runqemu scripts but are not part of oe-core's machine conf's.

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



