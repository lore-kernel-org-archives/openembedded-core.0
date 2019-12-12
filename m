Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F04327FA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so3634557wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=sWnZZEdfSEgy825GZT7jVNvf+znxdrkA8cKjE2C5Ucs/oxFhD5OISaK7cNh7MZKnip
	6qlnAIa6BJX8SBCWBWGwm2bZTNV/wQs7D/U9GdwhvKUXK9dzCkZM1ZCHvkbhmkd/qwD2
	OpZFjlPZXKV6+eFL890roMvh14FtL7BGmLWZGRKQfH8NlQcPRdaCPdifgRSnoew5XFZC
	kMLLBbggvUlk3VFoSAXkQDqIvzEWjAwHuo4Qlf1JT08kIUBHRZyBgReygiZhUJLqF4uu
	WtZxE6BnTPPaSKW+u1zffIfJsMoazWxS9QbLoNDvGIBDQFpBzmwgLnjRi6Kv7lT3lL4I
	35qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=mDAD66VLR7gjQMXpsNmBKuSSgEmQIQLRYShPBIOVaPDI78AItAW5I6hZedqJkJg0me
	zuDLdL9WzsRY1YafOp1cto1PhZyVEXvMMoM8PjTNZSdYMefNfD2hWqHpUrS8wxNkACBz
	sIxreTApcrBQkOVDYpx/6cafh5mVUqTt/nSL9SOwbRD05MgIg97g8BADSvJMwJsMgMLX
	ZR8f6T32l3bpUis9LkudwVJIoDP01XKLaEtAgNgO/ZDaeIDGD97FqxGCQLKmXThPJhaP
	nbXthgUUln3wjTL63KZhi0lwLFOt9FO6O1E0R4gnoUcFwnyueAEocGaCpsroMwiWtRHn
	VPRA==
X-Gm-Message-State: APjAAAUlhWrASM5kNWRtIYQgUC/7A7hQXS10tfeQoWUhmm7UJNnhAHdy
	NamJixbb2LDojQ9rG3dd+AMxSKGa
X-Google-Smtp-Source: APXvYqyAoWCG4sm42ylAdHnyJ6QmksaQcOkMeJ4SokSwPCxpDV24Y7nDi99MyXhwXk1YzZ6xQMWVmQ==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr8639879wmj.104.1576174490411; 
	Thu, 12 Dec 2019 10:14:50 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:13 +0100
Message-Id: <20191212181436.1322-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:50 -0000

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


