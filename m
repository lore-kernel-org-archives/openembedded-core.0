Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF1A7F646
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 13:03:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b9so14718632wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=WHcONv710XJOv2HzyV5xSHBhCzeLyx/+OqyyCOxcr/dgzcqSubVmH1f7XFo8Llf64n
	r8FHRgC3P/3KUsVVA/1Q307ejs5RNY9sY93f/o+cdax0rqyGm3GXM9eYxk5OlahjDpml
	jDQ4wz+xMY/bgMzg6AhuCytA3Nz7jMW/z2OVhiRbwLpAItCXMqserc0SeaHFgSQW7kKy
	u+u4NBA8Gq/6Wflhm9n+qaLgpNh/UySiD3m/+Z4SiMX/4PXDuyW6YVO+1cSePhyUtBp8
	TZOKodkV/RJy73JQWbtyVgTLIduuWnSxwC91p0hUrR0yA1wCz37d4wisxcWrQnnKOx+q
	ED1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=qS5YyBoem5wPeHiVtFcF1X60HRyWBZ0wmIFfDM/RN5x5NW//wNIr/j4gA76QBgVUt3
	BKwiYkA1/Js95Iu0XBvLoxnae02+QBiTb/yfx3MuzBvX3qFpQ6VJXp93g7buysUZBUl0
	TuLDlqNOee3c4G2bb/cfUVHHhxwN5peeNg002LCt5UPmb1DLYDcfjXA7BnSBhaY3fWBK
	lyA+05hYZXgvbaPk67nT5i4V9d6F7YRVW637QLJDbr//K1TckW6vOqvP525v9t2XzOLX
	ha2dBj6g28LXDWE70KzCDKVHcysPnvTMxbJ5NUMNRWTzhuilcSXRF2u47Iaznaq+hDdq
	/9rA==
X-Gm-Message-State: APjAAAVdjbnpMoM7UAXNLv/YXgXO3EiNFZNJsn9KG3xxKRIFN8JwU9MC
	02fGuyAj4TvPz6lyFzR4IwTfj0bkCy0=
X-Google-Smtp-Source: APXvYqwWdzztlJ07hqIPBU8bw0lpfZAPx8P7e5O9ouiHL/iZL72XbXUPMrcUUKANzNP8OhnrHhmL4Q==
X-Received: by 2002:adf:fe42:: with SMTP id m2mr17061762wrs.321.1570885396162; 
	Sat, 12 Oct 2019 06:03:16 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	r10sm14516331wml.46.2019.10.12.06.03.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Oct 2019 06:03:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:03:09 +0000
Message-Id: <232674a14a6860cedd2baab9cc8b81f6602d8c96.1570885333.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570885333.git.Martin.Jansa@gmail.com>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RESEND 3/6] kernel-artifact-names.bbclass: use PR instead of PKGR in KERNEL_ARTIFACT_NAME
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
X-List-Received-Date: Sat, 12 Oct 2019 13:03:16 -0000

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


