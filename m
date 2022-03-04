Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045EDC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.7856.1646406326744935499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IzJoCXL0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id z2so7960202plg.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Mp07xbDiLsMGi0wH9J+TvxI08miDSgjc/tJGGeDzl6I=;
        b=IzJoCXL0IIuo4SaGP5b3ZEiAzB3u4OebKhgIY8ns2ZoacFawIrYrY3u304IRN/vwAm
         PzjuGrz2fikyIjN6Kc5oZ0nl0dTxFJCbGOvMfsfOcbwvJfvlf0zG2hYIB6KhPwPtL3vr
         eZw25y7lxr7eDG8c9Ggo2Hn/zkQib3DLqAQHistiGVq8lbQJbkgYn7EpK+4PlBn84BDd
         cQw/YyBu56t8Fj2yJ8shFbJwgHNPGKvyHo3uOKxZkb09CxgYJ7AIckaHTOtloPKMTjlP
         FKfXP2qVziFw20Y6e88tLBZWwfHXVveaWkTfAku008mOthPWrkDUhCGowZA/0RLPindu
         Wr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mp07xbDiLsMGi0wH9J+TvxI08miDSgjc/tJGGeDzl6I=;
        b=DBbI141nvgmRJ26wOknKyNUpZT/9uoC5SvyJa/EiF7C+M/+4siiEXITMMsesA6X0oy
         NBJFa4Q6dGH4oNaDIlFOr+XXXRJbJ1lO2uRM6LXx1Nz0Cg4UhDLCB5FbRHSsl66/9lWP
         cYXq5KW9GJVvLeRtZuW5rU2rmEB9Ogy/pOh6/6enI3kXHgOFhstxNE3ksWoV4+1EvrJs
         4YPeEYuu1XYgQ5dB0Xbe3c/8ox9CRNR7WRvn4sQw4XkkvukxUR/yqlCokGV/D2IMo+bZ
         8Jjohyfya31WxYd6JVhz23JlJyL+81J1xurOPLB4sSWI/id4pDcWVOWtzC68DPXhYX8k
         qKtw==
X-Gm-Message-State: AOAM531C/PUGrLNMAQyz93U8XcTuUdDMItX5FeUezZtvhA1wID3TPxkw
	BCVVZwycvdz7YtKiWms5X6jgF2HVoAew7epxckw=
X-Google-Smtp-Source: 
 ABdhPJxLcvZeCDp/kcXDU2sb3kB/Iq/1dBxlxYWjusNYToazdXmyCyGX1ulF80T4xgNWpOIotCxhAA==
X-Received: by 2002:a17:902:d2ce:b0:151:6781:affa with SMTP id
 n14-20020a170902d2ce00b001516781affamr26770783plc.168.1646406325607;
        Fri, 04 Mar 2022 07:05:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/18] uninative: Upgrade to 3.5
Date: Fri,  4 Mar 2022 05:04:26 -1000
Message-Id: 
 <51844f2d60d77fb8cb46ffe460402f76ae216ca5.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162737

From: Michael Halstead <mhalstead@linuxfoundation.org>

Add support for glibc 2.35.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 347b8c87fb4e2c398644f900728cf6e22ba4516d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6833072cd3..bfe05ce1eb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.34"
-UNINATIVE_VERSION = "3.4"
+UNINATIVE_MAXGLIBCVERSION = "2.35"
+UNINATIVE_VERSION = "3.5"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
-UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
-UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
+UNINATIVE_CHECKSUM[aarch64] ?= "6de0771bd21e0fcb5e80388e5b561a8023b24083bcbf46e056a089982aff75d7"
+UNINATIVE_CHECKSUM[i686] ?= "8c8745becbfa1c341bae839c7eab56ddf17ce36c303bcd73d3b2f2f788b631c2"
+UNINATIVE_CHECKSUM[x86_64] ?= "e8047a5748e6f266165da141eb6d08b23674f30e477b0e5505b6403d50fbc4b2"
-- 
2.25.1


