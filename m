Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziR-0007ZH-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:11 +0100
Received: by ggnh1 with SMTP id h1so8399607ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2XSfLV/d26Uvo+Xjv5WlNObeRZl7dc8fTm1zUU1bW4E=;
	b=eG0HobpLdfMaD/LGEAU3HdWA5JwobGm1o+pWW9JauU3pisx0lO8WsWUzYHbKWm8LLA
	VEypra/hgkCkZKWcj3Kk98GuKvN6wG49AyZT4Vl1ROsgfAQKTwlpoWNCSaslM40CuWrY
	dvEVFhW6/cISYcU884EG1Xw/dOGHjjXqE6x+M=
Received: by 10.101.111.11 with SMTP id o11mr5771458anm.40.1325102156704;
	Wed, 28 Dec 2011 11:55:56 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:55:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:24 +0000
Message-Id: <02a39a63ae188c48fff6436667c28230687ca680.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 03/16] qt4x11.bbclass: add QT_BASE_NAME for use in recipes
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
 meta/classes/qt4x11.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 3f955d4..610397d 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -2,6 +2,7 @@ DEPENDS_prepend = "${@["qt4-x11-free ", ""][(d.getVar('BPN', True)[:12] == 'qt4-
 
 inherit qmake2
 
+QT_BASE_NAME = "qt4"
 QT_DIR_NAME = "qt4"
 QT_LIBINFIX = ""
 
-- 
1.7.2.5



