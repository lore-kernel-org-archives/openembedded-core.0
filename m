Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1QlnVp-0004k1-JK
	for openembedded-core@openembedded.org; Tue, 26 Jul 2011 21:41:54 +0200
Received: from mail30-ch1-R.bigfish.com (216.32.181.168) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.22; Tue, 26 Jul 2011 19:22:35 +0000
Received: from mail30-ch1 (localhost.localdomain [127.0.0.1])	by
	mail30-ch1-R.bigfish.com (Postfix) with ESMTP id C624B16701AF;
	Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail30-ch1 (localhost.localdomain [127.0.0.1]) by mail30-ch1
	(MessageSwitch) id 1311708154473949_24497;
	Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail30-ch1.bigfish.com (Postfix) with ESMTP id
	6E78B1198050;	Tue, 26 Jul 2011 19:22:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 26 Jul 2011 19:22:33 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.289.8; Tue, 26 Jul 2011 14:22:32 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p6QJMV9T002817; Tue, 26 Jul 2011 14:22:32 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <yocto@yoctoproject.org>, <openembedded-core@openembedded.org>
Date: Tue, 26 Jul 2011 14:22:30 -0500
Message-ID: <1311708150-24226-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1311708150-24226-1-git-send-email-msm@freescale.com>
References: <1311708150-24226-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Wed, 27 Jul 2011 09:21:46 +0200
Cc: Matthew McClintock <msm@freescale.com>
Subject: [PATCH] Update TERMCMD message to align with previous change
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
X-List-Received-Date: Tue, 26 Jul 2011 19:41:54 -0000
Content-Type: text/plain

A previous patch changed the default TERM to use xterm. This updates
local.conf.sample to match the change

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta-yocto/conf/local.conf.sample |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index 499c48e..7a0fc89 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -205,7 +205,7 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
 # out if that is desired
 NO32LIBS = "1"
 
-# If you do not use (or have installed) gnome-terminal you will need to
+# If you do not use (or have installed) xterm you will need to
 # uncomment these variables and set them to the terminal you wish to use
 # when resolving patches which cannot be applied
 # Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
-- 
1.7.5




