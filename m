Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1CB7F333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:01:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so7468271wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 23:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r/xXzXVM91TBKvLh4/bgq1GvosMkUlq7EDuKHJDny7c=;
	b=fth3Q0bU2Av/KQd0ZxDbsh/Twl5YpeAvxZr7mlfBm3auYvm5QOT66D5JMSWqOe36gZ
	rJTgh6wczjNFvcxOmwV1pYtA6Yeb19sIkUR9WM+kGMpIgcIjFt+NfPf/jXHZH+qWuoWo
	cNGmIhmkpcO/J+1lj4yxvMrrz6GwKmote6lBYTV8TQbx9inW/WCQ3jtgrc36rj6jgl6m
	RxNCJ800tmqRDuwMlK7nlmRdxsjzaliIWH2v5ZELfsllpxF+mDavAr6FfgFIpDCewJnc
	5drxyp0AWd7HT6JdIy1/2Q2phb6uq5Fl9apW1lR91EHjuv4N6+I4w7DYscJQqog1JTi5
	PxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r/xXzXVM91TBKvLh4/bgq1GvosMkUlq7EDuKHJDny7c=;
	b=AgCdtgJkhPeBkPzG1gvsOB99pIzDvQ0cAKD5rqNqsF24xosTEGRUMcImJqo9adIAvs
	NfCNUe7tST6aL6NdBkgxoVKCBr080TWWUBtfbnPVfYmmSVqSHERqCUBhwSsb8AWkRHwh
	18t2gECtSuVakvfSEN2VsLumOEDIgy3LGHF9ZN2V12hQXjBVJ8VuU7txkvk48gmf7pFx
	yvurK+gocO+esBSvBQCc/QoQWXZbKwPEySuBUwUjIpzEsmLToYLBlMQWk7mbja1glmuK
	5F3RNi7uoplH5Zqozn6My8G7Uf7BstVokogy6bNyUP2/fkqVD1wn0a6STrLSStAFWIzd
	BCcw==
X-Gm-Message-State: APjAAAW0sOsJmsesIls0Jb8WjTvq1drVVa0e7ZcMMN+bOXzcgW0wRJ9y
	TeoxA0UTONYMtycZgJp++3hzndLgy/I=
X-Google-Smtp-Source: APXvYqxpQZKpL/ktGU1lOnWcb3hcUH4WDX0IzUNQYJkPlAwEx6HZtuHNmbrpZFOVdxWo/8DYs/So3w==
X-Received: by 2002:adf:e74c:: with SMTP id c12mr2786640wrn.173.1566540105581; 
	Thu, 22 Aug 2019 23:01:45 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id s2sm1405743wrp.32.2019.08.22.23.01.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Aug 2019 23:01:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 06:01:35 +0000
Message-Id: <1f174f8a97519bda49cec0a5711a3d6503ad7b72.1566540028.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] *-artifact-names: include version only in the artifact links
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
X-List-Received-Date: Fri, 23 Aug 2019 06:01:45 -0000

* drop ${PKGE}-${PKGV}-${PR} from kernel artifacts names (this is the
  latest build) and add it only in hardlinks created in do_deploy_links
  so that we can use PKGR there again (because these links are generally
  used only by human operators and they don't have their own TASKHASH or
  the IMAGE_VERSION_SUFFIX might be set to some release name which they
  do understand

* this allows to drop package_get_auto_pr from kernel do_deploy as well,
  leaving only 2 EXTENDPRAUTO bumps for each kernel build (do_package
  and do_deploy_links, unfortunatelly these will still have different
  value, so if you're looking for the exact kernel image in deploy
  directory based on kernel image package version seen on the device the
  EXTENDPRAUTO part of PR will be different).

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image-artifact-names.bbclass  | 2 +-
 meta/classes/kernel-artifact-names.bbclass | 7 +------
 meta/classes/kernel.bbclass                | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index d5ba035f5a..b23cef22ca 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -3,7 +3,7 @@
 ##################################################################
 
 IMAGE_BASENAME = "${PN}"
-IMAGE_VERSION_SUFFIX = "-${DATETIME}"
+IMAGE_VERSION_SUFFIX = "${PKGE}-${PKGV}-${PKGR}-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index 41ef6e884d..92e08297cc 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -6,12 +6,7 @@
 
 inherit image-artifact-names
 
-# Intentionally use PR instead of PKGR, because EXTENDPRAUTO included
-# in PKGR will have different value for do_install/do_deploy/do_deploy_links
-# tasks with different TASKHASH, causing multiple EXTENDPRAUTO increments for
-# each kernel build and more importantly preventing do_deploy_links to
-# reference artifacts created do_deploy task
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PR}-${MACHINE}"
+KERNEL_ARTIFACT_NAME ?= "${MACHINE}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index df203d2b4f..3a3400da87 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -700,7 +700,6 @@ kernel_do_deploy() {
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-- 
2.17.1


