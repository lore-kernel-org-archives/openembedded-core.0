Return-Path: <prvs=2708173d3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id D341171AE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 08:06:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.37,197,1488841200"; 
   d="scan'208";a="544455"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Apr 2017 10:05:55 +0200
Message-ID: <1492157155-17156-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Cc: dev@g0hl1n.net
Subject: [PATCH] bitbake.conf: add sha256sum to HOSTTOOLS
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
X-List-Received-Date: Fri, 14 Apr 2017 08:06:04 -0000
Content-Type: text/plain

icedtea-native from meta-java needs sha256sum for checksum validation.
Therefore add sha256sum to HOSTTOOLS (as md5sum is already in there).
Without it the icedtea-native build will fail during configuration at
current master.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3937a..227babd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -459,9 +459,9 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
-    sort split stat strings strip tail tar tee test touch tr true uname uniq \
-    wc wget which xargs \
+    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
+    sleep sort split stat strings strip tail tar tee test touch tr true uname \
+    uniq wc wget which xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.1.4


