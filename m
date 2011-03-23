Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2UBV-0000BT-Un
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 20:57:37 +0100
Received: by wyb40 with SMTP id 40so7876204wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:55:43 -0700 (PDT)
Received: by 10.216.166.2 with SMTP id f2mr231257wel.24.1300910138709;
	Wed, 23 Mar 2011 12:55:38 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p5sm560354wbg.28.2011.03.23.12.55.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 12:55:37 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2011 20:55:31 +0100
Message-Id: <1300910131-9827-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] kernel.bbclass: blacklist 'kernel-misc' from kernel-modules
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
X-List-Received-Date: Wed, 23 Mar 2011 19:57:38 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

When 'kernel-misc' is empty do_rootfs will fail when including 'kernel-modules'

The proper fix would be to have a whitelist for the 'kernel-modules' meta-pkg

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3eb6659..9f014d4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -429,7 +429,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
 	bb.data.setVar('FILES_' + metapkg, "", d)
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-- 
1.6.6.1



