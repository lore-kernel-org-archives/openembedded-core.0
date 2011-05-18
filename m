Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMh6T-0001VJ-LJ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:47:57 +0200
Received: by wye20 with SMTP id 20so1306636wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:45:00 -0700 (PDT)
Received: by 10.216.239.73 with SMTP id b51mr4562727wer.60.1305726299964;
	Wed, 18 May 2011 06:44:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a82sm795209wep.6.2011.05.18.06.44.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 06:44:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:44:47 +0200
Message-Id: <1305726289-9546-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1305726289-9546-2-git-send-email-koen@dominion.thruhere.net>
References: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/5] lsof: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 13:47:57 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/lsof/lsof_4.84.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.84.bb b/meta/recipes-extended/lsof/lsof_4.84.bb
index 960d837..9e76096 100644
--- a/meta/recipes-extended/lsof/lsof_4.84.bb
+++ b/meta/recipes-extended/lsof/lsof_4.84.bb
@@ -23,8 +23,8 @@ python do_unpack () {
 }
 
 export LSOF_OS = "${TARGET_OS}"
-LSOF_OS_linux-uclibc = "linux"
-LSOF_OS_linux-gnueabi = "linux"
+LSOF_OS_libc-uclibc = "linux"
+LSOF_OS_libc-glibc = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
-- 
1.6.6.1



