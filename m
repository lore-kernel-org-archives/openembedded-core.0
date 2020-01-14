Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E89787FBB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so11336526wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ahGm5oI2HilukYtPtoVbfmGVIKLlHF/NEjE/efSzGCk=;
	b=iuXCRZwm4QUOk0aFRkzJypZMdIsl9Il/IzWEZzkNdGeZ1qCf57ODcqIhPahoRpIH3H
	F2WDOy00PfQuAzjDL9HQY+S+C1rlwW/mBrFDjj+SQ0YfWt0JgST+trzLykHE5+KaVN6i
	ZwSf1RicCcJXC3BV8OBENNfMOeC54jW9plxIadVWRuDh2gCZ8zur5EOYaT2z5HUBrxV7
	EwfIwHAZ4yNa3hqfM3moWuwZeBZkRnlRGEbYmiq1K/oFVxxP4DIc/H5kjiXIL0o4oeLa
	UZUsB/kuXuqWRf720CWsW/oEMcYBkQBJT8s1ZdUBxgM1czUbf7nFGgK8wAGCfCtwEn1w
	b+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ahGm5oI2HilukYtPtoVbfmGVIKLlHF/NEjE/efSzGCk=;
	b=dggPl2mfYfPeN4YEohzJGSAjRV+ZHFXHzcPfO9LaFvT0zVAaTBj2NmEVZRl9UIPsoM
	9kUoyvPANSgiMl29lJ+hPLxPmPtBRFeU/GmdanneMU2egm4FjSUZdV1wOMEtEVzBsZgk
	gLF2p0dqLZnvpGAqnHJCoD+pmj8GFJTnw20zdCGlrT/81lI2wy/NeBbc76THOA6qj/EG
	zYC9++f2Qr82XFxHxjMHTubansV7zxkLcKPAJuLKqWUqG1JkcSlRD5pl4vQpSPRdzLwU
	1p87DO1IEUVzb67Sm9V3ht1frmxVeSJG5F6vrcM6LoscVMCFl5fDARsPG+vLW0fq1B59
	dZ0A==
X-Gm-Message-State: APjAAAWdJ5UVNveQSxLNThrxzTCaIQYZVkEZTNgKQQjK7I98US9rf3VH
	VffJDP6J8T1j/7azrIHxVZZyAqOzuxg=
X-Google-Smtp-Source: APXvYqyf6mGFBNvPiBs+E80X4irMYB7FNErE7BlU0E2PDYb+lANMlvzNa1D+cXyC8G5HJvXNmAdMfw==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr24846569wro.194.1578993159521; 
	Tue, 14 Jan 2020 01:12:39 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	q11sm18844913wrp.24.2020.01.14.01.12.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:22 +0100
Message-Id: <eb4b74da5c7986f53a7e419dcfef2d4acf11dcdc.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 3/8] kernel-artifact-names.bbclass: use PR instead of PKGR in KERNEL_ARTIFACT_NAME
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:39 -0000
Content-Transfer-Encoding: 8bit

* otherwise PKGR seen in do_install, do_deploy and do_deploy_links will
  have different value in each of them (PRSERV will return different
  value of EXTENDPRAUTO because TASKHASH is different for each of these
  tasks and also cause unnecessary multiple EXTENDPRAUTO increments for
  each build).

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index 529e0c565e..41ef6e884d 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -6,7 +6,12 @@
 
 inherit image-artifact-names
 
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
+# Intentionally use PR instead of PKGR, because EXTENDPRAUTO included
+# in PKGR will have different value for do_install/do_deploy/do_deploy_links
+# tasks with different TASKHASH, causing multiple EXTENDPRAUTO increments for
+# each kernel build and more importantly preventing do_deploy_links to
+# reference artifacts created do_deploy task
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PR}-${MACHINE}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
-- 
2.20.1


