Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAFfT-0006e6-Ki
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:13:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q7vPxn006549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 23:57:25 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 23:57:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:57:17 +0800
Message-ID: <5649132673d6d4d2add07aa92beec536e35edcaa.1361864565.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361864565.git.hongxu.jia@windriver.com>
References: <cover.1361864565.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sstate-cache-management.sh:fix the incorrect usage of option `-d'
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
X-List-Received-Date: Tue, 26 Feb 2013 08:13:52 -0000
Content-Type: text/plain

The description of option `-d' is not correct in useage. It is used to
remove duplicate and debug at the same time. Use option `-D' to control
debug info output and the option `-d' to flag remove duplicate.

[YOCTO #3635]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/sstate-cache-management.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 90e6764..24384ef 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -72,7 +72,7 @@ Options:
   -v, --verbose
         explain what is being done
 
-  -d, --debug
+  -D, --debug
         show debug info, repeat for more debug info
 
 EOF
@@ -393,7 +393,7 @@ while [ -n "$1" ]; do
       verbose="-v"
       shift
         ;;
-    --debug)
+    --debug|-D)
       debug=`expr $debug + 1`
       echo "Debug level $debug"
       shift
-- 
1.7.10.4



