Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 562DF6D409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:25:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so324509wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l0icallKEyoEsY7N9hLEo9fUKPiDcqti832Mz1unyRM=;
	b=1/pVOaNhGPIaCqZOh5iS0QAR9U2pvkVDlefU0iRWHy4/z+HUJVOFg54hcOigeCm7Qj
	OzvsqujMZVF6f88dga5gEbhUtkwF3BPyngFVua876RKKuE6g6TwKGibulcmTgem3q0nk
	XeQI/m1b9hIxNj5OsUA8V54xafyXElw1fCxDuwrU5l+gGQeYMenMRM4Oed7UbuR1bBQb
	+YbQeenWyslnUBIgkfqwsiJt/sDlYvlqnYwggfm/5vseGGWNw4eiLa0ugqTy4A4ljMDA
	RquX3QEnnAn3k+nOVQaUQMhV2RNYoYW2epIUwMSF7jB29tumvhTFFjO+/71ut9iCDYA0
	sq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l0icallKEyoEsY7N9hLEo9fUKPiDcqti832Mz1unyRM=;
	b=RzR/wRHmPPQ+XkBgs+TBpUkbK39PQ2+/E/M6yCKzl2/ujVH4vceZ+6+jcjN1AUGo28
	SHKN38WJCZqx0Vbl1tp1/lbi5zvk5dxf3FAvso+pBVu4p3yDVJlv7b9F/ee74KpSRfth
	JPEtXO1QZxUJvcYw9XtMUrQpGoOEGlbqEGgVZJQfst0l9c9m+LQGXyROZpBhYs2RsRul
	JeeT4qOGt2TgSjgue3lABqnI/KvURazpW4fNP3XmPhlBrEcCKmb4KquKqFcnMpTghgtY
	vySK1OIXkmuz6Ff8pbclXOw0lVH63WYH/28eP9RvFhLFRXnJk6zoTHUqk8XM0j6Q/6/k
	wALg==
X-Gm-Message-State: APjAAAVHLzI3SdQPHx+evwxZOfZlEzUI6QwI7OIbpxTNmUpPSQYdje+G
	D7Eg7i/BE8I2ka+TpO4QMRntOH2AtOs=
X-Google-Smtp-Source: APXvYqxoL1ieSBKlE85hu7hsH6SxgEfzkpDBuY//9arP6DGorXgP4zbwUC5fav+ar330HeVoIyiWFA==
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr13223324wml.126.1560169554853; 
	Mon, 10 Jun 2019 05:25:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p3sm11795882wrd.47.2019.06.10.05.25.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 05:25:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2019 13:25:49 +0100
Message-Id: <20190610122549.2144-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610122549.2144-1-ross.burton@intel.com>
References: <20190610122549.2144-1-ross.burton@intel.com>
Subject: [PATCH 2/2] efibootmgr: add
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
X-List-Received-Date: Mon, 10 Jun 2019 12:25:54 -0000

This was in meta-oe but EFI is sufficiently wide spread now that we need it in
core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb       | 28 +++++++++++++++++++
 .../efibootmgr/files/0001-remove-extra-decl.patch  | 31 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
 create mode 100644 meta/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
new file mode 100644
index 00000000000..4edb2e6644f
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
+SUMMARY = "EFI Boot Manager"
+HOMEPAGE = "https://github.com/rhinstaller/efibootmgr"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS = "pciutils zlib efivar"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+           file://0001-remove-extra-decl.patch \
+          "
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = "'EFIDIR=/' 'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar`'"
+
+CFLAGS_append_toolchain-clang = " -Wno-error"
+do_install () {
+    install -D -p -m0755 ${B}/src/efibootmgr ${D}/${sbindir}/efibootmgr
+}
+
+CLEANBROKEN = "1"
diff --git a/meta/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch b/meta/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
new file mode 100644
index 00000000000..42f3a8182df
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
@@ -0,0 +1,31 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+
+Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
+-- 
+2.7.4
+
-- 
2.11.0


