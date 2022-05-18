Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C1C4167D
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3418.1652871573471049451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pkgy0Foh;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id tk15so3035001ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aob33HaZmLRuoQ+TdE/9goSF81w5gmiu+UCX4vP8oEw=;
        b=pkgy0FohzhSbpKRxRDERoFgAbKkJHJ0bgnNm9kqXqR4sWJLFu3Xbo4c4Bw0py9x/2c
         zXrNkQcYWb996Sct4LyYQyceNLHO/xFDNvih9EaIZRFNvqRqVgfJRhskvulY4llxxG1W
         cUACRn7Cy4OfNRQ2ElHojZCD4USyYfNUKaHD7eCGIpw15UGsnOOaHjyBFpEkj6UFnkVO
         OEYYrnAC6apB3g04kPVJXPJVdIjLTQ5piQdZL1q/5qkzJ1yx8/CbPFiFpSEIpguU/LBX
         smNa3Aa47VK8rjjQkDkuniJzTr2+Vjd9WnzEOHSv2otBzxo59Fuj/hxqwAdv3a1tjlhp
         rVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aob33HaZmLRuoQ+TdE/9goSF81w5gmiu+UCX4vP8oEw=;
        b=ZPIEUXfU6hLnobfzQLqNyyOWN6fcdQq8tHnpk7A8I0TPwO3L2rRdr63bUTE267WmaH
         8ymwE8b3RbHhLZmEYZh7ItoswMl9qxwHYiKMR46AcdfLbJBH5LaWsW5HzwDnjUrejWcF
         ikjdH8ykupBUAIsEZAoSJRllg5LbkpjrYZCcw/I5eDnmUGmIQ6DpyJ++IFdpCVKlNJAM
         pv6BVUol8ajbXaiiDS2Int/kpM4oLLD3hrQuR3S/hQPqkYUAW/GoRQILnhLhK4noOtie
         6P8D57i3nMWIgXShwWTo666v5mEVrvHPz36IT83RlWHDcTuv5lSXYt+8W0xzWW2BQZiE
         2oEA==
X-Gm-Message-State: AOAM533p5DklTulgZ5qqHpxYvYfKznRhwGGRhbmuTlLqteVGRpXK1PUG
	1YjdlPSPR8ArUlaH7zWwoNZowr59xs0=
X-Google-Smtp-Source: 
 ABdhPJz0lnyKczEyaxRDrrp/por9yMzHzkJ7/GrT1youYDsVYBj7ViZlAeK1tMnAYDS+6pjKY539mA==
X-Received: by 2002:a17:907:9720:b0:6f4:31d4:925f with SMTP id
 jg32-20020a170907972000b006f431d4925fmr23936537ejc.658.1652871572043;
        Wed, 18 May 2022 03:59:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/49] python3-pyparsing: upgrade 3.0.8 -> 3.0.9
Date: Wed, 18 May 2022 12:58:38 +0200
Message-Id: <20220518105843.3299331-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165841

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pyparsing_3.0.8.bb => python3-pyparsing_3.0.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.8.bb => python3-pyparsing_3.0.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
index 30be4bb87c..b858073c3b 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954"
+SRC_URI[sha256sum] = "2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.30.2


