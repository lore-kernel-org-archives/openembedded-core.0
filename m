Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7844D6A49C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 2C29B13A87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DVPuuARqgai5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 6347012053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 4C10D81D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 3E987371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3CDEB3405E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4TEuG5w028547
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4TEuGHa028546
	for openembedded-core@lists.openembedded.org;
	Wed, 29 May 2013 16:56:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 16:55:59 +0200
Message-Id: <01657da2304a7f29db858fd13dbee2aa457fdc0e.1369839249.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
Subject: [PATCH 3/4] makedevs: Make the mode number readable in debug messages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2013 14:56:17 -0000

---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index d58e891..4cfb1d5 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -108,7 +108,7 @@ static void add_new_directory(char *name, char *path,
 {
 	mkdir(path, mode);
 	chown(path, uid, gid);
-//	printf("Directory: %s %s  UID: %ld  GID %ld  MODE: %ld\n", path, name, uid, gid, mode);
+//	printf("Directory: %s %s  UID: %ld  GID %ld  MODE: %04lo\n", path, name, uid, gid, mode);
 }
 
 static void add_new_device(char *name, char *path, unsigned long uid, 
@@ -132,7 +132,7 @@ static void add_new_device(char *name, char *path, unsigned long uid,
 
 	mknod(path, mode, rdev);
 	chown(path, uid, gid);
-//	printf("Device: %s %s  UID: %ld  GID: %ld  MODE: %ld  MAJOR: %d  MINOR: %d\n",
+//	printf("Device: %s %s  UID: %ld  GID: %ld  MODE: %04lo  MAJOR: %d  MINOR: %d\n",
 //			path, name, uid, gid, mode, (short)(rdev >> 8), (short)(rdev & 0xff));
 }
 
@@ -147,7 +147,7 @@ static void add_new_file(char *name, char *path, unsigned long uid,
 	} 
 	chmod(path, mode);
 	chown(path, uid, gid);
-//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %ld\n",
+//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
 //			path, name, gid, uid, mode);
 }
 
@@ -158,7 +158,7 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 	if (mknod(path, mode, 0))
 		error_msg_and_die("%s: file can not be created with mknod!", path);
 	chown(path, uid, gid);
-//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %ld\n",
+//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
 //			path, name, gid, uid, mode);
 }
 
-- 
1.8.2.1


