Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBkK7-0000L6-Np
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 12:37:35 +0200
Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 03:24:45 -0700
Received: by wgbds1 with SMTP id ds1so2551105wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 03:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=l7spjOMqKWJieIPC/Z/vH5EKd7gqsAyk0k+lUerGqI8=;
	b=mcOpyQBVa8M9P1gZVyYXP0bb0ovk7gwtmDDHw0pWaOgQs0mwjnVSsuMih7dc6EjjvC
	a+uA2sfAyjtJ5wN8O1+5RJgwXj3ckvirFnfQBdxLDnyHnYe62DFsyTGsC+06uzTTfNi8
	PgmooduINB20FrZofUxpb+M0Ku0NKJxmDLZDEgKzMF4AQULmNp+SYFs64XDMTJcT+9ee
	UwUs3AtE9ddcQkPTkQyTQRE+xngGU9r5OdOsCsE7rOUArUoVM1/6aY0Z4zp+pRG4taef
	pdqmPycjvjNnGg4FkDf2IeV7tKoKz2dsn4IVzCN3kCcBo5avcB6aTgauRy3aGs3mgQiF
	4jlA==
Received: by 10.180.85.167 with SMTP id i7mr31800595wiz.8.1347445483197;
	Wed, 12 Sep 2012 03:24:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm7773438wib.0.2012.09.12.03.24.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 03:24:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 11:23:47 +0100
Message-Id: <1347445428-15753-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlMXaZXRjVcZnzmh7ivJ+3yPL0pxCdo7aQ3+hRbvd4N6XNCnljLR1sGawdV975nOo/k3C+D
Subject: [PATCH 1/2] mesa-xlib: remove, it serves no useful purpose
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
X-List-Received-Date: Wed, 12 Sep 2012 10:37:36 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-xlib.inc      |    1 -
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb |    5 -----
 meta/recipes-graphics/mesa/mesa-xlib_git.bb   |    8 --------
 3 files changed, 14 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_git.bb

diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
deleted file mode 100644
index b720e14..0000000
--- a/meta/recipes-graphics/mesa/mesa-xlib.inc
+++ /dev/null
@@ -1 +0,0 @@
-EXTRA_OECONF += " --with-driver=xlib --without-gallium-drivers"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
deleted file mode 100644
index a89640e..0000000
--- a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require mesa-common.inc
-require mesa-${PV}.inc
-require mesa-xlib.inc
-PR = "${INC_PR}.2"
-
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
deleted file mode 100644
index 6647120..0000000
--- a/meta/recipes-graphics/mesa/mesa-xlib_git.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require mesa-common.inc
-require mesa-git.inc
-require mesa-xlib.inc
-
-# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
-DEFAULT_PREFERENCE = "-2"
-
-PR = "${INC_PR}.1"
-- 
1.7.10



