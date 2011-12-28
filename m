Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziQ-0007XZ-Pu
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:10 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so6849833yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=OsMHKnGu432GzdjKbGxnoL/NaWzsa/CAayC4PqoJxz4=;
	b=J8WaEu9VlxETjzvPzaMIFBle4ZS4f8pM0ThNSomQVU24iT8u9NbKPT+Z1cR6/733ye
	pXF4tj7V8LLVwxrqoBGrhwRA50qZ3rP/BlkENXBEdzr/8DbvYIdcdJZpiCYR2j1EbQHo
	Wmtpl8xKGHCVNKAXqthaUTQxf3bQVsDGAGRwI=
Received: by 10.236.116.129 with SMTP id g1mr44288702yhh.107.1325102159293;
	Wed, 28 Dec 2011 11:55:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:55:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:25 +0000
Message-Id: <4c2e6e07954e5118d48e4cfb69679f522956e798.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 04/16] qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:11 -0000

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



