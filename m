Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitFy-00087E-Ti
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:47 +0100
Received: by ghrr17 with SMTP id r17so368633ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=u+/Les+yzNGELBpGglSKO9q9XnEJpbm+pjfqe60sY6c=;
	b=DNkOV43kfdnApyvLJiDTPm0RlbjAeHJJ8cq39DrRt8UFsD8BCknSsrrvNNIVJvoD7n
	Pyz2lekv3s8XqsJrkhVWETPX8wxQfyM9XFlRXHqVeTkpiMeunnZdXwGCGPy7QZZKCSEc
	GznU83FWALPFanyKGUd9UAwAIhCJJoYNmzu6M=
Received: by 10.101.74.1 with SMTP id b1mr1595978anl.43.1325792303601;
	Thu, 05 Jan 2012 11:38:23 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:52 +0000
Message-Id: <1864e75d7f5da42f6b6d3e74e0278fc5975e098b.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 02/10] qt4e.bbclass: add QT_BASE_NAME for use in recipes
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/qt4e.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index d955aca..f3d5caa 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -2,6 +2,7 @@ DEPENDS_prepend = "${@["qt4-embedded ", ""][(d.getVar('PN', 1)[:12] == 'qt4-embe
 
 inherit qmake2
 
+QT_BASE_NAME = "qt4-embedded"
 QT_DIR_NAME = "qtopia"
 QT_LIBINFIX = "E"
 # override variables set by qmake-base to compile Qt/Embedded apps
-- 
1.7.2.5



