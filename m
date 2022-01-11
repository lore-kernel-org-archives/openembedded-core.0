Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52708C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:11 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.11302.1641924010243369255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=liqvelVd;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id p12so108656qvj.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6Rqg2UB0hMhA6XmAhUmlJrGY5A/lsfuWoVTFVgfLMc=;
        b=liqvelVdkO5cn9zVtIbtVMbruxBYZ2vzXQgW8QxhXH8s2a8ATAHplKsBJJiwEzYlTO
         j6XE24rt0fvpsWtQiKxIwOgVwCfKgJbh5R7AG78nNPbKyxocHYfXua/bU9VG3dmo0CIl
         jFKy4xF8BF7BWoNudu7t1ECVduLvQYqVWk/hzxpX7NGT27sJPpP2IbhkD63AIMJt9JrG
         mu6yC3om1HbaACtsUwmvmbdZumU8JUFD8d46j273xxw8OAJYXFyJsqojll1sWkO59WyP
         udkXsq/1tFKScY9vGqwrPMVaGFotGd4ThNCQ1Y1PqGWsnwE4CEPrG/6DnIUR77qgjxe/
         Kj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6Rqg2UB0hMhA6XmAhUmlJrGY5A/lsfuWoVTFVgfLMc=;
        b=bH6epzOghHdhcp0hho83t1jfoN4QJD/UdATmPMgsbHqxUc+MtFAVzaJvaMwUbBxrCu
         oLLmZWp89rBLLS4dBs3ZaIKLF71TGFzuASJRnwMnI/TbSnkIKMhW+rSsBHHQ42sUHz4A
         hz1ktU5rqJaVXG2F7DTGNIi3yKfPJJXQ71Ap8u7/YTMfPY0vkMmVJu4rqQWiarkYj5Qw
         UZkUr/c9gLItmaftP+FA0ubuVt3/pKYBb9t6o/ATrBD+umnMVuLqw59JlICgVAgIyVrI
         znjNiGP7YkxmSG4jgJBAeoXMml3UqP0k9pme9bqjsLD9XTUAr15sw5+qXEV3YcM5p/yf
         cTdw==
X-Gm-Message-State: AOAM531oYwohQPBPHChDKd6a8eCEBsa+myrQ7VwN9tyYCfgsJlsXgm44
	GD4XY1K6kz6S+9snUqVgC7Oc4CxpndCQOQ==
X-Google-Smtp-Source: 
 ABdhPJyKLmPAaE1DupH1WdUM5CFYKDVGqvV8T0rOBI1GJjnp33rrQDF0Xwv/L3bm0d8xoE85AjekLA==
X-Received: by 2002:ad4:5961:: with SMTP id eq1mr4859426qvb.110.1641924009414;
        Tue, 11 Jan 2022 10:00:09 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] conf/machine: bump qemu preferred versions to 5.15
Date: Tue, 11 Jan 2022 12:59:58 -0500
Message-Id: 
 <8441d36eae02be3d4cb359bb6302befe5b5700d6.1641923694.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160432

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.14 has been removed from the active kernel list, so we make
5.15 the new default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index 44e4b4ec46..e76251ea2b 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.14%"
+PREFERRED_VERSION_linux-yocto ??= "5.15%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 3c2c4997b9..2dad504c99 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-PREFERRED_VERSION_linux-yocto ??= "5.14%"
+PREFERRED_VERSION_linux-yocto ??= "5.15%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE:qemuarmv5 = "qemuarm"
-- 
2.19.1


