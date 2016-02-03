Return-Path: <dominique.hunziker@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id DC2EF771C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 18:23:14 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 128so178434690wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 10:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VLySJaqV3rc35P26yI9WVRR5mGQ+rB/1NylwHVqBnNY=;
	b=Aevq59v8ohN2MksSNxa/zDvGgnUgB978HyKvIuhGHHr0V0G9bNE5GwvNuY1FIsuJco
	OU6648LtxQrJ4RZGXtGLf6AyFj713t6fYEl1sNr4u0sFHSG9iUzS6AU8cZ+ZomHm7xVc
	o/2IbqRHh+iwArRnfOapG2ngck7tAPYqIqE9TJCxkGJ4m1pf3LgvkRKaJHO6lHKdmM1y
	gCwVlhsauVep82PyX0k6oyOisOZLvW1GBwh1B/xZFvHZkS8dTeQVzsOlSnZEMLf2uEks
	MAWqLHaTlHH4K9Y2404T+6ypzo541fn96ul2eGETUuNHO5tG85Tf19pJwA1xNMLAH/3Z
	Qg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VLySJaqV3rc35P26yI9WVRR5mGQ+rB/1NylwHVqBnNY=;
	b=KyTpWI+wKIDNm0oGXiJFbd7pRaJRt/mt5+OKisveNCdNN1anCakzl0nGNt5LIhfbtb
	gZkhCNGSQs8CYptp6/9i8XpOwNF+4wyjTsgWA/SpQtigiBiu43CeNuYWhABbhPr2eSfp
	ppFpqK4ZvnUYGao7ofy+dhQhjyU5TNuMX9M7vegYcSqA1HrKJc/VibFbz8/JALeTm2hL
	cHSVVqyaaLrbcdbnVI//XjhSmqt3hqma4HowLv/rPuyryzZ9x8BAvGFND41TDQhzj+kp
	QqRONEelatDrHiBleGCQALOC05WMFtg2qNqBkD5at+/CfEnpF63Ph9AwFYET4F2odHNu
	SK+A==
X-Gm-Message-State: AG10YORhs8eDwcE/3zlnY9jZ4JDj7hEMqJy6ItWq9wycEFWMZ4Z/CZHE87pGFrIeBgvBAA==
X-Received: by 10.28.20.141 with SMTP id 135mr24651070wmu.85.1454523794807;
	Wed, 03 Feb 2016 10:23:14 -0800 (PST)
Received: from localhost.localdomain (77-57-36-131.dclient.hispeed.ch.
	[77.57.36.131])
	by smtp.gmail.com with ESMTPSA id w66sm9117013wmd.2.2016.02.03.10.23.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 10:23:14 -0800 (PST)
From: Dominique Hunziker <dominique.hunziker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 19:23:04 +0100
Message-Id: <1454523784-3938-1-git-send-email-dominique.hunziker@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Dominique Hunziker <dominique.hunziker@gmail.com>
Subject: [PATCH] python-distutils: add missing dependency on python-email
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
X-List-Received-Date: Wed, 03 Feb 2016 18:23:18 -0000

Signed-off-by: Dominique Hunziker <dominique.hunziker@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 4 ++--
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index f1efecf..673b90a 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../scripts/contrib/python/./generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -82,7 +82,7 @@ RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
 FILES_${PN}-difflib="${libdir}/python2.7/difflib.* "
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
-RDEPENDS_${PN}-distutils="${PN}-core"
+RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
 FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils "
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index f44a951..d089f51 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: './generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -70,7 +70,7 @@ RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
 FILES_${PN}-difflib="${libdir}/python3.5/difflib.* "
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
-RDEPENDS_${PN}-distutils="${PN}-core"
+RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
 FILES_${PN}-distutils="${libdir}/python3.5/config ${libdir}/python3.5/distutils "
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index f77066e..cd8a80b 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -244,7 +244,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-distutils-staticdev", "Python distribution utilities (static libraries)", "${PN}-distutils",
     "config/lib*.a" ) # package
 
-    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core",
+    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core ${PN}-email",
     "config distutils" ) # package
 
     m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 26eb0f3..c30a963 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -247,7 +247,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-distutils-staticdev", "Python distribution utilities (static libraries)", "${PN}-distutils",
     "config/lib*.a" ) # package
 
-    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core",
+    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core ${PN}-email",
     "config distutils" ) # package
 
     m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
-- 
1.9.1


