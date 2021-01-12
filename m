Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.17402.1610489659846672547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eGl7MK/E;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id w18so56959iot.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 14:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xiiE/ZI8lKOVqMJzysAKaRGzaxERYezuxupm7ZoblR0=;
        b=eGl7MK/EHvhuTkYJW+ca4M9sJMcHYlZFJhkXM4O7uyMdWQWod76JyzJH8oOi/Ay9R9
         Is53eqCDz8ahoX07aMnrL2Eg4Mg0Yku7ADnCC7Hze3t2oJLSRS8nee9/ZjBXwMpWTibR
         azYJaP+p1h/EAULVkQvE197dx7zOIk89Owl+H9EGnUlqDrolCz9tKpfkk3k5ydFDNowl
         2H0EjZSY/uqFbPJHC9GpLC7qETg+82ztj1vhORJtpsrGFZ4XZYOOlJsY+2wgWqYCzBdP
         Q8AkpBhRCxiquLJYLGjCmg0XKz2hf/qZQs4XuQzg5Pzk1VgJKF/d7TvVvYlUp6DqfYH9
         r3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xiiE/ZI8lKOVqMJzysAKaRGzaxERYezuxupm7ZoblR0=;
        b=faRI0faIag7VKEzwQ0a9iB/nj2dZZzUEQIRhAGY7WJW+eKOLm0+dBimMcCmEzBMAqT
         0IB1FnNujQSmbZrx2OAlUdA+q8CwoKscqkfnF5ifjcsmPzOApcUSIdrV+bAgfZADRJgE
         7HYeVrk+r1daRqsMY2Bug08x7DcMTJOPZWGSVIE2nv1KeEnJwavsxMPdzCcDNItuHSD0
         4KhWEyO3owdcZIq7SlKe27YoDo498MEmRytD2CLOJgPkyIG66fiCesVZVRt56cL4k0vI
         5KHWTKMyZBR71QxSYAnfff6y6ZjSO1jlXtZg5IUxBm2NMgFbUyEzCu0Gjzr3/x+DEymp
         5UCA==
X-Gm-Message-State: AOAM533qwm7+yOOj0xu29hfOmZ5xsAl/4kGwhCHDekCJupW9XJJuZlN9
	sQcYTv3cApPApUMd1aZUkg8=
X-Google-Smtp-Source: ABdhPJwgvv/AHqtCIZv+qs346dYuzphBuBvQVKsQz1hcKvHMYDBu6dEjgyaIzsmEJXkrJo1865tB2g==
X-Received: by 2002:a05:6e02:c0f:: with SMTP id d15mr1237626ile.263.1610489659317;
        Tue, 12 Jan 2021 14:14:19 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id s10sm62356iob.4.2021.01.12.14.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:14:18 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10/cfg: x86 and beaglebone config fixes
Date: Tue, 12 Jan 2021 17:14:10 -0500
Message-Id: <738b8db76c354c7a55720b327c746aef4e3f4bab.1610489445.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1610489445.git.bruce.ashfield@gmail.com>
References: <cover.1610489445.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to the linux-yocto config:

    47c7a3148a4 soc/skylake: remove CONFIG_SND_SOC_INTEL_SST_ACPI
    8124c015448 features/security: remove CONFIG_REFCOUNT_FULL
    7073e149653 media-usb-tv: remove CONFIG_VIDEO_USBVISION
    4480a5c5784 beaglebone: Drop the obsolete CONFIG_BACKLIGHT_GENERIC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4d315941fc..bcda4c48e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "82503751a7af71b460e6a605641cff377332c058"
-SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
+SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 107d7f1364..56fd7a966e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "e3cf3a0ff5a5e85395d8cf2aeab350ac518679c6"
 SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
+SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7ac84d1b1f..2a850ce246 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
 SRCREV_machine_qemux86-64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
 SRCREV_machine_qemumips64 ?= "a019b338648b95aa4d679ffdc01878dc660bcbac"
 SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_meta ?= "78dd53c2257380d5b8ef13e4ddae25c585154dac"
+SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

