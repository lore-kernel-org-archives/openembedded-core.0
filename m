Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGz4-0000yZ-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9Lhaa024720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:43 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:37 +0800
Message-ID: <04ccee436225f0a27f74cb9e7cb7b94b3796c965.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 4/7] mkdebugfs.sh: convert the tab to 4 spaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 09:38:08 -0000
Content-Type: text/plain

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/mkdebugfs.sh               | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
index 5dfa380..41a13cb 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
@@ -6,44 +6,44 @@ DEBUGFS="debugfs/debugfs"
 yes | mkfs.ext4 test.img
 
 {
-	CWD="/"
-	find $SRCDIR | while read FILE; do
-		#TGT=${FILE#$SRCDIR}
-		TGT=$(basename "${FILE#$SRCDIR}")
-		DIR=$(dirname "${FILE#$SRCDIR}")
+    CWD="/"
+    find $SRCDIR | while read FILE; do
+        #TGT=${FILE#$SRCDIR}
+        TGT=$(basename "${FILE#$SRCDIR}")
+        DIR=$(dirname "${FILE#$SRCDIR}")
 
-		# Skip the root dir
-		if [ -z "$TGT" ]; then
-			continue
-		fi
+        # Skip the root dir
+        if [ -z "$TGT" ]; then
+            continue
+        fi
 
-		if [ "$DIR" != "$CWD" ]; then
-			echo "cd $DIR"
-			CWD="$DIR"
-		fi
+        if [ "$DIR" != "$CWD" ]; then
+            echo "cd $DIR"
+            CWD="$DIR"
+        fi
 
-		case $(stat -c "%F" $FILE) in
-		"directory")
-			echo "mkdir $TGT"
-			;;
-		"regular file")
-			echo "write $FILE $TGT"
-			;;
-		"symbolic link")
-			LINK_TGT=$(ls -l $FILE | sed -e 's/.*-> //')
-			echo "symlink $TGT $LINK_TGT"
-			;;
-		"block special file")
-			DEVNO=$(stat -c "%t %T" $FILE)
-			echo "mknod $TGT b $DEVNO"
-			;;
-		"character special file")
-			DEVNO=$(stat -c "%t %T" $FILE)
-			echo "mknod $TGT c $DEVNO"
-			;;
-		*)
-			echo "Unknown file $FILE" 1>&2
-			;;
-		esac
-	done
+        case $(stat -c "%F" $FILE) in
+        "directory")
+            echo "mkdir $TGT"
+            ;;
+        "regular file")
+            echo "write $FILE $TGT"
+            ;;
+        "symbolic link")
+            LINK_TGT=$(ls -l $FILE | sed -e 's/.*-> //')
+            echo "symlink $TGT $LINK_TGT"
+            ;;
+        "block special file")
+            DEVNO=$(stat -c "%t %T" $FILE)
+            echo "mknod $TGT b $DEVNO"
+            ;;
+        "character special file")
+            DEVNO=$(stat -c "%t %T" $FILE)
+            echo "mknod $TGT c $DEVNO"
+            ;;
+        *)
+            echo "Unknown file $FILE" 1>&2
+            ;;
+        esac
+    done
 } | $DEBUGFS -w -f /dev/stdin $DEVICE
-- 
1.7.11.2



