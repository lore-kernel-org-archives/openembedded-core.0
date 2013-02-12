Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U5H3N-00061P-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 15:41:50 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5941AD22B4;
	Tue, 12 Feb 2013 15:25:51 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 15:25:47 +0100
Message-Id: <1360679147-24511-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] tclibc-eglibc: use glibc-thread-db as eglibc-thread-db does not exist(?)
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
X-List-Received-Date: Tue, 12 Feb 2013 14:41:50 -0000

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
|  *    eglibc-thread-db *

eglibc-thread-db is listed in LIBC_DEPENDENCIES and used by SDK. Package
ends as "libthread-db1" and provides glibc-thread-db.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/conf/distro/include/tclibc-eglibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 15f5ee5..88bfd40 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -23,7 +23,7 @@ LIBC_DEPENDENCIES = "libsegfault \
 		     eglibc-dbg \
 		     eglibc-dev \
 		     eglibc-utils \
-		     eglibc-thread-db \
+		     glibc-thread-db \
 		     ${@get_libc_locales_dependencies(d)}"
 
 LIBC_LOCALE_DEPENDENCIES = "\
-- 
1.8.1.2



