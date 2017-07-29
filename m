Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 70E9B7854B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 08:35:52 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id v190so119741064pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g958lrOuo0xCtf5whtTSDplVeS7m8RLFe6w0kJK0IqU=;
	b=GhqrxrbTKWPZCZRQnyzFvbfbKbtpyT4AU6iATq4dphg5ODeHE1cpaAJ7/lOXl4Nw+d
	Cygo6X/lYIK29IgPkmjtE5h26Ms7xbUeVIwvOvjg+oAAerfr7SFGqXvHpxyal2LfgyLJ
	MEvQZZ7eNo0XpRREdQwpRSqInkA/2dHJVHjxOr/lS+QZNnkSd8fMYV4RYTTe3ur4kwgm
	VI0EUYRhwIVheoRnrjlLZL2YRZBpQP9yYbpmQ4HK0m6LaiAjtRh9/G3hVUXoqOm9Z2yu
	xD9nxo+o3bb6qo0y5QL2QYJ2b/j4lAeftGv9BlUftMvrPvOjaIpX1LRF7mt5IDWGh3Nx
	ABnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g958lrOuo0xCtf5whtTSDplVeS7m8RLFe6w0kJK0IqU=;
	b=SdB9ULR4gxEQnjT1NJIjw1ozan/GS9HD+6WFrIa65L3s9fiG9B4xWRor90Vc3JWB2N
	i6ubACdnMG7/hcOw0WvpLetdRvzkjH/MkoqHLw10g6ztI+rLwzAu+LPD4CJEPj7WFASb
	lRvUvTTj2+lIINngAh62zdNw0UpVza7P69khNej4PxUYDsL2p1lnG2JaKRTC8aBYICt9
	vqiIvGlgZ9r+OCM2ZH6wgA4uK2lnyH/SXmHZhSH7OMTAPgMWtOvsTc4fbXcmYutjmTuL
	MjqOoXfdDLf72reAA3BDh5dxGtcYAjdVoC+jdyEmmi0ub2CHLlAYNr7/IjUZC7X6TiBc
	/uvw==
X-Gm-Message-State: AIVw1107WpKtjAyhUc0O3PHBnjOtmnZQTyWK/hvEOuDxmiin+18q6zn8
	rLim+qLBz+MOAhsJ
X-Received: by 10.99.49.72 with SMTP id x69mr9854743pgx.234.1501317354376;
	Sat, 29 Jul 2017 01:35:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s73sm26396059pgc.73.2017.07.29.01.35.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 01:35:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 01:35:37 -0700
Message-Id: <26f66595557291258e81dd1a1148597293e8e81d.1501317178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <cover.1501317178.git.raj.khem@gmail.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] ninja: Add recipe
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
X-List-Received-Date: Sat, 29 Jul 2017 08:35:53 -0000

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


