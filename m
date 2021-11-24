Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329D5C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:32 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.4099.1637788470835952065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ni2/Qgq/;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id p4so5044230qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UI6pqZZhA72FB0PFzKWJINSMQUhIFbRPOQleWwpQYL8=;
        b=ni2/Qgq/rrmpcMBWGdCBFasyIVhz15kZEiGZ7KnzMWLRZAeNd/59SGyLcsfo2NcLfs
         hiSEXR68Qv6k5uwZKnMjBuQBwZMC1SVvnbhpoQBE6SN4uIZF7yJ7ApSp98PwHYR6saJi
         OmtMikHOstUKwLEusl6RQ99AKh8JsjmHNH5bLa1ezHDvk/Rbkm1K9mM8jiSjxW+KtKwu
         8yFpv4pFXU7Xk9Hg7zXyyQwsoU5pddcEx6omvcssDS3A5NhMWmKi0ucZaRRsvP8otpLo
         kQQihDQc4O7oW1jx0RmxUa9X18Q876yfoWxMPzRPv32FJY/JH7/vWNMgLYx4XmQj6I7L
         o2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UI6pqZZhA72FB0PFzKWJINSMQUhIFbRPOQleWwpQYL8=;
        b=rOse2pFr+90fzBnp5WS3MEpNXebqBFRAZvoMXIPC5QJsJwS1YMeSMUxUIorlEcdxEd
         ig53lSb1f+J7RYM1NCcpJpogFYVU/riJXjJ3W0uSXm+GTg3wOopLqdcad5EZcigIM/5R
         fv6dWc2XS4LauvObVX+60+DZRPvQ4sdoYwA9nlt6z96eJs7QYyUxYXbsuYVqvlSb5cKw
         lov5XXwrXJ6hK7ziDTg+Cv13aSR7j7waLxy+aON4WbjfZ6PPgGvt0qKo6GhY4Lw3/HGp
         Og1EqPUGs+7jP1rk4/lZ4kHWXa0pls1o4pf4bU6o4T4P9TMry20yAQVkpzRmjS+Nnrbe
         yRRA==
X-Gm-Message-State: AOAM530K48XHmB2ym/z3AY4C/Y2aJlAaBc7reGNG/3vGDeYT/lQi63CH
	25vlSSnCY55JR7P2c5/zDjk=
X-Google-Smtp-Source: 
 ABdhPJyHNXAXFpC/nqnJTU6u3YBawuwOeaIRGDqj8S09v0xsY3e1ckgyUYq/+vEv9skXH8XB5kBBLQ==
X-Received: by 2002:a05:620a:2887:: with SMTP id
 j7mr9572131qkp.390.1637788469906;
        Wed, 24 Nov 2021 13:14:29 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 01/20] linux-yocto-dev: bump to v5.16+
Date: Wed, 24 Nov 2021 16:14:07 -0500
Message-Id: 
 <f172b73d2116be4622192067106c1b6ab59b9695.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158747

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the version of -dev ot 5.16. We also pickup two new
dependencies to support kernel dtschema validation. This
requirement was introduced by kernel commit:

   commit 53182e81f47d4ea0c727c49ad23cb782173ab849
   Author: Rob Herring <robh@kernel.org>
   Date:   Mon Sep 13 09:51:46 2021 -0500

       kbuild: Enable DT schema checks for %.dtb targets

       It is possible to build a single dtb, but not with DT schema validation
       enabled. Enable the schema validation to run for %.dtb and %.dtbo
       targets. Anyone building a dtb for a specific platform *should* pay
       attention to schema warnings.

       This could be supported with a separate %.dt.yaml target instead.
       However, the .dt.yaml format is considered an intermediate format and
       could possibly go away at some point if schema checking is integrated
       into dtc. Also, the plan is to enable the schema checks by default once
       platforms are free of warnings, and this is a move in that direction.

       Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
       Cc: Tom Rini <trini@konsulko.com>
       Cc: Masahiro Yamada <masahiroy@kernel.org>
       Cc: linux-kbuild@vger.kernel.org
       Signed-off-by: Rob Herring <robh@kernel.org>
       Acked-by: Masahiro Yamada <masahiroy@kernel.org>
       Link: https://lore.kernel.org/r/20210913145146.766080-1-robh@kernel.org

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 005b688778..ed94ab2517 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.15+"
+LINUX_VERSION ?= "5.16+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
@@ -39,6 +39,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+# yaml and dtschema are required for 5.16+ device tree validation
+DEPENDS += "libyaml-native python3-dtschema-native"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
-- 
2.19.1


