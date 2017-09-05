Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3157A6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 06:32:33 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id v66so7038824pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+iX62ImvhM924arbM/ghnaOSAs1W1fQJSCwJJFcQEow=;
	b=iI3aAueKYcOobnkfBJxaUdXqhf8XhgC0Qkuivibr4sRu9sncnQsL3bld4IlHQwESDS
	ODUN8QX2vDyBypY8lk/hEutupsoZf5jKE26IxnTbbTrumcoxI+OfAuta5CsjvS7KW4y5
	9GjiAG+AcwcOELhoU5ZP6MP202quG6OCb78tDQmq/972/+QpkE+tK+TFLF59wokcD38f
	8WuMZ//EJYfDVYGKVmhNNJfHy1JRkiR3IpTdidonxtvymTQRlb3BZqZWUIpGwRiDyXpD
	Z8PhWGUj96xrg9FN47B+TLwYXPZAcASnxAZQbL0SX1libl3dhlw2VkvzK7wnsSPoQ+eM
	H5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+iX62ImvhM924arbM/ghnaOSAs1W1fQJSCwJJFcQEow=;
	b=Y6i9qrYM8wY72NPsphZVO5pE4w0e0padx07OOumLbgQC6vnr2SiCppfdrB/hsWtNVl
	7H6BGkcMxJrrZkwKl0fHY+w/lUxFRFKanSh7CGLNH1RxMe7aBzm0G2k7TPCQtGetcFI6
	dfY4/sKwVPdg6SGDjG2I5HJ4qAmtkUHzgMu8wJjksWPLUEkWPNAnBAqVlBMqR43gYElj
	Vscn2UE+Z6oxdWI302VOPxLwe5/dW1vtsTC1RPkJrFGudztNTxbpRxJ7Q4MP0unt4HZv
	t3Ejd0lnKvbUK55OZlM2q7Xp2DLyJLIyIMqpwdNy7CAtjp7yC5Eyo4Y2EV8qFAL4FB/o
	hLHQ==
X-Gm-Message-State: AHPjjUgBj9jjeFZmj6KTW4A0GjU2a4I7D6ACGSezz64Flmo/UjLGZ6kc
	GpewPCWmWRmDyn0Pup4gVQ==
X-Google-Smtp-Source: ADKCNb4x2LlATYsxb47k0jEhsxh5v2sluW11pDSWfYbkLDASzvsgcr0HQI0MtoY23I+Qrexefme0GQ==
X-Received: by 10.99.3.213 with SMTP id 204mr2956226pgd.274.1504593155167;
	Mon, 04 Sep 2017 23:32:35 -0700 (PDT)
Received: from ankit.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	e64sm12557411pfe.187.2017.09.04.23.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Sep 2017 23:32:34 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 12:06:02 +0530
Message-Id: <1504593362-13345-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Tue, 05 Sep 2017 06:32:34 -0000

 7b7c15c build: Include check for xxd binary when in maintainer-mode
---
 meta-oe/recipes-connectivity/ell/ell_git.bb | 17 -----------------
 meta-oe/recipes-core/ell/ell.inc            | 13 +++++++++++++
 meta-oe/recipes-core/ell/ell_git.bb         |  5 +++++
 3 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/ell/ell_git.bb
 create mode 100644 meta-oe/recipes-core/ell/ell.inc
 create mode 100644 meta-oe/recipes-core/ell/ell_git.bb

diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb b/meta-oe/recipes-connectivity/ell/ell_git.bb
deleted file mode 100644
index d259f52..0000000
--- a/meta-oe/recipes-connectivity/ell/ell_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-
-do_configure_prepend () {
-    mkdir ${S}/build-aux
-}
-
-DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell.inc b/meta-oe/recipes-core/ell/ell.inc
new file mode 100644
index 0000000..7bed240
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell.inc
@@ -0,0 +1,13 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_git.bb
new file mode 100644
index 0000000..0589809
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell_git.bb
@@ -0,0 +1,5 @@
+require ell.inc
+
+S = "${WORKDIR}/git"
+SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-- 
1.9.1


