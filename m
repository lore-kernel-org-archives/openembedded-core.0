Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rwyci-0000DD-67
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 17:19:28 +0100
Received: by eaal10 with SMTP id l10so1522590eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 08:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vbcsTOd+6HZbIKd3F79cEFXCWsFGkH00OdaT/O2sblA=;
	b=uOF906r3exGyDz+rcziUv3v7fPj7vcU7BpIsIdL7GSdfWuNeVbo1XhTOO0ezYzBME+
	1VrwAobKjmnfY+zgr/nR5a63jvTEXAP5dpXJgIBpKOPDk66BHdnwJjhYuL+PFG3wf+Yi
	JyimZCRHnlUKfS3KeW4f8e0I8fxzX6HdD2ZZo=
Received: by 10.213.2.74 with SMTP id 10mr2815662ebi.11.1329149478765;
	Mon, 13 Feb 2012 08:11:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm62510633eei.0.2012.02.13.08.11.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 08:11:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2012 17:11:10 +0100
Message-Id: <1329149470-14511-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
References: <b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
Subject: [PATCH] gdb-cross-canadian: bump PR
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
X-List-Received-Date: Mon, 13 Feb 2012 16:19:28 -0000

* incremented twice, because meta-oe had .bbappend with PRINC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index a4714e7..dbcffde 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.8.4



