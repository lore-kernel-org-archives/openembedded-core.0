Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1906DA96
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:23 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so106206eak.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/QFJeCd7iKhkChPcsPAc/Y8QslNqdIFF/IjaZNn+kuY=;
	b=fBpVbFCS8pXNQtlISkDc1kp4gbkv217AO4UgCFeZi9njQJs5ud+d92WVtdNp1TpKk8
	cBllFUJDkXvVkmtyzaABXb6lpqjVON4DdjaGseognhqA6GFL5lZkQCNenwSLP+QvQKFl
	17DlwjIv/2o7z3fS6pxvf5WnKDIPAinjFP2YuNFBz1P/wG/64xqr4BEtFYEOYMt2jllx
	ReVQbPCIPzUgdI4UoMeNA9fAbvP8RxOYNgwy4TEQa6ls1vRCnuzIZxhGYRjLkK1kHHnY
	ciCCmdYG+BQWbiov+OiZwUfyZOTGOreOYvBSuK7NKNpogdCus0rWn+nHVNbF0qEfcWNL
	t89g==
X-Received: by 10.14.212.72 with SMTP id x48mr4547131eeo.0.1384696344827;
	Sun, 17 Nov 2013 05:52:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm27431154eeo.19.2013.11.17.05.52.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:15 +0100
Message-Id: <1384696338-5390-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/7] linux-firmware: Drop allarch
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:24 -0000

* the recipe itself is allarch, but update-alternatives adds dependency on
  virtual/${MLPREFIX}update-alternatives which can be TUNE_PKGARCH opkg
  causing linux-firmware signature to be different for different TUNE_PKGARCHs
  Hash for dependent task opkg_svn.bb.do_populate_sysroot changed from 8d215059308161841a84542dd1dcbf3a to 80b280c741c392cf5b30dd67b61dd56e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index e3a099a..ebb9c81 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -32,7 +32,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
 
 S = "${WORKDIR}/git"
 
-inherit allarch update-alternatives
+inherit update-alternatives
 
 do_compile() {
 	:
-- 
1.8.4.3


