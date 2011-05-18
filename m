Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMh6V-0001VE-3G
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:47:59 +0200
Received: by wye20 with SMTP id 20so1306670wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:45:02 -0700 (PDT)
Received: by 10.216.254.82 with SMTP id g60mr1771429wes.90.1305726301862;
	Wed, 18 May 2011 06:45:01 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s40sm795102weq.4.2011.05.18.06.45.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 06:45:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:44:48 +0200
Message-Id: <1305726289-9546-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1305726289-9546-3-git-send-email-koen@dominion.thruhere.net>
References: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-2-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-3-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 4/5] sysstat: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 13:47:59 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/sysstat/sysstat.inc |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index a4cad0e..4756016 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -27,6 +27,4 @@ pkg_postinst_${PN} () {
 FILES_${PN} += "${libdir}/sa"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-LDFLAGS_append_linux-uclibc = " -lintl"
-LDFLAGS_append_linux-uclibceabi = " -lintl"
-LDFLAGS_append_linux-uclibcspe = " -lintl"
+LDFLAGS_append_libc-uclibc = " -lintl"
-- 
1.6.6.1



