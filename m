Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1567FCAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d139so364045wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=YclMT7HDlhDze2DcQIxVxBPkGrNYS49qdCevzWftLYUsvVxYlazmQjq8B8WUuXG9n1
	q0BMTUDGbF7Aq6bbzYRkFPHruZyEfk2SrDv9K8pRTVLI5IJpjk1Rczxq4FAgvdCLon+y
	M4sXds9Lsmi/Uw/uhul2FnbKIAOb7Lazt4dcA7Iow3bggzD9nDW2r6ui57TXkOf8lYYd
	06BPmIh/QMWrXkAtPa049weeIg8h0Rh4IXezZNZZ52x7IrEp8Cu7BFizToPCCRiiAfAr
	XE6qdTE6W2e8/yQVgnIU+67cOHzVh+395auIwWob1KElkShfg5HJ2I2Dy15sS/5Pk8CY
	ypFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=T3WTTR9vjnpiE0aoAV+iB7WrBCCPMTJGXq9LW4spglNPN8zS+llgfots1NPdtLBXJC
	nM6yY4NjdwqgR1E/VeDly/04odZ8mMSHP8X7eY7OuckdIh5ZrXyno0ysoFumD3PEMcTV
	aeIi5ZN2Drg0dKIXDHxnOO19o6mcryNegMMa+ljR09tf3VtSf40fB8YRvXw/p/bZeRfu
	MzbmJraAbV6bcdmLqH+RsI9CaPzOF+8rmkJfLTtv0xfMWitDHWWw2BP3H4rM+XMmxrfx
	U/nxFCaOadBgZRkH7zYmWG389fE+yFmInD+c6C4QnK6knpY7p2XR1jf1dWLz6Wo/GWBE
	Ty8g==
X-Gm-Message-State: APjAAAXxUTgKPL8xH9mmSqq0fAK5+SZaZTmH7MnyauWv0Alg6fMC8xk0
	xADmfyZKMuGpGlETBN8EnhTXKwdJ
X-Google-Smtp-Source: APXvYqxbbiF9ODtxD7I2b46H+bwePOlThnC76ckDGSZWBA+V+O5PKGQ58vOsaMbnivk9XhWnQa73rw==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr2347wmc.54.1579541125884;
	Mon, 20 Jan 2020 09:25:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:50 +0100
Message-Id: <20200120172510.22648-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/24] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:25 -0000

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


