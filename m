Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9D37F646
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 13:03:19 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m18so12584754wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oJKrvhsyl+A13sua9mIFWztHD+QnDAxr3TRzLbvY/os=;
	b=n5hvP5s5BDkgDJ/uhgZ/HvcvAPbPIaFOthpU97Vx6oO+8SxnKh+d5uLCbqHZ/arVnX
	TDDDbOz3/Zbp6Jt+XA5szipZCAseJz9zhrc7SDrFEySrsgOo3/KVh+mq0PyLoMVrJsH+
	6ErnFYtfwa0Dp6hFsgeImDLUR0JLcD+EOkfNzUE/MgBNfmIEdT4P8a6bwdNI86M5m07k
	2Kj/uebNYiDBq6kgbT9I3xXuPOSjmmXSZ19rdRqPNoNiI5wNp9w0bEtcOCrEJIDSTMwY
	7TFgcuUZ+3U+aQT3GRkFADeHuXHN+YUrS9LEyZiUNA4i9nl4zB0c1urF2z1ve+KXQNxg
	5Ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oJKrvhsyl+A13sua9mIFWztHD+QnDAxr3TRzLbvY/os=;
	b=EET8BTCIJoxg8NsGabuMb12XUupdyvfu8PyFrlquxITFs+c5h9pcpMvcHgtPXZz6UV
	IC0QHr1a1MrEG3lbZWEa3kZBhtXM0lCIn08JAH5Cds9pVE+lChTzoLYlUxqO9UPM05g1
	bv4zVpan6dCVyhpHoNS+wvuQ2p+dCte/jrnsml+G6NtE9XXT+94P9AE7gsuwWohU9clN
	Huy8zop6UkqnZNH+rzVWTwWDVW1ob5dx/ooiLb0/WsQ5H/hMkI5aAOIEbZvYWLJsy+Ac
	3f37RJnL4NLC6NBbNDJLaMRMWGd635Y7uTvFfXDMMdDKXfTYFasIHBlQmm+Sd29o+9J5
	1W6g==
X-Gm-Message-State: APjAAAXpQtBzBYIxsFlG00aS2E21ruP1fV2ojyu6FrYAuEnwMAi8I0/8
	vKnSaXrtHSHdFMvnp5hqvw1I8DD3Wkk=
X-Google-Smtp-Source: APXvYqwBpucSmK4bLZcReTiXrZRWka/Pt5aVSZAt7xAR5/n0nA7qYYt8nwg9TxILNcFuou7qJVLZBA==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr7405120wml.46.1570885399746;
	Sat, 12 Oct 2019 06:03:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a204sm21706275wmh.21.2019.10.12.06.03.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Oct 2019 06:03:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:03:12 +0000
Message-Id: <c5b32b3fe6cbc60c10fcb24d6981c993793ce947.1570885333.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570885333.git.Martin.Jansa@gmail.com>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RESEND 6/6] *-artifact-names: include version only in the artifact links
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
X-List-Received-Date: Sat, 12 Oct 2019 13:03:19 -0000

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
index 8003d0a929..c807b88600 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -702,7 +702,6 @@ kernel_do_deploy() {
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-- 
2.17.1


