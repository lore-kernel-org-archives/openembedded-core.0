Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web12.31513.1613399875624487058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gMYaa7Lk;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id n19so1564166ooj.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hdd9pejRv/BzTTU5zUdZ3dkHUaVXBX0W4riaJ0NVRio=;
        b=gMYaa7Lk0e51HBb1/kyrIkDXAEGfMbUsCXOPSDykD/PdlvP/TUI8LJpIPOOHeCWHs6
         S0Bxwo/50idJb8WO8RXPPHk7Hr4oD6cojIIwGUK87YruFiU4Ds0+tGyiInMr1S1rGLhy
         ukC7h/61lUYhx6Txq+dZcEWMyzccVGqM3JXUzpgEpY63LDvdEB6Of44p8ad4d/kZokRy
         Gq94wFYndC1MmeMWPqw4B0dyt5Bf2alof4+jg0gC42zhPOJ8w/t1nLicV41N8y6eerOV
         LpRDhv/TEZq5alc82ITNbcyocrB0i4j9zRsr2jmLICxclyPWZktvS6+ZdmNdEaFW3BaK
         Znsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hdd9pejRv/BzTTU5zUdZ3dkHUaVXBX0W4riaJ0NVRio=;
        b=AUrsbTGZjoI4KLv4hhThcWOETvS9KZGkWtOVgTnkv9eYDAh6Bw44bgG3HDcxpjVahP
         nzH7unQzUEX9Z6sbRwvdec1gHxC+KTxYzVqMtrGDtZmc10WHyBzBftXSTpeuC4KouAG5
         3VRg1tduF74O3CSY5N9SLTsEuW5XXxmPnRnJXVYyaxga0+98BWnJ8ytkGXBrlUY0xpan
         8ATa7UChAnUrW7A4Zxcm1XzYsyMM8MO+h+Pbt91uNAw4ihHbgD0skHocdweHrzLnEecR
         n1FPCOuYb3ktdniqCvcZMV8X31+3cJClH2lyVnxf8ztPgezUY15EgtaJ+bRf13c1djzq
         fofA==
X-Gm-Message-State: AOAM531LwC+/Cj3efOsKLOj0zTNhwa1OTQulpYrQU0mRLniIYPap+gSa
	uiy/hJyYRKg3gbPUOenNjAHznCkIgIq3VSTO
X-Google-Smtp-Source: ABdhPJz6M56qlOSAOpMThvr2KKHtW8pWjzCR40JX9TxtoP04cKkYG1kkJ7sLteL3ICOYWBCdCOgtng==
X-Received: by 2002:a4a:751a:: with SMTP id j26mr11066557ooc.68.1613399874613;
        Mon, 15 Feb 2021 06:37:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:37:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] uninative: Upgrade to 2.10
Date: Mon, 15 Feb 2021 04:37:12 -1000
Message-Id: <f67e9a8edea00a9f28c0c72b97d220b85eccec1d.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Final glibc 2.32 based uninative.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b5d932a42ce9e3e801837bea9cf319c455d9ae5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 69b6edee5f..85336014b1 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
-UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
-UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
-UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.10/"
+UNINATIVE_CHECKSUM[aarch64] ?= "645e5c50b2b48aabb8b10f783a9f94b4b7c5ddc7cfceb5386d43b86d30253202"
+UNINATIVE_CHECKSUM[i686] ?= "233e09b5ff30e15341232a0c16fa8448ff31dccb8f3f3e2ad3948cdac8c4a598"
+UNINATIVE_CHECKSUM[x86_64] ?= "04333677f81990ce2cf55c3bc256cd84a66085d18fc95ccddfab8581e4aec014"
-- 
2.25.1

