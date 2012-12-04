Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TfpLS-0000wi-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:03:32 +0100
Received: from mail219-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 4 Dec 2012 09:33:49 +0000
Received: from mail219-va3 (localhost [127.0.0.1])	by
	mail219-va3-R.bigfish.com (Postfix) with ESMTP id C07AC60010D	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2012 09:33:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail219-va3 (localhost.localdomain [127.0.0.1]) by mail219-va3
	(MessageSwitch) id 1354613627571438_28648;
	Tue,  4 Dec 2012 09:33:47 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.239])	by
	mail219-va3.bigfish.com (Postfix) with ESMTP id 802E57E0175	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2012 09:33:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 4 Dec 2012 09:33:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 4 Dec 2012 09:33:46 +0000
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id qB49Xe6Y020710;
	Tue, 4 Dec 2012 02:33:42 -0700
From: Zhenhua Luo <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 17:57:11 +0800
Message-ID: <1354615031-27528-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com
Subject: libxml2: update PR to contain INC_PR to reflect the update of inc file
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
X-List-Received-Date: Tue, 04 Dec 2012 10:03:36 -0000
Content-Type: text/plain

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/libxml/libxml2_2.9.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.0.bb b/meta/recipes-core/libxml/libxml2_2.9.0.bb
index 92bcf5c..a022ae9 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.0.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.0.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "5b9bebf4f5d2200ae2c4efe8fa6103f7"
 SRC_URI[sha256sum] = "ad25d91958b7212abdc12b9611cfb4dc4e5cddb6d1e9891532f48aacee422b82"
-- 
1.7.9.5




