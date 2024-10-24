Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B88D2E00E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 19:04:53 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.4513.1729796683400834623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 12:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoWfisf6;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7180ab89c58so832631a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729796682; x=1730401482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmntcfx5zckM9mj+071CDPZ6VdVdKgyRx5Y8wyKBMws=;
        b=FoWfisf6w2kvPyn5UDVpPDkJ+2jbAHBSgT1ynENuV++RCCEmHoOQYaJfB8XVBHtixu
         lf59vYBt4FuOwy/ZbVVEZs8YkQItKDiuABAcZ1iHg+Ls29TnYJyknDtL465RZyKrCWXh
         ilubU6RY4zV6zZDXi3TlRC97+Lzp084PWVaH5LlIr/MjNEB9/zttq1YWzDyv9Owl9qwg
         vKmMn+w+XKzAVdjSvkjkjMwDhWGifUylWe4105d2PusHOX/jOzwSjMner/ikNBjDUHby
         od0EpBGuyFQJiqJksM6E/tbn/MKn8dY9DXh9i2w26DuOa0JRaZkaePlPZl+Zc834Gfgv
         p9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796682; x=1730401482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmntcfx5zckM9mj+071CDPZ6VdVdKgyRx5Y8wyKBMws=;
        b=GlP0wr7BC16BfFlUPIet9VBuR2Ai/5jth06O+hH4xCDxJ3c6H4vIKZzqHvLtHsqb9x
         GCMcCTC5T9oILTjyMahl+DoDYI9dk5M5Cw0laWFwXMbPSsQ8k8DVhFxGH3Wpkezc2nAY
         Fi2pWGpIHgQ+v0AzRUhhevEEuxf6lRRxFs0L3cg/FQfxUcUggb/gRVgFlX7JU/ExaAXh
         3jnpOJgWveAX29gCiLvV87+qRe4u52+HPPB4V+UiAF6ymrK8vju78C+ZNxHkx/ub5I4m
         Ybm20P4mEltWq76eAzeXqb3yEgksEDGb0P7h684O3+yU7Zn1oYvd5vCvg/Jr+OPDePHm
         E2NA==
X-Gm-Message-State: AOJu0YyvTpyadIqjrQg85RYewSyzmx+Y3ws7A+A5DgKCPVvKLkafk0nL
	C1IKSTT9CcvI5Cc1D5y8pSk3EWH2Pjvzs8qnhz6QOtII+N3PjaN6ajteCQ==
X-Google-Smtp-Source: AGHT+IGX1gp5cJLmUQ10hN4xTOA0107arM/v1bL7qNzUck8vKuHzqUYE8rypn42AN2FqAmUUz4HyeA==
X-Received: by 2002:a05:6830:2644:b0:718:1109:9626 with SMTP id 46e09a7af769-7184b29609dmr6890085a34.6.1729796681761;
        Thu, 24 Oct 2024 12:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4437])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd5af8sm2233242a34.55.2024.10.24.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:04:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 0/4] Incompatible Licenses in Dynamic Packages
Date: Thu, 24 Oct 2024 13:03:06 -0600
Message-ID: <20241024190438.3630946-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023212013.995247-1-JPEWhacker@gmail.com>
References: <20241023212013.995247-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 19:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206303

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

v3: Fixed several bugs that were accidentally omitted from the previous
patch series, and feedback.

Joshua Watt (4):
  classes-global/license: Move functions to library code
  lib: license: Move package license skip to library
  lib: package: Check incompatible licenses at packaging time
  lib: package: Copy locale license

 meta/classes-global/base.bbclass          |  42 +----
 meta/classes-global/license.bbclass       | 165 ------------------
 meta/classes-global/package.bbclass       |   4 -
 meta/classes-recipe/license_image.bbclass |  14 +-
 meta/lib/oe/license.py                    | 202 ++++++++++++++++++++++
 meta/lib/oe/package.py                    |  10 +-
 6 files changed, 223 insertions(+), 214 deletions(-)

-- 
2.46.2


