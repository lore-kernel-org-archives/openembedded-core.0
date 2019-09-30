Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBCB7F314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:13 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id x127so4861065pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=g/kxkk8regcpImegrL6cYAIJrf58ymPef0QyMUhRVIR5vKRkRJShDUwfO+Fql2OYH6
	sq0EzIdXAWq9VtLAfBs/GZ4ykbzVur1g3eohnF/LoAYrPimEXJ1Vwi+qSzn2STC1+Rsj
	grrkeCUUIyl0bB5JH5KTH0p5M2cwD6DNsOk1pqBMsPb3wQCoJ6/R8HfXgpydnbFriecc
	pLsu9V4mttHXTp+mv2wJDE7VufcKqgr+tVTQ4DL6mUibnxTThAmreut7fInkx5WIfCFd
	jxHa2/+e+1uEERLcHUPLbQqdYhJEdVBnEiL0OJrYwkTNXp6mr8/h/RSUIsHFNtJ2/Ux/
	UQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=uYK1n2d0YeaonQyyRa0ymGy7JyCzVs7LvDJR5RLlMzoxga/oEp5oV+QJat/F+voYmj
	+7EHNQ34qrsB92tTm4MPcTwx1uKgzy/8qt0UjA0b9BUiRJBRNGrn87J8KiJVgKoT2kNv
	BqiHtUWC3bsT4rbGTmu3XqigYCgr5O5R7QZCncyA+We2d1UD0tvjX8/r+YKc6QV6CG4l
	JUifQiFflugo/WmqWBnYzmsXDMsIu34QZWzQuS+sWTjK/4O0L+W6w74criFSf4YWvR0N
	pT8M4yn8lDqagE5cWYWhC3nTThRnQVSLQ70Bv6xA7kqFONOjp2pK2AKQZnIzIEKc1+JO
	GU8A==
X-Gm-Message-State: APjAAAVj3lWapkP44u84J2/uCJ9e1BvSJesNbcgX3H2wjXmW4DGly5vg
	CPJiojZE8Q9FLIs9+9Z1Hz8BECXIZpA=
X-Google-Smtp-Source: APXvYqyrETCYjWY3tsFs34s+7LD2pKxPGHtFTz1NefUB1l2FUL7AT1oEH3TDEzon8y0up9n6/eFFPA==
X-Received: by 2002:a17:90a:8002:: with SMTP id
	b2mr25195754pjn.0.1569818894471; 
	Sun, 29 Sep 2019 21:48:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:16 -0700
Message-Id: <0b73e48c64cb8e651c81b19ddabdd108e4024697.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 21/54] qemu: fix CVE-2018-20815
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:13 -0000

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../qemu/qemu/CVE-2018-20815.patch                 | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ecf13dc..3de87d3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0019-fix-CVE-2018-20216.patch \
            file://CVE-2019-3812.patch \
            file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
+           file://CVE-2018-20815.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
new file mode 100644
index 0000000..c9508d9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
@@ -0,0 +1,38 @@
+From 8bb018af1a7f2b9965f872a4b1121864e73e1b61 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Fri, 14 Dec 2018 13:30:52 +0000
+Subject: [PATCH] device_tree.c: Don't use load_image()
+
+The load_image() function is deprecated, as it does not let the
+caller specify how large the buffer to read the file into is.
+Instead use load_image_size().
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Message-id: 20181130151712.2312-9-peter.maydell@linaro.org
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/da885fe1ee8b4589047484bd7fa05a4905b52b17]
+CVE: CVE-2018-20815
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ device_tree.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/device_tree.c b/device_tree.c
+index 6d9c9726f6..296278e12a 100644
+--- a/device_tree.c
++++ b/device_tree.c
+@@ -91,7 +91,7 @@ void *load_device_tree(const char *filename_path, int *sizep)
+     /* First allocate space in qemu for device tree */
+     fdt = g_malloc0(dt_size);
+ 
+-    dt_file_load_size = load_image(filename_path, fdt);
++    dt_file_load_size = load_image_size(filename_path, fdt, dt_size);
+     if (dt_file_load_size < 0) {
+         error_report("Unable to open device tree file '%s'",
+                      filename_path);
+-- 
+2.17.1
-- 
2.7.4


