Return-Path: <aatrapps@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA16F79C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 13:06:06 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id x64so7313865ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WB2aoqtVw6eJdbGP/fuC2qaONcjijVvSRsW1QupD1u0=;
	b=aEklp4Mww9WnDF4hTD9OREMliHf3p2kP4dY8ZQX+6dJBfaEd4lAazu+Rr/vV/PCgus
	PDsZbsTP2SWRQ+vloAbkvyQE88shJh+rCw4ijhwip03NrkWF6wcCpDhce8iyGiXXeu3n
	57dHwr3w4RHak3kKfPx0TSvqw/lySmvG9PC2rG/Ji08VXo6LMuahcbDClGunROLpeM5j
	rbBQcqTfGOwGA+SN5a9lAU2T5gCFO8uzKF4tWpbjIhqZ8IDItdDLCQlIvFkGfJBvqDi7
	0k/0AgJJJp36E+nQJISDWwryG21KubESwjiLyCylJYqqGinahFS537CqnzDiYgN9yReo
	MUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WB2aoqtVw6eJdbGP/fuC2qaONcjijVvSRsW1QupD1u0=;
	b=n5g7KevWz4zWae878TeVeOG0AJ3eGVNBl1KJiX5uQKHUP7U5AZdrRX5GcPCtz0x5rf
	HJesXoNv3zqWkv9iab9uUuQXj6a8t9D/UzGAPbaq0Xm0C9/gWEV6PISuhHjfVAMvWVkc
	l9OeKDf8JYC/J36jwxZwED5L5vIdPNbyqlyUNkxFC/jA1JwkFDUWutbGSP6ub7tjpcw1
	0O0Eqs3TgcH7TZctR0jfKKjCZZXFBOcMJSc2rUZU+aK9xtVqx2Y31ZgqFcMwKFxRmbX1
	LVDixSOgIn9zg3sWErlkp9d8N9FtAOW1s8PCA9b4q8uAFeOz+R+Qxbk2ALJCRzngFSJ4
	rbUg==
X-Gm-Message-State: APjAAAW4K4QGVLl3GZogn1LL4gRtzvJGCy+8eQlJYTRT3bDbM1RhQjpZ
	4R4Pc/nsk9uTien1bGPgkl2ew4vS
X-Google-Smtp-Source: APXvYqwO9saSzrUdCQ8YmwqOzJ7Rv6fz/ikJyggW1Age5EOx10h9LCTtztTd6+Y7RdJH3A8rY4iyvg==
X-Received: by 2002:a81:5d5:: with SMTP id 204mr15655963ywf.441.1571144767094; 
	Tue, 15 Oct 2019 06:06:07 -0700 (PDT)
Received: from aatir-VirtualBox.ibmmobiledemo.com ([170.225.9.143])
	by smtp.gmail.com with ESMTPSA id
	l24sm5537827ywh.108.2019.10.15.06.06.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 06:06:06 -0700 (PDT)
From: Aatir <aatrapps@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 08:05:51 -0500
Message-Id: <20191015130551.32707-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] devtool: nlohmann-fifo
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
X-List-Received-Date: Tue, 15 Oct 2019 13:06:06 -0000

From: Tekkub <aatrapps@gmail.com>

Adding nlohmann-fifo, a c++ header library for fifo maps.

Signed-off-by: Aatir <aatrapps@gmail.com>

 Author:    Aatir <aatrapps@gmail.com>
---
 .../nlohmann-fifo/nlohmann-fifo_git.bb        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
new file mode 100644
index 000000000..afab2eac4
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "fifo maps for c++"
+HOMEPAGE = "/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=b67209a1e36b682a8226de19d265b1e0"
+
+SRC_URI = "git://github.com/nlohmann/fifo_map.git"
+
+PV = "1.0.0+git${SRCPV}"
+
+SRCREV = "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install() {
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}/fifo_map.hpp
+}
-- 
2.17.1


