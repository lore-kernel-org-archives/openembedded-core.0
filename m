Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 711E96156C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:35:22 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id k14so823539wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UwJbwkavPcvM0mzpxnDfLeDXV6sNX/0Gyn9F0kz0ZBc=;
	b=aKBJCClyeAULgLVON4RihI5tn0O3RFzjeQV68m028KlLobFWOmoe8o8YP14rKDYXtM
	YgmczeE/VXwi4R08nAg4Gb1VSHW0sgM1YZsm2ouHgy2rkSGzTyS5e1RcdntDWzDLUspE
	jQAoSysHx+bg8qWrGyfBIg82VZMDM6jCC0HgJv/LYo+EhVCisNuR0QRqZ3W9oImGGjS5
	m1PdRxviD8PFXzEs8THX3fp6Ht/i3LxE6SK4J16eb1uOuXrqAWjvM1MKH4AXSmiwTIDK
	8xJvp1ABiStHCV1sHbtgIt0Xql+OXEWiUOjvLG4hIkTn/eKLr0mM21MlLnGOF0qZ3pIj
	Aq/w==
X-Gm-Message-State: ALoCoQmMv/2XoyZDGzq/wuJbnUFy17DO3loMoi2beTJJoHoXAz+ZxKubBwFhpEzlz+AZ2N2P+nwy
X-Received: by 10.180.77.68 with SMTP id q4mr1668507wiw.4.1379061323638;
	Fri, 13 Sep 2013 01:35:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx7sm1775015wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 01:35:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 09:35:18 +0100
Message-Id: <1379061318-6726-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] anjuta-remote-run: remove
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
X-List-Received-Date: Fri, 13 Sep 2013 08:35:22 -0000

This is from the Anjuta integration which was removed many years ago.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../devel-config/anjuta-remote-run.bb                 |   17 -----------------
 .../devel-config/anjuta-remote-run/anjuta-remote-run  |    7 -------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/devel-config/anjuta-remote-run.bb
 delete mode 100644 meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run

diff --git a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
deleted file mode 100644
index b9cded7..0000000
--- a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Provides on-device script for interaction with the Anjuta IDE"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://anjuta-remote-run"
-
-S = "${WORKDIR}"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 anjuta-remote-run ${D}${bindir}/
-}
-
-PACKAGES = "${PN}"
-RDEPENDS_${PN} = "dbus rsync"
-
diff --git a/meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run b/meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run
deleted file mode 100644
index 620e3a7..0000000
--- a/meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-. /etc/profile
-export DISPLAY=:0
-dbus-launch $@
-
-
-- 
1.7.10.4


