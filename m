Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcy5-0007DK-RI
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:09 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:48 -0800 (PST)
Received: by 10.216.54.199 with SMTP id i49mr1088293wec.63.1298798988269;
	Sun, 27 Feb 2011 01:29:48 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm1282515wee.40.2011.02.27.01.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:22 +0100
Message-Id: <c455847586abbb2889be0ee642af3df4b705c2b0.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 16/50] package.bbclass: Unbreak per file dependencies and blacklist doc packages
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fa1abf0..dcece40 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -642,7 +642,7 @@ python package_do_filedeps() {
 
 	# Determine dependencies
 	for pkg in packages.split():
-		if pkg.endswith('-dbg') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1  or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-') != -1:
+		if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1  or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
 			continue
 
 		# Process provides
-- 
1.6.6.1



