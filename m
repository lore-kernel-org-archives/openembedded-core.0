Return-Path: <florian.boor@kernelconcepts.de>
X-Greylist: delayed 2316 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Feb 2015 11:09:31 UTC
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id C30A061486
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 11:09:31 +0000 (UTC)
Received: from [192.168.2.78] (helo=serenity.kc.loc)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YIEHM-0003Tn-8y; Mon, 02 Feb 2015 11:30:52 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 11:30:41 +0100
Message-Id: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Feb 2015 11:09:33 -0000

An error in bitbake/OE context is something fatal and interrupts the build.
A deprecation warning is exactly what we have bb.warn for.

Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
---
 meta/classes/base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index de50be1..b5186bf 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -374,7 +374,7 @@ python () {
     # obsolete.  Return a warning to the user.
     princ = d.getVar('PRINC', True)
     if princ and princ != "0":
-        bb.error("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
+        bb.warn("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
         pr = d.getVar('PR', True)
         pr_prefix = re.search("\D+",pr)
         prval = re.search("\d+",pr)
-- 
1.7.10.4


