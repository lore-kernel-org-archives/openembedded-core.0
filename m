Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4742C83F1B
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.10495.1693064361311271710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Mazzza+L;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68bedc0c268so1701342b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064360; x=1693669160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=Mazzza+LWBtJwO47y3wgfzHVFCqUcRFrmwFOHcrbAbnE5xLy27ANHrU1EcVz/0LOEm
         vrtwo9bBX1fc0ap7ZkCHVpnl+TVHVdg0wjVej+jqBNmuq+f4CXz4ZBdHhYbrkc/J6nMc
         PMxbve0v+CGU+0FF1xi1BKwPga87rphNDr8oO/ToLrWnDlBZMOdJEZCeM9LrVw0d/xdk
         wc+yfz4lsbWYlJ9errqy4aeQRMPkUkFmtr0eGfjDcFFhMDEGvdpONb3iUSNykhuKN5kP
         grd/Jd0D9VnOXdrvjDeTRCS1JAQUzrf3i/54W78fHlw7SNfKFrAkVp1hDfCcJ8ASK6qJ
         ftiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064360; x=1693669160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=VVgLM6BLzkdXEui7KW7wt2bU58g54sfXMgpO3tYZtGE9YBdsG88843lCVR1vcDz/27
         A7mJwezSSBpPY9o3QNJ/4zYsU3NBDcPPIeqSZxYQC86HLSxERB6VUWSogRYBaq/2bzVe
         dUlJUCCQ8M6L78py/4EOBIzE84TA1aobDB/LJ4A5945kqNLG8BPQZZuCv7BhHwN+dRnA
         Y4ftXXflNqIG9TQihR/keVImKnYLK67zPgU7syFbesJXx3e1os+isVuKZuKs1w46NWfC
         aHf24zi0/wd+zcxH+y3agq5+bVv38IBVMn3obMkLPemoWRkoKi0uvD+pMrG5NiuqAQzH
         jYUg==
X-Gm-Message-State: AOJu0YyckvdVgHB56Dza1CMzHMrCxlO5dOUtPJeFa8/Oq3Jfrj1B2D14
	9nZTara63du0kcfzYgjlrsn9EDDZenhadQRNod0=
X-Google-Smtp-Source: AGHT+IF58Ynb7Z8GFaau5QmlaMP/hTmBOKupAA5b+oB8OWC1jfxGUPBUTNDiaJVHdfezpCHnR1+mnw==
X-Received: by 2002:a05:6a21:6da5:b0:138:64d4:b055 with SMTP id wl37-20020a056a216da500b0013864d4b055mr27467563pzb.55.1693064360479;
        Sat, 26 Aug 2023 08:39:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/20] yocto-uninative: Update hashes for uninative 4.1
Date: Sat, 26 Aug 2023 05:38:44 -1000
Message-Id: <c6d5a51ff933c9f8570326cebeea43fc14bcb3ec.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186757

From: Michael Halstead <mhalstead@linuxfoundation.org>

This version includes fixes to patchelf.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c5c8ff97ba0a7f9adc592d702b865b3d166a24b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad4816a1f3..b3bd7794fb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.0"
+UNINATIVE_VERSION = "4.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
-UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
-UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
+UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
+UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
+UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
-- 
2.34.1


