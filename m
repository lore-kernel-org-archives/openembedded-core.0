Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E09C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.20185.1664133489865652731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rWTyT0Xc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id fs14so4464218pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=vexBKIVQ3vKtK+czxh+cRwsjXp7SJkxfiU0C31i4HwY=;
        b=rWTyT0Xcjkb1SOtZV91u10RSWSU32IM5zz3eBk77sesiCSffBiLj/tRxuBV1IRB2Uc
         xrW9g4AUw0f16EJDYXhs04J4QcL3V1sXIf0IlvT/WWK1lA4qNgAusIXpD4LsxJt9bm7/
         Q5POw697+YOcsW/qO5qzJQmHYgPW2kgdAEM22iBU96lUcezxAEyXy30lwbAKwP99TasM
         0eVnnhNHl2INrUSsmK9uK0Y1m37jOg/6bw/MkMnp7+YyyXGMFXAeDIucBFCuCudkuMuA
         SxqsVeQ5+hL0/2A3mnaNyG64ZlGTfJzw1MwI4px915CiuChjs8lDSN6cQfrayZJ03rbw
         CvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vexBKIVQ3vKtK+czxh+cRwsjXp7SJkxfiU0C31i4HwY=;
        b=hgYyax5Ek6UrGfaJYNomnVBfynxeJVvHHIJTz08lmGl77IOJsmZt/4JnnKEup5ipAq
         82HLfrIaTjXLVcuM1hCsEfb1+bx431swY3F/AZgA6zwvmfFwe/VtAlkcz+JAXApLK6Ut
         3Gu7mjpiUQmPpihT3n/LKBOF4WNQiT9gKmtRYCG74Uo5hFOs9Eg4ngDuzB5MVt+y2W92
         ewLZI7KVek9cSDIepH8++bRtm9k2nSMXDnQGo5itiQIUhgxvOOBEmdsNuJfkMnCCG0Ka
         xQ92VFXgUE5jXJgNyzCYnEtbA+5zxVSLIJfiHUDaURXVOW1Xx1MODiBXab2bNsHrtv4H
         YJaA==
X-Gm-Message-State: ACrzQf2TISSACWOJRFtJv560IorLmrYX5sl0pNbz4gOzBF+S0jQfbNXf
	sE2qq9miIY1TY1qkjIPnhvpzhN5fnuejunlj
X-Google-Smtp-Source: 
 AMsMyM66ozx8+Yt2DEGfc812MFyXCwKDXDdLCqNam4GJ2y1wyJLzcVs9TEqvzeJsrEoB1XznZmr4Sw==
X-Received: by 2002:a17:90b:3543:b0:202:aa2d:b87 with SMTP id
 lt3-20020a17090b354300b00202aa2d0b87mr21566497pjb.118.1664133488990;
        Sun, 25 Sep 2022 12:18:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/33] glibc: stable 2.35 branch updates.
Date: Sun, 25 Sep 2022 09:17:17 -1000
Message-Id: 
 <0b75397a554c51d4fdfaff1641095615d14fd4e0.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171020

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Below commits on glibc-2.35 development branch are updated.

f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ #29415]
9e960717e1 Apply asm redirections in wchar.h before first use
577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug 29528)
83f1d9851e NEWS: Add entry for bug 28846
cbd8685e82 socket: Check lengths before advancing pointer in CMSG_NXTHDR
4bafc4001d alpha: Fix generic brk system call emulation in __brk_call (bug 29490)
37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]
a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL [BZ: 29265]
813a8d0171 Update syscall lists for Linux 5.19
e200127c6c riscv: Update rv64 libm test ulps
8c172a6cb0 dlfcn: Pass caller pointer to static dlopen implementation (bug 29446)

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ccb41e5af6..d3cea19f9c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "0e5b239f45992e4b54c6f946ecb0c410afc8bb08"
+SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


