Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id B4E9060B31
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:25 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 37so307904pgm.11
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=PP/acN35dpWA00PfWTLJPhI9YW78s0RknnKxueZahf6sN8WciMK2b+k17uBmucdTpM
	lHEsBXKNgOq3LTJ8kFhTsJqzjU2savtP+Wt+F1Hkf1ITTFXBHhzKRfhKVnhwdqVPB53G
	h+zY9mF+gJdx5t9jKZ529/K9np9ZyUB16rvXZfG0v2py1XUk2s/FmHpb4VdWI4fl/5t+
	g+o6tnQVYGOuoH5031FKBuI3bXj2649hNAf5RdZHeXtsFS3c+t18tE7e/jtCXU6fANpB
	ykxWn4+jFp3AMtH24FAlgzJ39gQAcac9Nz6kEa9RKJ4RUwV+MhRgL5JKk1/XfaTBlBbE
	rGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=Cev2evhAF4XkUUHPx/5ju5dPuTFfxQ3VPiPU+7dVIQaPE2ITgcqqMqVEFJOrRS+st2
	aCuN4Uri6Glqo7lTBQFLaP8D+WAFNF79LXox/UvHNMqr1V9TWVtHYIcHS0ByaUXbHmM0
	AHQZiithjnUBvrG5AAMmMTFmoNzMvZ8WOtaymPQf3FYysD2PINBJDMsFL7a7rKbBT2QG
	wgi1zM4LsRNEjjA7Gf8kbndxfpTcPeQTsCpu/PXyh2kms0o37ZLfrR+CIeKN6mkqPz5G
	xIbhAnn9yTMb5Pr2Fed1btLthiI3t2/vK7rWXUzunSpg/chh4vcdgnIFoC8Qk5tawQiA
	mHFw==
X-Gm-Message-State: ANhLgQ3Nb5+WAzZxowiJxIkBBMTfs14ru1ueilsqRlVTY0RhOypWTz/N
	CXDB7or/RgdBNJlQ6ASptv/FH5cR
X-Google-Smtp-Source: ADFU+vu3V+m47AEbyfOEEhOOfqIn+r9urg8olBj5wDV6vxuO8ThWMUD2SXnDPw1wYNwsh8q7Qjgk/w==
X-Received: by 2002:a63:4825:: with SMTP id v37mr612122pga.283.1583893586489; 
	Tue, 10 Mar 2020 19:26:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.25
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:07 -0700
Message-Id: <350496c3c0b80835cb5311aa6dbc91e4ee7b5935.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:25 -0000

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


