Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RrWFt-0003au-4i
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 16:01:21 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 715EEEB8B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 15:26:25 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj1KALdVJU9T4znVPGdsb2JhbABErlYZAQEBATcygk8jT0sKLQmHdrdTiGYDBAsBCAEFCQYDAQICEAEIgyQFgTODHASVGoksgVyHSg
X-IronPort-AV: E=Sophos;i="4.71,588,1320620400"; d="scan'208";a="1800144395"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.emagii.com) ([83.227.57.213])
	by ipb4.telenor.se with ESMTP; 29 Jan 2012 15:26:25 +0100
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Jan 2012 15:26:20 +0100
Message-Id: <1327847180-25415-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] mirrors.bbclass: Add new KERNELORG_MIRROR = ftp.sunet.se
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
X-List-Received-Date: Sun, 29 Jan 2012 15:01:21 -0000

www.kernel.org is missing a lot of files.
Add the "ftp.sunet.se" mirror containing many missing files.
The other mirrors in mirrors.bbclass seems to be inactive
so this mirror is added before the inactive mirrors

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta/classes/mirrors.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..1124967 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -23,6 +23,7 @@ ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu \n \
 ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu \n \
 ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
+${KERNELORG_MIRROR}	ftp://ftp.sunet.se/pub/Linux/kernel.org \n \
 ${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.hk.kernel.org/pub \n \
-- 
1.7.5.4



