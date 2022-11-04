Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECCFC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7165.1667530940730045689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=St0BUojs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p21so3714254plr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NLe73IpHA6NEoBmtccxcvFYg8IY0zMdsuPrGt4C8Ug=;
        b=St0BUojsu6S2/HboQPsRC/HMKVVDVQd/nRTjLK1DieC+Fp4rC7O4KbFV4uLvCv1zeR
         qAJge4YQ222uA9mVCKULcXcGalITShvLRD1KiabaSMPPl8/e6rbcGMXbs6afRUIS8r9H
         +EkW6Yez1qsof45WexrNpm9EiJmPzKt4zh/5m/qaw7HQZKlW5oozmdIbidcGu6AL/TcS
         PKczfgLuqUlyKIzRt+NxnX+e+vCpuEstzzlNUC8ZgQcL9BNBZzJADI7HOlSiTxJhr2We
         mn7Or9Lvs0ULgy2gEqZsgnsT+FKkseIDt3GcXLvtYxhqFfyErEik9DlZIj8RynW3GEiK
         /bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NLe73IpHA6NEoBmtccxcvFYg8IY0zMdsuPrGt4C8Ug=;
        b=zpM6T/ykMZ/5pnsH/lW5KfDAs4eXK0x0Uqd9xiSg3ZSTm9T0QWzfZh+Xh3KS3rO+cz
         lpN0syYGdPKHa0ALhoOnbAmU1Ww+HiLkhYjkXfon0GEVOvoh1Zae2SbPdqCNrc1ZmACB
         8iHLtyx7aOCHc/1yo4w16z0SL/Yrt7umVNve/x44Y+w9nogCcf6jwKbUsMFIXjVwzctd
         ADuJufyg5km1OdS5lh5MBEkz9MmntY4snqn+cHCEJl+eqftiswSSo7n4Tggad0GU+2fy
         WTMWrplNsvt3xUdWWII2Gq2nH14e7Su/y0pj5FyB5+IP9d8U2mtKyfgbHC+pRVrfH9Xa
         /rTA==
X-Gm-Message-State: ACrzQf02a+bEvAKlDJ6zts96Y0tbQMtb4ThwJz2JhFkTlXNEepjG+kKW
	SGdkyWUUNSeeXB/iiyf9yGuCS4TuVUfIHf85
X-Google-Smtp-Source: AMsMyM6a5NSHnVK0/tupxWFr/6q40yLNxZx3zMlbRmLOPwluMcLmQT3rdtLc9RS0HHu5AybjYoPxYA==
X-Received: by 2002:a17:90a:5308:b0:20b:1eae:c94e with SMTP id x8-20020a17090a530800b0020b1eaec94emr17358247pjh.88.1667530939732;
        Thu, 03 Nov 2022 20:02:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/31] perf: Depend on native setuptools3
Date: Thu,  3 Nov 2022 17:01:06 -1000
Message-Id: <b9fb393eb437fb4a37ef016a2f667dda03776267.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172692

From: Khem Raj <raj.khem@gmail.com>

perf has need for python setuptools when scripting is enabled
from 6.0.0 onwards it seems to throw an explicit error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da3d00178809bbf7cc453401e0c5937796ebc2c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 772bc2dea1..a4ce3169d3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
-- 
2.25.1


