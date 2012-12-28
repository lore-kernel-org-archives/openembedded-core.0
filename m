Received: from mail-bk0-f42.google.com ([209.85.214.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToQAp-0003j9-Dl
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 04:00:09 +0100
Received: by mail-bk0-f42.google.com with SMTP id ji2so4498875bkc.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 18:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7DM1HKYYp/ppmacBTOO61KbZ+jvxgqGZ54H8yrD5CKY=;
	b=AudVi5LWHrg6SbOAgYUy2fqYIL4vlzjU8jdUIIbjYrgp7fVq4KMF7HDCMCWWfeq2Nc
	ZPtOz4MNAL8kvEk654yQ6nwttyYDmWaU468MQ1e/PMymB6LU2OtuKXp6Q1UBcAt9L2xK
	QZFh0EN+AX+Eht5W6b8rxXPXqV4Z3AqL3CQXwpMpUjZqpqg0Yaw7vK5hoE3Sg+EYi+r5
	uIB1QWshwLITn67S/HY8MXdnOeSBE2ilFeRUkW1uSFuj4usvj+GRfzO+bpQgigIGU2DB
	1nl7pS1FM7kB5rgh0FvXqjxtWFz/48J0ZolQddVvh4DwPF4UOl6ZnCVvePuYDh7S42w6
	oHsg==
X-Received: by 10.204.147.217 with SMTP id m25mr15440487bkv.17.1356662696424; 
	Thu, 27 Dec 2012 18:44:56 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id f24sm21828056bkv.7.2012.12.27.18.44.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 18:44:55 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1ToPwM-0007Lu-0n; Fri, 28 Dec 2012 04:44:54 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 04:44:50 +0200
Message-Id: <1356662690-16034-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
References: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] icu: update to upstream version 50.1.1
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
X-List-Received-Date: Fri, 28 Dec 2012 03:00:09 -0000

This seems to fix HarfBuzz compile problems.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/icu/icu_50.1.1.bb |   11 +++++++++++
 meta/recipes-support/icu/icu_50.1.bb   |   11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu_50.1.1.bb
 delete mode 100644 meta/recipes-support/icu/icu_50.1.bb

diff --git a/meta/recipes-support/icu/icu_50.1.1.bb b/meta/recipes-support/icu/icu_50.1.1.bb
new file mode 100644
index 0000000..26b086f
--- /dev/null
+++ b/meta/recipes-support/icu/icu_50.1.1.bb
@@ -0,0 +1,11 @@
+require icu.inc
+
+LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
+
+PR = "r0"
+
+BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-50_1_1-src.tgz"
+SRC_URI = "${BASE_SRC_URI}"
+
+SRC_URI[md5sum] = "c721c2e0c8f86975ccea620d09aedc81"
+SRC_URI[sha256sum] = "a6f426e3c04749c74bcb9d2ce229f905de88deda2353db2249f2e96fe604df8f"
diff --git a/meta/recipes-support/icu/icu_50.1.bb b/meta/recipes-support/icu/icu_50.1.bb
deleted file mode 100644
index 8f65c6d..0000000
--- a/meta/recipes-support/icu/icu_50.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require icu.inc
-
-LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
-
-PR = "r1"
-
-BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/50.1/icu4c-50_1-src.tgz"
-SRC_URI = "${BASE_SRC_URI}"
-
-SRC_URI[md5sum] = "cf7bf9e56aa6c2057a8b6f464046483e"
-SRC_URI[sha256sum] = "68592b3c07d9b86100f41d0172eb1a81f3ffb2a8fef1104d7395099079ba7350"
\ No newline at end of file
-- 
1.7.10.4



