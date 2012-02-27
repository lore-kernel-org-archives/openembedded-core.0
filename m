Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S26mW-0003hA-QA
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 21:02:48 +0100
Received: from mail102-ch1-R.bigfish.com (10.43.68.234) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 19:39:19 +0000
Received: from mail102-ch1 (localhost [127.0.0.1])	by
	mail102-ch1-R.bigfish.com (Postfix) with ESMTP id 08A286035C	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:39:19 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail102-ch1 (localhost.localdomain [127.0.0.1]) by mail102-ch1
	(MessageSwitch) id 1330371557103812_24716;
	Mon, 27 Feb 2012 19:39:17 +0000 (UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail102-ch1.bigfish.com (Postfix) with ESMTP id
	085DE22023A	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:39:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 19:39:15 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 27 Feb 2012 13:38:51 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q1RJcpYA016536	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 13:38:51 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 13:38:49 -0600
Message-ID: <1330371531-28803-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1330371531-28803-1-git-send-email-msm@freescale.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/4] bitbake.conf: add default value for TUNE_PKGARCH
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
X-List-Received-Date: Mon, 27 Feb 2012 20:02:49 -0000
Content-Type: text/plain

Add a default value for TUNE_PKGARCH. This let's us use
the following:

TUNE_PKGARCH_tune-ppce500

Instead of scanning over variables and using bitbake internal
functions to create a valid value here.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7d0e0d8..e256d5f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -95,6 +95,7 @@ TUNE_CCARGS ??= ""
 TUNE_LDARGS ??= ""
 TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
+TUNE_PKGARCH ??= "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 
-- 
1.7.6.1




