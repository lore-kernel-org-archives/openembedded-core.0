Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6GQ-00071o-JW
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:37:46 +0100
Received: by mail-iy0-f175.google.com with SMTP id j38so4678110iad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WK8l5/RSXAbtqNokSiC/IY0mAb7cMQCCbCa99B4r93A=;
	b=MCt+3JvWO/crW0y/P9HNKMU5opP+5PSEw9WpT/F6ZC6rZZKnIpOTVEIb15I6a3hd/e
	gUUI/xwAmqnPUKxq+1Qbr9dlYLDbz5p7v7e54VCebndtkFHsOI2DqhxArrw2nQNNYf03
	SDcsrr7AI80CsF7V9Mnv5iWpKciLJPzoWXtEM=
Received: by 10.50.77.137 with SMTP id s9mr4495997igw.66.1323459057219;
	Fri, 09 Dec 2011 11:30:57 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id wo4sm19305554igc.5.2011.12.09.11.30.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 11:30:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 11:30:46 -0800
Message-Id: <2453a9733dd3e5f8dcde2d5a669815a7a478473f.1323458858.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <66bfa997b04bc6dc4c77c5e87f38c86ac3f30d0a.1323458858.git.raj.khem@gmail.com>
References: <66bfa997b04bc6dc4c77c5e87f38c86ac3f30d0a.1323458858.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323458858.git.raj.khem@gmail.com>
References: <cover.1323458858.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] task-core-nfs: Add nfs-utils-client to RDEPENDS
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
X-List-Received-Date: Fri, 09 Dec 2011 19:37:46 -0000

include nfs client in tast-core-nfs as well
this is handy when we need it on target e.g.
testing eglibc needs it and we can just do
EXTRA_IMAGE_FEATURES += "nfs-server"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-nfs.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/tasks/task-core-nfs.bb
index 5859fad..5c7f455 100644
--- a/meta/recipes-core/tasks/task-core-nfs.bb
+++ b/meta/recipes-core/tasks/task-core-nfs.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "NFS tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 PACKAGES = "\
     task-core-nfs-server \
@@ -17,7 +17,9 @@ PACKAGES = "\
 ALLOW_EMPTY = "1"
 
 RDEPENDS_task-core-nfs-server = "\
-    nfs-utils"
+    nfs-utils \
+    nfs-utils-client \
+    "
 
 # rpcinfo can be useful but only with glibc images
 GLIBC_DEPENDENCIES = "glibc-utils"
-- 
1.7.5.4



