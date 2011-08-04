Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+CwlRat7iaDl/qPYltSBAbH4v8Xs6fDmQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QosQD-0005ZH-Q8
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 09:32:50 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p747SR1a008889
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 02:28:27 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 02:28:26 -0500
Message-Id: <1312442907-21017-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH 1/2] bitbake: Allow seting of baselib
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
X-List-Received-Date: Thu, 04 Aug 2011 07:32:50 -0000

Allow for baselib to be set to something other than 'lib'.  This is useful
for the 64-bit arch cases in which we want baselib set to 'lib64'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f0b42c..c50ffb9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -7,7 +7,7 @@
 #
 
 # Used by multilib code to change the library paths
-baselib = "lib"
+baselib = "${@d.getVar('BASE_LIB', True) or 'lib'}"
 
 # Path prefixes
 export base_prefix = ""
-- 
1.7.3.4



