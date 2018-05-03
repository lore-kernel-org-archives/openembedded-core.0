Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB46749AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 18:46:13 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id g12-v6so27454286lfb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XdkoQeNA92VmGRO1gZaTQlq/Dtse0hPHZeSXR0sw+vU=;
	b=fD8E7i8WjyUR8yRZpOc3ZdCDMeqzxe7M132TVwCeGa2sIaJ9SdcZ41ituMEW6uqKhM
	775/ew+de52Br04TaUeSmDmBg0B7aIutRJiCb+CF7mOhx+6dDR7VR6j1GjZqs2RtHleY
	pYRwoibRkmlnCIG6UwzKCXZkyB851ZSC45WSwjtqapBKdI4drf8H+cA4X09FeZ0XFRId
	T4VPSJUcpsNwrJftEsDR5g8ZPLWCjE/Omvf1fj9wNvQ94D/34SWy/i3uY78I5tK1BD4c
	vyF+t/8s0ZfkUZYyS/B1XzX7LURCYEjl0H6+XxSR6hGvVSpEuihqiBgU4VRGEQk03CoH
	gjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XdkoQeNA92VmGRO1gZaTQlq/Dtse0hPHZeSXR0sw+vU=;
	b=oLcH4Z2ud+WdH0NNNVufH/jV/h53df5kjqtjNdcSlrWNr0S/QzkUK7Cs8SqtqcTgv0
	O9PQ1fyieqYtf7dVgZUehBVYB3PW1DqDqs9WPxZlBNXBNvJq2CWenaD98Pij2nceQ/At
	Qm1sKW9693STEOLPiCcqEyR57kEvgKTcIcWxPZW3LUdc9j9cC9fpw4o5f1RvKv4/09Rf
	yJkD6TibT78HoSSyKb1LHHPpoPsH3AJj4JVGzpq/8aGyTf3NUFG7zDP4vyc1Qul1wfav
	+QjS5akxiy7fjGYIzA4vOALzevUMTZJPdHgfO3eetlKeex3J1llviH/NkphgbbP7CGYd
	Ly0w==
X-Gm-Message-State: ALQs6tC3kAWAYwKxK6mEZizrZ+N01pPxVWZK5gsioEBd1pGOXyh4Aa4I
	qSGiLqS4uS1zCu1+W10g6w80HQ==
X-Google-Smtp-Source: AB8JxZpY+nzeVbEHJRm9cAUKSfuBLkWJI9pHW3DYkZS+RpTxmcg4C0QGNWeCg900IcBXvkF3A0+oaw==
X-Received: by 2002:a19:1462:: with SMTP id
	k95-v6mr15902983lfi.23.1525373174250; 
	Thu, 03 May 2018 11:46:14 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	f16-v6sm2946611lfh.94.2018.05.03.11.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 May 2018 11:46:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 20:46:10 +0200
Message-Id: <1525373170-20985-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] core-image-*-initramfs: drop export of IMAGE_BASENAME
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
X-List-Received-Date: Thu, 03 May 2018 18:46:14 -0000

From: Ming Liu <liu.ming50@gmail.com>

I can not see there is any need for exporting them, simply drop the
latency code.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 2 --
 meta/recipes-core/images/core-image-tiny-initramfs.bb           | 2 --
 meta/recipes-extended/images/core-image-testmaster-initramfs.bb | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 6de860e..4806b78 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -15,8 +15,6 @@ PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-
-export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 51d08a0..917b453 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -9,8 +9,6 @@ PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VI
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-
-export IMAGE_BASENAME = "core-image-tiny-initramfs"
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
index 09a6d16..13242e6 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -6,8 +6,6 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-
-export IMAGE_BASENAME = "core-image-testmaster-initramfs"
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
-- 
2.7.4


