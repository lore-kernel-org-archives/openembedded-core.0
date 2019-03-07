Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D50547CDFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 06:03:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FKn95vTPz54
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 07:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551938605;
	bh=ubdjMBDdDsuRgKGJfypEMATTbijZzsU+SsvuoYcU0ZA=;
	h=From:To:Subject:Date:From;
	b=jD2Qm+WNOLnf246qS9jcuHv7XY6RYpdE39Keq3e8XrFq+B4mhUp2TQR489u/nzqxg
	Hbprh7ywklJ2T5pnBdP8uBhD3J9bv72pdIM1PdFmkBbscOpRGDXspGDdO9bqpCDmkI
	WbpUYl4oC4La9KiD4gDUtLAvl9m5Fi7sfgFvWiC0XDspk7oFFiZ+xBPaNMp/kSwIo4
	XdOl49UgH0laOIyKpHvptvZZxhNlTrvsEHCgbfUuY+UIRE3cBSXEolP40BuO05CI8X
	P8jTc+cY0MpO2PXs64/u79DxfGyyTQCCZun9AoymZIzkpQXKW731fUwoO0JP2/g/Ay
	ps2HKlTtuzWrok0LkAx+X/+fECmpMWNhjucI+ul5Nx/XbYmqPdrixvSTKdBgaexh40
	pddBNkonFgTgNtbBHANxp9GrH00/zK58J5bmI7Wzqgb3ws8850EpF2n0+724jXyRYg
	cz6af4v34v2Hk/xM4wHab2Qs/c9T5HWSKOw+vETacq6F8D5CAkVCawsFNrOQtqnCQl
	DIxq7kbhcLtvHe6LEpKtgPqp0Dez9q/YA413lEEzEt39oCDM5Exw7dTqMT54hVVh7h
	E7ppCEm0T1U/Kwo45YWsQYac9OUwNMIj/i3DVnmCtonk+5iM/H7kUzEr7pEZIH2224
	Km5DSUaCi+qxTOvcHLsxG35M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 08:03:24 +0200
Message-Id: <20190307060324.5488-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sqlite3: Upgrade 3.26.0 -> 3.27.2
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
X-List-Received-Date: Thu, 07 Mar 2019 06:03:27 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/sqlite/sqlite3_3.26.0.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.26.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.27.2.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.26.0.bb b/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
deleted file mode 100644
index a0d615bac1..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  "
-SRC_URI[md5sum] = "ac2b3b8cd3a97600e36fb8e756e8dda1"
-SRC_URI[sha256sum] = "5daa6a3fb7d1e8c767cd59c4ded8da6e4b00c61d3b466d0685e35c4dd6d7bf5d"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
new file mode 100644
index 0000000000..22fec21454
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+
+SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
+SRC_URI[sha256sum] = "50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e"
-- 
2.17.1


