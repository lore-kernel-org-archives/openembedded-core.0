Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE80C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:17:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.6746.1659705456520987407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OFFY+nfM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bv3so3236018wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=nvMqD/lrZGeP/bNguf5jcNRdMRKQcrrirYtPuPsYkBo=;
        b=OFFY+nfMVf90lmJZhQqZxClNpY7EM6LNC7tNWALBHTOZfhOdnT1xJ/6LGb3vrz3FK4
         fcoutc0/C18ujmvqurIbnglrEcd5yecxT/IcD4ufGm2iOEv++q9A24ypaId8/p+fQfEm
         lwjjaL9P0Hay0BgW/ELUq3OpCgHUDku4qOeeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=nvMqD/lrZGeP/bNguf5jcNRdMRKQcrrirYtPuPsYkBo=;
        b=ubPlIE9/JdQWXm/BZEk3I9+mCN23ZCZTwA13g2whCs+Wp9ow+Cg7dBSBTb/6DzXNmy
         f8KIwuIC3r+sLY1Cp75hgH2I0bJrQXZO9C7As2Kmlas/r3CM2ydOOTqFkX70wFamgHe/
         JUWahIVYmvCVJQSiM6dtYUoD5ddyt2x8o5lyJIdwqpBQwDMlAQbVVcNxfXJ/TW2L5wKc
         rWC7nSQJp5d+bJwj04LavT2n8HFbGbUHNwHwujFpS4d28c3OVp2lV78cnIBACWSG0g9g
         4xvoKgiQI5qI4GtLI0uzNNRzY1F9HXj1B5hfvLeN1+k8ty4aJ5Qsw5ARHdtVibFozDjD
         XDWQ==
X-Gm-Message-State: ACgBeo3lt1+Usq56DWTYHwm+WyLPftNr/++H/S6LK5GM9mUBhFOZFexu
	TSpbx7QEC81utEM2xkmn3DkG56z7eRKu9g==
X-Google-Smtp-Source: 
 AA6agR4ejuCbGSBcQt/Q3fdJJ+A1a4MB00IDVs3x9nulvyrX8RYJZ7kdhy93EEOD/g/owgSG/MiJNw==
X-Received: by 2002:a5d:6c65:0:b0:21d:b7c0:9930 with SMTP id
 r5-20020a5d6c65000000b0021db7c09930mr4239927wrz.500.1659705454774;
        Fri, 05 Aug 2022 06:17:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c05c600b003a2eacc8179sm4565901wmd.27.2022.08.05.06.17.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:17:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust: Update README
Date: Fri,  5 Aug 2022 14:17:33 +0100
Message-Id: <20220805131733.3707314-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168964

Update the README to match the current status and remove unclear/obsolete
information and fix formatting.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/README-rust.md | 26 +++--------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/rust/README-rust.md b/meta/recipes-devtools/rust/README-rust.md
index b87637c3b0f..209836ab65b 100644
--- a/meta/recipes-devtools/rust/README-rust.md
+++ b/meta/recipes-devtools/rust/README-rust.md
@@ -3,22 +3,6 @@
 This provides the Rust compiler, tools for building packages (cargo), and 
 a few example projects.
 
-## What works:
-
- - Building `rust-native` and `cargo-native`
- - Building Rust based projects with Cargo for the TARGET
-   - e.g. `rustfmt` which is used by the CI system
- - `-buildsdk` and `-crosssdk` packages
-
-## What doesn't:
-
- - Using anything but x86_64 or arm64 as the build environment
- - rust (built for target) [issue #81](https://github.com/meta-rust/meta-rust/issues/81)
-
-## What's untested:
-
- - cargo (built for target)
-
 ## Building a rust package
 
 When building a rust package in bitbake, it's usually easiest to build with
@@ -36,11 +20,11 @@ may also be added to the SDK.
 NOTE: You will have to edit the generated recipe based on the comments
 contained within it
 
-## TODO
-
 ## Pitfalls
 
- - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust configuration options are tracked for different targets. This is the reason we use the Yocto triples instead of the native Rust triples. See rust-lang/cargo#3349.
+ - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust
+ configuration options are tracked for different targets. This is the reason 
+ we use the Yocto triples instead of the native Rust triples. See rust-lang/cargo#3349.
 
 ## Dependencies
 
@@ -52,7 +36,3 @@ On the target:
  - Any `-sys` packages your project might need must have RDEPENDs for
  the native library.
 
-## Copyright
-
-MIT OR Apache-2.0 - Same as rust
-
-- 
2.34.1


