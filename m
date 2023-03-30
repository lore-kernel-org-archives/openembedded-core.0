Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05E2C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.38972.1680210856428173993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ylGA8Q/l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id c4so2487062pjs.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210862; x=1682802862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KENU/j2xG3Vsdx0K29hF7OQSXyG13AHFi76Y2uXhO2Q=;
        b=ylGA8Q/l2HR/yhaK3qQ5Tm+hj64YrhNR33hJltaJuQm4pEQexHELt3gHTfdm3iEri8
         I+qJSIlcN3/CipxDBrFNG/C51uTiaT+XZ672akU4yKRhSfRK325I+4oW5XEtFHFcg1N0
         vkxJJFkeXDsIbmdPhEGTBWR4Nqvqh/LU5wAgkdG5clNeiU/Sy1iKtvEKP4BeMi7jUOyo
         ScY2hNlNcIVX2oDaOYOkQHY2Sr3h0ENuPL7ehuV706nS8zNxRlZliDjQb8HJlzsJetdc
         R7mE+ALOuq3mAuoWYA+xNuAFE7C/joBmtTxBFtiaJCBXGURuSlIM5JYuUoJSJ7rOESYg
         VXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210862; x=1682802862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KENU/j2xG3Vsdx0K29hF7OQSXyG13AHFi76Y2uXhO2Q=;
        b=7KjtGEjfr9fqDFpCEmHZpVO4ORrlGrOvnQ8gxjC4EQcCMOMA2EmiiDrhNwC176E4lA
         fBX9b2vmlG9hv0PyZ5h72o8bYpw/tMmC6Up14KaXvLwNw2uo+h9u1/qii3fsM2WmIjHV
         CCKSqutUMMst6Z2WkGbYwsljOqjvP+vL2+VrChG0twMbKPoA8hNzcXHCO+nLnMtzE60M
         oJYLi8murOlAzqS+fh8dBcTpoLWJCfjnfaAThYaiYfEi+aWYIO+E3qVMnkBgyD5SpRvu
         3UR0BPZVnFRolKn1Ysf36T2VUY5x1LBO26i6Wzh+vXUd4B6YkVhcm/wz6o+LehN5XhBp
         IGPA==
X-Gm-Message-State: AO0yUKXqGyhjMzyXxQyKAG6Td8/IzpAwyk1OfhCR3bip4/zxrLnz3yMJ
	0fiRSYsm0wFu4xEkbCRGPeJw6xW3+lNGDZiFChI=
X-Google-Smtp-Source: AK7set8lIC4Rec5OulXsZ0fwzkoacF+P+KnIRzYtMv0Y5vabgY8GIV7kiABjCDVZqPlfym8rwUIGCQ==
X-Received: by 2002:a05:6a20:be29:b0:d4:2ce:8c6e with SMTP id ge41-20020a056a20be2900b000d402ce8c6emr19114237pzb.47.1680210862537;
        Thu, 30 Mar 2023 14:14:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/14] vim: upgrade 9.0.1403 -> 9.0.1429
Date: Thu, 30 Mar 2023 11:13:50 -1000
Message-Id: <5b866019573b99306e32ea5734015040c9ed3868.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179367

From: Randy MacLeod <randy.macleod@windriver.com>

Fixes: CVE-2023-1127, CVE-2023-1170, CVE-2023-1175,
       CVE-2023-1264, CVE-2023-1355

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2415072c3800feb164dd4d1fa0b56bd141a5cbd8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 42a2ba46b8..1e27415288 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1403"
-SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
+PV .= ".1429"
+SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


