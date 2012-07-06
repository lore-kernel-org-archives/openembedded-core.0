Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iyadkq@gmail.com>) id 1SnHig-0005r6-2q
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 01:13:50 +0200
Received: by pbbrq2 with SMTP id rq2so14651295pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 16:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pimr0e9ZqDgak7s7Y8JY3KxLSc67LwReIZQbdcHQIlI=;
	b=uw48eKHXwRKIVWUGYLfZtLeRUNfIfHWJiT8K2wuVyS2Ue2LgEhcwEAPOvKcPg4AcFt
	6Yc0kxD3pLYrhvQ0rReFUzxkZkQ5cwYojqhhqr55mWPK710VP7PPJ1feD5hDk0gdgN/B
	LiIYAwjgeLu/KIklMIiBULD5UNcPB93QhDVkkIWcYL7jkFXhu+6VxOBIyWk/0PA/+S3O
	IqvLisy22ESwtFIXyj5T1gt200AK61iH+kqdgzYaIR8CTq+8W1dZhX3adDc4NYzu3I52
	uCHNd4E7zHfToMoioxDbZDAlmOevA3ftwGYNxhyrwvFmoDzlxNPL8ZDIL2BfMUHzUaAu
	HPiA==
Received: by 10.68.135.201 with SMTP id pu9mr40575120pbb.146.1341615763354;
	Fri, 06 Jul 2012 16:02:43 -0700 (PDT)
Received: from localhost.localdomain (palm-64-28-152-131.palm.com.
	[64.28.152.131])
	by mx.google.com with ESMTPS id nj4sm8754559pbc.5.2012.07.06.16.02.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 16:02:42 -0700 (PDT)
From: Iyad Qumei <iyadkq@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2012 16:02:30 -0700
Message-Id: <1341615750-25579-1-git-send-email-iyadkq@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATH] fix build failure due to lic_files_chksum mismatch. The correction unpacks the source in the correct directory.
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
X-List-Received-Date: Fri, 06 Jul 2012 23:13:50 -0000

Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
---
 meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
index 3aea874..ad80ef6 100644
--- a/meta/recipes-core/netbase/netbase_5.0.bb
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d
 
@@ -17,6 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://interfaces \
            file://nfsroot"
 
+S = "${WORKDIR}/${P}"
+
 SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
 SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
 
-- 
1.7.4.1



