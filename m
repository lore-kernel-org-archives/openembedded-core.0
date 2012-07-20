Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsGvW-0004Di-6h
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 19:23:42 +0200
Received: by yhjj56 with SMTP id j56so3914828yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=pNxOgfrNP/EiIYhNvXF18fcAfwnqWYnoP7dFobviqXs=;
	b=Lwn/td64CVsu43MMQc5IZyRtLKImmwsAC37PBdbAFRkRW8b1/Aw4BkNMTlM8sQqMpo
	9QEZ3k54nbewSV0GoURVodGb5g/RhHD14QBcYYK9ol+F2W+IV5MFkXJPpknfaVyedSRC
	8zQest/35oXgcbIYvkpFJ0ImF7l4Zi0d32UbZbjsV+StscHViTNK5sawrokSNeZMFeKb
	YZUVSCnYpMwKyZS2nNCssS4Obz3CtDXImiTzA5vFG74conWsKLcIz12I98WlyWqE9rsn
	KjTFpQ38RC9TjWxMRM8GpgS0J2sehQjsGZZ6XX+0gUFvSJN+7EEgDycCc8tR/hHgBxCn
	nZhw==
Received: by 10.236.173.34 with SMTP id u22mr6291525yhl.100.1342804338342;
	Fri, 20 Jul 2012 10:12:18 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u23sm10411397yhl.21.2012.07.20.10.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 10:12:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 14:12:08 -0300
Message-Id: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] bash: enable parallel build
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
X-List-Received-Date: Fri, 20 Jul 2012 17:23:42 -0000

I've build it several times in a 8 core machine without problem so it
seems safe to use parallel build now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/bash/bash.inc    |    2 --
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ff9b0ce..6d7e930 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,8 +9,6 @@ DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext update-alternatives
 
-PARALLEL_MAKE = ""
-
 bindir = "/bin"
 sbindir = "/sbin"
 
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index e96709a..a28279e 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.2.5



