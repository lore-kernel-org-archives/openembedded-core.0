Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44C1C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:56 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.801.1637704675769492769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4iL59ko;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id v2so290294qve.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UI6pqZZhA72FB0PFzKWJINSMQUhIFbRPOQleWwpQYL8=;
        b=F4iL59koKZgdDBbgFItkwTQL/kJyEe/7mpS09zXb/G7cWl3+AA5aqlE9OB1au1EfXD
         ygNpgXYnnKaqMDuY9BBDfKJCIFFrrIll1afp9Ci+QTc/2f+L30UyS++GHHirGPN4pXXo
         RPDyjQG8hY0EioSCQvinj1i0+4xQojSv88p9+4FPzDja/dNlLjdOOAfFV+ndJqr/WOrz
         OPflaT2kk/hyX6lZ7z0QdozEJ8nCubcUYh5oH4C9UTnzfniUHxi5d9m6q7UaQxuJ55HO
         FP6MDupAiRkcAdQMaXtqS2DqWozTUDjpUw5yVfuWxUIu/iapnXQy8uEN/rfYpqyqP4wb
         2qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UI6pqZZhA72FB0PFzKWJINSMQUhIFbRPOQleWwpQYL8=;
        b=KRzh9vijlD3kbSsmVn3VkrQ03K+1YsH7Xh7GRhzkajG0YOKTrCVnQfaqWhZB1gPlQ+
         PuJ9Y0CxaYWx9S3j3Htidx42/Gyyhn/N8tBh7AL8Idl4NcP23MMBQK0dzCkQ0pvAMlft
         Tv6TSA5g96VmHw+FyT35mgGSATasX9C0kjbQFdK3aBs7p3xapDuOSC5ZFJYzl9FFo/FG
         aGyLAlUBnAbhtK2PCSOXxnAcxOkLKqsuWaLh7TFEHJ3YlA1XtMwGQ96tM+IzBlAsbeWf
         l9rZ0VIelrar4IId4G5Rtg4ETBZiRM0HhU6r/vagwvbR/Qu9rJgqt8FWQ4whVoZsv99h
         /FDw==
X-Gm-Message-State: AOAM532wgEeHI/W9PQAbbjYCzfNFrra/59/qMMVDx7cx1mxEJAxbTXnq
	qKG8mPICv4FMN13+eMasxnc=
X-Google-Smtp-Source: 
 ABdhPJwMOQN96Xu7N2C2GlkqbcoMnfeJUY/j41MK0/CUHhoC5R733XOjIQ4T/LA97NykrzgQBcSeDw==
X-Received: by 2002:ad4:5bc6:: with SMTP id t6mr871099qvt.15.1637704674955;
        Tue, 23 Nov 2021 13:57:54 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 05/20] linux-yocto-dev: bump to v5.16+
Date: Tue, 23 Nov 2021 16:57:32 -0500
Message-Id: 
 <72c845826a75320f49fe6907bd2c2f99fc61cff8.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158626

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


