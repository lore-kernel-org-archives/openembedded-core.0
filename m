Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.2592.1615661484337154395
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jFE5G9Gu;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id w195so23786237oif.11
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ynJbDkiIlqozAKvgbHBki+y2nYNdqaqEzqTWIScPji4=;
        b=jFE5G9GuxVmYeI1wKGDP2iilbwK1d6gy8SW6l626gvx6y+tSyELOkNXKvmQGrpkdiu
         BNcQirDLGN8AHVpKgWTYcogMeQYekOo8yr3kfJZSQSLTiJClBqMJbBMYYm03sD+vWg5Y
         TmhD1OaKqe6sJAUCJaEgvY/Jo6UOjChDhM/1suxygUJ9V+MBpmEQxSbcqHPHtyCKqu07
         91A52pzRS9nHvVwFt360oI7oRQ+EwlbNsOdeozd6mw/GMNSiyqHaEmb1C2KO81Tv6lgI
         qxaQYxFdXbhVZLKTGbuC0Ne4avSQnd5tKBzdnmVyQ99Ryh2SgqdvsRBjFIH2Jbwcyhvl
         rp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynJbDkiIlqozAKvgbHBki+y2nYNdqaqEzqTWIScPji4=;
        b=KXjphMy08SYa9cB5UEOR73jln7wPBJsS2Cx/Z9vjzW/91gNSyNod5x5AFoR3fD5NMG
         KLft4bBqdWM+Op+EWIEMRYcLtltpoDWbpLMnL3AqsNiJVZba5N8e4zQ0ts7cdk/PvSry
         I0Tzm400AGp97nQ8oDMcQZOWji5dTTDIPRZPxUslk2kLOgi+S3EQ6P5+6VcmzOfY5fel
         93MYshZTkBXIGoZthUdRrX/EVrDjbIo4bOsK4CAwJtwIKYL2YUpOFV9tJ0N79S1+N0Ak
         P+HekmEneAsIJYXrW50TAEYpcIGE+7SO0zWW17U+j69TcWIZON4OYAV9T5r+BTX9A56v
         pMGA==
X-Gm-Message-State: AOAM533OuoA2v4jMRbHHXhBmTp93xsYbrPiijwnfyAibAxh+u8xOti7l
	sEaBIDCiu3DrKTsKJVoxMoR0BQL87QBwIPOi
X-Google-Smtp-Source: ABdhPJwNirtBDLaz8I+QyZe4i+HYZXO1AGWHdLYHz1pWfX//TYBt9wgmTJ1im0s81cUZq6IcPtJ73w==
X-Received: by 2002:aca:4fc1:: with SMTP id d184mr13711928oib.31.1615661483123;
        Sat, 13 Mar 2021 10:51:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/38] meta/recipes-kernel: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:07 -1000
Message-Id: <2f2fb08e0d312d82749bea147306897c00df650e.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 693988ec423341b930e93d604638826cccba9e37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index b59f57b139..2d4429b6b4 100644
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
2.25.1

