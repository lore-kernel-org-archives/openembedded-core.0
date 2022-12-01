Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514EFC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:24:02 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.44645.1669904633534084846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WxSZhNS4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id r7so1980705pfl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYvhtivSrD89fPlujjOUtz64DvKSuzQHsisy0dTbhco=;
        b=WxSZhNS4Nh24BaB4bsq2hKcnKmh9RVId5nzenEWfzvM4P0lmbQwjBCmJ2iO347wLpd
         w0/lzds2Kng5E1blouIHGtZn+mSeynOSDW69qUBKQYljVxc9+j4EiXe+ZixPW1RjYWKJ
         0uKPc92J5PfdcAwDaE+A+Y/0o28CKGmvnZuYXuPwckfeTNAQ1ic/3TD620lT3fHOUlvV
         XAVKiezfq1oCuYl0cXTaSMU/Io/EUR6k2Ghl+RHPgXLPu0ZZf4mF95qJbAB+1L+/I5sD
         QJy1vRRYALq6uGiJmrVxuqA66j8RHg6iAfn7BsPkmbpU7r/hSgpkSJFkXTdmDwtxJJ9c
         Lahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYvhtivSrD89fPlujjOUtz64DvKSuzQHsisy0dTbhco=;
        b=XdYp4lzNYlPbEx+CarR2w7nO2H8tO5SVmz5U6eF/FqVblsUSrounQ5FVN6hjC3+EWj
         7phpVqrZI9s4WOdFQg92LPtwpL+zJAsy1fQSeu3Q0wAuxh5ZY7k0Xk2NfkL5PeXaLZUF
         XY6EOz4IhPnHiB0GIOxRs8qoP5SKfjio8MHZ8kaOTAduasZAlZzp3i+JbFUH4x80orCG
         Vx796sIw5ixixnxQytRJoKkmmvvfN6lenDhA217TONWo/jj5gUprunBeisEnsgvqfOcu
         M/V1sF38tUADP/ea7AgmdZFozJbPR/Prv4fXCqjXVTX0M60wMgO6LtCZa8P2idz1uOkl
         Snvw==
X-Gm-Message-State: ANoB5pnMPFtQ3aFAK/P+XN0vJxUYad/Xup3uLowkDYMN90PcAOd2oeR9
	nWxWKVbDNcLGHhT30E7SyoO2W8/4JMcGgH8BH7Y=
X-Google-Smtp-Source: AA0mqf4Igp7Eozr1sBrkjfRmgdcFkCn36ocKmmeARBrVe8LlNQ+llUBkVkLWtTNk2bzHbUdHlIuYTg==
X-Received: by 2002:aa7:9097:0:b0:56c:674a:16f0 with SMTP id i23-20020aa79097000000b0056c674a16f0mr50967726pfa.10.1669904632555;
        Thu, 01 Dec 2022 06:23:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/22] mirrors.bbclass: update CPAN_MIRROR
Date: Thu,  1 Dec 2022 04:22:52 -1000
Message-Id: <5a622a9171da941c705aedc88d487d7158955a8f.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174085

From: Tim Orling <ticotimo@gmail.com>

Both of these redirect to https://cpan.metacpan.org/:
http://cpan.metacpan.org/
http://search.cpan.org/CPAN/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1b74fc09f70d52d9ac629b04d81aa94fd97ff40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/mirrors.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 81fef7f660..d641c390bb 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -67,8 +67,7 @@ osc://.*/.*     http://sources.openembedded.org/ \
 https?://.*/.*  http://sources.openembedded.org/ \
 ftp://.*/.*     http://sources.openembedded.org/ \
 npm://.*/?.*    http://sources.openembedded.org/ \
-${CPAN_MIRROR}  http://cpan.metacpan.org/ \
-${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
+${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/yocto-sources/ \
 "
-- 
2.25.1


