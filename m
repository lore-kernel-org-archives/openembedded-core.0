Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E70647FAAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so13924773wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=pGpyYr+RzvQzXCa70IRNRXlYRjdaodUUp047k7+T838EaVf7QMC4n83PDgHhQ7+ckl
	jVF9PIpZU3tM8O+dwkAMAxGLhmMlzkeaLHPoZzjYb9mszlXsw07SNCudd7pTnNbrZu0t
	Tu3pgcJ3kdW79lgl+gM/MCjFvB2HpL0jGIVz7dFJu0ISM2SqdpXQ0NJQUycDJ8rVdNrr
	Z08oyfpggSKXjPFMRooC04Hytey6vpeW4wpeDMj4W1qkV2RITK4jRorY6foGpP1k5zUW
	3vfwqbyD+139jT5cYldr7w0cgk7kO/RqbP8nnCvVLJWXyI8mn9ENfS2/v92FGAHp3mcL
	R4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=dF8dm0vqvJx2l3qXWz1981+AOeATK58cr3aaKaUbU19RTvhA05DQgZMQHRoTGcLavO
	CjTkxpHAcjW0J3vVUoflvefnVd6vHJq2Qwns+h50NbiFXHSdJTTbbNpxqN49LFG6yvpV
	ouI6cVXLwE9P1ZVYUDcy7Uwdv0y0KNCIhUjY+qhN6cXULT4lbcrZO8AOVTdpIEfSk1St
	O64ne24dP9KKwrLSHf+RfbKqhFBosGb68QqWjm/w5VUlujpkQDCc7nlVTyPqOjCDYlT4
	wTOCRSykQMth10HNYc0ckweyMneCRGlQjdIA2LlfL3DuKeQPxPLVFbomHUaud69xgKod
	c+RQ==
X-Gm-Message-State: APjAAAV4SSzdBWu+DU9mZbOW2I+KMlvj/7RsyvCvA1ds2KU76C33G+IU
	nx4C7dta/DCqQNlDhzv7RxKf6bHI
X-Google-Smtp-Source: APXvYqwh+m/VGUUz+pMLJrxl/idr0Sr4VZaRpBV7MCdt3t38FjQaTup16ms3ZtZOwMFQETp+OGF1Og==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr28182579wmg.139.1579010416447; 
	Tue, 14 Jan 2020 06:00:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:52 +0100
Message-Id: <20200114140007.36622-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/20] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:16 -0000

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


