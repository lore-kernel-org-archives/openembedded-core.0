Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/m5If5dhZHP6Cnndko5qE38ytmElkj3LQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjEMb-0006Tk-53
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:45:45 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHfe0F009986;
	Tue, 19 Jul 2011 12:41:40 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:41:35 -0500
Message-Id: <1311097296-17200-5-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311097296-17200-4-git-send-email-galak@kernel.crashing.org>
References: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-2-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-3-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-4-git-send-email-galak@kernel.crashing.org>
Cc: yocto@yoctoproject.org
Subject: [PATCH v2 4/5] openssl: Add handling for linux-gnuspe-powerpc
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
X-List-Received-Date: Tue, 19 Jul 2011 17:45:45 -0000

If trying to build for an e500v2 target openssl will fail to build since
the configure script didn't know how to handle a 'gnuspe' target.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +++
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 39143ad..79620b3 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -80,6 +80,9 @@ do_configure () {
 	linux-powerpc)
 		target=linux-ppc
 		;;
+	linux-gnuspe-powerpc)
+		target=linux-ppc
+		;;
 	linux-supersparc)
 		target=linux-sparcv8
 		;;
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index ea83cb8..344747f 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r3"
+PR = "r4"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
-- 
1.7.3.4



