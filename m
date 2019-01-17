Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id DA79A7C268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id e26so8311100lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6nhmXASt1GZL/OuDB6aiEtvjPH2bobnNroJBHdbNeoM=;
	b=gSNyTAdNnEWfsokdR/KcbkC6a/vdmH8devMN1gqM53fARH7FswcpOm6H5Wrj8FDk9Z
	afzqLx61n0HBfGd/QSiT7s2L/UOKzRkefi9Ij8po9tCXhH7YADggWuTuqgH8oycolA1p
	RTZdk11hD0BTeyTRzX/95k1Eyn6tP7l/XmejdLsW0PV5yX0kY4E61DgGLCan6b5nZo+l
	leZBncGh//gVG2Zi9rg/rFusa6zxoWvPq6fyN2WVfMEwAuN3cg0/2ppWcO8JAqxjFuYn
	2NqcU4bkOoykDy+9zn5JReIJuz3LbCUbH0Zpk/TkGr1VQY8gVwZ2a94fxxVCHLJtSMKb
	vf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6nhmXASt1GZL/OuDB6aiEtvjPH2bobnNroJBHdbNeoM=;
	b=nLz/9DdLglabEiwyaICq4P6hL11+UJ7GLA/E4gxIZ7MTAGsZV5sGnQIqDCeyKIpJZo
	ACA/9f9ayOCE6sVeIV0h7FomC9RlyhlskdQ43sTHP/KKZZSwjyDnmc5G1zZ4e7KHTThJ
	DvAFHsCYSTIFzKupFYxey1oYj2+1nWoN/EyHp6z3PJoXe5f+mYtQvafduD6vQ76ha/YN
	D5djpq2iFquI4NMYdbgVdZusSf+O4Dcw2ZCiz84gcqUmHZyifyGSsje/vAx60GXDc8oG
	p11OdvB5YNPse9k0iDkrqQGFM/hXtSKXWtKY1hxjTnGIDVgR+gce5zRf8f7oQpEqnnAW
	OUKA==
X-Gm-Message-State: AJcUukcak8SzRToXhy9XcW0EQh9HPB2jwphAvgxDHJrbRUc6bLWN6z3x
	Ep94MPpr+FAivPDpslpqynKOgBfT
X-Google-Smtp-Source: ALg8bN5QiXFXHJntpc5Ua363s9GdHZx6R+S21QXVWvLs92Fo4bIbLgFds2ro/w/b1NzU/OGIyXtnBA==
X-Received: by 2002:a19:1994:: with SMTP id 142mr11093636lfz.134.1547743254250;
	Thu, 17 Jan 2019 08:40:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:11 +0100
Message-Id: <4b11f23a6ef12f4c88362a008028b5fec813d25f.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 26/27] kmscube: make gstreamer dependency optional
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:54 -0000

This in particular saves build times for virgl oe-selftest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index c6cb1842158..b2dd6b30b0e 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Demo application to showcase 3D graphics using kms and gbm"
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
-DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
@@ -16,3 +16,6 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.17.1


