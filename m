Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D789C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 04:38:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.27699.1753850293252851444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 21:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtNOORRm;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31e41cfa631so6624680a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 21:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753850292; x=1754455092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/vAsGSi7BTINM8nG/WkrSItg22OtIA2qhP5tnZD92Q=;
        b=VtNOORRmMVaD/YnRiLR4jFqr+GSgxUch9Iuw6Q0+IrnWpt9otDYl7CO7tWIWf7+1zb
         utiuJhdr7CWrpVf9J7Rz/FUq0I3L/VDjwXT165kjbMFx5NcKfNDxztwttH3a+ZzdvCew
         YR4qjWFkJisLwu6kPF1LEITPWjjzgemS5kCcLxIEltR+Pj/I8rSz+ddIV6WXPvtGE2LY
         hCk0x6wloQdwkyhpNzhN8QDXHc7cW0KmiapdRpAs91OugRgFUQD1CpOsfkLwh3QKKhjQ
         NYzn/9D4lEgcgVbYLhqnivG917I3Vg+0fTJ8p92z8a7b93MN+aia8McL0o/5ivKyIEi8
         0tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753850292; x=1754455092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/vAsGSi7BTINM8nG/WkrSItg22OtIA2qhP5tnZD92Q=;
        b=iqPeblvFG4MZRIVePYQV7jCT1mNkbmD+3PS6zOvFMbzKpWkO6i1Fr35sEK2/954tka
         eQnMV2G4MWQC/2nEQqAm2zdkaGAzLUw0LjTHKm+I9+HRMdbkZ0F7IXLS5fS2O5ef2i7C
         k1KYEhjr8YXDpY/7yFeZCtzCYw7NElLq3wV04XHtR+u9hp0I3AbGZ8dnvf3mm7NJcY/A
         1vneiITQlxJ2z4QlFabV1rH9LjC8r5xkYv45Q5KPQjxeauLqVz4aJ1PqVId/YENnu40x
         +Wj5EeDM4axQ9aHqihu4CYRTAThtVaUtxvognJzEdtbZ69pVO1kzLp/CrfYs0DMqyoTl
         4VQw==
X-Gm-Message-State: AOJu0Yy9dCa75n8BZzPQgcCdFU1SLsuBKN8NkW3DwMF/4QZwSzJjzYl5
	myRypfhS882IopwfXLCEMg/aBYG439Cn1BS6hNOmhqZoOXrfrJGqh7Ahrf0j5B2zWso=
X-Gm-Gg: ASbGncstWCzpvPuNZ7zd7wE33IFL0PZgtxu/Vrt+MYBP7xvX7k+fCP8MtUulYuQ2cR1
	Krih1Jriso9YTZBelwm8HZBNMRl6WovWArniTzf+g/hwEi3Ih9mIhIpFjm3sdijSzdUWpCKxMeK
	pLCA5xx46zzJ6ao3C74R6I+u2b3SRXBATHkG/o+6JPyLn46Cvg26IA9ly292bqqATpJFhy8ZGp2
	ooClBjbZWVp+HmUJlZLloefNjOXI+k0ZIKxOSfF80SgWkpHqWN6nWdyE8/r7m2HGK0nb7n3gwX+
	hPwUigUIA8jPPDaRHdi2MhKmxrdQk/j0ZVWoBd16O1UAz9RFH5+pwyzflkbw7m4WkORC1uH38uN
	bQskAYRZhv9oRzVfiqpMngFCV
X-Google-Smtp-Source: AGHT+IHuDjHbL07cG4/rSlxdzQg4u1T2bitV4wBzrfW12FqL2G69F+cdu2Q+JoDw2FZmQihyDcgmkw==
X-Received: by 2002:a17:90b:1dc1:b0:31e:998f:7b75 with SMTP id 98e67ed59e1d1-31f5ddb53a1mr2972166a91.9.1753850292170;
        Tue, 29 Jul 2025 21:38:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49ebsm689957a91.19.2025.07.29.21.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:38:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
Date: Tue, 29 Jul 2025 21:38:08 -0700
Message-ID: <20250730043809.1486481-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 04:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221098

This helps in creating relative symlinks

Fixes sstate errors e.g.
ERROR: sstate found an absolute path symlink /home/khem/yoe/build/tmp/work/aarch64-linux/libclc-native/21.1.0/sysroot-destdir/home/khem/yoe/build/tmp/work/aarch64-linux/libclc-native/21.1.0/recipe-sysroot-native/usr/share/clc/gfx90c-amdgcn-mesa-mesa3d.bc pointing at /home/khem/yoe/build/tmp/work/aarch64-linux/libclc-native/21.1.0/build/tahiti-amdgcn-mesa-mesa3d.bc. Please replace this with a relative link.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index ed31de503ae..e508959791e 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -24,6 +24,21 @@ LIBCLC_TARGETS ?= "all"
 EXTRA_OECMAKE = "-DLIBCLC_TARGETS_TO_BUILD=${LIBCLC_TARGETS} \
                  -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
 
+do_install:append() {
+    # Convert absolute symlinks to relative ones (same directory)
+    cd ${D}
+    find . -type l | while read link; do
+        target=$(readlink "$link")
+        case "$target" in
+            /*)
+                # Extract filename and point to current directory
+                target_basename=$(basename "$target")
+                ln -sf "$target_basename" "$link"
+                ;;
+        esac
+    done
+}
+
 # Need to build a native prepare_builtins binary in target builds. The easiest
 # way to do this is with a second native cmake build tree.
 do_build_prepare_builtins() {

