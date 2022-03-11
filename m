Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD55C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:39:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.8286.1647020389086262490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z73AZBUe;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so8775772pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPcHuiT1t3usLE3FEQiPzEuzdUw6j6aaqlfjyDxxblw=;
        b=Z73AZBUeWjFMH4sA/Zz+QGq5LSh+Qv/jb6sEo+JYa/3YVyQYVUMyh+IBqk4JhVD8W4
         D1QzyOAhPNgVD1NGlnyEzQ3+sxS/JuMtZZBQ7roEp20Q3Xx4fdrdtd/aXCYzndY0oD0L
         VefJDPv71/eZDdDfp4ehBYJnwkgJ2MbgSTZLjFHHRT2AmveDQsZPp8hEkHmALIYvxYk9
         EYiJcMHyTKnGg1JGu0T5oo5BfjqA3UEWq+FR3gnxIiaJJFJ3GdpKADCVjZW/H1JubV4E
         H5OkFFsSs57GgtiZRR7FCSG2xd3upHFgaUZ0MU77RuOb3H6fk08x/MTUiYYSYCB8QC7A
         sEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPcHuiT1t3usLE3FEQiPzEuzdUw6j6aaqlfjyDxxblw=;
        b=nW4Gq5IzPi9P/b0UBXaWjwSMVV/Wo99Q6lK1VXT5Janajj62IqojOTfzXTdDdz4Bso
         jZKyDxlC1NPTIpXiz5ifoqtg/NRYQL4ofp4sSl/PgnqXIPPI4S1oLDjbFwxgclae1v+f
         ECEu++4yBtdKDgDEtmQvqo6kQLz2n/Ro+P4WLV6hmvSXNuttLmW506T9/cv1s1xDZYRy
         L98lsJUD575yj2ntFUpeP5W65YSfU0c8+KAhqeHsZWQp5Js5imuaJmktJ6KgpaETNCvG
         PjaXS1UUIrz53RtW9+12TPbbcJ269iKpO6P5gXS0K0uFtWb3wRrhLqx9s4hNFNkO6Q4c
         OFMQ==
X-Gm-Message-State: AOAM533tzyhdnNeBxxdEgKR3Xs/BiUtrizen3BokLTOtqAbxe93xvZ4J
	poYiYfk4ZbbrShy9MjIeusV46JuyB5k52Q==
X-Google-Smtp-Source: 
 ABdhPJxxfdTAJm2j5J5l+aRE09yD11erla5vrnwiqZSlg+RUqYG3zY0EUq3I6wUL2urfMoWDFUaTNQ==
X-Received: by 2002:a17:902:ce0d:b0:14f:c36f:afd with SMTP id
 k13-20020a170902ce0d00b0014fc36f0afdmr11409085plg.63.1647020388363;
        Fri, 11 Mar 2022 09:39:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a638f44000000b0038105776895sm3135529pgn.76.2022.03.11.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 09:39:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcompat: Update to latest
Date: Fri, 11 Mar 2022 09:39:45 -0800
Message-Id: <20220311173945.735841-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163072

Brings in these fixes

  * 391b270 unistd: add __close
  * 8af2ff2 random_r: set `x` before calling savestate_r
  * cca99e8 wchar: add __mbrlen
  * 59e99e9 random_r: Add reentrant random functions from LSB
  * 6461276 gnulib: Add __fdelt_warn alias

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 955cc3c0100..cab1a97a84d 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
 SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
 
 PV = "1.0.0+1.1+git${SRCPV}"
-SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
+SRCREV = "4d6a5156a6eb7f56b30d93853a872e36dadde81b"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


