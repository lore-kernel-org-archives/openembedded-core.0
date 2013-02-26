Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAFfR-0006dz-Ll
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:13:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q7vLOg006546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 23:57:21 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 23:57:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:57:15 +0800
Message-ID: <3ab43dec0c6066c0005e8a0c9d4fdef74c061c1c.1361864565.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361864565.git.hongxu.jia@windriver.com>
References: <cover.1361864565.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sstate-cache-management.sh: fix remove duplicate failed when multiple archs
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
X-List-Received-Date: Tue, 26 Feb 2013 08:13:46 -0000
Content-Type: text/plain

The implementation of `--remove-duplicated' has been modified by the commit:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=0740f82aea92da0195524e37c372f9981e7f5e6d

In above commit, sstate cache files with multiple archs are not considered
duplicate and don't need to be removed as duplicated any more.

Update the description of `--remove-duplicated' in usage to keep consistent
with implementation.

[YOCTO #3635]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/sstate-cache-management.sh |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 7d81daf..2d4a2a3 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -47,7 +47,9 @@ Options:
 
   -d, --remove-duplicated
         Remove the duplicated sstate cache files of one package, only
-        the newest one will be kept.
+        the newest one will be kept. The duplicated sstate cache files
+        of one package must have the same arch, which means sstate cache
+        files with multiple archs are not considered duplicate.
 
         Conflicts with --stamps-dir.
 
-- 
1.7.10.4



