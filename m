Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXj-00066d-52
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:20 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507830lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Q3spGhi4UGczMfpoQQ5x9JG8UOKBtncwfCXvuW3PIZs=;
	b=bmOGaPK1dQoTIrHCSFLlKkIM66jvxV2GEujSYj/MCu1HwpDtBc/gUgAu5wGxticezx
	/fb4s1c7kCPhS1/cF5RCqlFiWtwHY6p44O4XH6AV0Gg321IZY7zhfNznETMVcRVQFcDf
	bE9yNfD1cYbuSBnsBkWFn2QJEKjPIwmUyXvFKbCXWHzZG1o8wFVgx0a58kk/8TE9fnF5
	Imek7448tBQvrFNsrKrbcFWVslf9ukvXCLw3kK6x1m/cmnS/1Elt/QPxZf14LBd/r8N0
	UrP//Gv8nFklJ+2geqrP5M4OOiviBy5yHn2lE8CdbHL0uvQojefNOIzKY+gB3pEvEXCN
	NWcw==
Received: by 10.152.111.131 with SMTP id ii3mr1524312lab.37.1354288563964;
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id ly18sm2106670lab.15.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-0002yT-2p; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:38 +0200
Message-Id: <1354288544-10778-5-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-4-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 04/10] xcb: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb |    2 +-
 meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
index 43ef5a7..89d79ab 100644
--- a/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
@@ -4,7 +4,7 @@ DEPENDS += "xcb-util"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fdedf75054223fb4 \
-                    file://image/xcb_image.h;startline=4;endline=27;md5=4e4f1b0fae5694beed407dea01f38212"
+                    file://image/xcb_image.h;beginline=4;endline=27;md5=48cd25ae55e7de525fe1e1a3a7672e1c"
 PR = "r0"
 
 SRC_URI[md5sum] = "fabb80b36490b00fc91289e2c7f66770"
diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
index 4d57ec2..465ccd4 100644
--- a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
@@ -2,9 +2,9 @@ require xcb-util.inc
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610d5bb9d \
-					file://ewmh/xcb_ewmh.h;startline=4;endline=30;md5=7bcd2d64f5615707f95ea8826a93561f \
+					file://ewmh/xcb_ewmh.h;beginline=4;endline=30;md5=73b589f90ef90b4a43998955daad5cd8 \
 					file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
-					file://icccm/xcb_icccm.h;startline=4;endline=31;md5=0af3f37474085b0517dbbae4cb4ce13c \
+					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
 					"
 PR = "r0"
 
-- 
1.7.10.4



