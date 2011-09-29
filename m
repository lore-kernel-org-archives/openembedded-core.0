Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RZ-0000Zy-I9
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:58 +0200
Received: from mail50-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:27 +0000
Received: from mail50-db3 (localhost.localdomain [127.0.0.1])	by
	mail50-db3-R.bigfish.com (Postfix) with ESMTP id 3C9A611881BA	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:27 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail50-db3 (localhost.localdomain [127.0.0.1]) by mail50-db3
	(MessageSwitch) id 13172700873442_8968;
	Thu, 29 Sep 2011 04:21:27 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.246])	by
	mail50-db3.bigfish.com (Postfix) with ESMTP id BF5F24C804D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:25 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:14 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKx024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:13 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:04 -0500
Message-ID: <1317270070-14250-10-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:58 -0000
Content-Type: text/plain

This fixes build failures from build warnings on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 5d29ae7..37ec32e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
 
@@ -16,6 +16,7 @@ SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
 SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
 
 CFLAGS += "-fno-strict-aliasing"
+EXTRA_OEMAKE_powerpc64 = "CXFLAGS=-Wno-error=format"
 
 inherit autotools
 
-- 
1.7.6.1




