Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFB2C636F9
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.8134.1650463789583245619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=52Cgv1Br;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id z16so2041721pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NY0ijhF2sdr1EtA0RqQLqVp4T9OGtGccwKPKuQG8T0Q=;
        b=52Cgv1BrLC8W8hAlGGlp9RWLvNmaEzXY71oZPNMSLtoWTTE+SWEshgZSoY/Z5ANmiK
         VA0XtC91C+CHP89YDB6XvS/vRIWFuRaEkvJbjmQ1ZjuUQCZwAZqHOX98SN+eCF76pNKm
         Lb7QM/LSTVER+NUf17wAi9QFuptzeM4Vv3fvIDi0BuMvhpNInxX09e/TjhXEzXagje8G
         uPIbBHAEBjWsgzOwSUeeG/6fLfI++STUXaFIRaxQ0apBQZGJKs41mZa5lWBmkVm3rTlI
         y22KU3BApvo95Nq/G/VCLL4lttmZ6A2UFFkcM/eNKYMVtUXPKMXseyZeTkMwivwxPMtb
         ybCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NY0ijhF2sdr1EtA0RqQLqVp4T9OGtGccwKPKuQG8T0Q=;
        b=O0bUG/eGRou7gyMnKLMvMySAw5RHCvQ+8BYTgOVGKfQMaYuytaTvE++Y0t6nwv5tH8
         xbIT4RGwsfDSj7wLVZBP6Ggz9c0INgLFnuEDozbS1Basvux319b4KY9SPKUDd3HI7HFq
         4iAUWg2AVbf7vlAU4EVti77UykBdTyZojQttODeL/rdeawgjjahkA2/PlS3sL45Bdma0
         YnI7oIf2nhC8lJnqzclUGUTIc4KFCdfYMt6tJBhBv/LhLIsq8vNT7MHYiwBoFQYTgfHN
         7JCWbVNQ7eISwPt1nNs53vVX0R2np9PwMDbqQesPX7EB4sjUd1PlKciO6FRoNA9u+YUZ
         kWkQ==
X-Gm-Message-State: AOAM531snwCKcsP0UB4NkXDAyMF5jAvUoUmacwJD9pAClh9ge3WLw6Yc
	BinZLWWzFoRhjdSYnkB6by/mJiH6/SwaFtxZ4CU=
X-Google-Smtp-Source: 
 ABdhPJzVqOJvTK4UV6w20TWF0YrDnT3Yuuqd1tD2H1aOepD+NO8dJhGW7Smdjy10z9o+YDZV38H6BA==
X-Received: by 2002:a63:7cf:0:b0:399:58f3:9acc with SMTP id
 198-20020a6307cf000000b0039958f39accmr5958793pgh.149.1650463788578;
        Wed, 20 Apr 2022 07:09:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/27] ruby: upgrade 3.1.1 -> 3.1.2
Date: Wed, 20 Apr 2022 04:08:15 -1000
Message-Id: 
 <f93933ee2e6dbef433538845fb37e26ce9e2e85f.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164695

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Ruby 3.1.2 has been released.

This release includes security fixes.

CVE-2022-28738: Double free in Regexp compilation
CVE-2022-28739: Buffer overrun in String-to-Float conversion

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1306c732a39070e12306b0b7a393e2a482c8b326)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.1.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.2.bb
index d8fddfa520..38ba46731b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            "
 
-SRC_URI[sha256sum] = "fe6e4782de97443978ddba8ba4be38d222aa24dc3e3f02a6a8e7701c0eeb619d"
+SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


