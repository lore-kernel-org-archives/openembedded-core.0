Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.1050.1591681394465770779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 22:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UAx2l9Yw;
 spf=pass (domain: linaro.org, ip: 209.85.210.193, mailfrom: arthur.she@linaro.org)
Received: by mail-pf1-f193.google.com with SMTP id d66so9583816pfd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 22:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0hf2SQ9uTzgJioDWIEI68M9UHevoX+bZ3ZigNTzYKA=;
        b=UAx2l9YwQyXk/Ou+sY7LChzN4rZY0Rdb+yw0roayh8yYLPqDsn1Gq5KP5UtbpYWbBu
         nUFD5Rbgqq+Q5OSbmL/7nwYFH6w0qUiUBn08ICWAOYeGKIYm5ACpmTcpavF/HBO76SGH
         A+EqRrk1hQ+Yn4lWRhXTSk49VlXVuVmPUgxjfA5gfKFlxA5i1JswQEqLDIFVHbO/bUrf
         TlGyGcv4QjAKdgimm83N3xUVCyL/3YBzjGU5U9gLuHCGq6Lg3uUfLJLZtLeyNsqpxWn7
         MwB9yQqZZbaT9UkA3lvJsYTAK9ic8piE1I5rNKrCsiUtb1qpOim0iHBQnzBTBm1LYpxh
         2+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0hf2SQ9uTzgJioDWIEI68M9UHevoX+bZ3ZigNTzYKA=;
        b=Xq3b1UQk4d2rleinTxCoVdNxcv1Q0sh9diY8EK45ZX/kFJ52tl5/LOu4orSAdlafBf
         kRY+O5uPl2jaH/5IB/B5dyd5z1uQj3xMKM+1yI0mvO2J3y7numGaEi9FCnEfxkQeKWdi
         PRZi5y2XS6sW45AlYiIIAi33NRqFpPnUnhGy9vDXsU5e0drc6TL/ZRyTEtAL++acbaKI
         o8yENIWvn3DIF6QGAIFJEN8TX6Sea4ZcA8NBDeOxdtZSI4XfO8FqPsG/iFIv9lzogfS2
         TmYUo8qakZcB2tVFCOe7dmrp+396dGJ8uBOaPu8gF55CkwGDf+nG/E7vumlqGGMNlylt
         nTXQ==
X-Gm-Message-State: AOAM530Xeon2g6GQlyXO/xsUc9dgCvcwZQI72ORaRlWAZxKL69Gfab1S
	3JYRZfY6NnOaO6fgQcZnfX6g4Shixx/gSg==
X-Google-Smtp-Source: ABdhPJyvfQ684sywHB7LmBfy2VQXGDdexyP9WCvUZceGVrjEGgMCQ+mBdJGmGmYYzpav4g5riiJ9/Q==
X-Received: by 2002:a63:f854:: with SMTP id v20mr23752380pgj.0.1591681393611;
        Mon, 08 Jun 2020 22:43:13 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id m7sm8753337pfb.1.2020.06.08.22.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 22:43:13 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH] igt-gpu-tools: add new package
Date: Mon,  8 Jun 2020 22:43:05 -0700
Message-Id: <20200609054305.183149-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

igt-gpu-tools is a collection of tools for development and testing of the DRM
drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../igt-gpu-tools/igt-gpu-tools_git.bb        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb

diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
new file mode 100644
index 000000000..761df1cbb
--- /dev/null
+++ b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "IGT GPU Tools"
+DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
+
+LICENSE_append = " & ISC"
+
+inherit meson gtk-doc
+
+SRCREV = "${AUTOREV}"
+
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
+RDEPENDS_${PN} += "bash python3-mako python3-six git net-snmp"
+
+PACKAGE_BEFORE_PN = "${PN}-benchmarks"
+
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+
+gputools_sysroot_preprocess() {
+	rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
+}
+SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
+
+do_install_append() {
+    install -d ${D}/usr/share/${BPN}/scripts
+    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
+    install -d ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
+}
+
+FILES_${PN} += "\
+        ${libexecdir}/${BPN}/*\
+        ${libdir}/intel_aubdump.so \
+        ${datadir}/${BPN}/1080p-right.png \
+        ${datadir}/${BPN}/1080p-left.png \
+        ${datadir}/${BPN}/pass.png \
+        ${datadir}/${BPN}/test-list.txt \
+        ${libexecdir}/${BPN}/benchmarks \
+        "
-- 
2.25.1

