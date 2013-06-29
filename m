Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id EA72A6AD1C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 12:18:38 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so2001684wes.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=srPbDkUQUPOI3RS/PPPYrkgMfceBq0OAad3z7z1CYc4=;
	b=ER91jwaT8FrTfDjwT69l4xinbC09/QOQoQbu3PLcNnHhUh/uj3SY1nPHzL/KpzS/zv
	fd0jvaYjNeiZROFS62qdcVjBbNYnd6sCI+l4mxJkgOrte56IIakgg2UCNisax41GeCIl
	Z8GIlY23UMdcLqzrXBzCxvP0sSB2MzsWGDynKQ/t4IL1OZ66A9kACdWADz3F5HT+hqRz
	Pj0ASoq+yGG/AimlpiVBQxMz/XtLjG84SmJVsC336Gqt5UQbaj5QRTnpj2WDCwK8wNdi
	qN0XPjDEVmf1mDJf0rfetUPPxNl7q8I+kKsyb5/1iMtiByTmVzYCalu6dKHnQOcHdaUe
	LsfA==
X-Received: by 10.180.183.202 with SMTP id eo10mr6286738wic.2.1372508319047;
	Sat, 29 Jun 2013 05:18:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm16684931eev.10.2013.06.29.05.18.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 05:18:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2013 14:19:18 +0200
Message-Id: <1372508358-1839-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
References: <CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
Subject: [PATCHv2] qt4e: override variables OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Sat, 29 Jun 2013 12:18:39 -0000

From: Wills Wang <wills.wang.open@gmail.com>

override variables OE_QMAKE_QT_CONFIG to compile Qt/Embedded apps

Signed-off-by: Wills Wang <wills.wang.open@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/qt4e.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index d7f5df8..850bb6a 100644
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
1.8.2.1


