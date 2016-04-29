Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 81CCF770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 17:46:08 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g17so48012038wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ER7xvoUi+zKMvtucV1CSgUZNa6kbqtINcpo3al0uDKo=;
	b=Q4deHwvcPUOIQGz6t1HAQQk5B2eNLIADRDMC/jeMfhsCWxtlAx+aZXWcK52hbJh6PG
	qlRP7Wg4Wf1qlwXwmR8WitQabAvCpz3XdfCf9X2WpzngRccVYkl5fPctAShHDdKCPGVi
	lNklCmx+6qgANTXPaTFXMbn8ihPH8n5iyL6WJ+dOQO2NF0g3U0gz/jvpUT8xlw9Zcvba
	AzlrjHjGxxtgNRNYbxmaJDwBtgVRlPVqd04xOmfGrHYIIQCbwKkctwTWc8IOz8dIYGyc
	3dxZxJm3FTmk05bQxbf/BlWmLe95rdsRgtWdQohlnlDeVLUmCu1f8haeiIsGPHuHqDsj
	GY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ER7xvoUi+zKMvtucV1CSgUZNa6kbqtINcpo3al0uDKo=;
	b=EnPzJUEfFi7rCHj+3vE87w9ZPNvag8vFf+ZDJ69PYAWuY6VsjP8PKF5lxnvUZ9Pc4f
	jnqcz0ADuhOROiVBib+MZv9Xbg5eZmeqFVcd/9gt8un38HPoQCqwwrXg2CTVT5e5PtTY
	jzZXleTl+pCpb+dRpmCoxtxlsNrgsx++i/NYUwk6CD60SP4xEE10fuOQfFpUG7gyz1lX
	tzPdUVvy78+G8N0zbVx57CX+6c8TTwMo0NxP/y2S7bU894RXckDaeyJlY1j2HHNH2BQq
	YxKExtNKD0zqLj/WTfYpGLL/pkT5pZoE9cqQiLT4yMEPqH2QquIojspCJZXOp58lmyu8
	2zdA==
X-Gm-Message-State: AOPr4FXUtpqw/WLUtWIW78yRyOCW9shPCBs0jfR9bJk3y5hxvvWXrL0LNzf66dSX9Ktz5g==
X-Received: by 10.194.115.39 with SMTP id jl7mr841563wjb.81.1461951968325;
	Fri, 29 Apr 2016 10:46:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g132sm4392484wme.0.2016.04.29.10.46.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Apr 2016 10:46:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 19:46:10 +0200
Message-Id: <1461951970-1225-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461951970-1225-1-git-send-email-Martin.Jansa@gmail.com>
References: <1461951970-1225-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] core-image-{minimal, testmaster}-initramfs: set COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 29 Apr 2016 17:46:09 -0000

* use the same COMPATIBLE_HOST restriction as initramfs-live-install(-testfs)
  to resolve ugly error when trying to build them e.g. for ARM:

  ERROR: Nothing RPROVIDES 'initramfs-live-install-testfs' (but /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/images/core-image-testmaster-initramfs.bb RDEPENDS on or otherwise requires it)
  ERROR: initramfs-live-install-testfs was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  NOTE: Runtime target 'initramfs-live-install-testfs' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['initramfs-live-install-testfs']
  ERROR: Required build target 'core-image-testmaster-initramfs' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-testmaster-initramfs', 'initramfs-live-install-testfs']

  ERROR: Nothing RPROVIDES 'initramfs-live-install' (but /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb RDEPENDS on or otherwise requires it)
  ERROR: initramfs-live-install was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  NOTE: Runtime target 'initramfs-live-install' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['initramfs-live-install']
  ERROR: Required build target 'core-image-minimal-initramfs' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-minimal-initramfs', 'initramfs-live-install']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 3 +++
 meta/recipes-extended/images/core-image-testmaster-initramfs.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 8d7c0d2..5794a25 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -20,3 +20,6 @@ IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 BAD_RECOMMENDATIONS += "busybox-syslog"
+
+# Use the same restriction as initramfs-live-install
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
index ad1407c..09a6d16 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -18,3 +18,6 @@ inherit core-image
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 BAD_RECOMMENDATIONS += "busybox-syslog"
+
+# Use the same restriction as initramfs-live-install-testfs
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-- 
2.8.1


