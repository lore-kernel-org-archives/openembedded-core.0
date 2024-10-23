Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB817CFA47D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:20:27 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.9317.1729718419615861371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nl4PUmDw;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288a90e4190so209534fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718418; x=1730323218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSNV6Utgsbki/uPkqRqoWGpzO1IA2lJFOfDLmMyIqzM=;
        b=nl4PUmDwkysEYqNl4aJval5DBCcgKEDBcASConRYVP8akqdTyx0slzRuPL8XauX9YZ
         7Qaq0Cg9vri9uzjEUems2QcEY++MP80d7eczncKvDPUAuaqWJngyMNtsMyuTzmHA2ddc
         cqGWtyakbTGxxpqsQJjYgMoQoZsf6Pet7tbWe3InQwWUknTj7neACNxrOxPhNGz0QoH7
         mTjM5k/wa/jX5wzJU3vnHzA9nuLGBtl2rwouQP9uCoclBcCMmdj1LlX7uZvLhgdu0Zu8
         imfkyiFAecpSppykFKQf6P7booDUuKKrxdvc4oZJgxE2D+dGdDNKuDYZ7Nvqncw6IQ++
         Ugpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718418; x=1730323218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSNV6Utgsbki/uPkqRqoWGpzO1IA2lJFOfDLmMyIqzM=;
        b=HKeH4PswfxRW06fJI0SrpFKJ089whCR44paioIH29NdAWXcPimA1N5Kb8/LpHUH9kr
         a35Tys3mdA3co4LNOSTqHROKkgU/nlA3iyhTH/KZ7kEiNYXEsQ47B7kHsMpRuEhybj1A
         VFdp35wujkwJR064E9W6HPcSi+GIXinVueCIdqSbfUj0MGBv0StyeeRJ7VRluoX/yzyw
         bnxbauv0uOvzx1vlcyYvWX+tBdEi7BSx22kJ1ugXEle8Fj7TOs8kvJdCjuGyFA/bM82L
         /DUNzZFk0zs1IvByReDd0ebHhgffMP8YSfpfsklpNGFymLBofBQ9y3Wlcen9dxnAPu/2
         5Wew==
X-Gm-Message-State: AOJu0Yx+bsQCpruAWkB/+8Xw1Bvz6gPFS4bTtSu1HH36sxMVdDgoie7T
	tpkoZT7FUF9+gx62tS4U01gqez56GSKA+A/SFwHjEuoMUMBjjrRs7kJjeg==
X-Google-Smtp-Source: AGHT+IFvVRerJZyPEgF2yJ1T6xoN2F1GADbrHpMqGro92NiUjmapaxckOzcwTygX4lCVWw8YBH60FQ==
X-Received: by 2002:a05:6870:d0c2:b0:254:bd24:de83 with SMTP id 586e51a60fabf-28ccb7f3a4dmr4524983fac.12.1729718418239;
        Wed, 23 Oct 2024 14:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fbb0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79204699sm2681940fac.2.2024.10.23.14.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 0/4] Incompatible Licenses in Dynamic Packages
Date: Wed, 23 Oct 2024 15:15:18 -0600
Message-ID: <20241023212013.995247-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241018220818.4042304-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 21:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206265

I noticed that INCOMPATIBLE_LICENSE was not applying *-locale-*
packages at packaging time like other packages. This meant that if there
were *-locale-* packages with an incompatible license, they would still
be generated, and then the final image would likely fail when the
packages were added to it. This is actually not just a problem with
*-locale-* packages, but in fact any packages generated dynamically.

To fix this for all cases, the code to detect incompatible licenses in
packages is moved to a library function, and instead of using the
'_exclude-incompatible-' variable to transfer this knowledge from
base.bbclass to do_package, the library function is called a second time
in do_package. While slightly less efficient, this means that do_package
is checking the actual final list of packages for license exclusions,
make it accurate even when dynamic packages are added.

Finally, the last patch makes it possible to set the LICENSE field of
the generated *-locale-* packages, by making them match
LICENSE:${PN}-locale, if set. This provides a means for recipe writes to
affect the license of the split locale packages in the event that it
doesn't match the recipe LICENSE. This makes logical sense to me, but
please let me know if I'm missing some important assumption

Joshua Watt (4):
  classes-global/license: Move functions to library code
  lib: license: Move package license skip to library
  lib: package: Check incompatible licenses at packaging time
  lib: package: Copy locale license

 meta/classes-global/base.bbclass          |  42 +----
 meta/classes-global/license.bbclass       | 165 ------------------
 meta/classes-recipe/license_image.bbclass |  14 +-
 meta/lib/oe/license.py                    | 202 ++++++++++++++++++++++
 meta/lib/oe/package.py                    |  10 +-
 5 files changed, 223 insertions(+), 210 deletions(-)

-- 
2.46.2


