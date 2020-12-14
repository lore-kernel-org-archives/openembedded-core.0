Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.35814.1607956674801030117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DXW322+5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id j1so8724999pld.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cQbgro5r+PHxPfjovOjkwUMr6vfg6Akj+D/qQNHHtfY=;
        b=DXW322+5XkJPmHn8RWyGrqk3ugfcF8xjE8Yjxx7fQykzR0tS09SzrHtGWeBxzr9+HZ
         aj6WlXj2E7BfrvkkY77PxOy7xDdVWEzs553fvdrLNeEtdNkJNJ8O/0jtkm0KWIYi4oCs
         9BfzNcn6fqbSozfsVgYSzK4owKTVFVLxqFEVrkmBKt8yd4dTbKThfwoD+7HCD2XLOwE3
         WQi8BeBtTuhrHuC3J9MbTuFzX0gRl41h15GecDUN9/zp4QghowZyp+4dksccRn5wHEwU
         hjg9r4y4myIwT396FLioqcuoL17iIH+L/z8a0ohSN8yS5jxSg82gjG+FUMwCgf/5SPNp
         Vdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cQbgro5r+PHxPfjovOjkwUMr6vfg6Akj+D/qQNHHtfY=;
        b=WmMsb+3b4k+ZQyVBQ0WZP5xiI+yMjSCLm51KtG5hpHX2IwtgkE0v05nLMZ71F1ebx7
         Sqlh2J/pJEOBb+vmGJGuOe0NTXWNDkKW8OkJ++FEAxM0q28RSkfyhHc2G1tbwC+sHEtd
         saomawD7bxoU/1IckVXLU+EA8/2dx3edym2bcvdByjANZ05CdthQtf8VZlqDu5PZata9
         7HjYnNz8+mWc/LfSNT/nD3bsV4uIosdIKJh8MidHYE7JnRyv7ZYzrV/HPRb0fDN5d8+9
         mbQxgula9t/yXJA3Cp5z7kd48Szzsd2RPU1b9twqeqf3xC61jZWz4y8J7cd1RkQVWTJW
         Mucw==
X-Gm-Message-State: AOAM532W1YFeYTLODCeT6ZGVlTI07R4P6B7VhPoHHWg7uQG5wG9VYfpD
	opbBadkuTjyncJaoOnVOrK1D01AIiTEWELTg
X-Google-Smtp-Source: ABdhPJzNrZlwoIwXYNdHOX1FCRma3fpoLUelkCisV9UyF5UGvP8I7CCaLpGKd6QltBtdiZcA8kcHWQ==
X-Received: by 2002:a17:902:82c7:b029:da:cb88:38f8 with SMTP id u7-20020a17090282c7b02900dacb8838f8mr16020404plz.49.1607956673934;
        Mon, 14 Dec 2020 06:37:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/25] llvm: fix reproducibility
Date: Mon, 14 Dec 2020 04:36:45 -1000
Message-Id: <18004b4c1b2d595d081888437f6f9cbcb02bf746.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a467c0a03d077861c37e317dcb2905b6388cb64c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index a8607f5008..6ea1b80e1f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -101,6 +101,11 @@ do_configure_prepend() {
 	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
+}
+
 do_compile() {
 	ninja -v ${PARALLEL_MAKE}
 }
-- 
2.17.1

