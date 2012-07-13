Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Spmmx-0000Vv-QP
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 22:48:35 +0200
Received: from mail110-db3-R.bigfish.com (10.3.81.227) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 20:07:08 +0000
Received: from mail110-db3 (localhost [127.0.0.1])	by
	mail110-db3-R.bigfish.com (Postfix) with ESMTP id 751E9460360	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 20:07:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail110-db3 (localhost.localdomain [127.0.0.1]) by mail110-db3
	(MessageSwitch) id 1342210026608996_8828;
	Fri, 13 Jul 2012 20:07:06 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.225])	by
	mail110-db3.bigfish.com (Postfix) with ESMTP id 8922510004A	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 20:07:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 20:07:05 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 13 Jul 2012 15:07:03 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6DK6wu7022281 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 13:07:03 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2012 15:06:57 -0500
Message-ID: <1342210017-26817-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
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
X-List-Received-Date: Fri, 13 Jul 2012 20:48:35 -0000
Content-Type: text/plain

This prevents kexec from building for this part since it does not work

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/tasks/task-core-tools-testapps.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/recipes-core/tasks/task-core-tools-testapps.bb
index b5847f8..bdd0d05 100644
--- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
+++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
@@ -22,6 +22,7 @@ KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
 KEXECTOOLS_mipsel ?= ""
 KEXECTOOLS_powerpc ?= ""
+KEXECTOOLS_e5500-64b ?= ""
 
 RDEPENDS_${PN} = "\
     blktool \
-- 
1.7.10




