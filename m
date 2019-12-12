Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E930F7FA0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so3756355wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mHuBK2xmT8UQSp+B3ChVrlpvtSeA7sGqNuYGWKKsceY=;
	b=TG3PkHpa7Rf7j6ZaTyNhVTracNxgHUt2DoHni16j+Hnre1iA7UINAZY1ZpJzdUm2mf
	aOPlsW5iBSwkB4mDqyU9GMk4IvNdzki79vBbrdegYxXk4L1lUkL9AtLrgqyVE4zL3Iha
	onhdzHdju80x0DYFHwjBDTplwUTRGYGq9d1E8z9lgPF9BXl2EgxBMs7emZUFOu0a2psu
	b81jzsDeGX8D2PxBO+YvWKMIm4wAPABwn6QmL8UOVBoaYbq/XzQlW+6WHjiBpbYVFfpe
	8+RHnB7ODj9iFAfQsmDIabyZsj7kCd4UXqlyISPw7Kz/Daeb9/Q84gkdreny/vJn4cTy
	dj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mHuBK2xmT8UQSp+B3ChVrlpvtSeA7sGqNuYGWKKsceY=;
	b=lb9s2rTqKiPnMB1/QF8BwVbcyYAtGcOn98FuoiYNYuFoKmLGX3tET0IvH3xlruRysp
	j0DDuxMqnGdejZdRb9pHI2zWeBOE/HeW105ZKMFz21ebrax/pLw2+s4W1Q84Bo8xHjPK
	TtWKPfP3+BPzl1Eejo3JQz151sQnsEMmIrJBnhly8zB9dJsrqWS5F/iPFE8h6OdFY2Mz
	fMdarg2+PqJYfi+JGJ60DmYe+iWf3i80IR73U5CIRBj84xbyjeKAb7KNyoD1m82XNjdZ
	cD21vEjWldiPAqWIrFnoPY51zXtrHUp4IFUHNHSJj58AUx2fpacSOPUeikK579gyfUOr
	xNkw==
X-Gm-Message-State: APjAAAVeTFzOjdzZUMlzckIXqLGKXIMPM4dbnTRbgc1QyqswYnhCvvgF
	LNdcnHsV2kRSgwj1RnkGmY+RhIeR
X-Google-Smtp-Source: APXvYqy9rVD5xyua9Duco1c5gZfMro0JARwCBEOhpjFZf1VP7SVfTT/Did0iVWv9FMVocz5uRFj+Hg==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr7733359wrx.153.1576174502523; 
	Thu, 12 Dec 2019 10:15:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:26 +0100
Message-Id: <20191212181436.1322-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:02 -0000

Removed the bleeding-edge variant; if it is still useful please
maintain it separately.

License-Update: formatting, dropped the gpl texts, as they're
not anymore in source tree, and the main file is specific enough.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...les_2.10.11.bb => lttng-modules_2.11.0.bb} | 21 +++----------------
 1 file changed, 3 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.11.0.bb} (51%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
similarity index 51%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
index 789a3be8507..ffb703e3678 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
@@ -2,10 +2,7 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
-                    "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
 inherit module
 
@@ -16,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "c618fb646514dfc1bf910cfd7cda4256"
-SRC_URI[sha256sum] = "7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1"
+SRC_URI[md5sum] = "46ec6c566e65cf27b391a1bb643e11b4"
+SRC_URI[sha256sum] = "98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -32,15 +29,3 @@ python do_package_prepend() {
     if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
         bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
 }
-
-BBCLASSEXTEND = "devupstream:target"
-LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3"
-DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.10 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           "
-SRCREV_class-devupstream = "624aca5d7507fbd11ea4a1a474c3aa1031bd9a31"
-PV_class-devupstream = "2.10.10+git${SRCPV}"
-S_class-devupstream = "${WORKDIR}/git"
-SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1


