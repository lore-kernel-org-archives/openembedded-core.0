Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TVKCl-0000TF-W3
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 11:46:56 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Nov 2012 02:33:11 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg15so4232571bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 02:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=bXQ1YsBBriS3kzrNYxL7XBXXRlJszM5jy41FTDcfBKw=;
	b=IiGFca87FJD1VPB4kmUx7A3pqmkgrIYN+EMO1o1K6yXetAxfSq3kIPozCsti9teWJy
	7DKkeuBYxcJRMSPTrfvt6ATfSogNcBHLMk9sAzCMFSozvUUkMbsAvAV5xSkWoRayHWOb
	9iLIRPgmd6VSFIR4xnQ1XwOpF/0TR/QifRIYiiXjsHwuLxb6j+puKyvPuDrk38dTqEzc
	2bH53lCHHXMqjoJ7Gu519Ex3JtB1PPuFSv/czU4HJ+RW0Sud0g3o/7XakPLnwwKK4hVj
	3dAu8hCU2walMm1Gn7wv3UBJ+iZfdSLxJPn18gf+yAlqQBS3Aznj/WHY8puZB14VQQWO
	Navw==
Received: by 10.180.79.37 with SMTP id g5mr12561874wix.7.1352111588543;
	Mon, 05 Nov 2012 02:33:08 -0800 (PST)
Received: by 10.180.79.37 with SMTP id g5mr12561854wix.7.1352111588277;
	Mon, 05 Nov 2012 02:33:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q10sm4596594wie.2.2012.11.05.02.33.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Nov 2012 02:33:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2012 10:31:51 +0000
Message-Id: <1352111511-22618-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkgSnuN/uo3qXEn0B5TeT79Il0l+6nZUwRCMMxdRNzAgFn/KoFq11dDkxhx6Uut9JTyw+npYPocw45XCUogzGtAU/68DyxS8U2ia28gyLIa4NZqnCZiDcNBnNIQnwSJFhmdP+5pfA9qOjMCPFN3yTFPFBIaipZy18aoT5Ri7VwixRzn4qIMkYhYM15k/wTxtFueJ/C9
Subject: [PATCH] qt4: add missing libglu dependency
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
X-List-Received-Date: Mon, 05 Nov 2012 10:46:56 -0000

Qt4 needs to explicitly depend on libglu now that it's been split out of the
Mesa recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 20ad30c..ef3ff81 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -3,11 +3,11 @@ require qt4.inc
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libgl libglu virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
-INC_PR = "r47"
+INC_PR = "r48"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.10



