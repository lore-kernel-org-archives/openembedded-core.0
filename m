Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id D53FF6CD5A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:10 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so2336527eak.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4VTuwtOrDBHckKK+Z6lYTPdZem3vW1DNwgdq6gt4wNc=;
	b=UnDK9vVLhhqX4TrB1etObDbewX+qe7ZMnzW9jWxY6cFxhGcehEMXZkrt9y6SStC1Fs
	6PeatLY1n5k3BJuvPRM8o/B2h/9c0B+jRXiXezkzY6beJPojokzKeWLuJxK58Oaxi8ca
	Iso2TKavbF/TC6vNR4l3ExZWzCiccWUC7X2rGyvouZKNj4O2hLYJkNT9fgcg4sHIvd3e
	RycqndwsSPEiDoBum3RzDULfbotC15MlgGyVG+/2khaNXzguPg6QjCRXkfhZGr9zOSq0
	81zFD0EeekA4K2ElXY6OsbHcGgFtQ9urQvNUOlFngvElELqMYXgVUcjJAtpRIBOrr02f
	V+BA==
X-Received: by 10.14.122.132 with SMTP id t4mr30760983eeh.20.1380975792450;
	Sat, 05 Oct 2013 05:23:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm39231795eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:03 +0200
Message-Id: <b91a68e9e9d6becb7282ccf70119108747ec83e7.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 06/14] matchbox-wm: Add dependency on libxfixes and libxcursor
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 09e8b7c..b009c4b 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -1,7 +1,7 @@
 SECTION = "x11/wm"
 DESCRIPTION = "Matchbox window manager"
 LICENSE = "GPLv2.0+"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage libxrender startup-notification expat"
+DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxcursor xdamage libxrender startup-notification expat"
 PR = "r5"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 55480d7..934719a 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
                     file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
 
 SECTION = "x11/wm"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf"
+DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
 SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
-- 
1.8.3.2


