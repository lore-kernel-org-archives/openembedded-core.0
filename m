Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziT-0007Xe-CO
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:13 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so6849838yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZJxdSy2impaqSX2XT15sGhwEZSOxgYnGixNyQQZAIAg=;
	b=wqGYRPNaWWkJjaC0lty3bD7lom+pAAg0gY46pGVx4NPmjJhyTlVQxLsN/wcs/dKh4f
	U8m/rcgAYpD3YQPHJAeZ0AAsDnsvzrhRPcnke5M8xTFveb/LMWaSvgZe63kOUM3lHrQC
	7XIjt447fjyItnKnITJGXb805TB2YniPKSWT8=
Received: by 10.236.128.242 with SMTP id f78mr45906646yhi.7.1325102161869;
	Wed, 28 Dec 2011 11:56:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:26 +0000
Message-Id: <f5be7c28a0ecac2f91da66d77c02a00c354d3dce.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 05/16] qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Dec 2011 20:03:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 5b93a98..40939de 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,13 +5,12 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r36"
+INC_PR = "r37"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
 QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
-QT_BASE_NAME ?= "qt4"
 QT_BASE_LIB  ?= "libqt"
 
 inherit qt4x11
-- 
1.7.2.5



