Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DFFC25B0D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.6586.1659705184757203275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bE+6ya6L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 h34-20020a05600c49a200b003a5165eae0fso1266495wmp.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=QtlL6vCmjf/ln4dEb7MxQBB/Rf4ekVaXojUJJesayoE=;
        b=bE+6ya6LZev14aQptddEjRXLxXLdWaHtkELt4/StBcmBVvkKSomVDQ8zPFZMhnUmCa
         31Jn26TLTGrB0Y1/525ktk/geV/Vc3aMqtsGXPTI4oxV7V5ilK0aRftW+SwrERjcPBwb
         +7vskz9hk4eaoVOlkxWBcf+T2+ceygquG7jYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=QtlL6vCmjf/ln4dEb7MxQBB/Rf4ekVaXojUJJesayoE=;
        b=Uh1I03RkIs8m7osuxMzRJe8cs0UyMfFka8Z7bW8EY3AS89ekTvkJ25UiQsv1phUYLr
         UN0shJ5lqr1FnwkoDlKDvzuC+VJWGEq+N9Ad9geWQZae+F/ydVc2vSRaAz7uAttwKyh0
         Two3XY15tHM2SxpEw0GNcpXN35Bbg2l58zZ142w8V/R7v6tQz6TnSuW190XiPam9crIx
         2CTItED99uLPLN27SgSAQCQxalnhQAmpkHb6H8Td4OwB0add7SGgzcbMHxjE+QGwNbxz
         98IFfPqsPHQo2RFZA1S7dig/AGpQNkAdwXCfsAQ4x/P+WZI0TNYNobsYi+lMxW17ZR+g
         n3iQ==
X-Gm-Message-State: ACgBeo0IjUFWUkQjmQe276JWcWxLqb/TPGq0L2jmGqv78H3y18jMns+v
	S8QkR0FC6TESML7ERq6cr/jcqrJ2F/1K5w==
X-Google-Smtp-Source: 
 AA6agR4jPoFRwdubgzsJ1B2WWRTa3/2DcAzhgIFyG3Xxo7S5rWVcQyZr8J2fZg84EicFx13n4vF6UQ==
X-Received: by 2002:a05:600c:3c8a:b0:3a0:4ad8:d3c4 with SMTP id
 bg10-20020a05600c3c8a00b003a04ad8d3c4mr9719806wmb.43.1659705182941;
        Fri, 05 Aug 2022 06:13:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/29] rust.inc: Rename variables to make code clearer
Date: Fri,  5 Aug 2022 14:12:34 +0100
Message-Id: <20220805131252.3706794-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168945

Instead of reusing a "target_section" variable, name them host and build
section instead. This patch sets things up for other improvementsm,
separating out the renaming.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index aa067932fdd..30f2b71fe8c 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -79,24 +79,24 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
-    config.add_section(target_section)
+    host_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    config.add_section(host_section)
 
     llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
-    config.set(target_section, "llvm-config", e(llvm_config))
+    config.set(host_section, "llvm-config", e(llvm_config))
 
-    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
-    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
-    config.add_section(target_section)
+    build_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(build_section)
 
-    config.set(target_section, "llvm-config", e(llvm_config))
+    config.set(build_section, "llvm-config", e(llvm_config))
 
-    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
-    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+    config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+    config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
 
     # [llvm]
     config.add_section("llvm")
-- 
2.34.1


