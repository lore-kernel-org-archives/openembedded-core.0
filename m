Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id E881D6A957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:42 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3391226eek.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OHC1WszjZOq3qdrbFmATOzr6gjkNxxXmg5LAEzEsq90=;
	b=pqpt5+INyUlBw14H9B1SakV1x6PIMKQ+WOe+pLHflmbUWzzCOzgAIJ+tThaJBFsASO
	jIUAdJ/IFNRdsF+iQ3fVnFWy9sDC0GWUihJ2HqhrnPOagMMHzSFkBcR0vI29jwgw+SGK
	tjqsSnYz5zkk6nSokbgQI/2D4Z5P9wkW5l1Vwjp8jCqE9azf6HPXM9wYJntW/zrxKm9t
	fSWjx0ZnfjQqM9wrqkyNpEpK+jn9DP+vQxXJ+xv7MqSRyYAEUFoPgKXv6zC5scczFYNj
	AsB7VEJq4c22iTssr620LpgYhz2J2hqj2XKtJlS3nTxi4WJZjknw5FvxXu29pRXUDJ9Q
	OJ9Q==
X-Received: by 10.15.52.5 with SMTP id o5mr23489895eew.58.1371079183687;
	Wed, 12 Jun 2013 16:19:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y44sm39768138eel.10.2013.06.12.16.19.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:56 +0200
Message-Id: <a33ffe697e3e8232090b7fcfac343a68765b0e4a.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/10] mesa: move LIC_FILES_CHKSUM to .inc
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:43 -0000

* we can also include .inc as first statement in recipe like most recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc  | 2 --
 meta/recipes-graphics/mesa/mesa.inc      | 1 +
 meta/recipes-graphics/mesa/mesa_9.1.3.bb | 6 ++----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index c5507ce..cf07155 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -2,8 +2,6 @@
 SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
 PV = "9.1.3+git${SRCPV}"
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
-
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://fix-glsl-cross.patch \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 74fddc2..dd91981 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,6 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
 
 INC_PR = "r9"
 PE = "2"
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
index 74d467a..fc193f5 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -1,3 +1,5 @@
+require ${BPN}.inc
+
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://fix-glsl-cross.patch \
@@ -6,8 +8,4 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
 SRC_URI[sha256sum] = "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a669acecbeaa52d766"
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
-
 S = "${WORKDIR}/Mesa-${PV}"
-
-require mesa.inc
-- 
1.8.2.1


