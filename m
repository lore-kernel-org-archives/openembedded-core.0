Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 68BCB7FC0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g17so11334002wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KBE/F5l/l0Z4EPmXGLnHaMcASFVZaus4z/htCJPG1W8=;
	b=gyTnUKC7utwJnOB1wiIfh26IhnzzizNVfHoiOvC03hx88KQ8AsVHpfsisRBWgw4Tzh
	9NenBG06MMjBseZiOGcqPdkPlS/1Hvjc7qXQRQ90vXTRAJOXQs+UFHG/gKMr9uLg/a51
	ZM4jfTz9f1XC/PF+o6VOjnaqAYNC7Qzyp9YkqAN2lxFhDKcvCi1AqqwcLBBx2S3noI15
	v+TqQTRLa9jvmRSW6V3bI54ji56J34se1jf1TE6fYySi4ZLWDT7gNUEq/diGqJUYkXNI
	C1+EYLoIye8ZRtchmq1a11F0ol1QjrbWj7K3hnVpAQ8Cuv3iOHwFJ8fPbw/Nh90v4KL0
	jBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KBE/F5l/l0Z4EPmXGLnHaMcASFVZaus4z/htCJPG1W8=;
	b=tzwzOcBf7Mkr1vsZex4G0TzMNrLozEP0FbKoHqe0T/7weRkU3Vu1C/teZYLhXrzq3A
	WOxgOzW8+EZZuYWKnw5lrqf69ol/n9ivKV5WCjcWFuEK7wznH0lCmd1JqNNEA+pRexQH
	+7MYP2PzeIBYfvnySdoC93N4Hl4JeMnlHZQfOqluAmT4pJJU3KKXya61CvLP/G3vHFOq
	wMaUDWzNQxMBFOzdtkRYCl0BMoOwyKyErsKhDjikI6lddljm6j91wAWRZk59a5+XZ0k2
	OmQdgmt3uqmiQlh2h+FdAZXJjasxr5NTon4/60lb51cNekCGSogTT493AL88efrviE1i
	AflQ==
X-Gm-Message-State: APjAAAWhAfHHl7UdiKm0sJ7Q3lFiwSw97eM8f9ciuHCWyvSG/hKbpbNu
	T2b3IeX49jsLI9jWiY9mGjDNGknxESw=
X-Google-Smtp-Source: APXvYqxy+wxQAwo4PLm5m7DJpF7pP/6NexFyBBYKmqjETEIsOEAI4kCmy6FlFVvpB6nltOz/2aknEA==
X-Received: by 2002:adf:f484:: with SMTP id l4mr23691112wro.207.1578993162997; 
	Tue, 14 Jan 2020 01:12:42 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id 5sm19091544wrh.5.2020.01.14.01.12.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:25 +0100
Message-Id: <6dcec5ad86b29313b2956f35cbdb1bd3315e9b48.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 6/8] *-artifact-names: include version only in the artifact links
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:42 -0000
Content-Transfer-Encoding: 8bit

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
index 249704b6f8..ebe5378301 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -705,7 +705,6 @@ kernel_do_deploy() {
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-- 
2.20.1


