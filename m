Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.7374.1615289794565094005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNS/eMXM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id u187so1380186wmg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y0Kj3Tj2zP7CzlSBtDJ7TqV5G1zQXFRWJyIBmIo6C8A=;
        b=WNS/eMXM2Haf5aIJMtLDHsupPf1jWCIg48kr3rCWkGWKv5N/4Yic8CQPo+cWfQdW9b
         QfncQjjUgehXjSn2IK5PwRLJGDmFsSRRh7kl47otHUrGYS2brSfAjAfo49hesuOG3pAr
         C8u86mV16FZ7NJXIU3C9EwVza0amcveRkO01CVK3bLnfklpr9WniMI4XojEPXu9SEwrk
         nm3dNl3he4QPMXZy90YXpYeB3HtCC1ce7Wnk1B0LwBt9+fU+CgksYTSccqzu8+luefG/
         whmL10clytQ8AMH1+JjNDFrrIxC7A8D3RUiqXsdKWbEC156mOyqkQFJlLWQLcs9BJqkq
         m+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y0Kj3Tj2zP7CzlSBtDJ7TqV5G1zQXFRWJyIBmIo6C8A=;
        b=H9/BXRaKLt1ySdxdavUcY2vyAPhMLL4v7qbeFqvuGU1CVWB+rePmMiaOjHAn5I5aDY
         J5i1KOUJEFCopD5avMd+Jv6lKY+hk8NrYN0jnjnUtinQ2FMOiCDrMse+I2lECDKLjHaQ
         W0WbXXgQI4JcEXGLmJn2j0uJbi5ef7c9l72XDBV55+8fC60gKWUBrUhg/N753Z7BP0Ao
         YliKg5cySBBhrnL7g4y73r0QMAl5AZ9RDU1SnRv3rScgFocvyMsmq6ZjCOWASod0UaAZ
         /zyIpkKdcTEDjbc3NLJjbjw48AxKOFXYR7jJy+PgWY8bYemETSmfuWEY1N4WfKj/2SOB
         mgVg==
X-Gm-Message-State: AOAM531BgpTQjBp6Ouqk6a5yusHXE5/rKTmf31jx304T+wJhDXsaWc2R
	jJHiTnzVyZcjL/0pfAXvTI5vxmxITVj70w==
X-Google-Smtp-Source: ABdhPJwBnFzj5lKzmIY+zP7jEThvYeR+MDCdpg9RkgnamBOZr3UU8TUiItpPCpauOT9/VF8lpgeK0w==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr3467406wmk.123.1615289792845;
        Tue, 09 Mar 2021 03:36:32 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.166])
        by smtp.gmail.com with ESMTPSA id x11sm3804289wme.9.2021.03.09.03.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:36:32 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 3/5] meta/recipes-kernel: Add HOMEPAGE / DESCRIPTION
Date: Tue,  9 Mar 2021 12:35:49 +0100
Message-Id: <20210309113551.13691-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309113551.13691-1-dorindabassey@gmail.com>
References: <20210309113551.13691-1-dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb | 1 +
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 +
 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb        | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 0013e24580..1881a8e065 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Firmware files for use with Linux kernel"
+HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
 that contains firmware binary blobs necessary for partial or full functionality \
 of certain hardware devices."
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 7ec94024c3..175b2d1819 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Sanitized set of kernel headers for the C library's use"
+HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Designed to maintain an Application Programming Interface (API) stable version of the Linux headers"
 SECTION = "devel"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index 46820ef489..6ee0be5e3e 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "UProbes kernel module for SystemTap"
-
+HOMEPAGE = "https://sourceware.org/systemtap/"
 require systemtap_git.inc
 
 DEPENDS = "systemtap virtual/kernel"
-- 
2.17.1

