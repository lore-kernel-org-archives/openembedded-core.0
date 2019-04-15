Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5598A7D915
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t17so21261612wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DU/8k6znCJVVCDWbtQJfCnAepVTAPyCBxKf2r00E50E=;
	b=BcR0GotHJAR+pLSw0ifKmnjLBlCSln2zfQfCHw02z2EqmZuS5zI+uv2BMoh0kKnFdr
	4kQFfBABWOl2Fujn4ucpb0TqwPgk9oZWuH+ehHEyWw1UPgn/fZc0ojfEHKlrqvtZcmf1
	GXjD162zkeQ+tc69g5JLyOB0nXNl59oKjDwSoOEBDUDUsbT/kxYIiGdF6vrwrqXhuWgd
	kKazzWmveoyV8a/vtMAod0Ox7il6ATjeMnvtOA7h+VT90B9ChGhz8cwb0QHTLdzc6FOI
	Nnmoiaa+AUe/hLfmdurBq3GhWgiqGAkxe4HCxIxzCifHNXU2Mt30/nNWPWOXdmERwbK/
	fM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DU/8k6znCJVVCDWbtQJfCnAepVTAPyCBxKf2r00E50E=;
	b=pu6pLfqiviYzRDQA1MkOEo5wu4B6PuEUfpVU/hWzUPWp9ru2/h90UzwgCDw2P0rNqs
	WhvpOE/ULY9iENk2xALC2HCOKVuNY/R8ZyOFuvTPmIeDCyKYOcji0EyfTIfvmtNRhCfc
	OS6KpTeSIqcbfRaxohBHYN6yCZOvcXtoytj1Q3ON8cdwf4Yimdlj1QBnj4ZodHgcPfGF
	z5qXTvTtFYbJ+UQoUb2GMZ1r4k/iCoetr490eyifw18tEKOvYl890i/Nb124GGobWOET
	0WlpILmSyelE5EtZYLt0r8rQo4BB/Sf8j6eGfuZxgEjtpGzdnveOne9WqR5BZp/b61ya
	PY+A==
X-Gm-Message-State: APjAAAV6BqshJQVeM6RODSr7U3eXKWskwnASiRtmP+mTHG2a/IWbFbkm
	VXzAoh1ty//s24RkhuJQ4GH2QsBNMBA=
X-Google-Smtp-Source: APXvYqxDVko8FkELhBhGicXLd2Ct1lSrRHd9Ph0mSDa4KNErNj9QOnBwNOSVJfreG+sIJA+qGF3Izg==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr28148163wrm.233.1555325715873;
	Mon, 15 Apr 2019 03:55:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:51 +0200
Message-Id: <20190415105457.57067-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/19] at-spi2-core: fix meson 0.50 build
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:15 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/at-spi2-core/meson-0.50-fix.patch     | 31 +++++++++++++++++++
 .../atk/at-spi2-core_2.30.0.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch

diff --git a/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch b/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch
new file mode 100644
index 00000000000..fbdf7d0e2ea
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch
@@ -0,0 +1,31 @@
+From 44a812ea51223d82f21a098a2d45fcc5c329ce7a Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Tue, 12 Mar 2019 11:46:24 +0100
+Subject: [PATCH] Fix meson.build for meson 0.50.0.
+
+Since meson 0.50.0 it is not possible anymore to specify an
+absolute directory for subdir. To keep current functionality,
+use install_dir instead.
+
+atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+---
+ atspi/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atspi/meson.build b/atspi/meson.build
+index b7a9357..2a6915d 100644
+--- a/atspi/meson.build
++++ b/atspi/meson.build
+@@ -57,7 +57,7 @@ atspi_headers = [
+ 
+ atspi_includedir = join_paths(get_option('prefix'), get_option('includedir'), 'at-spi-2.0', 'atspi')
+ 
+-install_headers(atspi_headers, subdir: atspi_includedir)
++install_headers(atspi_headers, install_dir: atspi_includedir)
+ 
+ atspi_enums = gnome.mkenums('atspi-enum-types',
+                             sources: [ 'atspi-constants.h', 'atspi-types.h' ],
diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index 06fb7195b64..36e8a9ef486 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://meson-0.50-fix.patch \
            "
 
 SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
-- 
2.17.1


