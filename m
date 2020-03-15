Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 62CAF61B97
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h8so8278105pgs.9
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=SZOgd5Ir9lvAYjjJeK2KbOjsNxRGfkh5sLsn8ACqPeAc1oRstgzNy17D9Tt9bv9D1C
	AIAIsrckHeL63Iur/Y8R91M0UFPaVq0H349L9vZWMabbNqNQDjft3EJn6o3vL+hNXnuU
	7WGd4j+cD0XT/2GTZyAa3QSBMBLmOIqRcaXdU+Mc/AwTWdDeqGLfvzn3f3TWI1L7vyFT
	MmWmPUYN0VIzDcfSzzTiqx6gEpriKyi6rqIQkuPWKW3wO8v0JgHkPHAyPRmV5PpEjxLC
	QYsZyDESU+43VYCB4QwLqaVIRy7zDPrjVMdXXmXWPe41Y3w1LJGV42D5j4WhEaWhj8b9
	OglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=TkGOSTmRXdeQ+qf4g875YNMWfjMmvW+R8fiQ6O+U8DYMaBgOFjkkZxxKwertpqXPTF
	ApqB1bvK7ll82Hvci0Gzqf3u+pS8q3ek3bm+uB6kAA9fgt8WUN8Yn0EMQAiPCPU5zNU8
	ClQYs5rYHAjFaqTJFZA9ObAPNbpjeY+mdFuTaskUlXXgLuSyce/mu7tqKPCIeTqQIl+l
	Kb43dFE/S1/nPH3UnnsxjX/vQozrtXzYSaDiL23cwwnnLhDjmPteIOOUviIrOcwz0Qmx
	HXPVIdLy9O3C7yfLfqJYTDt9i7my58egzUUr3240RWE2aXBtLj4ssfJAS38CVreLhgKN
	23xw==
X-Gm-Message-State: ANhLgQ28yJan4Ql8w+oZQZz36CqTuS9JA5vqucyeU1TfqsYGVeNyHhKy
	zI6wrIopP9hrRLI5yDtgoBBZ/b0h
X-Google-Smtp-Source: ADFU+vvlMejN3MKpuO21Ik7qz9oUvI0pnDpG3Um3c8Gdh7MhhckLkTPNMCzY/hvsIrKsFQmfY9rR7w==
X-Received: by 2002:a63:5011:: with SMTP id e17mr23108816pgb.338.1584295927253;
	Sun, 15 Mar 2020 11:12:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:48 -0700
Message-Id: <350496c3c0b80835cb5311aa6dbc91e4ee7b5935.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 06/16] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:06 -0000

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


