Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 68C4A72DD2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:10 +0000 (UTC)
Received: by pdev10 with SMTP id v10so8559643pde.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oPAG68mU6+nSaULVIKEZBwMMVp50yrZddFDi2mhyn9Q=;
	b=y3MivrWHoM2oGUxg+uCB/kZ/REdwz1dVtbh9CdbjBkrNN378YCRYGkAgG8lXbfH2HC
	+gfS1twfs5rjiKjwQqm4lgNcAzJyrOTpLpB1SgZVlWNyb/d0/rM/R17VIrBBoW7HxNzC
	byt9KQOhr1LMKZ7eCPwUKWOukypLgRv3WHAt9Kjlti9jGEIBUeJg3ChadgKbgqUhkTFD
	wHoFu4+SHyQkaT4jEb8gfuIWxl++link7zFqaH1+ERV61uvViSMbm4inuHK3O9CEiuOq
	mwHHc1rEfXTofG04r8Q42Uxf5HFi17Elp680aaPZrm7LgSoStD2EfJL6dpVTdcqbxYxs
	dh1g==
X-Received: by 10.66.66.40 with SMTP id c8mr6629212pat.139.1423152371751;
	Thu, 05 Feb 2015 08:06:11 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:07 -0800
Message-Id: <6f59d3bb1c0e4eec5724edf77b761de7af46cc87.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 59/61] busybox: cve-2014-9645
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:10 -0000

From: Armin Kuster <akuster@mvista.com>

modprobe,rmmod: reject module names with slashes

(From OE-Core rev: 815a7b6fbf3b0cf95f5464bca687d97366d7ed6a)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ..._busybox_reject_module_names_with_slashes.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch b/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
new file mode 100644
index 0000000..4e76067
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
@@ -0,0 +1,41 @@
+Upstream-status: Backport
+http://git.busybox.net/busybox/commit/?id=4e314faa0aecb66717418e9a47a4451aec59262b
+
+CVE-2014-9645 fix.
+
+[YOCTO #7257]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+From 4e314faa0aecb66717418e9a47a4451aec59262b Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 20 Nov 2014 17:24:33 +0000
+Subject: modprobe,rmmod: reject module names with slashes
+
+function                                             old     new   delta
+add_probe                                             86     113     +27
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+Index: busybox-1.22.1/modutils/modprobe.c
+===================================================================
+--- busybox-1.22.1.orig/modutils/modprobe.c
++++ busybox-1.22.1/modutils/modprobe.c
+@@ -238,6 +238,17 @@ static void add_probe(const char *name)
+ {
+ 	struct module_entry *m;
+ 
++	/*
++	 * get_or_add_modentry() strips path from name and works
++	 * on remaining basename.
++	 * This would make "rmmod dir/name" and "modprobe dir/name"
++	 * to work like "rmmod name" and "modprobe name",
++	 * which is wrong, and can be abused via implicit modprobing:
++	 * "ifconfig /usbserial up" tries to modprobe netdev-/usbserial.
++	 */
++	if (strchr(name, '/'))
++		bb_error_msg_and_die("malformed module name '%s'", name);
++
+ 	m = get_or_add_modentry(name);
+ 	if (!(option_mask32 & (OPT_REMOVE | OPT_SHOW_DEPS))
+ 	 && (m->flags & MODULE_FLAG_LOADED)
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 8879e52..7736520 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.9.1


