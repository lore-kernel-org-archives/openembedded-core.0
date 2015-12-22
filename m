Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6362860112
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 19:57:02 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id q63so5027663pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mA3c1B+3gGAiW/Q+jQuOxn6yNCOLOnjXQQj15SKcRiA=;
	b=pcwozFw8jQhc3ZluY6vYJYPjoXAJOhIYc3gE9+co9KikwyLHVIo68Atw3AEPjZtMBc
	lADjPttnFjR/5WNKFGOkNXJNARmyEH2G+BN72nqMT3gmPIS61o1P7Yr+f5i/2+Ea8Swx
	pJnhbB4Y+parVDknzf9a3NghVBb31iKBCbFtsCp8+E2GtXXP1uVHQD+/aK6NfJNyr8AS
	JngcZDkuR05+Amje+jdrpQjZk9hCxGAbHjuVooWL+xfMxld5x/NSkFRKqK1qm5u7CkM2
	PrtG4NaU00MdQkUHiDKD3Y2SjLbDfxav6MCzFssnW2aLOUOaubmlJu/Izw4ANYup/DUs
	u/4g==
X-Received: by 10.98.8.14 with SMTP id c14mr28718070pfd.19.1450814223520;
	Tue, 22 Dec 2015 11:57:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 13sm36417450pft.5.2015.12.22.11.57.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 11:57:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 11:56:56 -0800
Message-Id: <1450814216-23030-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cairo: update 1.14.4 -> 1.14.6
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
X-List-Received-Date: Tue, 22 Dec 2015 19:57:03 -0000

Release 1.14.6    (2015-12-09  Bryce Harrington <bryce@osg.samsung.com>)
========================================================================
Simple bugfix release to fix one Windows issue.

For a complete log of changes since 1.14.4, please see:

    http://cairographics.org/releases/ChangeLog.1.14.6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/cairo/{cairo_1.14.4.bb => cairo_1.14.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.14.4.bb => cairo_1.14.6.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.4.bb b/meta/recipes-graphics/cairo/cairo_1.14.6.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.14.4.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.6.bb
index a47bfa5..20b4668 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.6.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "90a929e8fe66fb5d19b5adaaea1e9a12"
-SRC_URI[sha256sum] = "f6ec9c7c844db9ec011f0d66b57ef590c45adf55393d1fc249003512522ee716"
+SRC_URI[md5sum] = "23a0b2f0235431d35238df1d3a517fdb"
+SRC_URI[sha256sum] = "613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252"
 
 UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
1.9.1


