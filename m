Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E65C7F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:36 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k25so24796109pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=ALll2gkV1kIfpx6kBhyY7f3SB/n+awe7ylkGq/Y0+n/vszMbY5pH22MwPFfd41oav4
	cscjlG7HnA7YSqXWhgH/JP+fbDyLc1apdF1kcpZi04ZGpQrhgGAfUlazavxBXPF0A1xg
	7XahLI+yaFCvIehIf3f57nfdyJKGefPseBkDJ9B0VUL/2xerS+EHTjdVYgyFqGES9S9b
	EEb9nQqUtzoQwZgAmk6ooPJ421QcdfxQZU1BUi7CTocjKTAN/bZLi/CymEqyMoS9i4KK
	wsNE7zJbDb0nyoeAmxTYY4Otx4/X3rkwXDro/IqHn4iToSPLyknYxczXkR98SNiErNiB
	jm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=uEZ//CpJnVGEwUKLxY/4YCtV/qTuvKayINiz+ux+Bn7K/psPLi//FVJEQIPdtxu0yz
	mG/H0vhZTe1LvgRkVwHxWi1PdJGZDDx25cPqqsDb5dLQCfSak1qM0XWh672VhLLdyUkb
	c0EPuYU5bcldFdoOkApnCb/8nAOcaMMrSA79dYAGBWqLkB1yyoHAkqZRpS0wHccrndy+
	d/PDmwmCaYkqcCQdB6JXXLrPCpQKZ9pdd2kdZYFLhuK99oO1MCz+0FAiC6CXoqJnJEgZ
	yxuL/cUoF0wzfdnlOpBRW8rE9c2LySjCI+bmgT3eBoHYAW8bHCsaDpV814ci7WQ/gGrO
	Q4yA==
X-Gm-Message-State: APjAAAVWrY1RmRA0qN2bmmCm+TQrKxuDS58pNgsmBxpP3GJrBshaneGz
	PU8WZGKi1SYfLAB8ESo45CRO2uBdzjE=
X-Google-Smtp-Source: APXvYqy2RMIv0zlCmdZslCkY9uK8m5Ks5thO6dHaTFLHCIyo7t+mhsMA2XQTXq/rMwQxO3SXsA/vmQ==
X-Received: by 2002:a63:31cf:: with SMTP id
	x198mr100818626pgx.272.1578155197095; 
	Sat, 04 Jan 2020 08:26:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:07 -0800
Message-Id: <8a25a3ecc4a4220c996ab91fb986598de7d1e917.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 26/29] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:36 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14f14eccf176539493fbfe710b66704feb7710da)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../valgrind/valgrind/s390x_vec_op_t.patch    | 19 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
new file mode 100644
index 0000000000..eea671da0a
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -0,0 +1,19 @@
+s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
+removing it ensures that valgrind can be built with -fno-common option
+
+Fixes
+ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-guest_s390_helpers.o):/usr/src/debug/valgrind/3.15.0-r0/build/VEX/../../valgrind-3.15.0/VEX/priv/guest_s390_defs.h:289: multiple definition of `s390x_vec_op_t'; ../../VEX/libvexmultiarch-amd64-linux.a(libvexmultiarch_amd64_linux_a-multiarch_main_main.o):/usr/src/debug/valgrind/3.15.0-r0/build/VEX/../../valgrind-3.15.0/VEX/priv/guest_s390_defs.h:289: first defined here
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/VEX/priv/guest_s390_defs.h
++++ b/VEX/priv/guest_s390_defs.h
+@@ -286,7 +286,7 @@ enum {
+    S390_VEC_OP_VFCHE = 18,
+    S390_VEC_OP_VFTCI = 19,
+    S390_VEC_OP_LAST = 20 // supposed to be the last element in enum
+-} s390x_vec_op_t;
++};
+ 
+ /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
+    ULong variable.
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 63f972945d..aedaab27b3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0002-valgrind-adjust-std_list-expected-output.patch \
            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
+           file://s390x_vec_op_t.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.17.1


