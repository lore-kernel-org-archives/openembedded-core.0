Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352B3C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.30930.1668892533138273389
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=am7hYJfW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id j12so7435853plj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MeylPW7Zn98ElpLY7wzny7vbyPajRWyOXq0cYmcPRM=;
        b=am7hYJfWDU4PnNUEsqm8yH3kQVaii0drkLSH9VPQeytcE5QmIfBZjJOmSNkEsPeRhV
         FojYfCzfT5tl8ETCvFMs4+VjEYeyIwfy8h7AeB9kEySmKFCmgT3Uhe7wCwHr6bCb/WmY
         KE4ZcU8SqHfHQpXb9ZYlM+281yAEWZKg8I4Kjanxe6jc1xfsbcL36SoOS5UUjWkvZGWm
         2BkwK4OkR3TqH8CYiDlH88LY4742TZlnvPKWcmIXTc+E04kAPF3lV+UvJLXCv0a2EUef
         aBsyrqUEO12j0x4BARAKyPsM8tqUttknv6zj74csQEhUtYuMjSZLV42x51oRWO6CBjeI
         ho2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MeylPW7Zn98ElpLY7wzny7vbyPajRWyOXq0cYmcPRM=;
        b=nhHDZAZb+J+Nkrp2LF+Lj4oUfCY39wiGsN+Yp65Y/1Qn+K6s8r8192I5+UadiMtVYO
         uTGifxPirDi1pMscVIhNqqqO6JAE5IRGtF/1Vj1CIMUoRfDW3T+pcfUTy8OM84GYCaj9
         Nn75SZpVGNNuJ2JesyektAW/Ru+BULXwxhvdjZnGnBqR+aMhgjd7oBfQjeI2wjVtQ++T
         M55r60r6HSnpQ6SuGOmiPV66rs0pNGmNWxCbSdRXhGBTDJ7g1vphoagVt9qA/M7AclYG
         Fw4trNfG6Mlxi/dkHvsD6B0OoQ7wX15NitJ399SGlD/5Ti8mSLKmeuKWExL0urzfgkYD
         wLjA==
X-Gm-Message-State: ANoB5pm/6P99I6sfwxNlIe0n15t3ey0jGhThXpoLjUWE0HoZpHG7sUdG
	5U1ajR5gGBIiMjXGWHhSU/j6Ow+tUxlW/us7Doo=
X-Google-Smtp-Source: AA0mqf7R59+JdXFS3tm6IBCLzvuFmIvskkQcENS3fAhNVa+pLpww96trjJlD6gBQN44acLuMnzd5RQ==
X-Received: by 2002:a17:902:d34d:b0:188:f76f:fa6a with SMTP id l13-20020a170902d34d00b00188f76ffa6amr263257plk.75.1668892532152;
        Sat, 19 Nov 2022 13:15:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/35] python3-mako: upgrade 1.2.2 -> 1.2.3
Date: Sat, 19 Nov 2022 11:14:44 -1000
Message-Id: <ce8d8fb1052eb45c0a4a860cb59c53c93430d6bf.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173545

From: Tim Orling <ticotimo@gmail.com>

Released: Thu Sep 22 2022
* bug

 - [bug] [lexer]

   * Fixed issue in lexer in the same category as that of #366 where the regexp
     used to match an end tag didn’t correctly organize for matching characters
     surrounded by whitespace, leading to high memory / interpreter hang if a
     closing tag incorrectly had a large amount of unterminated space in it.
     Credit to Sebastian Chnelik for locating the issue.

    As Mako templates inherently render and directly invoke arbitrary Python
    code from the template source, it is never appropriate to create templates
    that contain untrusted input.

    References: #367

[1] https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.3
[2] https://github.com/sqlalchemy/mako/issues/366
[3] https://github.com/sqlalchemy/mako/issues/367

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49ad6f031458e1f48f24547dc88e41abc4ec41a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-mako_1.2.2.bb => python3-mako_1.2.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.2.bb => python3-mako_1.2.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.2.bb b/meta/recipes-devtools/python/python3-mako_1.2.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-mako_1.2.2.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.3.bb
index e3774ee621..12acfee777 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3724869b363ba630a272a5f89f68c070352137b8fd1757650017b7e06fda163f"
+SRC_URI[sha256sum] = "7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.25.1


