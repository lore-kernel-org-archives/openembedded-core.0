Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id E2911731A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 03:23:59 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id vt7so52614430obb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 19:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lNWCb61EVvOtoi2QuFmPhPdR2diq6mNrFrLCxKQVYpI=;
	b=Q0m2bu7Xjc+JBSqONxTOYNzZ2EhoSWpZeyOxhwyE+a2Yj5wVdwOVakZ2RBU9TpU91c
	PsPJ9u/dmzHAhm3Pz9jHWCR7y2gP1yVOmAW5d+k3p92d1xhSYJmWCLM8XVfGWrqciReM
	QakT2y5uvSdf0tUuOR05ONmM0PEYWL3bBL1iNOo9++PSPUmltwSoGEy4CV3IKz2jlggv
	fM0JPJtGrCOrUbeDnrs5uQrMBU1l9IjdqqppUsrHWCo5e3Fv8hg7Ul/C9MeldoqV5G3P
	MY7L+x63At1GipsDzS4hDwkXy3KqXR89xPLBLtgbQjHWHL2Z8/TJjspPGsUxdSVuLMwe
	WeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lNWCb61EVvOtoi2QuFmPhPdR2diq6mNrFrLCxKQVYpI=;
	b=leR5uqpjxSH0pqV3bfFROfdBroBVqXFTwBErOKX0zGSS2O0JltPjU4nQENPxWdBss7
	SDamrSscc40iifXqLKrWAdnaH608GQHyPR6ncstevpaRGKNN4hq7HZmgLoYoWApvMihS
	DxxZrT7cIoRIyaRBNdCLgboLL9sJ/d4o0W2uD69xt73XGypLYCqXQ4vEdITJaiP5B2Z+
	CnnbQwCVSXsStcPxfTw4JOm3dHKV52nKcng4Bhr3r5F69Y8DrZ91oI1fW3Vzfe6EfjnO
	udcZ9nDZmckq1bXF/+DtmjsEqD0QrRuiUIBv41z7yYGFM+ccgXfcvgUfB3afM7qL8cw1
	zCpw==
X-Gm-Message-State: AG10YOSsfwv95+QD3TSb5nVRFPpzjxnFa9WifMRmrvxNhS4OaXzcGRjTioUDDnj+a832bA==
X-Received: by 10.60.76.201 with SMTP id m9mr542288oew.33.1453433040063;
	Thu, 21 Jan 2016 19:24:00 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i10sm2153432oer.5.2016.01.21.19.23.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 19:23:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:23:53 -0800
Message-Id: <1453433033-25320-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] orc: update HOMEPAGE
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
X-List-Received-Date: Fri, 22 Jan 2016 03:24:00 -0000

The old entropywave.com URL no longer responds.

Also remove unnecessary 'name=orc' from SRC_URI.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/orc/orc_0.4.24.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/orc/orc_0.4.24.bb b/meta/recipes-devtools/orc/orc_0.4.24.bb
index 9e70d55..520f88d 100644
--- a/meta/recipes-devtools/orc/orc_0.4.24.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.24.bb
@@ -1,11 +1,12 @@
 SUMMARY = "Optimised Inner Loop Runtime Compiler"
-HOMEPAGE = "http://code.entropywave.com/projects/orc/"
+HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz;name=orc"
-SRC_URI[orc.md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
-SRC_URI[orc.sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
+SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
+SRC_URI[sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


