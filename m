Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFj4-0002SU-G9
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:54:33 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7137AD22EA;
	Wed, 20 Mar 2013 10:37:43 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:37:23 +0100
Message-Id: <1363772243-370-7-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 6/6] nfs-utils: switch to libtirpc
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
X-List-Received-Date: Wed, 20 Mar 2013 09:54:40 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
index cd97810..2a12a34 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers sqlite3"
+DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers sqlite3 libtirpc"
 RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
@@ -42,9 +42,10 @@ EXTRA_OECONF = "--with-statduser=nobody \
                 --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
-                --disable-tirpc \
+                --enable-tirpc \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
+                --with-tirpcinclude=${STAGING_INCDIR}/tirpc/ \
                "
 
 INHIBIT_AUTO_STAGE = "1"
-- 
1.8.1.2



