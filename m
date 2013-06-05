Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 833AD6A4A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:45:22 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so688499pac.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 19:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yJih5y4PrxEul88HClActMx1DKmaX1oj9hEeqB03rv8=;
	b=w/y5M5z4mHCYzswPeo14DF4vl1oCdPUmDte4X/RZJHYmHuS/wHBjohF57TP8fBxNL3
	mez7yOLseX6lgxTN3SBuUNJo2bFMzzFeN6qN42yDbcYAHgOUBqGLWF30witEHhDiL4Sp
	trWEP5I3QTaPToT5T2Z7dulz3kf9/FYQc1YwI68jaoU/XcmJuVbgUFs3tZc4ST8tUcg1
	PwpA3CS4EEWctsfJtoPWhdyYj2EqTRNhdNOg3kO0pewm0/VXiA/PWF4Q/nstY2j7FxIS
	RgN0VMtnutu4ii53qxhBG5mMyinpMYkjrugIr5G9F/hPpfjGHy/pJlzuuuL93XJ0cXF+
	ZKJg==
X-Received: by 10.66.50.4 with SMTP id y4mr32206399pan.216.1370400323049;
	Tue, 04 Jun 2013 19:45:23 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vu10sm65673616pbc.27.2013.06.04.19.45.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 19:45:22 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 12:58:59 +1000
Message-Id: <1370401139-15582-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] valgrind: allow native builds
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
X-List-Received-Date: Wed, 05 Jun 2013 02:45:22 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 3520d49..503e996 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+BBCLASSEXTEND = "native"
 PR = "r8"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
-- 
1.8.2.3


