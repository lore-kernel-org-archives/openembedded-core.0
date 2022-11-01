Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275CFC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:09:21 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.7548.1667315352086764862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 08:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OY1Ea4z9;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 192so13722913pfx.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72cvfCCb8QXHUHiwUW8hBPK80r2jas12a+Yv32BOPM4=;
        b=OY1Ea4z9MilSKBImlkSV1N6lb0Pu01yOcUi+Wsb8eVz3lYZw3cbm/L4eOKAuNFBzn8
         npR5ldZIOylSWWtiIRJPp9aEzKgtuHjTM9HGyz+6rA/DAg3lZmrAGubcBiWWV4C/uz7C
         OSDI3/IHbTu2tvD/8x2MVFKtYJ07eEp7Yl+BMJqHsAnqzl7qdB2xlAc/93hczbohLBzS
         9WN5ZKLOzDXd4kyVtqEynectgz55vSuwcZ1O6H9EqEgPX6jJPVuFtWd/8VCdmsF3iZDV
         XbMr7bEdElC5MsigPt5Cxz/8Qtb6ETOkETkF3zf/HQ+ovRHfFyhvhPX32LIn28+K2Ox4
         DUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72cvfCCb8QXHUHiwUW8hBPK80r2jas12a+Yv32BOPM4=;
        b=pWyYxnu4KWSYLJ+4jq8Hfg50XsVsGoVzGwIe6zXm4XgoBP4nwBo07gfdepKwNd40YV
         GI1IoU2MyyjzD134jNc6ZWyLrbG6CJxWk1eFEk3TsHrNFhAh7c5LzKXX5FKbaD6nT+sv
         1YuMN4eqbV8clUKoD9yBOudb1oC19gajb6f7j7A18IJlNZ6Os0VW5RxFHk8qv3Gxc/AH
         KOTB0D3DkUgBuhYO0jivS7+rF3nbmhA7aAAJ0VLJS8B6UGF/02cXKE5VukOpZuEmUO2t
         bqgLxtnKlr1BkALjEKVX0/41n9yayn9IkIzYWoUNvgQVfdMBGvFwAY7oPQ3IWv7ZAbDt
         MDHg==
X-Gm-Message-State: ACrzQf0vlMbOW8MMx6j0+2KvfYGmcSSVoqfgLNB0fcCiN2DU1B3SLE7Y
	NkoWeKDjkBu++mm/RrpPbSd4A0EvBKSovA==
X-Google-Smtp-Source: AMsMyM42fbwoYB53SeAHWyTdjO31mJ1qodBxEq7xIfFeNywyvI7bmMgZhDJbxJFNUlYdk/dwN87MMg==
X-Received: by 2002:a63:8341:0:b0:46f:d9e:b13f with SMTP id h62-20020a638341000000b0046f0d9eb13fmr16844416pge.389.1667315350894;
        Tue, 01 Nov 2022 08:09:10 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b0018685257c0dsm6523784pla.58.2022.11.01.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:09:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-mako: upgrade 1.2.2 -> 1.2.3
Date: Tue,  1 Nov 2022 08:08:57 -0700
Message-Id: <20221101150857.132840-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 15:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172361

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
---
 .../python/{python3-mako_1.2.2.bb => python3-mako_1.2.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.2.bb => python3-mako_1.2.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.2.bb b/meta/recipes-devtools/python/python3-mako_1.2.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-mako_1.2.2.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.3.bb
index e3774ee6215..12acfee7773 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3724869b363ba630a272a5f89f68c070352137b8fd1757650017b7e06fda163f"
+SRC_URI[sha256sum] = "7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.34.1


