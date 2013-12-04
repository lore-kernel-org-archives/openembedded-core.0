Return-Path: <nathan.rossi@xilinx.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id F224E6D2A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 04:51:30 +0000 (UTC)
Received: from mail154-co9-R.bigfish.com (10.236.132.238) by
	CO9EHSOBE032.bigfish.com (10.236.130.95) with Microsoft SMTP Server id
	14.1.225.22; Wed, 4 Dec 2013 04:51:29 +0000
Received: from mail154-co9 (localhost [127.0.0.1])	by
	mail154-co9-R.bigfish.com (Postfix) with ESMTP id AA92D4A0946;
	Wed,  4 Dec 2013 04:51:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 21
X-BigFish: VPS21(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh2327h2336h906i231bil1155h)
X-Forefront-Antispam-FastScan: 20<65236727001>
Received-SPF: pass (mail154-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail154-co9 (localhost.localdomain [127.0.0.1]) by mail154-co9
	(MessageSwitch) id 1386132687843694_14578;
	Wed,  4 Dec 2013 04:51:27 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.239])	by
	mail154-co9.bigfish.com (Postfix) with ESMTP id C9BEC12006E;
	Wed,  4 Dec 2013 04:51:27 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server id 14.16.227.3;
	Wed, 4 Dec 2013 04:51:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1Vo4Qp-00012M-Bo; Tue, 03 Dec 2013 20:51:27 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Dec 2013 14:50:46 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <0e8c5801-bfc9-468f-b9f7-164bab1af812@CO9EHSMHS010.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] attr: Add patch tracking details
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
X-List-Received-Date: Wed, 04 Dec 2013 04:51:31 -0000
Content-Type: text/plain

Add author tracking information to the attr patch added by commit
b28f12a272a9e2f0c3084a58b91605acb05f58f8.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---

This patch fixes up the missing signed-off-by line, This was requested
in the following thread: http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087163.html

---
 .../attr/files/attr-Missing-configure.ac.patch     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
index 5887ed5..20fcc3c 100644
--- a/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
+++ b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
@@ -1,6 +1,7 @@
 Subject: [PATCH] attr: Missing configure.ac
 
 Upstream-Status: Backport [Upstream released tarball missing this file]
+Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
 ---
  configure.ac |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 48 insertions(+)
-- 
1.7.9.5



