Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D55D07F361
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:17:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so2235124wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hBuOsSfbNYyd7IdzqrXeHXmDuurBd585pRL4ZgqTyd4=;
	b=CLFqcaNkKH3HXxUfeh1rFITlAMwYEdONUleORh+MaSzIMXIxiI9hJsUeifizL6ZZ6e
	PmwSXxVWMQ9I3r1S1v1b1zU+YGiS6LCXybcBpWf0ABD1O25yMvXKy/lISfo91l8iKDuN
	dsqPOehC0qgroT0TykXEu3gCIM/iNQuNFKO+MGa+w7CLT+5RTi+1qIgA+DZf9DM40JUj
	P9toaSiQMtKCZJHp2PnjTsnmqwgTZaqqKGDVSZdNiB9j3QpyCo0VMlTXa1/a/pRpG7zB
	i2D8vYjDE9Vry+FFmAF3Kx5jQIsRN2zK3KGkl/UMu7sRhACYfG26+KPJwXFQIWvDpwS9
	201g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hBuOsSfbNYyd7IdzqrXeHXmDuurBd585pRL4ZgqTyd4=;
	b=A5zDGXYupfFn19EbhWTqJNZ32jTYbUL8yvWMkyIxgU3JuSX/3CJVuFtrAdm+FW0nc4
	Z46cZRzo1PoW+vJHBsokpMj1EgjxwzRv9O1AzpKOE/STbLuwmLx0y3UqLh6IyME/+tas
	Id512QzlbAZdtXu4n3YgGKN4DFn5trsSjO6Bq8bGz3vGWZlXzXTnKk3pJV2g/Os8Vyo1
	7li1UvtjqbU6qZ1JemJ65OrtSv/Qi8bf6KkMJxy1zpyo9KKXz+c8y807Jw8S678B4TDC
	dwCznl+bUrivTVg8hgDn5EvQL2H1VtKqK/1zGk3DsawyI3Nr6qzTPOQ8lbrPiJGgEybe
	bgBQ==
X-Gm-Message-State: APjAAAV/0T2dY5AH7VjTvKC55+7TfSYNtQ7SK252iF6W1sGF3BYAiN7u
	JXXFx4Nlnsv4uvbKlZicxXucJ0wh6ls=
X-Google-Smtp-Source: APXvYqwFRuc1iLnZ7k3u3kO/t3NcCsmf+JpjKqqm3dEBWy2emKKJ01YDhyX3BCYIrIWbKR8aw7T+fA==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr11269345wrc.354.1565975826306;
	Fri, 16 Aug 2019 10:17:06 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m6sm4715521wrq.95.2019.08.16.10.17.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:17:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:17:02 +0000
Message-Id: <271517e2f38dc3eaf372e3bd9966966100e84568.1565973637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565973637.git.Martin.Jansa@gmail.com>
References: <cover.1565973637.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 6/6] *-artifact-names: include version only in the artifact links
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
X-List-Received-Date: Fri, 16 Aug 2019 17:17:10 -0000

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
index e41adcbebe..3b8bfd2991 100644
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


