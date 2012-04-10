Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHUPz-0007xi-DH
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 08:19:07 +0200
Received: by wibhj13 with SMTP id hj13so2714837wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 23:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7tWoHDAmvCqjKlk37zXRATiy/pD1dDp+rMf0bFe/xXc=;
	b=k0+hZU1o+rE0QoXgNw6nhWrwZ9TyIAOlTYiIecJjeDJHqs9si7ZaHr7j3Zy+ZoXueK
	iQSAI24Jvzj/EKh0aTAE4X4bpcv1Hq0yORvN50keEssg1O0ugBTZziEJQSCkFsxi435F
	qxNzIupmdTDU2n4dcY9EB+MlGlP8xDAE56rjaMi/MgsqroyRlQGSevrkI+yNcmerdZUc
	MjmMBYbgNg10JFMWetAsPx1A8rHQb25duoIyamjESpMYbLIxinnOwS0N8xa/9H40SfVD
	ce8I+SqXiD/ewXR9AwjcXnRhtOJ9I/knRcTgVVXUc5hN8/Jrrz8jIXtiLwQYqUuDFlLW
	D2zA==
Received: by 10.216.145.209 with SMTP id p59mr5642711wej.50.1334038189859;
	Mon, 09 Apr 2012 23:09:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm57595731wiy.3.2012.04.09.23.09.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 23:09:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 08:09:42 +0200
Message-Id: <1334038182-834-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <4F7C8B6A.1000008@opendreambox.org>
References: <4F7C8B6A.1000008@opendreambox.org>
Subject: [PATCH] gdb: add --with-libexpat-prefix
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
X-List-Received-Date: Tue, 10 Apr 2012 06:19:07 -0000

* otherwise it sometimes finds host's expat

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index a8fca6f..4f7ea4b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -36,7 +36,7 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
 
 EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
 
-EXPAT = "--with-expat"
+EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-- 
1.7.8.5



