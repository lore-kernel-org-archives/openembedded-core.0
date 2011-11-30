Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVf73-0006sp-L7
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:01:53 +0100
Received: from mail95-tx2-R.bigfish.com (10.9.14.237) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.22; Wed, 30 Nov 2011 07:55:09 +0000
Received: from mail95-tx2 (localhost [127.0.0.1])	by mail95-tx2-R.bigfish.com
	(Postfix) with ESMTP id AFF4F460390	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail95-tx2 (localhost.localdomain [127.0.0.1]) by mail95-tx2
	(MessageSwitch) id 1322639709585002_26623;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.254])	by
	mail95-tx2.bigfish.com (Postfix) with ESMTP id 7E35D700042	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 30 Nov 2011 07:55:09 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 30 Nov 2011 01:55:09 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAU7t80Q014042	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 01:55:08 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 01:55:06 -0600
Message-ID: <1322639707-7798-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] image_types.bbclass: add xz-native to deps for lzma ext2.lzma images
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
X-List-Received-Date: Wed, 30 Nov 2011 08:01:53 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2260915..aed5a85 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -142,7 +142,7 @@ IMAGE_DEPENDS_cramfs = "cramfs-native"
 IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
 IMAGE_DEPENDS_ext2.bz2 = "genext2fs-native"
-IMAGE_DEPENDS_ext2.lzma = "genext2fs-native"
+IMAGE_DEPENDS_ext2.lzma = "genext2fs-native xz-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
-- 
1.7.6.1




