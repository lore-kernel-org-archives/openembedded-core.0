Return-Path: <openembedded-devel@urbanec.net>
Received: from mail13.tpgi.com.au (mail13.tpgi.com.au [203.12.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF5C6AD05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 12:08:23 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Wed, 15 Oct 2014 23:08:22 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail13.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FC8K1O017992
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 23:08:22 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeNNK-0006KA-75 for openembedded-core@lists.openembedded.org;
	Wed, 15 Oct 2014 23:08:18 +1100
Message-ID: <543E63B1.8060404@urbanec.net>
Date: Wed, 15 Oct 2014 23:08:17 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Fix up white space lost in last commit.
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
X-List-Received-Date: Wed, 15 Oct 2014 12:08:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Commit e9672387 split one long line into a multi-line string, but in
the process white space between words was lost. This results in badly
formatted output when this message is printed.


Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
 meta/classes/sstate.bbclass | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9cd4590..aba3c16 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -188,26 +188,26 @@ def sstate_install(ss, d):
                 if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
-        bb.error("The recipe %s is trying to install files into a shared" \
-          "area when those files already exist. Those files and their manifest" \
-          "location are:\n   %s\nPlease verify which recipe should provide the" \
-          "above files.\nThe build has stopped as continuing in this scenario WILL" \
-          "break things, if not now, possibly in the future (we've seen builds fail" \
-          "several months later). If the system knew how to recover from this" \
-          "automatically it would however there are several different scenarios" \
-          "which can result in this and we don't know which one this is. It may be" \
-          "you have switched providers of something like virtual/kernel (e.g. from" \
-          "linux-yocto to linux-yocto-dev), in that case you need to execute the" \
-          "clean task for both recipes and it will resolve this error. It may be" \
-          "you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning" \
-          "those recipes should again resolve this error however switching" \
-          "DISTRO_FEATURES on an existing build directory is not supported, you" \
-          "should really clean out tmp and rebuild (reusing sstate should be safe)." \
-          "It could be the overlapping files detected are harmless in which case" \
-          "adding them to SSTATE_DUPWHITELIST may be the correct solution. It could" \
-          "also be your build is including two different conflicting versions of" \
-          "things (e.g. bluez 4 and bluez 5 and the correct solution for that would" \
-          "be to resolve the conflict. If in doubt, please ask on the mailing list," \
+        bb.error("The recipe %s is trying to install files into a shared " \
+          "area when those files already exist. Those files and their manifest " \
+          "location are:\n   %s\nPlease verify which recipe should provide the " \
+          "above files.\nThe build has stopped as continuing in this scenario WILL " \
+          "break things, if not now, possibly in the future (we've seen builds fail " \
+          "several months later). If the system knew how to recover from this " \
+          "automatically it would however there are several different scenarios " \
+          "which can result in this and we don't know which one this is. It may be " \
+          "you have switched providers of something like virtual/kernel (e.g. from " \
+          "linux-yocto to linux-yocto-dev), in that case you need to execute the " \
+          "clean task for both recipes and it will resolve this error. It may be " \
+          "you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning " \
+          "those recipes should again resolve this error however switching " \
+          "DISTRO_FEATURES on an existing build directory is not supported, you " \
+          "should really clean out tmp and rebuild (reusing sstate should be safe). " \
+          "It could be the overlapping files detected are harmless in which case " \
+          "adding them to SSTATE_DUPWHITELIST may be the correct solution. It could " \
+          "also be your build is including two different conflicting versions of " \
+          "things (e.g. bluez 4 and bluez 5 and the correct solution for that would " \
+          "be to resolve the conflict. If in doubt, please ask on the mailing list, " \
           "sharing the error and filelist above." % \
           (d.getVar('PN', True), "\n ".join(match)))
         bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")
-- 
2.1.2


