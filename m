Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FA7C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 09:26:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.17618.1653557160073222526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 02:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SU4JJ5a0;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id m1so992305plx.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=wr/q6KzJwQslbYm6ijvoFxNkd3kVGtOkec3YKe7mRqg=;
        b=SU4JJ5a03XMUmiMQqFVmk466nk9i4WMExT2jDTqPtTXnr0qTg+kxTZKOZhGYXD7wb4
         UN0uO8XJI9sINCxsQFq1adgM+dVAyR0VFojr2p7R99hHYJEe97DQ2Deg9MSBTpNXrnUF
         AZSIxQ3r1MH8kOHJ92k7/3rfGLlKZvsTV90AFzi7ZbgNzq1Ymu+nxpKS2Cfgw6RSyhCP
         fHFutj5uIUnvQqcn5scTWojC1K7RZf7bk8AHfhmkOs9BhlrTntNGbEmOcmUtlpv+VpBr
         3B1De5F/3q16c1ISIrYmhya8t86/HkpZwAZOnXRZuDS1BEMHUfhkMls7RgIcwo2fujQy
         Z1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wr/q6KzJwQslbYm6ijvoFxNkd3kVGtOkec3YKe7mRqg=;
        b=KopEvSDm18XOhyCzlOQKrEX/D18cEtRbxLGcZyMuTIh4Lnf605Qons2YfriB06MPTq
         3InURVaIZdGGNcKLrel5wEl+8rPIpkyJiZzzeI5eNniN6EW1c6M0P1W3m1PsD3VpTwad
         Wu43K4C44INR8lZgq9e1AslhioQnWAE+Oyinh9lCHo7zDQ/0tM+MP5cY96rBFiIIsIoB
         yJScJubyDesNTP2z387bHiPGTQGz4hEL3sMpJP9t/XootUX3mpJRzdGXgmr8T8yVY7sD
         WeRjsg2PFYrkPUvzQVI9IeQUbz2WPQkMYng9HCYV5SMfMyqaWvhul1i+G6Stc4+eTXCy
         JpxA==
X-Gm-Message-State: AOAM532eIiTd9UpXQzMnhMCEuOBKbontIwMh2AaBr5qLV++AfX1bATvH
	jri20iEZbbyev13bVI/Z0E6Annggp6Q=
X-Google-Smtp-Source: 
 ABdhPJytHBzQeQ5Ukkj42e25UilUmQcX+z36saPukoI6eCob8l8fCk6mZ3vvqeumJXYbHnHrjLRADQ==
X-Received: by 2002:a17:902:e54e:b0:162:4b8b:f2be with SMTP id
 n14-20020a170902e54e00b001624b8bf2bemr11323367plf.5.1653557159166;
        Thu, 26 May 2022 02:25:59 -0700 (PDT)
Received: from localhost.localdomain ([103.238.105.13])
        by smtp.gmail.com with ESMTPSA id
 j2-20020aa79282000000b005187f4ebd12sm948556pfa.123.2022.05.26.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 02:25:58 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH 1/2] ruby: Upgrade ruby to 2.7.6 for
 security fix
Date: Thu, 26 May 2022 14:55:16 +0530
Message-Id: <20220526092517.22032-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 09:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166178

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Upgrade ruby to 2.7.6
Link: https://www.ruby-lang.org/en/news/2022/04/12/ruby-2-7-6-released/
This includes CVE-2022-28739 security fix

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.5.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 44a2527ee7..658a17659a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "ede247b56fb862f1f67f9471189b04d4"
-SRC_URI[sha256sum] = "2755b900a21235b443bb16dadd9032f784d4a88f143d852bc5d154f22b8781f1"
+SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
+SRC_URI[sha256sum] = "e7203b0cc09442ed2c08936d483f8ac140ec1c72e37bb5c401646b7866cb5d10"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.17.1


