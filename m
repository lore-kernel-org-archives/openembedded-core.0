Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CABC77B60
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.44004.1679494917520510758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vFR0ogU6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id le6so19396737plb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcigD8eMN6SZ82E7iheygHWMYFvgBQ+nmytKRznAH+U=;
        b=vFR0ogU6v60SqtdVIriC1qv/AEJWpk5A06fNUMX/R4IlVhhmebMMTj5L3qkp8OAHwZ
         U3yGxN/t0SUW3lFzY1MzbYQP/WBO++4UlsaZumKQ2wLAop7rykykwBqFQyjGgW94J9Mb
         6/r9HM++ZNY/Ds5sysBAn/RMTpmnQDd3iLu7K1SoaN+TaVhOdGYwLudPzGUw6jYkTcmt
         CHvhT8Be2eCxoZ+GpTuVGjOJ7DhaRAP+vescsjL5yuNYP5O3o7innvRzJEz5e6s4fCcR
         LMdfxtW5G/SfQ10cafbEZmdkdVUZ88gy2sdZxblOZyrRPQmUfhxHEGwqW6T3iTwIwADO
         tpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcigD8eMN6SZ82E7iheygHWMYFvgBQ+nmytKRznAH+U=;
        b=RaYWUIhAxZ2jHmoKDbg99JBRIxLi6mN3zAx+mJ49quRN18ml5zwbsY5bKF7HNdoaU4
         SFz076/E+sMvmafVFd/mmc19QlE2JtlK0/RLVyxQwjMkqV0a31Xs5MIpvYb81CaZhZtw
         dvleLPZNPyOGxdLPe2T9nplLhdiA5CaDvkqTt7IkW4u1So3Sd3hqpiM+wPSAlGoudzce
         XwFlrk3Yepc1Gxm4FnNZXIUOU3cltgc0HFihOiLpyJOubxEeyJos4FUGM+wSwK8c/mGX
         LCo1IN7zy4r3aJjdRL0p1vSjkADLnv++dt4X1KOWSEeLvjwbd+uwjPFsfcpeWnF1qSk3
         b9fg==
X-Gm-Message-State: AO0yUKWCFNxKZxNtm12hsFRd/8vTWgaRjfu1/1ND179f6Zmu+2VdN4Fa
	YqkSlvRSkvscDACLDGjWTY7nlsOITT41OD3cjl0=
X-Google-Smtp-Source: AK7set9vv8sImNT7HfAQiX08/YPMFCieH/y+Lgsz2R/V7GtCE+9hfuxlaR3dcFp6an1oRRnogNd/cQ==
X-Received: by 2002:a05:6a20:47db:b0:d9:fc6c:520b with SMTP id ey27-20020a056a2047db00b000d9fc6c520bmr4754770pzb.41.1679494916583;
        Wed, 22 Mar 2023 07:21:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/21] libgit2: update license information
Date: Wed, 22 Mar 2023 04:21:23 -1000
Message-Id: <a45bc475c7d983aef57c51dc51cb24902959e6f6.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178929

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

The LICENSE did not have complete information.
Some examples of missing license:

Zlib: deps/zlib/
ISC: tests/clar/clar.c
LGPL-2.1-or-later: src/libgit2/xdiff/xdiffi.c
CC0-1.0: src/util/rand.c

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5560a0e15bd860a59671a66cc76ad1bb7e07c9d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libgit2/libgit2_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.1.bb b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
index 59866ce385..eb7b538ece 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
-- 
2.34.1


