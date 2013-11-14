Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 27FEE6D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:43:54 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s13so1372140qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=qs04g182PBs5MDlXeo+B34QDUDPaLOqb7RkzxMrFYdU=;
	b=qOeFvIyrlya9RuknAmFdRFRSzpjb3HevrmVO/t9OPmxBA+kzXqlDfYnRc6hMHJslHS
	TUCEVb9McERA3I8k+EoyFIYT8NX1Bpy+h+J4oGCemkp8TA4z4BqXQsMXcnYSAEkGm80K
	IVdoSFo11g1tSgVOvSn68wCoFEyktc7A6nNMRLEAri7ZYqYjhd8A2uhuS3byNYrgvtht
	x5OrwzEvJbpSDHrjo5RGx98H5Kw9kuKrnUcmhLMC74vIoIB9aJ5c+Iy8F/DUv2bnQPLH
	H0DhObodhbKbIBOpB5xjhuufOLja61Nl/KzQOMvaipnzsGAEUb1aaa99mGKP2whHIIQ3
	RV7Q==
X-Received: by 10.229.41.130 with SMTP id o2mr4214803qce.20.1384451035644;
	Thu, 14 Nov 2013 09:43:55 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 4sm894694qak.11.2013.11.14.09.43.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2013 09:43:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 9F0BA1745AB54; Thu, 14 Nov 2013 15:43:51 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 15:43:49 -0200
Message-Id: <1384451029-18116-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lttng-modules: Update to 2.3.3 version
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
X-List-Received-Date: Thu, 14 Nov 2013 17:43:54 -0000

This updates lttng-modules for 2.3.3 and it also fixes the build with
3.12 Linux kernel.

While on that, we also renamed the recipe file to follow the other
lttng recipes which use the version number on it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../lttng/{lttng-modules_git.bb => lttng-modules_2.3.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.3.3.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_git.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index 789b5ec..f293376 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "78c8710bb8e6b7f6301d95afec0305f40fa063ad"
-PV = "2.3.0+git${SRCPV}"
+SRCREV = "eef112db0e63feff6cbf0a98cda9af607cefb377"
+PV = "2.3.3"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.8.4.rc3


