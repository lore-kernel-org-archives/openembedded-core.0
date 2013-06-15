Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 894CE6AA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 23:52:10 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so1020893pbc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VuT01qMrecPZb2kjyDBaedWsYzLSLYJfmzlJglKR0IY=;
	b=IV+P/JvD2seILWVj1XNyEpeIuhF+0fzztB9FtnvXXyxvzt1zdRMqBl9YDheD4nDHFC
	dMNiXxDGdr7H5MJkMT3vaBvojf96aGLqFTA7NrvGP+pSitMZZAx3tlORhTr0nHGvfPFM
	Y3lcuUxpaZsF7OJt2yQkT+4tdG71JC9ehhEcV13h00bvnZGTrETBncDGZZF/flWHP8sp
	NdgG7Bb9+72mo75aVJQ2/+CXSmiUCaMevCEwO90Qv0KGt+BhO/S0PFkNtkADXS+jonLP
	oSYvs2pRlQCNT2txYt7ugiU2UkXMLjur+4JNgSKDRKMHhWmuB2cIiZd+0qQu0IFwcSt+
	56hg==
X-Received: by 10.66.246.194 with SMTP id xy2mr4457526pac.131.1371253931358;
	Fri, 14 Jun 2013 16:52:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id jb2sm3868968pbc.8.2013.06.14.16.52.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 16:52:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Jun 2013 10:06:31 +1000
Message-Id: <1371254791-8168-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 14 Jun 2013 23:52:11 -0000

The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
pointing to the qt4 qconfig.pri when it should be pointing to the
qt4-embedded qconfig.pri.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qt4e.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index de2a68d..13b1050 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
 # override variables set by qmake-base to compile Qt/Embedded apps
 #
 export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/qconfig.pri"
 export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
 export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
 export OE_QMAKE_LIBS_QT = "qt"
-- 
1.8.3


