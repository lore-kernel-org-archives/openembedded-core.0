Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZXDY-0008Jz-JB
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:52:20 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QZXA5-0005zd-Bm from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 16:48:45 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Jun 2011 16:48:45 -0700
Received: from localhost.localdomain ([172.30.80.154]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Jun 2011 17:48:43 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 16:48:41 -0700
Message-Id: <1308786521-27001-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 22 Jun 2011 23:48:43.0976 (UTC)
	FILETIME=[EBBA6C80:01CC3136]
Subject: [PATCH] kernel.bbclass: Stage System.map with KERNEL_VERSION suffix
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
X-List-Received-Date: Wed, 22 Jun 2011 23:52:20 -0000

Without this, images will fail now that kernel-abiversion is back.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1bb69f5..f2e0aff 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -137,6 +137,7 @@ kernel_do_install() {
 		cp -fR ${S}/* $kerneldir
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
+	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
 
 	#
 	# Clean and remove files not needed for building modules.
-- 
1.7.0.4



