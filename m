Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitG0-00086v-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:48 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so373860yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2XSfLV/d26Uvo+Xjv5WlNObeRZl7dc8fTm1zUU1bW4E=;
	b=Da4YpRrzg0lu8thisJSujg2fxtUrrecO3ODrBtl5mHj8noiF5ilEfblaLrbBclvcX7
	hdJkUINnknaIgoFxGNWStjRNKsOcp8Q14Gus2qE3mchs+NbnMQoEbRvO6rLNfG+hUZk1
	U4yaY9yofFHtBbagBS/9430nT2vZGD93kM1d0=
Received: by 10.236.128.242 with SMTP id f78mr3772123yhi.7.1325792306976;
	Thu, 05 Jan 2012 11:38:26 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:53 +0000
Message-Id: <aafc744ac210e8bd2da575a8b6d7e9e87093837e.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 03/10] qt4x11.bbclass: add QT_BASE_NAME for use in recipes
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:48 -0000

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



