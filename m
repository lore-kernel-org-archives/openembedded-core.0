Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.221.1632333239948211608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h6c7xtan;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 138so12285511qko.10
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uu0iqT+kt+4ScwGF3lWyvHjjmJ+LJhBkd+5NtxZ8Hl4=;
        b=h6c7xtanclWp4OI3UvKv9N3O54kfuvzEW8LS01lMzanZqlRpO/lVbnhyXA5X8n1esc
         8m8+way9CygHcD7E0w9NxgV1Y0KA50GjpexwRhWATOOIZh9f5i/dSDx9u0k3AyXgtMJR
         wWOTCg2tSyTAMv2Sf910Q+n6kqj4ArPOpFFMevu4UHCdXpQ5xaPcf6KS5R32gn5aQapW
         21CsLUzYDTIghypHHHmfmM+rae+lOVa0GVzB0+h6i3Cn3QHDRKPHOpER416ig1ARyt5C
         Vzakg8PM+gJgyeXiEhMK0XnKDmyNqmfYG45SJqzSpr8QYVe3KjxB74bJmnk6r7esEDpU
         E3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uu0iqT+kt+4ScwGF3lWyvHjjmJ+LJhBkd+5NtxZ8Hl4=;
        b=IOhjaa0aeGQJqNr+pUQt6v+3iCfTYiQM33EYh5Rr9Z2+TTulQCHxvncm4VaLo8X+9B
         909AMyHOW3eP9yKzLAR8f6fa9zlfPXJt/BxXLvTO5g9Xr2lAIOIMfIt4zKx/sfeYPNHt
         MRgcXdmc9zu0dIqSH2CJNhfJNcI0ZUpZkDrZShYZFJJtWTjtjCGusJX9U34t/hIzhCrt
         ZMvr+Rl8SGZ7XIDjhx4lusdyvdtCSyHdbiZ/yPHhV/yw3rpQeLbNCTGkd9f1H8tBYVw6
         xrzasbMUoRTGSbJNrHC0o7dbU4dKEsMxlgubjYzAuoYh+IU/TLVPt1NOjiGRlgl8OFWM
         YFDg==
X-Gm-Message-State: AOAM5320pjniBDcc0e+7GAoEhQ98uq2ljFmjVXGX9eu5HQyfR5clE30U
	Lsu+xnW97hU+q0pbIQjW8/HkRKDCEV7UZw==
X-Google-Smtp-Source: ABdhPJz08wzUDGL/wUSr2ci/RgrplBnCaDjlaBgJ76PVJRALRAk5RkjBedM5zkCR8wZ9gFmBzH9wXg==
X-Received: by 2002:a37:a897:: with SMTP id r145mr568221qke.16.1632333239042;
        Wed, 22 Sep 2021 10:53:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:58 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] conf/machine: bump qemu preferred versions to 5.14
Date: Wed, 22 Sep 2021 13:53:52 -0400
Message-Id: <c3ed9c094566be74c852af8bc58212c3d7d612e3.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632332981.git.bruce.ashfield@gmail.com>
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.14 is the latest reference kernel, so let's make it the
default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index 958b3490e8..44e4b4ec46 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.13%"
+PREFERRED_VERSION_linux-yocto ??= "5.14%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 252d6286d8..3c2c4997b9 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-PREFERRED_VERSION_linux-yocto ??= "5.13%"
+PREFERRED_VERSION_linux-yocto ??= "5.14%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE:qemuarmv5 = "qemuarm"
-- 
2.19.1

