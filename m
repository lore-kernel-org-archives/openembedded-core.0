Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.5878.1609856696226882940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WzVs7S6f;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id n25so21390035pgb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VM3w86vVfpz5zL9w/x9pT3ShK8epxDdeGlBhMHzLA0U=;
        b=WzVs7S6fezFiXJuYoZZ3ov5vsiH54RgJFwHOMgiZHQflKkgfabCb3P1Eu136UwKNth
         yirzjy24Tp9dRHnt29qZiGh0wG7iNJXKB9Vq7YPD6Stc6gAaOT+8Z25vw8Cx90lwW4wP
         qpOwB9yOzZ6VNnDcShqSbnOjLIIalV5Yuj6VBbJePToxQ6mc1AfhK0nED4xVb6F7VtX7
         hiQBEw1DgTey1hxfVuhpOPykxJoIghLfNP4PB72IkM50v2LzvKTIJHk2/rKp/lJgh7Jm
         vjf/NVV3Gr7cIDr/2n7ypu+KXNbbWSWaLFC6jiLiWE7qXGbfLFsVUvi53i0y40TaRkRn
         dLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VM3w86vVfpz5zL9w/x9pT3ShK8epxDdeGlBhMHzLA0U=;
        b=D6gKTkiQ32I1BWcF8IzmNSJ9UT1rOrAvak5I3FRBKgMZ5tyMJiZC8cszGk1M4lFfK2
         k1zi4u9COdULD/1ByszQwXWLReHhBQlXCalNicPUKRaj3GjOHyQeTB9YWL5uwKKV60QM
         irzNuFA6j6cXdp8kol/pfcvtwr8hQ0nrWz4LN3aqceoKKfWw1WVzj4eOWDfoNyUavTWX
         4AreVatKEUaku9Tn99kkxdOp4a2sU0zzbP9dg20kRMeCDtg4f2nEOrAJKh8P2l5ayjsI
         kobsxDcGsr6SdCCqaLLV5a9SObXpuXb16tRUm8Yvk3VOS02BZV9/R3aldKn2IMi/r+iB
         mBsw==
X-Gm-Message-State: AOAM532Uy6vzigehmHZs7CLdV2Whl/EGXhgx8/jXPBE65joUC70cOCnQ
	veeUYWVTKQo3oCrNu6hLhO/Br2Hh4WjyRkwW8As=
X-Google-Smtp-Source: ABdhPJwELoVv7vnL2taQ0N1mfjdMsIvKhuyTup+UTyaW78C7ndLyR3PDNJzYDoFT/n2IC0xKBbmskQ==
X-Received: by 2002:a62:1506:0:b029:19e:aca2:4ed8 with SMTP id 6-20020a6215060000b029019eaca24ed8mr49272541pfv.27.1609856695301;
        Tue, 05 Jan 2021 06:24:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/30] mesa: add more details to elf-tls patch
Date: Tue,  5 Jan 2021 04:23:34 -1000
Message-Id: <968535e877677cf559ba9f67faca01d0f5176022.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Anuj Mittal <anuj.mittal@intel.com>

Include link to upstream report and the last autobuilder failure [1]
so it's easy to identify why this is needed in future.

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1160/steps/8/logs/step1c

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28647f8e4fb5fe2e56f0609900187bc658ba9ccf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0002-meson.build-make-TLS-ELF-optional.patch  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index cd35a1f850..a64f2faa85 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -6,6 +6,21 @@ Subject: [PATCH] meson.build: make TLS ELF optional
 USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
 TLS GLX optional again" patch updated to the latest mesa.
 
+For details, see:
+https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
+
+This prevents runtime segfault on musl:
+
+Traceback (most recent call last):
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
+    return func(*args, **kwargs)
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
+    self.assertEqual(errcount, 0, msg=self.msg)
+AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
+-----------------------
+Central error: [    10.477] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
+***********************
+
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Alistair Francis <alistair@alistair23.me>
 
-- 
2.17.1

