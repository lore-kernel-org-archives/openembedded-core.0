Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxz-0007DK-Ph
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:03 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:42 -0800 (PST)
Received: by 10.216.211.92 with SMTP id v70mr3733943weo.23.1298798982233;
	Sun, 27 Feb 2011 01:29:42 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j49sm1285477wer.14.2011.02.27.01.29.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:16 +0100
Message-Id: <cecae5a52ba212b68cae582ea7eae95c18bf5c50.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 11/50] poky-setup-builddir: Update references to the manual
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:03 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/poky-setup-builddir |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/poky-setup-builddir b/scripts/poky-setup-builddir
index 7a1452f..7a49a8f 100755
--- a/scripts/poky-setup-builddir
+++ b/scripts/poky-setup-builddir
@@ -66,8 +66,8 @@ you with some default values. You may wish to edit it to use a different MACHINE
 cores for example. See the file for more information as common configuration
 options are commented.
 
-Also, for more information see the Poky handbook:
-http://pokylinux.org/doc/poky-handbook.html
+Also, for more information see the Poky Reference Manual:
+    http://yoctoproject.org/community/documentation
 
 EOM
     cp -f $POKYLOCALCONF $BUILDDIR/conf/local.conf
@@ -82,8 +82,8 @@ You had no conf/bblayers.conf file. Poky has created this configuration file for
 you with some default values. To add additional metadata layers into your
 configuration please add entries to this file.
 
-For more information see the Poky handbook:
-    http://pokylinux.org/doc/poky-handbook.html
+For more information see the Poky Reference Manual:
+    http://yoctoproject.org/community/documentation
 
 EOM
 
-- 
1.6.6.1



