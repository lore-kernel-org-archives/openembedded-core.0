Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19GFaxY6/FzwoZglsUZlmeBrG3BEs2G9Tg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkBun-0003kE-D4
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:21:01 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9Grlh032009
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:16:53 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:16:50 -0500
Message-Id: <1311326212-10672-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
References: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/4] site/powerpc64: Update power64-linux to include powerpc-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 09:21:02 -0000

Now that we have a unique powerpc32-linux config, we share powerpc-linux
between ppc32 & ppc64.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/siteinfo.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index d0d405a..c5308b3 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -35,9 +35,9 @@ def siteinfo_data(d):
         "mipsel": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common powerpc32-linux",
         "nios2": "endian-little bit-32 nios2-common",
-        "powerpc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "powerpc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
         "ppc": "endian-big bit-32 powerpc-common powerpc32-linux",
-        "ppc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "ppc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
-- 
1.7.3.4



