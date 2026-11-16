Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3750.1794864138014128432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=InTIg4p0;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so898812241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864137; x=1795468937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWXEBQ54mI2I7+pIwJ1dYzNNUym0+xgOg9+FL4vK0Ew=;
        b=InTIg4p0wTn8Hze1HlnstsdpUJg3bicbp6T73l5jFMd5ErkdPSnbyywC54Hp+RlBeG
         KRGXHT7uUc0XchQU5PZ+EGGIYw/1Gwdli2y3MxBjdVNQxiDNKcFJ0JfW8r6Oxu8qxs7A
         jtpO9eOeEk10uk7CGAhJvYDXjxNus92aKbnj5zPrujm7pMLrFBUWYz02M8M7KSOoiMYf
         F8HZW7toa9GTB8dgNMXIlKNTBMWDvgjyPdlgv6U5SFyxpBblcfTO+GOnqgz7BKyF99S6
         1tq2eZVlS3i1+GM0nvsrI/hvwkDSDL+dmq7izS1GTuFgg5eGf0wJ7pzTa3XRL/FHCOtu
         Dsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWXEBQ54mI2I7+pIwJ1dYzNNUym0+xgOg9+FL4vK0Ew=;
        b=ff5WTS6rX+mQMZeYNOzy45evMhGiAP6DrVkgDtNIdDgvHKuW/rhQRTq40mnWwI4hKx
         J35czXqaZpjpybWsqVte2W5029cQ4mAcXkaiSpacFTXeztw05LruA6C2quWXJ2sxy45I
         Mt2n6FozLiB+PFak+QZlPJEmhYTdk+bvyG5BRcKoHnwJtZOxOAk7n+3Q0uzIlS0XcT2C
         KJVSivO2PAPlIwsABDIYORiSbMn789iQn/Junqqi/zCmr8E83sIZuxWF6HfEz/qQCGTD
         dkBkmeFCX8NFE4c/i64umJAKRbtaYsEoHJZuZHylUI4yogWAHA7PC/kkG9gyAG91FDWG
         twTA==
X-Gm-Message-State: APuU4Z/zZ6bwAnK4sV9ec7C5a8KdPyFWCWxBobyoSR2CpFSm1hUVmHbe
	Cge9BSsHYdsI2nJjbw9YjwBVhcHcjrbEJTk9Boldea7E8XS2FrxSjSH0O9u6tIyTTmZzGw==
X-Gm-Gg: AYBFou1sv/z11uPVy7ig/m1qUNkly2VAo3IxB8bJhmflYqvJpj5OYuwoRqDOvEVuG9o
	ZeO2KbOID9NO3WVCB9yRSUVOtqCNxa1sKKnRK8AmSgPjYgTzySXbfDZ8sZbNq5qSa6B6cVwYpJr
	LPZlF2Ja7Pyr51xN9Id33dZIOtJCb7LTp0HQGMq2oQQSJh7TuabBbIoeVuL8TUcoTlNw4BT/sys
	SEOIT0oHdTEAiakBDMGgOyURpGHaBucS5TNrLbNVcXf2FEwZ4Rhq+tf3nsLnGDHX5WGR5J/hmIn
	uUgiXwwhFI8XtnphZplSu5FyFSdbuXry9m4oh8RYYw2da2JWjVR/G6EegkxBrDbtURxIy/kBS8i
	TUx6rNsDrQi6b1r8GcrJt9P8NIPzJPYfr91r2oIMpm7DRS/SCTkI6OMN+6PpdohUx/xuaDVtjfG
	Eo8oRV5HeJCckun3pFDvG5sGA/cIeUOqqWXmOvpauszfSEQNUx2dD77nFbprsxylRbHRByns/PX
	t+tX81q5tAtUvFd02R14E1g45HdUu7rGRLtNEmtu1Vm54tbdNnN7Q6+882+v61cnnwk+gPxDxi6
	ovBpOzFLK937QzDcgC1NjN38XCIpVkSUDxCeiyAcrIf9DQJmAl0JmeGYlDFaXvcrfOVY0IY1DS/
	95e1HoTp7kIdWSy6kwHcJzP7cKPvawwJU4jZm3htFNxYgQo0nbYti/h4z06nraYok3FSPeksoNc
	zU+rOAUX0cJvQYcfxN3v8oYQ2JYB07pMCQpwqOtLNPCaJH
X-Received: by 2002:a05:6102:504e:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d64d9eb4cfmr3334014137.33.1794864136680;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0c53a8sm896282137.11.2026.11.16.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][PATCH 03/05] linux-yocto-dev: bump to v7.4
Date: Mon, 16 Nov 2026 16:22:09 -0500
Message-ID: <20261116212211.4068570-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
References: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250385
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

7.3 is released and 7.4 is in -rc, so advance the development kernel to
track the v7.4 branches: point KBRANCH at v7.4/standard/base and set
LINUX_VERSION to 7.4.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 6fd0936369..267bfb4164 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v7.3/standard/base"
+KBRANCH = "v7.4/standard/base"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
 
@@ -29,7 +29,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "7.3"
+LINUX_VERSION ?= "7.4"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0

