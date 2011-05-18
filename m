Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMh6T-0001VJ-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:47:58 +0200
Received: by mail-wy0-f175.google.com with SMTP id 20so1306636wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:45:05 -0700 (PDT)
Received: by 10.216.220.142 with SMTP id o14mr1878793wep.1.1305726303846;
	Wed, 18 May 2011 06:45:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k76sm794088wej.19.2011.05.18.06.45.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 06:45:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:44:49 +0200
Message-Id: <1305726289-9546-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1305726289-9546-4-git-send-email-koen@dominion.thruhere.net>
References: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-2-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-3-git-send-email-koen@dominion.thruhere.net>
	<1305726289-9546-4-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 5/5] tcp-wrappers: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 13:47:58 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index daaa2f7..d5e334e 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -71,8 +71,7 @@ EXTRA_OEMAKE = "'CC=${CC}' \
 		'EXTRA_CFLAGS=${CFLAGS} -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'"
 
 EXTRA_OEMAKE_NETGROUP = "-DNETGROUP -DUSE_GETDOMAIN"
-EXTRA_OEMAKE_NETGROUP_linux-uclibc = "-DUSE_GETDOMAIN"
-EXTRA_OEMAKE_NETGROUP_linux-uclibceabi = "-DUSE_GETDOMAIN"
+EXTRA_OEMAKE_NETGROUP_libc-uclibc = "-DUSE_GETDOMAIN"
 
 do_compile () {
 	oe_runmake 'TABLES=-DHOSTS_DENY=\"${sysconfdir}/hosts.deny\" -DHOSTS_ALLOW=\"${sysconfdir}/hosts.allow\"' \
-- 
1.6.6.1



