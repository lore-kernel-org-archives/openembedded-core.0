Return-Path: <aatrapps@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 388AA7C2F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 15:15:57 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id e205so6227634ywc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NQX3wUX2mOAJIcEhqidCPdIaQpYhb2ieMS8QjJ4SOnQ=;
	b=IEaC8B3I/vlEO//Q8upOwISm3Mpke+I9JvmjwBWmilyxIjFiqa73j5kmMh8QBrZzdb
	F/XlxrWk9S72ayIvDalzMxIvRCNf1SCOeCKZPSITudU5ReL/7vJ7ZjqMYckfshb4RDvq
	j1q5JUsDiERfolO6TnyQeGbS9QJ9jaIacaISfO+OyglWFDIFOptsBlw/RRJ3AA4zctLl
	XJddRhmlKwOi9QNVZX7lskaGafEqYBMeT6UR7DKyeOQM+6RfKrHWI+xPhqG0rnEmnYoU
	7CzlnBU/cE6ppp2pvswlsiDVYb1xDHwqG+8W770/c4u6j73R6iQM2T2taZ8i152dEsqn
	u4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NQX3wUX2mOAJIcEhqidCPdIaQpYhb2ieMS8QjJ4SOnQ=;
	b=VjOfTzZ3uvoiH9zRb60M8ReA1bgXB1cSWcVD09ZDNbI5zGUJBvbkDoQkLkVBSq/lrp
	LpBP3pqgYMKDQIbvWGalkTDxHhut/pesZLGuV8YLvhMQFqvd9PJX2Z08OFUjl5TQ2piA
	XP0NiQYU43ky46zS/Uh3iiwOZXdSI/CMKOblUSCnW6Nz4ZFnllKJVQSj4dyeep9KKmDc
	nyNLtI+m5bewm1nak1//WtIxkdrHx+kjW9wEXyEWAV54d/In5wePn6xkmir4cBpJUftI
	PiwcsythgdJ8k3K2kPKHCgdq63I1B/GRQkUDk0h2bYEB9U1cDStDuBAfO1v9xwhUMrwZ
	xYpQ==
X-Gm-Message-State: APjAAAVJyUoMCv/cOJIL600bPMd2hgGLnUFxnN+sS5Or25fKQUi2PmdG
	coNt5ysFEplLSjW0Y5ONi1Rnen/0
X-Google-Smtp-Source: APXvYqxroMBpZ0AdBfikFL2fLATonJ/GfGo7b5TM2An94Kdjrs+zw8PguELyuC8RLsQSS5jj07bh4g==
X-Received: by 2002:a0d:e987:: with SMTP id
	s129mr13920853ywe.111.1571066158425; 
	Mon, 14 Oct 2019 08:15:58 -0700 (PDT)
Received: from aatir-VirtualBox.ibmmobiledemo.com ([170.225.9.143])
	by smtp.gmail.com with ESMTPSA id
	l11sm4462764ywh.34.2019.10.14.08.15.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 08:15:57 -0700 (PDT)
From: Aatir <aatrapps@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 10:15:49 -0500
Message-Id: <20191014151549.30432-1-aatrapps@gmail.com>
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
X-List-Received-Date: Mon, 14 Oct 2019 15:15:58 -0000

From: Tekkub <aatrapps@gmail.com>

Adding the nlohmann-fifo, c++ library for fifo maps.

Signed-off-by: Aatir <aatrapps@gmail.com>
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


