Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7FC7D95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id q16so20038159wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8irZBsDKKaWQANh/v4VvkxBi9ZF3MVAO1ssdDSEzJ+c=;
	b=k7OnGnHmB7IWXlu4Nnjh6I7SYKzRl9dw6/mm94dHWiFEgtcon1riK8/s3epyY7Tufu
	4hsRiKJda9Q5u4zOMaYn/yd/N9Fy9Zb/Jv6AC6PsGba0Hn5AyfEs10MV3IaK7nSg993m
	S+p15kRgeXoOEkTnfywoEhwiHJFGFJBhAbTVGzg6Vsqubn07IfZgvCkUefvSpSUT+lm5
	ZvVaWkX8T50eCPdA12EuToOZgTp/bNRzUj7nd4yvXe1lVj06Us8JutzFAZD7eo0zEwDw
	HRD+zaZt2lezgfHNkvWrtXBORHwiVD5zPztUqjGVvsD6ja3RfLWxpUDpAKErXV/EjQEh
	rnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8irZBsDKKaWQANh/v4VvkxBi9ZF3MVAO1ssdDSEzJ+c=;
	b=aVeB4famG44glKQU6csUtGJgVrovWSvNnxi7iI468CaIbRvEcxSFNR6XeT0v12IF7c
	fDkt3qgJbZ9txy8QT6fMR0S6NJQR0E7m29bkaENr/rt4TjtQurFzcAQhYXO6t4TGzC2f
	6y+D4gAQP6h5XYX8cV/FkTVYpKPXxpiWHqo858zYZqo+ujw43ItC9STUevw1/trDrTxT
	czHeqqTM1iuKDsFxKiN693F3G5prxdpt0lPupMLX16cjMGZs6OmOe8HdNb99lOQXwQBy
	phSmCnmUTR6LfL2H9kv/CxjU7wzpdrzdPBwsW0zPJ0zETN4O/gdFniDrgRhTf/N0tkMi
	aDLA==
X-Gm-Message-State: APjAAAUUlTpTHMvBsZq3Sd6CscW8AWSnjpeULUytgFnAF9rhmIAbkJ3f
	Qz9YRdcknz9U6Bk3Mkvwn57TyYIKoxA=
X-Google-Smtp-Source: APXvYqyXJHuuB2ttUE7b3SDwN9zrC8N3avGVro5jcucHzzNy/8E2h/GYe5JkBNNFAR+sfn+7zW/ZTA==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr20691920wma.69.1555325710823;
	Mon, 15 Apr 2019 03:55:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:46 +0200
Message-Id: <20190415105457.57067-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/19] libcomps: upgrade 0.1.10 -> 0.1.11
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:10 -0000

Remove upstreamed patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-library-installation-path-correctly.patch | 27 -------------------
 .../recipes-devtools/libcomps/libcomps_git.bb |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
deleted file mode 100644
index dc3d9763523..00000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b1f61296e2f16c2b9a39c5501e4538628ff01ab4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:26:00 +0200
-Subject: [PATCH 2/2] Set library installation path correctly
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libcomps/pull/32]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libcomps/src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcomps/src/CMakeLists.txt b/libcomps/src/CMakeLists.txt
-index e553d77..e2eef9c 100644
---- a/libcomps/src/CMakeLists.txt
-+++ b/libcomps/src/CMakeLists.txt
-@@ -52,7 +52,7 @@ add_dependencies(libcomps src-copy)
- IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
-     SET (LIB_SUFFIX "64")
- ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--set (LIB_INST_DIR ${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX})
-+set (LIB_INST_DIR ${CMAKE_INSTALL_LIBDIR})
- 
- 
- install (FILES ${libcomps_HEADERS} DESTINATION include/libcomps)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index ff6820851fe..372c3c35804 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -4,13 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0002-Set-library-installation-path-correctly.patch \
            file://0001-Make-__comps_objmrtree_all-static-inline.patch \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.10"
-SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
+PV = "0.1.11"
+SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


