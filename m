Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QZj47-0007Te-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:31:23 +0200
Received: by rex (Postfix, from userid 1000)
	id EDB4E20D86; Thu, 23 Jun 2011 13:27:47 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 13:27:26 +0100
Message-Id: <bba6a7693c5e1716a0bfa0c7aa9280b29d0b0b0a.1308831847.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/4] base.bbclass: Drop old style SRCDATE handling, we have pn- overrides now
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
X-List-Received-Date: Thu, 23 Jun 2011 12:31:24 -0000

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..4681489 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -303,11 +303,6 @@ python () {
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
-    # OBSOLETE in bitbake 1.7.4
-    srcdate = bb.data.getVar('SRCDATE_%s' % pn, d, 1)
-    if srcdate != None:
-        bb.data.setVar('SRCDATE', srcdate, d)
-
     use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
     if use_nls != None:
         bb.data.setVar('USE_NLS', use_nls, d)
-- 
1.7.4.1



