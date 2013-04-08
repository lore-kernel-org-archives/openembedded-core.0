Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nathan.rossi@xilinx.com>) id 1UP6Jj-0003nt-Ss
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 09:16:43 +0200
Received: from mail103-co9-R.bigfish.com (10.236.132.233) by
	CO9EHSOBE038.bigfish.com (10.236.130.101) with Microsoft SMTP Server id
	14.1.225.23; Mon, 8 Apr 2013 06:29:07 +0000
Received: from mail103-co9 (localhost [127.0.0.1])	by
	mail103-co9-R.bigfish.com (Postfix) with ESMTP id 761281C0052	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2013 06:29:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz177df4h17326ah8275bh8275dhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah906i1155h)
Received-SPF: pass (mail103-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail103-co9 (localhost.localdomain [127.0.0.1]) by mail103-co9
	(MessageSwitch) id 1365402546493785_20890;
	Mon,  8 Apr 2013 06:29:06 +0000 (UTC)
Received: from CO9EHSMHS022.bigfish.com (unknown [10.236.132.233])	by
	mail103-co9.bigfish.com (Postfix) with ESMTP id 7609A48005B	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2013 06:29:06 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS022.bigfish.com
	(10.236.130.32) with Microsoft SMTP Server id 14.1.225.23;
	Mon, 8 Apr 2013 06:29:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id 1UP5Zi-0003GK-46	for
	openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 23:29:06 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Apr 2013 16:28:38 +1000
X-Mailer: git-send-email 1.7.5.4
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <482e6583-90f5-4116-b3c6-856f5b51a452@CO9EHSMHS022.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: sipkev@xilinx.com
Subject: [PATCH] insane.bbclass: Updated MicroBlaze machine definitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 07:16:43 -0000
Content-Type: text/plain

* Removed existing definition with machine 47787, this
  definition is outdated, a sanity error should occur if an ELF uses this
  value.
* Added new definition with machine 189. This value replaces the existing
  value since August 2009. See binutils thread for more information.
  (http://sourceware.org/ml/binutils/2009-08/msg00127.html)

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/insane.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2f10688..75db7a2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -60,6 +60,8 @@ def package_qa_get_machine_dict():
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
+                        "microblaze":  (189,   0,    0,          False,         32),
+                        "microblazeel":(189,   0,    0,          True,          32),
                       },
             "linux-uclibc" : { 
                         "arm" :       (  40,    97,    0,          True,          32),
@@ -97,8 +99,6 @@ def package_qa_get_machine_dict():
                       },
             "linux-gnu" :       {
                         "powerpc":    (20,     0,    0,          False,         32),
-                        "microblaze":   (47787,  0,    0,          False,         32),
-                        "microblazeel": (47787,  0,    0,          True,          32),
                         "sh4":        (42,     0,    0,          True,          32),
                       },
             "linux-gnux32" :       {
-- 
1.7.5.4




