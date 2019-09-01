Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFE97F41C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:44 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p3so5923495pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=q4i7TdiZ9IefsoUz2+U+af4a8ZSAsEco7Ez+74TyBy09rLdzfe7w3cBuPDDfspdxIR
	KPBEM9/y6nhJBtRP6s5sVFRTftdEimGTBHsHRaiy/1WeF8T09Qw9z9jv8wg1JAKuKYIo
	bTGV+HfmjlhcJIX5FRZ6g4NQW20h2mDxY6TXalLdnczMW8qllM7bVAV0+5lozJe6VVp8
	bu75guTwpczyNlNE1Mq54EIaSUFkJpBgVoxqrXEG4IHN9kFgbFUVYTnb2DNL9xvQknKB
	FQiW9Ncuuj1fHUy25paNcpiG/8e6cZV9f9zfcUHum7uMz7FbK20Ro9DmaY+AHVoumQNd
	+0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zYK2/OWI+OvpgR99xeIyzaHyNNfFmmyvA7PkqIrTm5g=;
	b=drAgIk6DJUq/vMfYvL9EXERmsd0F2GoNz24MnpMMk8eFDLoGSadO0MrwG4ZJVw5E3o
	EOA/C0X1Phd52WYIPhprpR3OnGvatILnka9WnHbhZUf6C9+pbPpT5xtndnPJPbEYHObA
	qPX4U9MwoH+VYEQoHyScgUxZ3BI7XivkojheCEeKQmXcuO4zAL5r4aX2BTFmx956EOIB
	m85+HRTBHZLCNdcVKuATif2X/BlNyvJA6JkF5CHIiVq7yu7TZR2UAakvlAvKZpzsDOcE
	P7EgZVxxfbHCqfavjLCzW0uYilwwOIGqRY4V/RWks7ieKKpeNOXFKRocDuWLih5r4NuB
	hNpQ==
X-Gm-Message-State: APjAAAX2qhJGrnihXDynhSYJzif+QTBUVBryv1/MbS7kLL9HBjhN6CXD
	O6vM+I/spqKYfb6Du4XtZW608sQr
X-Google-Smtp-Source: APXvYqw00W7YNZbrVvTeE55YpWn5PfvVDgtvqlh5jQZ0J8hLf+BiAmd7k21A/dNcDwf1JuK68VUGoA==
X-Received: by 2002:a62:1444:: with SMTP id 65mr28993497pfu.145.1567348605972; 
	Sun, 01 Sep 2019 07:36:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:00 -0700
Message-Id: <0e1aa222b85048768c620ebf78d533311e138488.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 22/43] qemu: fix CVE-2018-20815
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:45 -0000

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


