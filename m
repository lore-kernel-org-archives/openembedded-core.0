Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaT05-00065X-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 15:06:33 +0100
Received: by mail-ey0-f175.google.com with SMTP id l1so1585883eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 05:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hqOLPZ7ERuRGTCubQhmL7kcOpuey22HajJbWhNKPt3g=;
	b=ZTrK8ZMmtcb2Kx7i0V29fuLjEZMNvV5yEmwRlZa88rxMdHLaf2om97fWjG70ZdYhyk
	cUawLWTUL1xJDPbGhB1H8Pm/ev7n4tf7r+2NVRtpNqsuRdCmh95AHrjjZQ5QDpZi6ojG
	OXmWveWUppwByrPtPNwPLtClkFp0oxqVLhng0=
Received: by 10.14.18.83 with SMTP id k59mr4321667eek.105.1323784779950;
	Tue, 13 Dec 2011 05:59:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm89352495eeh.5.2011.12.13.05.59.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 05:59:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 14:59:15 +0100
Message-Id: <ebac301a84eeb403360b8fc268aaab4e94be126b.1323784347.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <f62734520b4996df6a49cc7be7d60e2af934447e.1323784347.git.Martin.Jansa@gmail.com>
References: <f62734520b4996df6a49cc7be7d60e2af934447e.1323784347.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323784347.git.Martin.Jansa@gmail.com>
References: <cover.1323784347.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 3/3] python: bump PR due to arm OVERRIDES change
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
X-List-Received-Date: Tue, 13 Dec 2011 14:06:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5417d5e..5e8e0d7 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-- 
1.7.8



