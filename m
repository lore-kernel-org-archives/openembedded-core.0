Return-Path: <danielhilst@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 20D8677414
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 01:49:31 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n204so13799620qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 17:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MapkRl8bp3psFeDUsMADXbmE4RDY3S+kgMxXzc2Wv38=;
	b=a1lcqEx5Xk2wffh8Ht3ABT31aXgiJPstkTiE7d/0yWKbIzQrWsP/7XMDbG24tzYwZ5
	46YZJ8x6bBXpt6ZBcKjgLyEjENypx53+NRLA3xLCk/QfY1B88T09C0Na9TKhflL4TIIX
	qWByRRz53S/L8YRi5BjYbptAWCgxd7CfHR2rIr7k2EXY7qYbJJZv90zw/GUUeaVPOLPS
	Gdjg9Y8/i0NfeiaVN0rZRF+WAQVCOYSFxy88qvoXA9YQ9kXhU74tJECJ8I97t3eF255+
	FrNIGSckCGfT5n83YdxZRQY6B8Lg7i0Ku3njTXzP980BIlUsmgyC1BCpfJSLrCEdwBjm
	eyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MapkRl8bp3psFeDUsMADXbmE4RDY3S+kgMxXzc2Wv38=;
	b=ShQULbmG57Cps7BaOSD1NDJTPtHd95/fUwFXGZtQhk59C77oD6mpsQ2vg905X1Vbfq
	WWJw3npaySok1AUS5gw88prp6+k7pmYGHpLll7uvFcug7PnvN3OWvSl46raDRNYWvurW
	Qew7JgyyqZQ8DkzoSDjun6dT/xA7RTbEl5mSoEt80rkjVLf78zZ9yzae/4PHnburTXc/
	fJnqZZZfX9FrZ/fp7f8HoMNX1AULN81ny20D8/7Dh6AKOoVxsWH7Ik+LlMwvvKzKZIxd
	gp1nB0xLhcg3Yd5my0Jrx0Ukcxt9kIQimELJwcwrnuBAyg71K6NA2IZu7N0er/8j3EkM
	SnhQ==
X-Gm-Message-State: AIkVDXKpPeHKqOiybLcd9yxi0h/qS6v6ievRoN2cXvuUPsGJRhHTWMrIZ2SWi/wCbIxIFg==
X-Received: by 10.55.18.30 with SMTP id c30mr6623537qkh.213.1481939372942;
	Fri, 16 Dec 2016 17:49:32 -0800 (PST)
Received: from localhost.localdomain ([189.29.217.33])
	by smtp.googlemail.com with ESMTPSA id
	r8sm5080119qtc.32.2016.12.16.17.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 17:49:32 -0800 (PST)
From: Daniel Hilst Selli <danielhilst@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 23:48:05 -0200
Message-Id: <20161217014805.6120-1-danielhilst@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] Add cxxtest framework to devtools.
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
X-List-Received-Date: Sat, 17 Dec 2016 01:49:32 -0000

CxxTest is a C++ unit framework test that doesn't
need precompiled library.

Signed-off-by: Daniel Hilst Selli <danielhilst@gmail.com>
---
 meta/recipes-devtools/cxxtest/cxxtest_4.3.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/cxxtest/cxxtest_4.3.bb

diff --git a/meta/recipes-devtools/cxxtest/cxxtest_4.3.bb b/meta/recipes-devtools/cxxtest/cxxtest_4.3.bb
new file mode 100644
index 0000000..2915011
--- /dev/null
+++ b/meta/recipes-devtools/cxxtest/cxxtest_4.3.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit, CppUnit, and xUnit."
+HOMEPAGE = "http://cxxtest.com/"
+LICENSE = "LGPL-2.0"
+SECTION = "devel"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/cxxtest-${PV}.tar.gz"
+SRC_URI[md5sum] = "b3a24b3e1aad9acf6adac37f4c3f83ec"
+SRC_URI[sha256sum] = "356d0f4810e8eb5c344147a0cca50fc0d84122c286e7644b61cb365c2ee22083"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/cxxtest-${PV}/COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+S = "${WORKDIR}/cxxtest-${PV}/python"
+
+inherit distutils
+
+do_install_append() {
+    install -d ${D}${includedir}
+    cp -a ../cxxtest ${D}${includedir}
+    sed '1c\
+#!/usr/bin/env python' -i ${D}${bindir}/cxxtestgen
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


