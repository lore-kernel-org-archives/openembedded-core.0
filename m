Return-Path: <frazer.clews@codethink.co.uk>
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
	by mail.openembedded.org (Postfix) with ESMTP id BF6BA7F9B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 17:14:58 +0000 (UTC)
Received: from [167.98.27.226] (helo=frazerclews.office.codethink.co.uk)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1iP8bb-0005aD-CS; Mon, 28 Oct 2019 17:14:59 +0000
From: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 17:14:48 +0000
Message-Id: <20191028171449.8489-2-frazer.clews@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
References: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
MIME-Version: 1.0
Cc: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
Subject: [PATCH 1/2] fix format strings in makedevs.c in print statements
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
X-List-Received-Date: Mon, 28 Oct 2019 17:14:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index cba7681414..01e564afee 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -230,7 +230,7 @@ static void add_new_directory(char *name, char *path,
 		unsigned long uid, unsigned long gid, unsigned long mode)
 {
 	if (trace)
-		fprintf(stderr, "Directory: %s %s  UID: %ld  GID %ld  MODE: %04lo", path, name, uid, gid, mode);
+		fprintf(stderr, "Directory: %s %s  UID: %lu  GID %lu  MODE: %04lo", path, name, uid, gid, mode);
 
 	if (mkdir(path, mode) < 0) {
 		if (EEXIST == errno) {
@@ -251,7 +251,7 @@ static void add_new_device(char *name, char *path, unsigned long uid,
 	struct stat sb;
 
 	if (trace) {
-		fprintf(stderr, "Device: %s %s  UID: %ld  GID: %ld  MODE: %04lo  MAJOR: %d  MINOR: %d",
+		fprintf(stderr, "Device: %s %s  UID: %lu  GID: %lu  MODE: %04lo  MAJOR: %d  MINOR: %d",
 				path, name, uid, gid, mode, (short)(rdev >> 8), (short)(rdev & 0xff));
 	}
 
@@ -292,7 +292,7 @@ static void add_new_file(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
 	if (trace) {
-		fprintf(stderr, "File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
+		fprintf(stderr, "File: %s %s  UID: %lu  GID: %lu  MODE: %04lo\n",
 			path, name, gid, uid, mode);
 	}
 
@@ -311,7 +311,7 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
 	if (trace) {
-		printf("Fifo: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
+		printf("Fifo: %s %s  UID: %lu  GID: %lu  MODE: %04lo\n",
 			path, name, gid, uid, mode);
 	}
 
-- 
2.20.1


