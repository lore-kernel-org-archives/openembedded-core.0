Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B2929605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 16:08:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f125so43948350wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RATAI+5rq9Mg6wTNuj0f1VrpBVcY/oHdBDOkz+D0mUs=;
	b=NoBwJugHZuL25C4kuJIxEFNeczE0/i/xPUwDB4jNbXAILgl1Qkq0kYd5ZUNOIbx0YE
	XKxQ7ByoZMrBeeFZptgYbmdJVcimrz5+yRboZkMDOtlfwKqYIyp9hX2zS3yfa+OjQKiZ
	LMY+95EL2vMDn2xDYy8m2X6Sl775QQxuqbg8I/HFy6ELgAvRkNrcR0TRE1EAg75izD1k
	3VLBX/Ce+/PdLO6NRn//6E04gIKwWf9aMbMpSHRbzBm/t5LUBNuyMBTijkLFVIWirtg0
	0cSmJqbkdwgHQFL6svXBJ/+znWglCkzpIWyokpmcJRlnwsd1gAxZWp2PTsHXsCX9zpBQ
	/MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RATAI+5rq9Mg6wTNuj0f1VrpBVcY/oHdBDOkz+D0mUs=;
	b=Ey88vTc/tZB2ptQ/SyDH8hZzDVzJbVk5S9vGxsppwbKDS9gj8uv576hBtEOXd71gL2
	DUQQw9zjxLRBeLOTosmS5cf2W1+l3tmUZadXgCzHCwblQVyPufdz86lyVmoR4Dwh/I9c
	q4TI/TPb4A5H2PJWjfIlBzYPeONhhijDr/BZnCwiUyr4MdVznErwTnD7sIBafSmABU8n
	nYreS6SCc20MLnnTxRJGgLH4U8EbiuphUzucb4uhUvfY5z4Wrb7mMi7ZkuPGcv1zw9WG
	iBNhTGoYql47G+45Txroq89KD5zFXbWaf/GO/HOX8Ku6dbQ1AJXoI66WPfwERnaFFbKj
	qkuQ==
X-Gm-Message-State: AElRT7EOccEgN7yomGKU26MBp/NW8VCm3lFoj00hCcC3ldG+lvv2V7aU
	qQVByiwlCnlYM1lxKOgmS9A8lqry
X-Google-Smtp-Source: AIpwx494bT8PFVlAn9KSLdmBUz9JCxOEVGp+eudx/rl/I+Z/020vMrBzlwwmt1zCSTW484ioGgqwRg==
X-Received: by 10.28.159.68 with SMTP id i65mr8523076wme.27.1522858135771;
	Wed, 04 Apr 2018 09:08:55 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143])
	by smtp.gmail.com with ESMTPSA id 14sm4923984wml.41.2018.04.04.09.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Apr 2018 09:08:54 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 10:08:49 -0600
Message-Id: <20180404160849.21578-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] gcc-sanitizers: Update supported architectures
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
X-List-Received-Date: Wed, 04 Apr 2018 16:08:56 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

aarch64 has been supported since GCC 5.1, sparc has been supported
since 4.9, and S390 since 7.1.

Also mark as broken entirely with musl.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 3183b29dec9..3b7e0028f2b 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -61,15 +61,19 @@ RDEPENDS_libubsan-dev += "${PN}"
 RDEPENDS_liblsan-dev += "${PN}"
 RDEPENDS_libtsan-dev += "${PN}"
 RRECOMMENDS_${PN} += "libasan libubsan"
-RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
 RRECOMMENDS_${PN}_append_x86 = " liblsan"
+RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
+RRECOMMENDS_${PN}_append_powerpc64 = " liblsan libtsan"
+RRECOMMENDS_${PN}_append_aarch64 = " liblsan libtsan"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 
-# MIPS, aarch64, and SPARC are broken.
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
+# Only x86, powerpc, sparc, s390, arm, and aarch64 are supported
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
+# musl is currently broken entirely
+COMPATIBLE_HOST_libc-musl = 'null'
 
 FILES_libasan += "${libdir}/libasan.so.*"
 FILES_libasan-dev += "\
-- 
2.17.0


