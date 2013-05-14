Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40527@freescale.com>) id 1Uc9TO-0002Ym-H0
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 09:16:35 +0200
Received: from mail99-va3-R.bigfish.com (10.7.14.249) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 May 2013 06:43:17 +0000
Received: from mail99-va3 (localhost [127.0.0.1])	by mail99-va3-R.bigfish.com
	(Postfix) with ESMTP id 57D1B20881	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 06:43:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail99-va3 (localhost.localdomain [127.0.0.1]) by mail99-va3
	(MessageSwitch) id 1368513796135223_24299;
	Tue, 14 May 2013 06:43:16 +0000 (UTC)
Received: from VA3EHSMHS026.bigfish.com (unknown [10.7.14.235])	by
	mail99-va3.bigfish.com (Postfix) with ESMTP id 1C9832C0063	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 06:43:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS026.bigfish.com
	(10.7.99.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 May 2013 06:43:16 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 14 May 2013 06:43:15 +0000
Received: from localhost.localdomain (rhuath.am.freescale.net [10.82.176.1])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r4E6hE0O004992; Mon, 13 May 2013 23:43:15 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>, <b19537@freescale.com>,
	<b28495@freescale.com>, <b40290@freescale.com>
Date: Tue, 14 May 2013 01:43:14 -0500
Message-ID: <1368513794-20427-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.6.2.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zongchun Yu <b40527@freescale.com>
Subject: [PATCH] toolchain-scripts.bbclass:Add CROSS_COMPILE variable to environment-setup file
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
X-List-Received-Date: Tue, 14 May 2013 07:16:38 -0000
X-List-Received-Date: Tue, 14 May 2013 07:16:38 -0000
Content-Type: text/plain

From: Zongchun Yu <b40527@freescale.com>

when compiling the linux kernel manually. users need to set CROSS_COMPILE separately.
adding the CROSS_COMPILE variable will be nice for using.

Signed-off-by: Zongchun Yu <b40527@freescale.com>
---
 meta/classes/toolchain-scripts.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 050e799..be5623b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -47,6 +47,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
+	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -92,6 +93,7 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
+	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 }
 
 # This function creates an environment-setup-script for use by the ADT installer
@@ -137,6 +139,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
+	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 }
 
 #we get the cached site config in the runtime
-- 
1.7.0.4




