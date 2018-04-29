Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 811E774639
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:42 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i29-v6so4908156pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FVSh+HMUfB53l3u2iev7PAPk2oMLReQtBeKA0bW8sEI=;
	b=Ot4Uf3/yB3mrg5MF4LKzuMbaq56eR4LPOIz8tdU4PHOjc3qVJR9Kh1hEWt9ggGedGU
	hQ6xLaSYPn9KVEePscMXECr6Qdu8Ze+QYPZHNZRAeFS9A9fiz87Ye+WtKUD35aVrUMEq
	TgPd5TBZAfarWOMVSuotPR7mAxGVMk2FH2C1+8rnl4/q0DMcisGG3diIWmQK3YV6GNnK
	+ekpCvEUuTo2NJlD079djxEVW3Va+j1tkV97CBgndyqpa+uPGjgpMQSfaAyQyl8OtAjz
	JWsZp8fEs6nD+r1MshP4O5NkRJ+Z8vJuIWIqYfXzTD0hihc74eN9VtN5L7cwFkmPfUMA
	ugow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FVSh+HMUfB53l3u2iev7PAPk2oMLReQtBeKA0bW8sEI=;
	b=dKdCMZsR9k2tzHTdSxoXD8gGShnlC1xKmv8BJV9gGK3hzB/n5iBQbuDyyGuph/KkRe
	VwAHzsbztNnrHRwMDS4Ujfqu34yoHXPMskKixr5LZM5Q6ek/ET2IUvGXcRaz9wW5cr7T
	9FlB+YJzX6PlN+2DxBiHaw4a09fEFM3NVMgn+QEzgfAwtXLYjU8iy1UFykhiLET4xy4a
	C/NUui1Z3xbM99uzkdXuiths5laUxP8zg/nz8mfr0HyWCMIWeaMMoDa5kdKYh5FrQTyn
	vrDc1TFgHZrCwSyYhhLZ20I8TbxXTMO/ImlsVtfK3w+xpqLocDwjCPz2OWGcxrkx+ZEH
	ivsg==
X-Gm-Message-State: ALQs6tA3XAT1FN3C8SKXm5OeS9Gp+bl6lOIUWvyThmm4rI/hxq53m20y
	nyEJKKuZWeLl6vjmsY3BL+6nXg==
X-Google-Smtp-Source: AB8JxZo/Pb0FSxaEC+tcCV4O0j99kwSPa6Yk4kw/c2A5OWIFtJOAQbOiZRLPN5qPfMog9tf57LTZmQ==
X-Received: by 2002:a63:91c4:: with SMTP id
	l187-v6mr8133652pge.261.1525030603237; 
	Sun, 29 Apr 2018 12:36:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:09 -0700
Message-Id: <6e6015dc7ab903419eb768d62630be137ac65ad8.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 22/24] libnsl2: Install into /usr/include and /usr/lib
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:42 -0000

Extend to native and nativesdk variants

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index c6ba80c943..c3a24face1 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -21,13 +21,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext
 
-EXTRA_OECONF += "--libdir=${libdir}/nsl --includedir=${includedir}/nsl"
-
-do_install_append() {
-	install -d ${D}${libdir}
-	mv ${D}${libdir}/nsl/pkgconfig ${D}${libdir}
-}
-
-FILES_${PN} += "${libdir}/nsl/*.so.*"
-FILES_${PN}-dev += "${includedir}/nsl ${libdir}/nsl/*.so"
-FILES_${PN}-staticdev += "${libdir}/nsl/*.a"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


