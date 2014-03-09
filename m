Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 693976AE14
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 10:06:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s29A6b8v005228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Mar 2014 03:06:37 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 9 Mar 2014 03:06:36 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Mar 2014 18:05:52 +0800
Message-ID: <1394359552-24992-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.21]
Subject: [PATCH] kernel-yocto: replace '=' with '+='
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
X-List-Received-Date: Sun, 09 Mar 2014 10:06:39 -0000
Content-Type: text/plain

The dependency to CCACHE_DIR was moved to ccache.bbclass in
commit 2acf8da4f13c175ea818b9514677b7059de1e3e2:
[ ccache: Separate out into its own class ]

then the '=' should be replaced by '+=', otherwise, it will overwrite
the original ${CCACHE_DIR} in dirs.

Signen-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 707a219..53bc6d4 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -236,7 +236,7 @@ do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_patch after do_unpack
 
-do_kernel_configme[dirs] = "${S} ${B}"
+do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 	export KMETA=${KMETA}
-- 
1.7.1


