Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.32531.1620657002173062474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=E2PUq1SB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so4427503otq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0yKof36e2dV4iKzGMqI2gVnN+3iMDu4nw9jO6+qc/7s=;
        b=E2PUq1SByvHuBFCh5DczFwi6hboWnyOnbrkvQektGxfH4NR7HuV1E01a9ywuxpViTR
         lUDpZkSLzlILErxThFEwCiDw0X0Q7I/Z4bRip6vj/3EUEkEWw6Zm8L++fSNDGEbWDrtG
         bNPDRQWbd+N5sbVHyfmoHDYT+LvPrk8NuzszVwKbLhq6Q7CyN8AYRSjkD+zQ8iwduD/5
         Fz/5EWPe0hAoSXZXLvik7iAH2p1s18zf3xJi/CDflK5yq8tC5LTz+1Nx1hNvZZ58C7vU
         0byJh29XX+Le+UuQr5HFreHgIK1euWaGXmaBNw0GxaiW/4KU9xTFAkscaF0mrhyb6uZ8
         chzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0yKof36e2dV4iKzGMqI2gVnN+3iMDu4nw9jO6+qc/7s=;
        b=EzqUrWzfj0f5dtKpaaI66xrNo6T0RaIApezIv0se9ngu4Doem+pIm66hW+JChz1H1i
         BvFnGtIJn/vBGKjmG57vlqrukZBEiw2dKgu7d675CTLGepAR8vqQ/m72hv3pBIiIBtH/
         Xqg//wDvdXWymeFPEPGrDnVIdlm9A8qhtYE//s309ir/+nU5WYjb2GhwE/cZcvVeRNQV
         ZoyS9yrrfLMm5j3WaSHBOXxyJXmEdqSmt/OVHL0usjHq+TK7HACosO6wG2S0y6RcvlyJ
         2GNevk70S81hJC17y1P63ouPxSygPWC3rK/RXAGZPtC6PcHfOdpBT7hZz4VHu3WzPa6m
         Kz3w==
X-Gm-Message-State: AOAM5327pR1bv9PdKUsx9AJobiB6wMDLeGyfpamn/BIKOQEqf9B7bSGE
	AkNa3M0J2pCAnkLE7rpZYS8iGiFT8L7Q/jzui8c=
X-Google-Smtp-Source: ABdhPJyzNZVfRXOFt3hU0kYrTLeZBwT78k3KTKho4Nipa4kFS64A/AlWrnt8ZXJToWod8q+HV9xwvw==
X-Received: by 2002:a9d:f66:: with SMTP id 93mr21454044ott.229.1620657001064;
        Mon, 10 May 2021 07:30:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/25] yocto-uninative: Update to 3.1 which includes a patchelf fix
Date: Mon, 10 May 2021 04:28:45 -1000
Message-Id: <6f4c91b64ef6448b256f3f58c840769986edede8.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d9d38eb6b3621fed58a217eeb4de1816e3e6487)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a2a2dd18ec..05b79d14c3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
-UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
-UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
-UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
+UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
+UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
-- 
2.25.1

