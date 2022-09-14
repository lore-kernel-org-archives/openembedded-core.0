Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B081C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:11:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.1220.1663182668013092776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o/uze5ID;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w13so435212plp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=qXr3xWuIXe460xW4HBBED+PilpGqp33UAonEzCsrEME=;
        b=o/uze5ID2AviPfOpQFiDCWomkfXwKmrHEyTeFCEzl1chd8h3533K4/FiHvrzId0q7y
         AZBY2HXHKLSAAd4pv0ONkboWpE0Czoyr6TjD1RmAOAoM+rNysysKUd8rhGMCgKgOUzMn
         zLeydu1EK0AweJS/gMHfEnwR6FSpdGvVlX3QLyndtvPdHCCvLVPzcHA3O39tHkJR8f/p
         ji4Je/E1kC4hu8gG8RE0ZDBhRPGQUcF/aAUU4qxOtYfIv83UcTJw1zDnZDAVH0H0+s8M
         Blb0/18OEq4lLJbkuX0/U+HJ/i8ve0m6Mqfrs5FS5PIlK3S4vKKD76m0sFHfoMj6ZIN5
         eyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qXr3xWuIXe460xW4HBBED+PilpGqp33UAonEzCsrEME=;
        b=jdlaP0fBFSIUgFAkFTqR1yCUHIuWbsYaK62RzYWObcyEuvGzMhBDT+jl72d2Dm6S1s
         elbDQIdF4X76Ee7VVTkNL+5usFnev1UtLUx4RFrR0i6IV+/IL2Ea20rMp6PpnRxX+UEH
         nXgS75jDsMba1zokIHVRMVITAZg2kGFc43Ijdo9On0lrZ2N1ZCcxcVIvF7c7CnQoDFaF
         tRx6enOhc20DbfltEjjH3LGz2p8pipxk0zgZam5Ed6YLbL8miY/4Lwb2gNnPd13//xGB
         GZZfEfsjOcceN+D64oHnAQ5FPPWNQJilCKTtUzYIyCVUf8KE+CXVf4qKrxIwxfS3roNU
         mnyg==
X-Gm-Message-State: ACrzQf3maLDXAn4o9bMetSpc2lIxRFDbtqVg9uE6F2Sm/jTpQQgKV+CL
	2JkI9o7aKLkXRyMszsc4dsBLLHCPaA0EZ8q1
X-Google-Smtp-Source: 
 AMsMyM7Hp696BxOR4FzsTfiQ7mSx3PukJXSW6kRs4mkex+LWBijB4nQw9ROJgnqQirRFvjQGnFAL6Q==
X-Received: by 2002:a17:902:be02:b0:172:d409:e057 with SMTP id
 r2-20020a170902be0200b00172d409e057mr471357pls.90.1663182667142;
        Wed, 14 Sep 2022 12:11:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.11.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:11:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] vim: Upgrade 9.0.0341 -> 9.0.0453
Date: Wed, 14 Sep 2022 09:10:33 -1000
Message-Id: 
 <bc2e5e961e88eb9f4d8cd1f2ee0ed56ab00774a9.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663182524.git.steve@sakoman.com>
References: <cover.1663182524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170673

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2022-3099 and CVE-2022-3134.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d042923262130b6b96f703b5cd4184f659caeb92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33a8299243..70dc2dfecf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0341"
-SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
+PV .= ".0453"
+SRCREV = "83a19c5fda0556330860899bfb484addf9178cd0"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


