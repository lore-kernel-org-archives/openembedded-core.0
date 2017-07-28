Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id EAAB878466
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:56:16 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id c14so13875314pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g958lrOuo0xCtf5whtTSDplVeS7m8RLFe6w0kJK0IqU=;
	b=Qn6pkB+AcHlbkoCBdrp8+eeFEJtrUnRc99VLWlFt0ySK1vmvs59tfX0eM7RlLus51Q
	dG8x10f9OvHZ98eFemL168sU9z+jR2wrW7nzn4o+JfHJI9HgSHFySHDaREcYAdyT7OZh
	FHPw00C0WBeZkMq8hjv2wrQ5i1fm0if/4tn8JQ6G98svm7TQ06Nmds96xpdrWqU1DLvA
	rDl37ZJarLW0dP7+QrFFZafxp8iB/ffhvPPl8vQjrmBi3f/pe6Af0hCgU6JA78G+jJlH
	GwBJV6bZXTwcPWdlYghKqPkG8l1LHTLePk3VTIqiz0hC/2jHKkC7YU+5z76uPPuStSbf
	ww3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g958lrOuo0xCtf5whtTSDplVeS7m8RLFe6w0kJK0IqU=;
	b=EUqOj8DTk+eCGbLK+nK/OcUKQROhWo57OAmxHw6oN2kvnQoE/oXs3QqnUSw3ARSCWR
	hH1o2Sf2agLgAd0K6EdIshcU8oJKVbfNVZ8ykxeEhTY+lf70+24k/WRyQA7FLg9u50EF
	LD+rwGCWTnYxJnk7cAnSUVmEksPuJOdxuKfsn5VMYrL1Lehn7p9R15tKL9kE1LmaiPxi
	L6PWqGWqDy0d/K4dzOF50LPS3hBxImY6ZHxSi85AzxwSRrB+cXDXkp+a3rvYIvCeS4Dh
	q2AUxwKIjxVXjZ6+5eGj8ugztTMt7GlyYJiKLXYMN3fYUuCoipylHYP9b3E8v1NdSGwL
	u4xA==
X-Gm-Message-State: AIVw112GOOcnDtabPBZdwbmvDqbbajlXRpM+j/SxS4Jrsb+HZia95k3z
	x5EyDULV5XVHgiq6
X-Received: by 10.84.177.36 with SMTP id w33mr6910919plb.302.1501217777746;
	Thu, 27 Jul 2017 21:56:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	n80sm39912188pfj.118.2017.07.27.21.56.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 21:56:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 21:56:06 -0700
Message-Id: <e178ab56ae1af5a5b840e933c74f8a10a4e3c794.1501217624.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <cover.1501217624.git.raj.khem@gmail.com>
References: <cover.1501217624.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] ninja: Add recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 04:56:17 -0000

llvm is using it, therefore move it from meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ninja/ninja_1.7.2.bb | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb

diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
new file mode 100644
index 0000000000..20dca2f0af
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Ninja is a small build system with a focus on speed."
+HOMEPAGE = "http://martine.github.com/ninja/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+DEPENDS = "re2c-native ninja-native"
+
+SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
+
+SRC_URI = "git://github.com/martine/ninja.git;branch=release"
+
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+
+do_compile_class-native() {
+	./configure.py --bootstrap
+}
+
+do_compile() {
+	./configure.py
+	ninja
+}
+
+do_install() {
+	install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.3


