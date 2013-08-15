Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE116612B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:36:14 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so1068580pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c2L0DTL63CCVw6M9yjVHu86Bz80fh4n4wsM9RCNjdi0=;
	b=znyfhF/q3XjqoVMKLKWqE5yQFrd4gpxCfQA1IbakU333ICSNNktrXm688dbMTvmqvg
	70z8pmSBbCEpF47y6laDqE7rUq7H9AqpSuGI+6reKZhY0FKuwwiOpsqdtCrNp/6igfD4
	jehOQKhBLgzxmFj2XCWILZBIl/Y8XFL1mPntBkvRDv9PM95yteyKJh2hZGvRzFslnUqA
	KzMuAxGb1/w0W1HMkbWer8NVbOSYyoIUtHihVUz28G+vjnDaqeJHVH5bkiLZLiSCOSJx
	5XzB3AerN38C1tx6VNATDTKnG6OnvMU5r15V5ZISvDRZdWzSAxlEwWIF+ugRAEkWvyF9
	XXEA==
X-Received: by 10.66.122.67 with SMTP id lq3mr8277847pab.147.1376588174829;
	Thu, 15 Aug 2013 10:36:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id mz5sm734334pbc.18.2013.08.15.10.36.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 10:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 10:35:27 -0700
Message-Id: <1376588127-7395-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] qemuppc: Change default tune to 74xx
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
X-List-Received-Date: Thu, 15 Aug 2013 17:36:14 -0000

We use mac99 as platform for qemuppc
lets choose a tuning thats appropriate for it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuppc.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 48eecb7..93145a1 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-ppc603e.inc
+require conf/machine/include/tune-ppc7400.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 
-- 
1.8.3.4


