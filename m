Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitG4-00087E-OR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:53 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so368633ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZJxdSy2impaqSX2XT15sGhwEZSOxgYnGixNyQQZAIAg=;
	b=KYCz1hOgZt94twZX8FKHdHD1kpQ7KQtlqh2WZ4Jd1WieyN6WgIrzmwzhrJ8oOJfQKV
	l5+EJaeIEAmllQXwSFPI65FiB4wiC93zDlouA9CX/owvPZG/l72BlESMRCVReqCuaM3z
	oALW0Pet37i+5PoHs0kOXa3beL05tljE0uUsY=
Received: by 10.236.184.8 with SMTP id r8mr3719419yhm.110.1325792311809;
	Thu, 05 Jan 2012 11:38:31 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:55 +0000
Message-Id: <cd96e27b6190f693edde388733211b82d688328d.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 05/10] qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:53 -0000

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



