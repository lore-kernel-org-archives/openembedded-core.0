Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAsCJ-0004Rk-3f
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 01:45:23 +0200
Received: from mail47-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 23:39:49 +0000
Received: from mail47-tx2 (localhost.localdomain [127.0.0.1])	by
	mail47-tx2-R.bigfish.com (Postfix) with ESMTP id ACDA41A10156	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 23:39:49 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail47-tx2 (localhost.localdomain [127.0.0.1]) by mail47-tx2
	(MessageSwitch) id 1317685189614251_3974;
	Mon,  3 Oct 2011 23:39:49 +0000 (UTC)
Received: from TX2EHSMHS047.bigfish.com (unknown [10.9.14.246])	by
	mail47-tx2.bigfish.com (Postfix) with ESMTP id 90BA9660052	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 23:39:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS047.bigfish.com
	(10.9.99.147) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 23:39:49 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Mon, 3 Oct 2011 18:39:49 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p93NdlvW023828	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Oct 2011 18:39:48 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Oct 2011 18:39:47 -0500
Message-ID: <1317685187-9041-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [RFC] Fix typo in meta/classes/sanity.bbclass
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
X-List-Received-Date: Mon, 03 Oct 2011 23:45:23 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Not sure if this is correct but it looks like a typo, also
there appears to be some issues with the fix as well

 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4067408..cf30927 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -169,7 +169,7 @@ def check_sanity_validmachine(e):
         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
 
     # Check TARGET_ARCH is set correctly
-    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
+    if data.getVar('TARGET_ARCH', e.data, False) == '${TUNE_ARCH}':
         messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
     
     # Check TARGET_OS is set
-- 
1.7.6.1




