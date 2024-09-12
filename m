Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AA6EED62F
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:30:34 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.53847.1726162228259685219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gutJJBmL;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6bf7ad1ec3aso8949686d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726162227; x=1726767027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Orh5xzYxgur6pB6VvgzMX7dQL9HM5RjXI+39uIg8k58=;
        b=gutJJBmLDtYw3VsHjdWjZGo7sPw+GzXYBgiA7UisayJ9Ly6BOgmOMF42q1Xr35XUb2
         dYiy9ZfsvausBFUSkVRL8qcrC8pZfTjXZSXRrzdVdOHsYikEZUUmmcWez5MkIFAuMT6U
         wtT4zFrblP2B/hUHEFoc8zEMv/8Yq0BcMuDpqX1iTXYAZkizXxHWG7DB892GyX0qoYBt
         tT2ZIL3LrlkO+jVznJxLH+HAUC+XI7HS/oZ1LWhaqdGiUyjwk5xAQriuJW9QmNgPdEbo
         FwSRcu1pvby7yKfH6a0hEruFOXQr1CzsGLJlCU4uGOvQ3iyo4tbizsQFdl4a43XiPLUf
         xphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726162227; x=1726767027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Orh5xzYxgur6pB6VvgzMX7dQL9HM5RjXI+39uIg8k58=;
        b=UXdHaG3YvSJiPsw3ymiQTv2LPxyqZSn5ziLCuFSaE4ZyoAmZuYPKjNtBMAHIAT4/98
         QGazwQm1OfgGXEyxKn/t98/wezahvepOK5rWmLtXmEVrfBuBZu1BJjS0JBhLjmeSLJlX
         JzzpAXQCBbeZuQhQ8Bg84zw9fUFpbbc6fsgns+NaY8I63IowzJqmj16CL4fyYXBlcdO3
         x+iJf6aLEN5pswTIbOgV+hNObS7vzYt6+GWkssl0YICiRo+mVB9P5GEUj9IgUcl2v50A
         MlMCivzkP4EL11atyX4qQulHMddFJwPAgpkW8Wdx3N0DUtjwZ8QF1fGJdBPJ46+80CbI
         shnA==
X-Gm-Message-State: AOJu0YxCv8/aEvkCtjLlgkO6kHjGNsB8UusCTfl3NAlzjLmi0ha/pjLA
	wd6mZ2A6BplYhSut+5nOr0qwGZN9+bLygsQNZNlEQc+59NLMu1MC2UwcEGLo0mE=
X-Google-Smtp-Source: AGHT+IH93IqS0p7WJ/34XAImUtrlryhqMqzoOMHM5W1M03aRteUeaOgatznda50Ehl3qRGPgLRAhXw==
X-Received: by 2002:a05:6214:5d10:b0:6c5:1f00:502e with SMTP id 6a1803df08f44-6c573572b8dmr59205016d6.36.1726162227014;
        Thu, 12 Sep 2024 10:30:27 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53477427asm56340356d6.112.2024.09.12.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 10:30:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.10: cfg: arm64 configuration updates
Date: Thu, 12 Sep 2024 13:30:23 -0400
Message-Id: <20240912173023.3993510-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912173023.3993510-1-bruce.ashfield@gmail.com>
References: <20240912173023.3993510-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204455

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: features/security: fix Meltdown/Spectre configurations
    Date: Thu, 12 Sep 2024 16:42:50 +0100

    These are both specific to x86 so move them into the x86 file, and were
    renamed to have a MITIGATION_ prefix in 6.9.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: update for 6.10 kconfig symbol renames
    Date: Thu, 12 Sep 2024 16:42:51 +0100

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 925666de23..b2e9071615 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "b8e8a499763e5f192540d76dcbed6b545b7dafc5"
-SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
+SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index b569c4dcf5..62354201b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
+SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index b00081b240..0d3041b27a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
 SRCREV_machine:qemux86-64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
 SRCREV_machine:qemumips64 ?= "5fdfe03b830e275d165d1bc655dd4a7b9072aecc"
 SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
+SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


