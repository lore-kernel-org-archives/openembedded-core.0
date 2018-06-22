Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDA0974DF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 19:23:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5MJMrxn031917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 12:23:50 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 22 Jun 2018 12:23:16 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2018 12:23:16 -0700
Message-ID: <20180622192316.235356-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] mdadm: fix format-overflow
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
X-List-Received-Date: Fri, 22 Jun 2018 19:24:00 -0000
Content-Type: text/plain

nb[] is not quite big enough.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0002-mdadm-Specify-enough-length-when-write-to-buffer.patch     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
index cbce053..6bbe8f4 100644
--- a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
+++ b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
@@ -24,6 +24,10 @@ Change the length to 47.
 
 Signed-off-by: Xiao Ni <xni@redhat.com>
 Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
+
+nb[] actually needs to be at least 12, but we will make it 16.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
 Upstream-Status: Backport
  Detail.c | 2 +-
@@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644
  		mdp_disk_t *dp;
  		char *dv;
 -		char nb[5];
-+		char nb[11];
++		char nb[16];
  		int wonly, failfast;
  		if (d>=0) dp = &sb->disks[d];
  		else dp = &sb->this_disk;
-- 
2.7.4


