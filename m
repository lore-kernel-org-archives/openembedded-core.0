Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9247C7FDD7
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:35:02 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 195so26970093pfw.11
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=E6F6Vy70JVFybxOsflMH/4VKze+V8qWVvNUtMnzrFXTZkd78ML9QbZ94JLiiCiVNIP
	ETtNyZXn04pBQIv19TIXdqBetV/ldWN0IMDGR8ZqzUrsRd4o1EDkIjtUwEqXQ+QmZfCU
	S5dGwd2bBfB4W5+DUtAV9HMlrK5bQmn9IXj/r8+kuRhlXh9LVg6H9/hqIDnDFLr+0shz
	l3KcS03BiejnOxITYSVMSToQhkieCmWp22lzs/xh+cVv7E3h/zWYtK319VL/ytAKKsv5
	87dseOiUEPgZScwEljP9WocQviu86aOofBipzscZ26ncNnPgclxsuqeqoAcKqZpV77Sd
	Fg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DKyCmoyaKhp1vlq9xulHdsr8Nfai2oFDqoaeUjwQjyc=;
	b=gMqnkI73bGIVKTjhtuF7TlbyNrhTJkPyLOKYr04bnSD+wTJKjBj4km3SjkkkrzOOFX
	zO4Yyp2JseVpRzK0aIjjOIQGMKexWQUIZ2KAgofMTxEU0JmHIdX1m/89+9hDVK7jyDwF
	FGDXqWlyMvxVgC9Zl+dEE4mLJ7wwe/zMkIy/pDF0P+Hg00QJRZEL7BlfS4Od8HaQfIfn
	QimPHRwPxv7DQ6l6ITlbfjLduHGEGBHOZgb7FyEXL1bwq7b+sUs73EdFwDcy2ERar9be
	IUCvApP1Us6Zy/AfMpo+oRoQ0IByF/OQp+v/kI69xZwQrqorh0+MBLK64CF88cNJzgQ8
	gJiw==
X-Gm-Message-State: APjAAAUzyyx2/1ylNlhfMdpFpKhD+1pF0pkMx1dJfo/nDutlURd04+wS
	0XlaSTQG52hHF7X5lW5TXrREz5Qx
X-Google-Smtp-Source: APXvYqxXn6J9wcLA98YFkM8+rg+24xPfsWPTfx0w0ClfA+K1AesiKsrFG83ZGTenvowrvxGrev6QfA==
X-Received: by 2002:aa7:95a3:: with SMTP id a3mr115370176pfk.193.1578364503612;
	Mon, 06 Jan 2020 18:35:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:31 -0800
Message-Id: <8a25a3ecc4a4220c996ab91fb986598de7d1e917.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 26/28] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:02 -0000

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


