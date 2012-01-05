Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitG2-00086v-Fu
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:50 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so373860yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=OsMHKnGu432GzdjKbGxnoL/NaWzsa/CAayC4PqoJxz4=;
	b=iDfYTPg2XMdUii/Sn2ZzBd0ChmTAdtH3td1NxnRyoQHZymbmVOWhrzJDz3rUNvFlHR
	K3xIkMdwCbPZv+LM515MPivhXah5uXihbJ4beIqCiy0oe/Ifa/spqJJeP34I5BO2El4r
	gCG93pWp64mq3baHZo6G2GOa1h281I1VnNMjI=
Received: by 10.236.128.207 with SMTP id f55mr3717539yhi.83.1325792309532;
	Thu, 05 Jan 2012 11:38:29 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:54 +0000
Message-Id: <eea6cc4bf36151b09972954b13be160ffa53aafc.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 04/10] qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:50 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 39f7398..e472af5 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,9 +2,8 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r39"
+INC_PR = "r40"
 
-QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
 
 # Set necessary variables in the profile
-- 
1.7.2.5



