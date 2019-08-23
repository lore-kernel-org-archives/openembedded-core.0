Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC9EB7F311
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:01:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so7730113wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=Rz7TVhbJR2gmG3jr6+C4ry2xyzHUaRyiC34fo3A8M/HDF4kyjXSahoJKqeItOEz894
	+DxVn7z1cuCbur9TXHusEFPZZurLqZXN6bBezrEfPw3D57Firm/bu7bn8FtJVYlMYdI4
	YTr4QZUXUqO1QxEALnZHCqMMjRFjFXPphOazlC9mdhGYHiED0/cY6sgLiga0WZuX7eeb
	BtgmCv1d0uuZIqal+AL0Zuex8AQ0cV+DmPKd+PgYwaqZlrBSZi2ev9n15bpeBIJEZu4z
	VkJi9gzqQgNwgibfSP27u+VJO6jTuNaTPtZxJokI0iM4j2yFxMvognbJ1hRS2Q771k32
	VkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=Y54aOwISNNZ2CUQnjrZ7Ug6bBZJQxkWbQRh7B9jG3ayGw8JlzKTH3qo/Wn+Y1Hkatm
	N92l4TrdpHQ4ZrVJqvVhkNOOaAfVOCpyw2FtrzfaynhOBmZ6fNajF1VuQ1Im+yTP0xxV
	py8aWLCq9ZFIKC3MjACzRxiy89hiQzAUgZKEoob1MMgH4mRB7X8oqtbXCNjX8Cz0y2a2
	Qy4FMSroHgTFsE8DfVRi049D5gS6N4GbNltx1bp2cJp43O9zKUKCkwfmpAM3WyVZzXdS
	kP0yS1l1PR85MEmTdT1wkxdV4j8H4bFe8+cmMVxIJGhkTX9Oz9a8xX51GJ+oXaY5dyux
	+Tjg==
X-Gm-Message-State: APjAAAWm6Jv+PAUkrPxxSumVG3vjNzk/2T3HDK03a98UFsQOWrRjnpaM
	eqAPpNTZWZoouyDdA/pBKGRC7Xex23s=
X-Google-Smtp-Source: APXvYqxlPeYE7ZfxhHZNn4KSEqk0ACXD9R8TNfYducCOoI5WyzY96u/U/k6qpnK04GjfkiN1jnyR+A==
X-Received: by 2002:a1c:c1c1:: with SMTP id r184mr2931968wmf.9.1566540102335; 
	Thu, 22 Aug 2019 23:01:42 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l14sm1906770wrn.42.2019.08.22.23.01.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Aug 2019 23:01:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 06:01:32 +0000
Message-Id: <252c5e03b9511e503059a9d116ed1f0f84697f34.1566540028.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] kernel-artifact-names.bbclass: use PR instead of PKGR in KERNEL_ARTIFACT_NAME
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
X-List-Received-Date: Fri, 23 Aug 2019 06:01:42 -0000

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
2.17.1


