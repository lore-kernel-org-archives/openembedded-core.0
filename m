Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziR-0007ai-K9
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:11 +0100
Received: by ggnh1 with SMTP id h1so8399593ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=u+/Les+yzNGELBpGglSKO9q9XnEJpbm+pjfqe60sY6c=;
	b=cnQkRkoEHsHQV/7eNCnoCruTTCdeTDaptyqgZiCjO9x3Mpolfx3u9SihGMnRqUPsI/
	duHvhukaoEYngP5b6QlQIZhgRYZmQbkGAcDmHUazxY0LS57K/AbdhJnynjU0i5IfwNyW
	MvL1tSZ+GJbiPO9HpcSFvVwwcu9/IEpjyRx7M=
Received: by 10.236.175.39 with SMTP id y27mr33334053yhl.86.1325102154452;
	Wed, 28 Dec 2011 11:55:54 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:55:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:23 +0000
Message-Id: <e67061df15176dac6bd4d08b3b2352e60c26179a.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 02/16] qt4e.bbclass: add QT_BASE_NAME for use in recipes
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



