Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTNy0-00011W-Nw
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 02:19:08 +0100
Received: from mail102-db3-R.bigfish.com (10.3.81.248) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Nov 2011 01:11:55 +0000
Received: from mail102-db3 (localhost [127.0.0.1])	by
	mail102-db3-R.bigfish.com (Postfix) with ESMTP id 1F64E2C0195;
	Thu, 24 Nov 2011 01:12:13 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail102-db3 (localhost.localdomain [127.0.0.1]) by mail102-db3
	(MessageSwitch) id 132209713338844_15343;
	Thu, 24 Nov 2011 01:12:13 +0000 (UTC)
Received: from DB3EHSMHS017.bigfish.com (unknown [10.3.81.240])	by
	mail102-db3.bigfish.com (Postfix) with ESMTP id 04779340046;
	Thu, 24 Nov 2011 01:12:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS017.bigfish.com
	(10.3.87.117) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 24 Nov 2011 01:11:54 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 23 Nov 2011 19:12:32 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAO1CVN4014039; Wed, 23 Nov 2011 19:12:31 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Wed, 23 Nov 2011 19:12:31 -0600
Message-ID: <1322097151-27144-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4ECD94DF.6010506@linux.intel.com>
References: <4ECD94DF.6010506@linux.intel.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Nothing uses USERNAME, remove it - can cause sstate-cache conflicts
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
X-List-Received-Date: Thu, 24 Nov 2011 01:19:08 -0000
Content-Type: text/plain

USER is the correct variable to use, also this can affect sstate
cache as well.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01f064c..cb70a49 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,7 +735,7 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "basic"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
1.7.6.1




