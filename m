Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id E84687EDF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 205so288899pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=VtkKOs+/YEycuw1zN9cbf8pfw/tpE/DSNJkGlCzmWc8l3NF0dgjXy0oayowqPCNPLm
	qo3S6h/xFYiNAGOr5rrtuYykiFO2uDPtgmSP29VPwI6FpSf5w5mGDNobXuth/l0pR0RJ
	yosdWnqDzGv5Zpw2v130p0FkiSGgF/NFjh2BU25w8fATumR5TBj0E3duHu75x3j4SXqY
	eXx3pwulGNb8jXkR/30MnZ447r2RL1HKeqXEcEbc7aS6PzlCqv3I7+p3dRLmw/1m57Rf
	zkSwH7/MK3LqBwC01OugpsszF5h6Le6dUaB8RtSwCw31MRMnL9IxFUK1cLTo1hkZcVik
	jisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=SUZzXwCLcpbj9c5J+z9gVBV24iwjjbiQsQZgY7jcJjvnUWKoifDZKU5jHv5H03nql9
	2MG1VvUWjaaOpVKk3pwbDEZ1JvGfQzFcNals5jPc8bdKZb1pM/M/QTtlW0QhOq6YHh02
	DbrGis+SZ+2IAB4+z9UbhIV0FkVFiyh2RZLd8LrWg5eQHApneeUeQ6sY3ncL4uXabdVP
	j4WqOe/pOJfR3zu/HrC6zOSlvFsSf3CZSS+C6irlxI7o7q0NGzuFtVACyfB+kilhHeAk
	FMQp1sWjzj2uWmvMfX7zpVi7zW3CQlrrRg0KeyxPUpAEQzUSwCckAgZIcuSTFX/ECB6E
	4f0w==
X-Gm-Message-State: APjAAAUHMwDUF91GIf/M/6usJBdBExFRLoYjvHhYoHJJRty+vKyPr/q9
	jAsp1CpMRW4HcfKJopW8CUhA/SA6AWM=
X-Google-Smtp-Source: APXvYqxasMd86Ne0wszI2dHewvy7R5eElO6+FqvxS1yJ3th7i5gKnJl5fRo2J/Fxe+TxWrABnG/Krw==
X-Received: by 2002:a63:904:: with SMTP id 4mr812033pgj.36.1569293395833;
	Mon, 23 Sep 2019 19:49:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:02 -0700
Message-Id: <0e1aa222b85048768c620ebf78d533311e138488.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 22/50] qemu: fix CVE-2018-20815
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:55 -0000

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


