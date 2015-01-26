Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6544E6AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 11:46:59 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so6286812qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 03:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=CV6oyFOFE96n8ej4pdThidj1oNCO+CsBf8Sm6w4W58M=;
	b=sk+AbWzMkGcWKdv0eAKDWYbfz6FoKC4mzAoFSxsC6ZgIPAvSn3/tE9iF2IDH3x3Ycp
	ZS/moWydJH3/CZWeccDyPhLfwcVVEOjkm070UGycfoy/8Oq7xVjbLXOo7BwE6jmOcSsZ
	xOeQItt5T15OQrXN3pZoowRJDnE/YqKv+l0VeajEnaqhYYBZgp04G+RJPf/WvDKo+R7z
	uj9IZXaebqVm6xXjlllFM7DJpYXwbNRmj+2G8gF5FCGSjDohOLSjH7Wal4htcpUBjBXn
	W8ODgUivkEjoDXtoHWaR+xYxR2RtasmTPut0Fevwavbs1Y1pGiADbeBVBjp3alDD5tg2
	GR5A==
X-Received: by 10.229.80.3 with SMTP id r3mr10102256qck.23.1422272819823;
	Mon, 26 Jan 2015 03:46:59 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-84-240.ronkva.east.verizon.net.
	[108.44.84.240])
	by mx.google.com with ESMTPSA id r16sm9718981qay.10.2015.01.26.03.46.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:46:58 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 06:46:36 -0500
Message-Id: <1422272796-23609-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] orc : Update to 0.4.23.
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
X-List-Received-Date: Mon, 26 Jan 2015 11:47:08 -0000

Orc has moved to freedesktop.org, so the fetch URL changed. Dropped the .inc
file and PR from the recipe.

This version fixes a bug that led to problems on armhf abi builds.

https://bugzilla.gnome.org/show_bug.cgi?id=727464

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-devtools/orc/orc_0.4.18.bb              | 6 ------
 meta/recipes-devtools/orc/{orc.inc => orc_0.4.23.bb} | 6 +++---
 2 files changed, 3 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-devtools/orc/orc_0.4.18.bb
 rename meta/recipes-devtools/orc/{orc.inc => orc_0.4.23.bb} (74%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.18.bb b/meta/recipes-devtools/orc/orc_0.4.18.bb
deleted file mode 100644
index 2375d8c..0000000
--- a/meta/recipes-devtools/orc/orc_0.4.18.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require orc.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[orc.md5sum] = "1a2552e8d127526c48d644fe6437b377"
-SRC_URI[orc.sha256sum] = "34d3c8a7259f42bed4dcfbc106c5e3d0cc8e17eeaa73128d1c5eaf92883a6a24"
diff --git a/meta/recipes-devtools/orc/orc.inc b/meta/recipes-devtools/orc/orc_0.4.23.bb
similarity index 74%
rename from meta/recipes-devtools/orc/orc.inc
rename to meta/recipes-devtools/orc/orc_0.4.23.bb
index b134831..0e07731 100644
--- a/meta/recipes-devtools/orc/orc.inc
+++ b/meta/recipes-devtools/orc/orc_0.4.23.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://code.entropywave.com/projects/orc/"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-INC_PR = "r2"
-
-SRC_URI = "http://code.entropywave.com/download/orc/orc-${PV}.tar.gz;name=orc"
+SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz;name=orc"
+SRC_URI[orc.md5sum] = "72e0612ace54d77aa2f7a006348ee81a"
+SRC_URI[orc.sha256sum] = "767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7"
 
 inherit autotools pkgconfig
 
-- 
2.1.0


