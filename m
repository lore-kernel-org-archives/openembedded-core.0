Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRULr-0004gL-NG
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 22:16:12 +0200
Received: by werb13 with SMTP id b13so1045621wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hV9DAHjQp7AbMUoKp4bxG+FDTJfd19kEjAS3XcIKW9w=;
	b=Ff4qFfY0Sf+5xCouxqGGwAO+E1sG/qct9qkwrOlm8cSKB1FDNc8keEZTPtU1zKUrhA
	ySqurkTmiBDfO2RRYh3X7UYAJYivEG9/wU4px/B0/wvYEblNdTCtDMR+H+PxWdaZ5oJh
	Bqp/Ll1CSybS+E14tFw294OJe/iQnEovM5/2Q0q5xkue5xl3oqTDNZE43ZWOZlBlpPCu
	tMeT8WXqyDZs7tMoz42KpA7eDTn1H0vgwDRqFXAG7F8TBZkqiYXjPByA0o4BWR+P815G
	zA2dRhE0O3bgQk0fpiiJoJX5tumNKoBJOz1STGY9Lq8wPGbqxd47kZey0ExszJUe9ajK
	T+Bw==
Received: by 10.180.102.3 with SMTP id fk3mr38398190wib.9.1336421180582;
	Mon, 07 May 2012 13:06:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm23967752wia.11.2012.05.07.13.06.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:06:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 22:06:00 +0200
Message-Id: <22fde0c2910b75c83b50cc486741adf75b975653.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] dbus-glib: bump PR to rebuild after glib upgrade
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
X-List-Received-Date: Mon, 07 May 2012 20:16:12 -0000

* some apps had issues in runtime when dbus-glib wasn't rebuilt and
  reinstalled after glib upgrade, see:
  http://www.shr-project.org/trac/ticket/1980

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.98.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.98.bb b/meta/recipes-core/dbus/dbus-glib_0.98.bb
index bd9389a..e2c6a0c 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.98.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.98.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3f7f117dc7c8d899d9acfdcbf9253fb8"
 SRC_URI[sha256sum] = "297c81d6bb8b1c312e9b0ccfe91eb28ec0672756abb64dfb7bbe2b5f1ae5d111"
-- 
1.7.8.6



