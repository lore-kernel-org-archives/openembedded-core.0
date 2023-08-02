Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA161C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:16:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.14853.1690982193063103694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JnohUpc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso74062935e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982191; x=1691586991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkCP8Fd0Jz79gki+ChLtlejuzRUMD3wKqWF2ou/EaMk=;
        b=JnohUpc6VG5C6BbGRqQ8boOjdmUHW+wDWCuuAE4O1sfQmbBvjl7blll2kGjn7JQEKN
         CGUc6XCfa7APkLIzKVm6KwW4N0UyAyy0TUGkFF7I+v4Ta23gINBLqCGr/0DzWYYdNVlk
         vg2vG0AgLn1NwFAVp/sggtj6KeU5JlBmyxdpIz6AOTY6ItvAC/za8v4yw7lS1dsUZ6G+
         t6ykD7E2hSVkR69VczxOcb/fmHlsgaRrZ/n1uad59PDo42wdUaYt2Gjr74G7ua6VFNv2
         970otnCvjxamvL6vesl3RIjWnrWED+MfZk+x4vb/1EcFBXzapE35rb/p3uCa5Zs0FWxZ
         cv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982191; x=1691586991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkCP8Fd0Jz79gki+ChLtlejuzRUMD3wKqWF2ou/EaMk=;
        b=L9ReV04PEZrTx88tP4PFp5uLaJid5v/kgBYblCbODZPHWIt97jVqkifkRpzRObuPe1
         Lx8zC2nfD9Ujw0QHLaBYBLkWBDBVeZbA0LfXHUwwi9mW333kKiqfFz5hLjvnf2a0z2JT
         13HW8z9qTheqNWNbaJnAJfy6LaP+LOVpbAIFBurUxwAc6Prd3c4aJxOw9Ldbr3pM4dSf
         HpM+L3AWXImAXSxMz84urQhW7sEVaR24XVvHNbxzLBJK2DbzlCuoPWZ6XfY3+i8e329X
         hSoM08Su1LAZdbX0dKsBmbHtiF3NXNq3D/H6JGaHqP0I2mmY5XxZ7VX1Rb8zISD68iy+
         hNkA==
X-Gm-Message-State: ABy/qLbCBbLNjGnrLw285UmSOCa1wqQeYecxQXo1W83iD69GDkG9Yoth
	XNGkPohPpLLfeomr30YaDWUv8g7/sUw=
X-Google-Smtp-Source: APBJJlHQIVaXVuep/IjuCG6ouwoEDpyRWn5jpl43fGkZfNyAqu+eG0BcSGRWewAPpQKzrEJ/6xISjg==
X-Received: by 2002:a5d:43c3:0:b0:317:734e:3614 with SMTP id v3-20020a5d43c3000000b00317734e3614mr5005221wrr.39.1690982190991;
        Wed, 02 Aug 2023 06:16:30 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:ab32:1451:bfe8:2a0f])
        by smtp.gmail.com with ESMTPSA id l18-20020adfe9d2000000b003112f836d4esm18951248wrn.85.2023.08.02.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:16:30 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 3/3] drop rust-hello-world recipe
Date: Wed,  2 Aug 2023 15:16:05 +0200
Message-Id: <69932b78a14903b214fcb19c780d88dccefe4a18.1690981978.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690981978.git.frederic.martinsons@gmail.com>
References: <cover.1690981978.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185395

From: Frederic Martinsons <frederic.martinsons@gmail.com>

we now have more rust/cargo recipes and test that covers
various use cases.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/lib/oeqa/runtime/cases/rust.py           | 12 ----------
 .../packagegroup-core-tools-testapps.bb       |  3 ---
 .../rust-hello-world/0001-enable-LTO.patch    | 24 -------------------
 .../rust-example/rust-hello-world_git.bb      | 19 ---------------
 5 files changed, 59 deletions(-)
 delete mode 100644 meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
 delete mode 100644 meta/recipes-extended/rust-example/rust-hello-world_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1c9c5616d8..202e5739a0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -734,7 +734,6 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index c9c60e16fd..9bf0312669 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -48,15 +48,3 @@ class RustCompileTest(OERuntimeTestCase):
         status, output = self.target.run('cargo run --manifest-path=/tmp/hello/Cargo.toml')
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
-
-class RustHelloworldTest(OERuntimeTestCase):
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['rust-hello-world'])
-    def test_rusthelloworld(self):
-        cmd = "rust-hello-world"
-        status, output = self.target.run(cmd)
-        msg = 'Exit status was not 0. Output: %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-        msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "Hello, world!", msg=msg)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index e05e329020..1fee1c925d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -25,8 +25,6 @@ GOTOOLS ?= "go-helloworld"
 GOTOOLS:powerpc ?= ""
 GOTOOLS:riscv32 ?= ""
 
-RUSTTOOLS ?= "rust-hello-world"
-
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
 
@@ -59,5 +57,4 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     ${GOTOOLS} \
-    ${RUSTTOOLS} \
     "
diff --git a/meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch b/meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
deleted file mode 100644
index f319545ee1..0000000000
--- a/meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From fa40b874f6470ec11a8fd7b0c9909d0cdd2d6feb Mon Sep 17 00:00:00 2001
-From: Dan Callaghan <dan.callaghan@opengear.com>
-Date: Fri, 5 Feb 2021 08:56:34 +1000
-Subject: [PATCH] enable LTO
-
-Upstream-Status: Pending
----
- Cargo.toml | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index 7a2f6c8..cdb6b5d 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -3,3 +3,6 @@
- name = "rust-hello-world"
- version = "0.0.1"
- authors = ["Cody P Schafer <dev@codyps.com>"]
-+
-+[profile.release]
-+lto = true
--- 
-2.28.0
-
diff --git a/meta/recipes-extended/rust-example/rust-hello-world_git.bb b/meta/recipes-extended/rust-example/rust-hello-world_git.bb
deleted file mode 100644
index 1d91109b51..0000000000
--- a/meta/recipes-extended/rust-example/rust-hello-world_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-inherit cargo
-
-SRC_URI = "git://github.com/meta-rust/rust-hello-world.git;protocol=https;branch=master"
-SRCREV="e0fa23f1a3cb1eb1407165bd2fc36d2f6e6ad728"
-LIC_FILES_CHKSUM="file://COPYRIGHT;md5=e6b2207ac3740d2d01141c49208c2147"
-
-SRC_URI += "\
-    file://0001-enable-LTO.patch \
-    "
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-SUMMARY = "Hello World by Cargo for Rust"
-HOMEPAGE = "https://github.com/meta-rust/rust-hello-world"
-LICENSE = "MIT | Apache-2.0"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


