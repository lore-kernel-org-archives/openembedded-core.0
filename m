Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9E7C-0004Yr-VB
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 13:49:51 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 04:37:26 -0700
Received: by wgbdr1 with SMTP id dr1so466649wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 04:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=wSmxEhytSeR3aSXwXGaAPnQTVGbFxGECRo2i11/yTes=;
	b=U3Sw79+nGCK56YphCjM7klBjnVABV6cv8hE06wdVk4RjDNX36OyifDP4wqPVmc/8vO
	B154h0mr64l+Rz8JpdMfVd38U+aEPar98v6sNSmLKYt7WzESS1GZRd6n3MczIa3tBh1y
	FpA3UtFnit2jvmMPn3V+Q09yqRUiyYuJy12swQ3ZtMbzkst2+QYmTkGlvoNAprJ9lhjQ
	EJB8o1VQDzbXvhVkvqOz5nrq3z7rd27x1zhanxDTvfyO9MZ3kT2+w4Mk1M/RAZl787VC
	3abPrOgr9llLLVWTCIXNlhy1SkKG81JjXYBUIQ5D9amqdlRx2UyXSca5DIMSs11YELE3
	smZA==
Received: by 10.180.84.104 with SMTP id x8mr37582144wiy.20.1346845044449;
	Wed, 05 Sep 2012 04:37:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm28552807wiz.1.2012.09.05.04.37.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 04:37:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 12:36:39 +0100
Message-Id: <1346844999-9420-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQljKjBecJCXdMwmVx2TmewQ7CTsaCVYETceUXFwLGTaQFoETF9WDX6xKG+lW0fEBXB8i5GN
Subject: [PATCH] gsettings.bbclass: fix whitespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 11:49:51 -0000

As nothing in oe-core uses gsettings, it wasn't noticed that the whitespace is
wrong.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gsettings.bbclass |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index 1e3f7a1..dec5abc 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -18,20 +18,20 @@ gsettings_postinstrm () {
 }
 
 python populate_packages_append () {
-	pkg = d.getVar('PN', True)
-	bb.note("adding gsettings postinst scripts to %s" % pkg)
-
-	postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
-	if not postinst:
-		postinst = '#!/bin/sh\n'
-	postinst += d.getVar('gsettings_postinstrm', True)
-	d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-	bb.note("adding gsettings postrm scripts to %s" % pkg)
-
-	postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
-	if not postrm:
-		postrm = '#!/bin/sh\n'
-	postrm += d.getVar('gsettings_postinstrm', True)
-	d.setVar('pkg_postrm_%s' % pkg, postrm)
+    pkg = d.getVar('PN', True)
+    bb.note("adding gsettings postinst scripts to %s" % pkg)
+
+    postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+    if not postinst:
+        postinst = '#!/bin/sh\n'
+    postinst += d.getVar('gsettings_postinstrm', True)
+    d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+    bb.note("adding gsettings postrm scripts to %s" % pkg)
+
+    postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+    if not postrm:
+        postrm = '#!/bin/sh\n'
+    postrm += d.getVar('gsettings_postinstrm', True)
+    d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
-- 
1.7.10



