Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/8C86WmBn5gwJaSxkpQ0wINOyccutGaYY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkC2k-0004aF-Tw
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:29:15 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9P4oA003946
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:25:05 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:24:56 -0500
Message-Id: <1311326696-11745-6-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326696-11745-5-git-send-email-galak@kernel.crashing.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-2-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-3-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-4-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-5-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 5/5] openssl: Add handling for building on linux-powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 09:29:16 -0000

If try to build for an ppc64 target openssl will fail to build since
the configure script didn't know how to handle a 'linux-powerpc64' target.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-connectivity/openssl/openssl.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 79620b3..b134ad0 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -83,6 +83,9 @@ do_configure () {
 	linux-gnuspe-powerpc)
 		target=linux-ppc
 		;;
+	linux-powerpc64)
+		target=linux-ppc64
+		;;
 	linux-supersparc)
 		target=linux-sparcv8
 		;;
-- 
1.7.3.4



