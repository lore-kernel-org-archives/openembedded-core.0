Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9555C32773
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 17:28:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.18378.1660670881709542159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eT6ulwAc;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t3so1951614ply.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=LwPOl317Ih+f59M27w/v3eW49osmPVOdAZF0o8am3xM=;
        b=eT6ulwAc5ST2XH7X74hq8H8A94eJN018TZYxR4AMRLXbrBRakwckXcK6+pt+r2sgO1
         wwzClv2MeIWfS4LsV/CR5a7xRkmmofUeaoazFlY6E9Qf32JmyYcUccEwg3t9AtSVt9He
         QY2SpyjwYseugXT6Mo37ttydk0QQSnmZtqn3/ihYLlYCJZhTCGyUeJMXvjIhFGUsznTE
         Wlvu1P1GYkyYgQoNUKcs7S5VBNF5LGspkZKtv3r4T1FEWSgkzvt3GAc6y6Halv2r3dgm
         IM957g83A1fJzQ/kuhnj0IE3WQSEEZLZL32c/v29s5ZsRIlBmQuMy0b3t9+A2Z6nzZgB
         tX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=LwPOl317Ih+f59M27w/v3eW49osmPVOdAZF0o8am3xM=;
        b=uBZIzRYVZBcglhL5fUI53GBHekw3Ye1vkf6I0kkKvPBUqLbg0/+lvzgUtGIL5KNov4
         hxgSTwD+V+aL+xjznL8j6kdF8ba6z6l1/BqTJ6I8IQekMa5cjPCRS1iCaovu3G5qBjoZ
         uduVMKPv7k1DS1653ekpp5WIcchzGBwV8DmOCs/+qBKyXm2KeEZ+irnEF/WjT2Otmbwk
         vsIwsMf6xiyZPZvhVsco2tig4mud/5QL1zvl4hGFae5I5N0Gp62iYrhB793LzgksUhBT
         HVV+uhkxeYIxQgSzhtcXh651KtV52UQALfarX5aco2iZ2QjoEbMo7UM89kDEAielT2QP
         OOZQ==
X-Gm-Message-State: ACgBeo2RnEVbrahLUYLStLz14CvEQL8DhrBt2hZ2xxXawlV2DlG7z9QV
	mSv/N2CKJQxWc8cmvLYbBdj5lt0hvuaXew==
X-Google-Smtp-Source: 
 AA6agR4jzZh9nCeE6vcJvboUs3lj3q3rR/+aypvu4tOsbNG3SA5Ajuqe9nF8UpczUUweY3oEoOqdaw==
X-Received: by 2002:a17:90a:f002:b0:1f3:251:c48 with SMTP id
 bt2-20020a17090af00200b001f302510c48mr33574239pjb.22.1660670880611;
        Tue, 16 Aug 2022 10:28:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 90-20020a17090a0fe300b001f1acb6c3ebsm6547232pjz.34.2022.08.16.10.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:28:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] spirv-tools: Remove default copy constructor in header
Date: Tue, 16 Aug 2022 10:27:54 -0700
Message-Id: <20220816172754.2579164-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 17:28:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169450

Fixes build with when clang libc++ runtime is used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ult-copy-constructor-in-header.-4879.patch | 34 +++++++++++++++++++
 .../spir/spirv-tools_1.3.216.0.bb             |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch b/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
new file mode 100644
index 00000000000..044c366a75e
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
@@ -0,0 +1,34 @@
+From a90ccc240501bf3362b23f67771f65b7dec2ccf9 Mon Sep 17 00:00:00 2001
+From: Jamie Madill <jmadill@chromium.org>
+Date: Fri, 29 Jul 2022 14:26:37 -0400
+Subject: [PATCH] Remove default copy constructor in header. (#4879)
+
+A recent libc++ roll in Chrome warned of a deprecated copy. We're
+still looking if this is a bug in libc++ or a valid warning, but
+removing the redundant line is a safe workaround or fix in either
+case.
+
+See discussion in https://crrev.com/c/3791771
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/pull/4879]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ source/opt/merge_return_pass.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/source/opt/merge_return_pass.h b/source/opt/merge_return_pass.h
+index a35cf269..d15db2f6 100644
+--- a/source/opt/merge_return_pass.h
++++ b/source/opt/merge_return_pass.h
+@@ -118,8 +118,6 @@ class MergeReturnPass : public MemPass {
+     StructuredControlState(Instruction* break_merge, Instruction* merge)
+         : break_merge_(break_merge), current_merge_(merge) {}
+ 
+-    StructuredControlState(const StructuredControlState&) = default;
+-
+     bool InBreakable() const { return break_merge_; }
+     bool InStructuredFlow() const { return CurrentMergeId() != 0; }
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
index eb907326c43..fc1074d8b89 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
@@ -8,7 +8,9 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
+           file://0001-Remove-default-copy-constructor-in-header.-4879.patch \
+          "
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.37.2


