Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90C8C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 00:17:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.23450.1753834623900214363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 17:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEXNAL1n;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so300276a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 17:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753834623; x=1754439423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8U09FwnRPmt9/9eakeX7KyeXXUoHVh08m1kUE1Thrgg=;
        b=NEXNAL1nASGOdEhP2RydAL+0ZmkC9Nr5JBIEgpw1uweo8hsHKavN3aQNOotH8UF6Zb
         zuHYYq5rnZh2gsWRyDIyIvH3UUA0LqBACFjZvKfEWbG61XsQjINp0oUMhTF2XQHrnEWV
         1v52id/sise10nqeFVgDB1ZzWOQehNBNIZp8Vns5MsNC2ubLqtQdl1a6upuWsDtsMiyr
         VyP2Cdst5sg7KO6Dya+QxmnRQ+Tnd6O3ZU+pCHmgTMVFpqUe1xRUiqLLJyUyxJl8olwx
         NkkblQJHmgkyWWP4PdPvGU6aturF1uhIXFMofvsi/drVUT33X0NVUMOFv7KzrOfT5Oa+
         4pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753834623; x=1754439423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8U09FwnRPmt9/9eakeX7KyeXXUoHVh08m1kUE1Thrgg=;
        b=Q2Xzp8i75MvoEDnaMn/DJQoq5KfxWIv3+K2RUMT/dr/Uf6DenAroIYaPRk0c0s/l6g
         +vXSRP65PKyOTZJl+bF+j7H60nTHP9rd29Tc+mbO44gDL2pOfvNfpczUsoE+dKIQLEk5
         nbgK/aL3TqbzVwN1vXUR1y1nhEc55hZYcAg3WqCRxsz89/Eudn1c7dR78UrdkjubpRi4
         GL0zdpWjc4Tg4cSrIKI0w0bE2EgU9lHW38Kw7XugSp9dwvNNwimh4oTs2hwxGoR271i+
         uOzTPkRvylmXbqscnKCs840sjY1vjhhbyYqZlB5wpCUwn5iZp8lQkg8yP36ZxsHguUMc
         N/wg==
X-Gm-Message-State: AOJu0Ywd8Mi5b2u34r4OAFFzw8x/Gby5Ck8WVRMwe/TzPFhlHwMMfyLB
	h+3j1Qe3nyjOLY+OATE844YESznkSH3B+35HPtSTaTKI+/yVrHH7eopX+HehbsouJLI=
X-Gm-Gg: ASbGncs7x1mtR+nUiCgT538RSj7PKcNbziJlYHMMeOX6ZYDeNilZcxUoCHnSHXDazwn
	ocFao4q80caQxpHtZZyNUacRTtBHgXb2qsdhIIm8/YM+ZXVpu5W/PiC4N3bBa6IpZUb7OC8Vk0+
	HMZX8JVDTTe4+LQOi9Kzky/AfVeNEKsooKumNyxrdnmafSVFgayhTyrrYFM3Lr2MN00KEVtbqQc
	Nyc8R6k4SYRY6b8zy7KHpu4LXhyTbMmsW3mmycDT1ChhJYxBwMyFNSRwgd34WfWniHgFRmKpxit
	laSa6J0y0O7I9GzeZxfx5YSsmR2hzeQn9rXfkko3anFY46l8YiLfEZOQmwUzPnphwVXp+rw8DI7
	zfpJfyw0AGxLv1w==
X-Google-Smtp-Source: AGHT+IH54eXbHFln46pOzaTxtTB/h8//103AKkaXX1sUnLl2vBrVHRERy8WKMqVRLqVQ+yn5J5QngQ==
X-Received: by 2002:a17:90a:ec86:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-31f5de4cbe6mr1824285a91.21.1753834622841;
        Tue, 29 Jul 2025 17:17:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63dfdd64sm287884a91.27.2025.07.29.17.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 17:17:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libcxx: Provide libunwind based on TC_CXX_RUNTIME
Date: Tue, 29 Jul 2025 17:17:00 -0700
Message-ID: <20250730001700.1579752-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 00:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221090

When TC_CXX_RUNTIME is set to be 'llvm' distro wants
to use llvm provided runtime elements therefore provide
libunwind when TC_CXX_RUNTIME = "llvm"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f54bc364d88..05066d4ff16 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -101,7 +101,7 @@ CXXFLAGS:append:armv5 = " -mfpu=vfp2"
 
 ALLOW_EMPTY:${PN} = "1"
 
-PROVIDES:append:runtime-llvm = " libunwind"
+PROVIDES:append = " ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libunwind", "false", d)}"
 
 do_install:append() {
     if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}

