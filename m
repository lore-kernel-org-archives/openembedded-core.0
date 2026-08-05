Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3456EC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:01:43 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34828.1785913301006960153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 00:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=erPjVoUF;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c2a449c57so3721951cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913300; x=1786518100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HN5LGifwQvG5R5LqmznLjNiZNWmEwvzYvXTA9FFYpq4=;
        b=erPjVoUFDADiH58ZoC5S2a/sQGZVRe0RHNR9xqQg2TlyT+UUWeN7nBDkNHPFqrpvnL
         bFG+2+hmyox4FAwmC6imhtbPgRURA5ZrlyF7FISbnumxxwAOl4Zud/g0AgnA9+WD8fwb
         0XN5J8nc/ljEsfWyqE8+4BImtj5upFra8pOayMqHPpffVknkb/fJB3yCMTTVgjtF7XU4
         4dqMMMjRifn1pljCcvc+2O9tzKI9hhq+ktWpHdEO0zFZv4gXBZy9QW/pmkTJrPM4OHJP
         JfDV2KjskaZnr9Zfkp16lyBtI4mPJ7/0tKpuB1Ze+B5iiDJPX8jWpflhUH30nvEvP7LS
         a0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913300; x=1786518100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HN5LGifwQvG5R5LqmznLjNiZNWmEwvzYvXTA9FFYpq4=;
        b=revp4RSG9GBX2sGOIEE8E4nk8+XQ+/0OCOOepbVgs3u4J55WUZkxFdY6NlIUGXmBgg
         H1j3NN90MP4joRX9HhyOedj4T9wQHXCb9t02qdFean5q8ZEv6UzWQGWlYh5eWncR9GZr
         bCoWKgS/0aS/BCb/W9MTqL1Z+Ku/RbShVr9PQx75I2p+a0y0MGsvApLNIIaCyIubqsU5
         GIqdIRwdGmE3XBxjHJ+45o9CVhXEUmU5Oxuiev6tjRnOAahEsbKrBlFhZRCCg1uWBT0V
         eudSYyFfQ9QdfX9yci6FMHgwl+8G20gx/08zS9SVi8i3luNtoBXyS/ifN/9cVw/pjlz6
         M1Uw==
X-Gm-Message-State: AOJu0YwavcZvTduJjV9FtWj/aYMbpavNYHOgs9EBwlsQ+CpUUwcYBdVp
	egg/XxStVDP48O9+sxFF1HQTHJmpSvgfu5NSdLldKZP6IbOW4WvArNQF62lurQ==
X-Gm-Gg: AR+sD13tWsFQUdwjCo3GN46UNaeQTTjYML4lDBLBt+jF169gJejt4txFsXclKQThVkX
	bs0ddO/zI9a5O02LBjDBYg58cZYFFd/D/rlseQIkeigRQvbYP2sa9BXfB/nHIH5SRUL15g93+9/
	2KsVsW6rriYLLwaR9pmDiBK8QfcSoVA6QbmJYmt7Bk2HIw5ZnQ+5SZgv6J2+ZFQhmYL/gYMN3qZ
	vC5HBgsGKkAQuxlU4Qv2F5D6LaABs8CbYUnROOvHE89JEWGoci5Z0j2LxRAVofSr/s47PSGXVfi
	vP6Juka6iQHwvAg9IX36leUHcSQ5esLdejWhi9ivsi9TI9ng0BoTAOUjWz2I+oYjyguhI2B56Q9
	bRYJww2sm88A8oNJsZmS6NXe2/IQB+df1sH2ZMERLTEaN/9rKic770dqW1mDmF0AP16fKhZk4Kn
	Pd/c0VDOTs6fWwTzgg0rx+hJlIebXoaLU/TBUtm18l/nI0DECOqCjKvM9To4h2OVIk+NS4tc1GJ
	KC1UqFZXWRq4OE7Km1UwYg2TqFe+0k=
X-Received: by 2002:ac8:58ca:0:b0:51c:20:aea7 with SMTP id d75a77b69052e-52ce5f62d41mr43511801cf.9.1785913299902;
        Wed, 05 Aug 2026 00:01:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce8975b3dsm13211661cf.30.2026.08.05.00.01.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:01:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] add an SDK_FEATURES lever
Date: Wed,  5 Aug 2026 03:01:34 -0400
Message-ID: <20260805070136.3499233-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242830

SDK contents are close to all-or-nothing today. The one lever that
exists, SDK_TOOLCHAIN_LANGS, has the right shape but only ever covered
languages.

Add SDK_FEATURES, in the spirit of DISTRO_FEATURES and IMAGE_FEATURES,
and fold SDK_TOOLCHAIN_LANGS into it. BB_RENAMED_VARIABLES keeps the old
name working.

Every SDK_FEATURES test resolves inside TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK, which are packagegroup lists read at populate_sdk
time. Nothing in a compiler's configure ever sees SDK_FEATURES, so
changing it rebuilds no toolchain and two SDKs with different features
share everything underneath. That property is the point of the design and
the rest of this work depends on it.

This changes no existing SDK: SDK_FEATURES defaults to empty, and
BB_RENAMED_VARIABLES maps SDK_TOOLCHAIN_LANGS onto it so configurations
still using the old name keep working.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (2):
  bitbake.conf: add an SDK_FEATURES lever
  sdk: fold SDK_TOOLCHAIN_LANGS into SDK_FEATURES

 meta/classes-recipe/populate_sdk_base.bbclass | 21 +++++++++----------
 meta/conf/bitbake.conf                        |  2 ++
 meta/conf/documentation.conf                  |  1 +
 .../yocto-autobuilder/autobuilder.conf        |  2 +-
 .../packagegroups/packagegroup-core-sdk.bb    |  2 +-
 5 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


