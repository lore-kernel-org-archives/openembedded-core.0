Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QIMN9-0007Yc-Jy
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:51:15 +0200
Received: by wwb17 with SMTP id 17so3012073wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 07:48:34 -0700 (PDT)
Received: by 10.227.16.153 with SMTP id o25mr3976268wba.76.1304693314532;
	Fri, 06 May 2011 07:48:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bs4sm2049553wbb.1.2011.05.06.07.48.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 07:48:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2011 16:48:28 +0200
Message-Id: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Fri, 06 May 2011 14:51:15 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6b3df7..082f233 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -676,9 +676,9 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.note("the following files were installed but not shipped in any package:")
+		bb.warn("the following files were installed but not shipped in any package:")
 		for f in unshipped:
-			bb.note("  " + f)
+			bb.warn("  " + f)
 
 	bb.build.exec_func("package_name_hook", d)
 
-- 
1.6.6.1



