Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4CxH-0006ve-U5
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:30:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so707788fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SrrwJICNLWoPh/HMQxPgzG7VtYW+XMxuLQBMKp7HtyQ=;
	b=vRrZiWtFlgkS79BFRFbF6CN73PF0DoKs4dMqD5g/kXNX3LCXmQQklc3xVYpsowGvYC
	YcINxufxEjaQCvdNMorgbV5tE3gmgRrV69lUA4up+IcPDZK1VrjyWMa7xMycLKq55T/w
	l5wM2tVvPfZxTrny192vOir3SbeHoAs7qGNHQ=
Received: by 10.223.42.6 with SMTP id q6mr579598fae.140.1316096710394;
	Thu, 15 Sep 2011 07:25:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l20sm7198601fad.12.2011.09.15.07.25.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:25:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:28 +0200
Message-Id: <125eb103194de5788920df13ccbc8004c54fb217.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
References: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] claws-mail: be carefull with # comments ending with backslash
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
X-List-Received-Date: Thu, 15 Sep 2011 14:30:20 -0000

* next line after #foo \ is not parsed correctly!
* but http://bugzilla.pokylinux.org/show_bug.cgi?id=813 says NOTABUG, so
  be *very carefull*

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-sato/claws-mail/claws-mail.inc         |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc b/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
index 04401df..b9fa4d9 100644
--- a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
+++ b/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
@@ -22,7 +22,6 @@ FILES_${PN} = "${bindir} ${datadir}/pixmaps ${datadir}/applications"
 EXTRA_OECONF = "--disable-aspell-test 		\
 		--disable-aspell 		\
 		--disable-manual		\
-#  		--disable-openssl 		\
 		--disable-crash-dialog		\
 		--disable-jpilot		\
 		--disable-trayicon-plugin	\
@@ -33,12 +32,14 @@ EXTRA_OECONF = "--disable-aspell-test 		\
 		--disable-pgpinline-plugin	\
   		--disable-dillo-viewer-plugin	\
 		--disable-clamav-plugin		\
-#		--disable-libetpan		\
 		--disable-gnomeprint		\
 		--disable-valgrind		\
     --disable-static    \
 		"
 
+#  		--disable-openssl 		\
+#		--disable-libetpan		\
+
 CFLAGS += "-D_GNU_SOURCE"
 
 inherit autotools pkgconfig gettext
-- 
1.7.6.1



