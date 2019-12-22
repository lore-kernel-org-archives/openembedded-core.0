Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9FD7FCB6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 04:05:57 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k197so7042228pga.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 20:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T0SyvsKexEQzjv7ANIzPnuJL/nIcevzUrrqeVg4KRVM=;
	b=IyAJhDURljAToudOOt0CpkJUYSW4+k1G0Q1L1hXIAWS0RUt5qEGlgmZsS5/WYgbnQN
	rdGQFkA+3iKI5a2byfVodgE1M6g5l/3dKFPtabD+o0zGWsi7CeMXWUmYSTqIJ8NeSMan
	FrAM77VEyroFk6jLKGWpy5w34Kz0+Gy3CMBnc2IExVSfPxX4Cf+CLbM9llcG7na2HTpt
	++FhBP862/kmVGSCPUOmxKq9ZvSPfRxsA9tFKc1wwDprvsiXssW9bITIttmhhbWe/a7a
	tw3jQ91eIDtsRji1JNNLcBsiRqYq0DAtsZS+MN7FX5BdTdtukfCUw5wNyUNZ3qKhNtY+
	vzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T0SyvsKexEQzjv7ANIzPnuJL/nIcevzUrrqeVg4KRVM=;
	b=ccbdAVSiTlMZW9qxc0iPI0/43BzZcYX1jcmL5B1s9lghaOgWYpaRSvfoz2CeOeg3SR
	X+fmo7Kyq5KA4BXyecwv9rTcyaSA6HSuV0As5489s03zZgCk9jn9QIEl9DFV/SruAPvB
	RTgsGHm1iB/lAwQyEb0l4euRe4tW66F953NWmuUk33WqSi2nfZtM5ehYiE3w5LMTyezZ
	DL7y6EQpOhbdrE00sk9wTbaKwktq7cCFVqUzwsmu26UaQUjPKYX87390ITNvhr+3uWVE
	6w71aJuyqpCgRayAzV2ZfhRY7fic/CxZ9tDzc+FX8rrzk11LATu7QASpo6+9ejQx2j9V
	12XQ==
X-Gm-Message-State: APjAAAUxY9as9aqvT/PYbDje+Dw2Gmk5NyPqaKEI6Z6jSWmlMYVeUZMM
	LvccGcF8Y73aic2T4jGJtgge3dR1PQY=
X-Google-Smtp-Source: APXvYqw2fA0jSEyQc4BhOqyaMl3LwOqiD2c286NOGvxu+HgJvHmga2fdEI5MHlyCnRcEpOVZoS4/Ow==
X-Received: by 2002:a62:f842:: with SMTP id c2mr25684774pfm.104.1576987557890; 
	Sat, 21 Dec 2019 20:05:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	h16sm18988306pfn.85.2019.12.21.20.05.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 20:05:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 20:05:46 -0800
Message-Id: <20191222040549.286151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/4] gcc-sanitizers: Add missing dep on libcrypt
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
X-List-Received-Date: Sun, 22 Dec 2019 04:05:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 8b1d1c94bf..668e14a59f 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -43,7 +43,7 @@ do_install () {
 
 INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY_${PN} = "1"
-DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/crypt gcc-runtime virtual/${TARGET_PREFIX}gcc"
 
 # used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 DEBUG_OPTIMIZATION_append = " -Wno-error"
-- 
2.24.1


