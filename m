Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3927EB0F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so289927wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=lGjIt7UBn+oYsWflTTcQOiTzSNruVo8qn88+BoI7s71lp6sPvHuFHz0OX3b78N+g0C
	tAPI8cWOAbzTKPv2b8BbC3c05eFycPRgSL/TsuC2uCN22R94PtXP+jErZAWXVwPsyCZG
	gkSEomS7OPpSVDzyrLIWTy5nZWfSZc9NkR2rWxT6f1IHa7IXCJQfVrHXOJ7OfyPt/Kcg
	NWD1z4LWeev1aTqhesda1MbO+jk2rSQ8Q4+aBxwHncisxPVTtAXWrvrnEVSLYL1CmjO3
	1JIcdhQRn096R6xu+IPgfj1cw60wJT+BZS+cGB3+8Ich64by52MnlIJusS/JeKdakh5C
	31xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=tcPxNOqmXkM9e+HPOz4tlcdsfA6Sy0gf22YvfmXOvyuY5yDgvrylGPbcUzMR4s+YHD
	R5v5oxzOAVTg0cCcpc9E+UOKrrWkFX34liYgsIwHXgOR2tM91KWu6hmPIeQbYLnh9PdN
	QJ1dtHXyVQix1yZhL9OyJzOA4YHtMGzAtqLMLZ1XceGVBaMpjUa0zAPslzOj/gt2IulT
	5Ya13HHm3unEtM6zpkWw90x9AflF97yQ8mRQlnvpe2GKS4mznD0/ry5a7rsGcmXSogz/
	sZjt7C+8P1yCnWPxAvs1Gst8FBG0uANPkjb+xOpJpthJLwzb7yu7Pl/ZTkH3LwoR7HVC
	5Fmg==
X-Gm-Message-State: APjAAAXSIgfIQgDLXgfNtTNwU/0pXK+OiJY1oiOEPNC+Ym37Bauc3dL0
	Q7oMFQPyahoKlPZsNwF4N4xTMZcZ
X-Google-Smtp-Source: APXvYqzOFLsyiJ1qubi7nFE5wp7jQzZQzhs8AwFEtaoCf/BsFBMl5Cy5hdiWaSUdkWg24+p6pujaXw==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr164392wru.122.1575309321913;
	Mon, 02 Dec 2019 09:55:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:59 +0100
Message-Id: <20191202175459.112655-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/18] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
new file mode 100644
index 00000000000..053108ad50b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
@@ -0,0 +1,24 @@
+From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Dec 2019 18:16:41 +0100
+Subject: [PATCH] meson.build: fix builds with python 3.8
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1da81d5..3e0db38 100644
+--- a/meson.build
++++ b/meson.build
+@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
+ 
+ pymod = import('python')
+ python = pymod.find_installation(get_option('python'))
+-python_dep = python.dependency(required : true)
++python_dep = dependency('python3-embed', required : true)
+ 
+ python_abi_flags = python.get_variable('ABIFLAGS', '')
+ pylib_loc = get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index b770ec060e1..0382360ec26 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://0001-meson.build-fix-builds-with-python-3.8.patch \
+           "
 SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
-- 
2.17.1


