Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8387EA65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 05:35:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D5Yivi021949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 22:34:54 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 12 Aug 2019 22:34:33 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2019 01:33:34 -0400
Message-ID: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: cp Documentation/ to sdk kernel
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
X-List-Received-Date: Tue, 13 Aug 2019 05:35:03 -0000
Content-Type: text/plain

A new patch let kernel source Documentation/Kconfig in top Kconfig
So kernel-devsrc should include Documentation/ too.
Otherwise "make scripts" will fails.

patch:
commit b1663d7e3a7961fc45262fd68a89253f2803036c
Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Tue Jun 4 09:26:27 2019 -0300

    docs: Kbuild/Makefile: allow check for missing docs at build time

    While this doesn't make sense for production Kernels, in order to
    avoid regressions when documents are touched, let's add a
    check target at the make file.

    Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5ec5929..a874e06 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -65,7 +65,7 @@ do_install() {
     )
 
     # then drop all but the needed Makefiles/Kconfig files
-    rm -rf $kerneldir/build/Documentation
+    #rm -rf $kerneldir/build/Documentation
     rm -rf $kerneldir/build/scripts
     rm -rf $kerneldir/build/include
 
-- 
2.8.1


