Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RVIQ6-0004Ax-3O
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:48:02 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 25649D2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 08:21:56 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AudIAHSH1E5T4zgTPGdsb2JhbABDqnYZAQEBATcygXIBXCMwH0sKLYgHBrcth1+DFQSUS4kIgVGHNQ
X-IronPort-AV: E=Sophos;i="4.69,590,1315173600"; d="scan'208";a="225326204"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	theoden.atmel.com) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 29 Nov 2011 08:21:56 +0100
From: ulf@emagii.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:21:51 +0100
Message-Id: <1322551311-2797-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] KERNELORG_MIRROR: add a mirror which still has auxiliary tarballs
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
X-List-Received-Date: Tue, 29 Nov 2011 07:48:02 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta/classes/mirrors.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..67a8fb9 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -28,6 +28,7 @@ ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.hk.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.au.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.jp.kernel.org/pub \n \
+${KERNELORG_MIRROR}	http://mirror.anl.gov/pub \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/ \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/ \n \
 ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
-- 
1.7.4.1



