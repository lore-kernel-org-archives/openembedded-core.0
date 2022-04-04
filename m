Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41EEC4743C
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.30429.1649039470167183069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nl44MUHL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id p8so7665324pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=psq9zy2icCwHzspKsLWFYciFRiPmInU8Yw6ow7ipUjQ=;
        b=Nl44MUHLWSQM1n9/oOXdxobjpzYJgC2I4Lyp5UyVd1GYllp/LF/sDuaZ+wi13UZ/rs
         HtbO5CHY79Hsouw1+CEGEMvtKrp5J57GpxF6ZOUQefC62JjLZ/3iljT1Wbwbfpd4dDxN
         XbL/IFRURjfBypQfRW6D16qv9qbE96DAA2EbSLvCcJskw2n+c9uYxrT7bF3FSVu7PlQC
         amxlBRShxKrxCHsq0NgxUDpkHfDaHNFbyx0rCp8hII5H+g1bHOjCpv58CM6ar1sW6IAN
         LU/oE13HaykKGiRS9iOME9W4p7SJ6DV/vYjoD6jR1ynR3NPN/5eWoAu6OX802GAXknu6
         rkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psq9zy2icCwHzspKsLWFYciFRiPmInU8Yw6ow7ipUjQ=;
        b=Eqy2LKJRw7LnhxARwsGFwjiYuobZR47Q28zEJtpVPYzTeyiTFL2lub8qhVPnDYE5Ak
         DiiGjP8GS2rkJFtvRxfKJWQc7uReTZPAqGUwZe6OhCS/e2jCA+wgdluSDY2KHcA1aFZU
         YrDqFZkbCcKjuV9QG1guBpcWansM62JbXw/ejB4Vld3c8COLGO0y9p0EC/KLnGqnhI4T
         kSizDD5OhvbEkc/P3MwBWU/1OlNCZYnYPnWhFM2jG1F4rAJB7JWMOhOaE0c/GLlJv4Gw
         JEkDWKWy2GGaWK1euthyFn/Cui99x2thvARZ0VhUMgmzzne2La2OkTC5NdYM99rew0qb
         1ftQ==
X-Gm-Message-State: AOAM533Z0rljys0tM4dqW3is+NlLzNGD5aMKNFKGbKOFMDCDvK9AzJnN
	A0EOTwZTK3GAYtl2/mdLQKOKRz7k7tfzCpQlGaM=
X-Google-Smtp-Source: 
 ABdhPJwcWxe00E2fSgNZaY8JzeKq3US2+p0p7ABCbHF6aRSXMIb3E9MK0Bz45oQKGWTjI71gwPzVEg==
X-Received: by 2002:a63:3e47:0:b0:382:366:64ea with SMTP id
 l68-20020a633e47000000b00382036664eamr23782112pga.210.1649039469237;
        Sun, 03 Apr 2022 19:31:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] mirrors: Add missing gitsm entries for
 yocto/oe mirrors
Date: Sun,  3 Apr 2022 16:30:26 -1000
Message-Id: 
 <f01207976eff87d5654c236cff3bf94679964de7.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163977

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The missing gitsm:// mappings looks like an oversight, add them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6600b9fca7888fb41647cd000b9efb7f0762dfde)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index a36236df9f..669d0cc8ff 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -42,6 +42,7 @@ ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourcew
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+gitsm://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
 bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
@@ -52,6 +53,7 @@ npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
 cvs://.*/.*     http://sources.openembedded.org/ \n \
 svn://.*/.*     http://sources.openembedded.org/ \n \
 git://.*/.*     http://sources.openembedded.org/ \n \
+gitsm://.*/.*     http://sources.openembedded.org/ \n \
 hg://.*/.*      http://sources.openembedded.org/ \n \
 bzr://.*/.*     http://sources.openembedded.org/ \n \
 p4://.*/.*      http://sources.openembedded.org/ \n \
-- 
2.25.1


