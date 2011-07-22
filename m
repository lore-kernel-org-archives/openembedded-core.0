Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19uiBZ4hYbzPIPF3vPW1n/FnP/tXAJmNWo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkC2b-0004XQ-VT
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:29:06 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9Owhh003877
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:24:58 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:24:53 -0500
Message-Id: <1311326696-11745-3-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326696-11745-2-git-send-email-galak@kernel.crashing.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-2-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/5] libc: Add handling of powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 09:29:06 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/libc-package.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 7cfeb7d..de57230 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -266,6 +266,7 @@ python package_do_split_gconvs () {
 			locale_arch_options = { \
 				"arm":     " --uint32-align=4 --little-endian ", \
 				"powerpc": " --uint32-align=4 --big-endian ",    \
+				"powerpc64": " --uint32-align=4 --big-endian ",  \
 				"mips":    " --uint32-align=4 --big-endian ",    \
 				"mipsel":  " --uint32-align=4 --little-endian ", \
 				"i586":    " --uint32-align=4 --little-endian ", \
-- 
1.7.3.4



