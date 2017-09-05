Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id ECCDD6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 06:42:13 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id v66so7091144pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+iX62ImvhM924arbM/ghnaOSAs1W1fQJSCwJJFcQEow=;
	b=fbzgdnyW1jPA9rzR+0uSpAbscsIWccxLvSBoYwammD4q0LSpQ6RfwnMQtssRRzbtJs
	w0WXMXqI4uDhMcbEDrCFrlzt0Fa8cNG9uvjznFEgh5GEbjG4Oe7fqOnPoFU7LxCDpsFI
	5tNtW71g7MwYbKhx0dSa809B8V70Mrvaj0gIYmKMX6AaxMmawqFEyAqpZMDUSqzZ4MxP
	7XSdFXK5YYHyF3QC51zE+XQfAgAKakbMtOOq2jwxekC5TFzKZ4hmJRZ4OM8ql5i3+/Cy
	6vGdJOz8ExpfLLpnShmfx81JfHkebb5giLywCw+oplw4E7FQwSGFLYjFg1n5AFYYNfb4
	+Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+iX62ImvhM924arbM/ghnaOSAs1W1fQJSCwJJFcQEow=;
	b=C4F6oYL+VvzgkeAIS3gZTSuAWVPPCBRUarBq3ehTx3LN5rNH6y12gSjunXCNmtnjGp
	as1DBy3Jv/vpjpmJtiObjJO6fjtoAXQDPpzsNDqV4Zdz82r1LOELgyjGZ7HXwz5JuF9f
	MzvvAluqF3AV+g7yjlYgbjEGpevf4i6sImgl+rVBCK14JhJmJSgy6Nh7xdbGHKBHU0+u
	yswXyiCiMx4EMkr/8qcnXTeaRcyatFfk7c1dCpK0gfrd0YufnUdSSdiW1vFIOlMyz8dD
	MOrk+xtKWUunKpYkTHYMBiOksI3q1HlMKW8c45i1EGI+rqGQrBXsPiKzObHgpANFHEy5
	k6qw==
X-Gm-Message-State: AHPjjUieANQJmodA8icwUq5PxPiEA/wK7HS4ZgPAvvEfKM5vw5XkdSvI
	o85e/+7wviNY//m4JGgC9Q==
X-Google-Smtp-Source: ADKCNb7ZIyX1B7O/wSheHP/JEU0bhXyKU7r6Dk2MLdogiEye99UgehcLPy13SswV9zugpGksGiymdQ==
X-Received: by 10.99.105.130 with SMTP id e124mr2988327pgc.420.1504593734942; 
	Mon, 04 Sep 2017 23:42:14 -0700 (PDT)
Received: from ankit.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	i127sm14139398pgc.73.2017.09.04.23.42.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Sep 2017 23:42:14 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 12:16:16 +0530
Message-Id: <1504593976-17743-1-git-send-email-ankit.tarot@gmail.com>
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
X-List-Received-Date: Tue, 05 Sep 2017 06:42:14 -0000

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


