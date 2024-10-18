Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61ABD3F2B6
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 22:08:24 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.33709.1729289304097460987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 15:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHZJNFvf;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e5ffbc6acbso1037678b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 15:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729289303; x=1729894103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kghm7wcleOEiaPasQv+p1Nxfgp7n7TSZfA0orslDa8=;
        b=OHZJNFvfnLOTZLMRmwTfbEPnEdFa2hpHgzZjO00J/iCM8LBF491bgOq/maqlVk5gln
         4UfN+rRH8kKfdTKP9zClVe8Lnws8NOXfnepVAMjYUP5E/f8S9wfvuApHd7i6+uY/bqtX
         AwSBehslZtHBAih/4oCumkuQz0yukS6xbcej5bsc3Z6FHQVDt7DDiWilhbr4LjycjoRm
         W31wtCbhnxoDI7u8reX2cNyIDsuzHsdbq0HH+qQL0CmCH++1JP/ziI/BshymhawrBdJp
         I0juum6r+1Ulivj36RCuFNooz+YApAp/YIbBA5BDB5brlFJrxybrcQzA2HM2USsQrjO8
         OfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729289303; x=1729894103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kghm7wcleOEiaPasQv+p1Nxfgp7n7TSZfA0orslDa8=;
        b=oXBvPqDHhd2IzmJtQ/29yvPja8gsIZH0Gw2LdJglsfTUWnG0UuIvvqODB19RUftqcs
         OtD4jQ/bBD83fmez7LdhLaebevxm4X32BzM8LlN6CJD+5MppiCYpkn3kkKTbYfa6GqwU
         ISFKS+3/2LMJxibfN96bc6Y643xzVPbaS8NHQIKV6/slqaBXtEgWKijkonMp9YZnc6cz
         eQ/s3T3sqwbcjw31MxYUJk1/0t3THGVSaX/iC/uf2oX8I8ynIv4+JxR9ZQvt6JAvb1IW
         ROecWiMVnkJZKagjMK0PTLTklfZ21+j4zMHMZ8BFT7BU0uScV7L2cTgamnjtkXR5gQKp
         40fg==
X-Gm-Message-State: AOJu0YzIbAL3LoQ/hdIZPdS8kk3O9X0Mc/8GzlFiZCglEkcwtCPd7R9N
	GA6pR29WOmb5k3BBiTv22gzjIbnSBGonGn1SUY1dViNSbE+0lU520dreHA==
X-Google-Smtp-Source: AGHT+IFJDLd0iryLp0QAiGtVpVSuKZo1jvmHt9ipkOdIxrJJbEsNx5EqxlO/pqIUYnmpGqlkvlJNLQ==
X-Received: by 2002:a05:6808:210d:b0:3e5:c7f8:ad7d with SMTP id 5614622812f47-3e602da0447mr3800718b6e.39.1729289302682;
        Fri, 18 Oct 2024 15:08:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9a72])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6029b7874sm554446b6e.8.2024.10.18.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 15:08:22 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/4] Incompatible license handling fixes
Date: Fri, 18 Oct 2024 15:59:01 -0600
Message-ID: <20241018220818.4042304-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 22:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206073

I noticed that INCOMPATIBLE_LICENSE was not applying *-locale-*
packages at packaging time like other packages. This meant that if there
were *-locale-* packages with an incompatible license, they would still
be generated, and then the final image would likely fail when the
packages were added to it.

These patches are more less ordered from least controversial to most
controversial :)

I suspect the first two are probably fine optimizations, the third uses
the new library code to make sure INCOMPATIBLE_LICENCE correctly applies
to *-locale-* packages. This same call would likely also need to be
called anywhere else dynamic package generation happens, unless there is
some smart way to detect that.

Finally, the last patch makes it possible to set the LICENSE field of
the generated *-locale-* packages, by making them match
LICENSE:${PN}-locale, if set. This provides a means for recipe writes to
affect the license of the split locale packages in the event that it
doesn't match the recipe LICENSE. This makes logical sense to me, but
please let me know if I'm missing some important assumption


Joshua Watt (4):
  classes-global/license: Move functions to library code
  lib: license: Move package license skip to library
  lib: package: Check for incompatible licenses in locale packages
  lib: package: Copy locale license

 meta/classes-global/base.bbclass          |  42 +----
 meta/classes-global/license.bbclass       | 165 ------------------
 meta/classes-recipe/license_image.bbclass |  14 +-
 meta/lib/oe/license.py                    | 203 ++++++++++++++++++++++
 meta/lib/oe/package.py                    |   7 +
 5 files changed, 224 insertions(+), 207 deletions(-)

-- 
2.46.2


