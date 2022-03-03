Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F6BC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 20:44:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.16123.1646340258887959849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kHNiRoff;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so5006804pju.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78RiJzfu6xueohlxbJoSweN46FIZ9NfuKoiFpohL/oE=;
        b=kHNiRoffVwdU3lw4IoU5AX0S+vwP1YZFKp9NJdCOsc8OF+dp/FekTsQFZj99AS1R+W
         AJPchAYmMlY9Xidw5NTH9SSpTt7VlTGG9HBxrl/TIjvC2M5bwpbtWVFqtiA1QMYNRkM0
         ZgU+Rxcl8uOgSO+ZowrMPXNfgt9JvyvglwZ8ttxOaf9xUh/N1xirDcADv+nwPbpU5TPh
         I29moKe2EmqRoGi9b59YAeKJs5mXc+f/c83ji5pyrwvLYgenaLqh1S8eAZs7/mb5KKZB
         zPbFEpgK0MUNYBaigS/K/fH5268/u3Q7h4JXyKHtynY+dI09foCNr0ehql4aAuTOncdK
         wBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78RiJzfu6xueohlxbJoSweN46FIZ9NfuKoiFpohL/oE=;
        b=4Za8ibkcnK90i1ySNa/qzFeK8A9quTsOzXwEGFt1a522SBR4mG/u4ZYfG1VxFHUPhN
         5upYLllqRtWNGhVb+EciBqVNVFAH3G79zJ5mwkkwk9NSznGhxwjksebMFZ3TyXVs6pO4
         OGhk2vVBPVjvU4OKx+jV9ERzAcGcYsFRrtZsMO72fNQ63qn0fGmrOZfZ7sReplvJRx10
         Xsjso5HeeoNcDs4radOhhZHW9FDMLs4MHnrx0+DQMIL1oY7SFO+3+QBIu5Ou2qlsQYd1
         0D4P1DvMMgV1l02r90HSls/d8koQ9Pb8uCZm1k1GzaTTVBqja22ehkOtHjLlrCyWEsnn
         jgDQ==
X-Gm-Message-State: AOAM533C/81keiXAmlG5G3GkEIHbRpBh8pN9nntMQC2Wa+al+ejNENFD
	UYdVdi/2nikcKMWhnp3YO6biUW29ueI=
X-Google-Smtp-Source: 
 ABdhPJzhZjI0BiFhuiBs1tgfcgIUlfULVR4ATQ3q7zL8aDh4qmC6mG+6jrwMZ1eQmYRkDPYZZlf7mA==
X-Received: by 2002:a17:90a:ec09:b0:1bc:d7c2:b2d5 with SMTP id
 l9-20020a17090aec0900b001bcd7c2b2d5mr7184733pjy.22.1646340257888;
        Thu, 03 Mar 2022 12:44:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:e8f6:820a:4d41:403d])
        by smtp.gmail.com with ESMTPSA id
 nh8-20020a17090b364800b001bc422b7b47sm2959899pjb.15.2022.03.03.12.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 12:44:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-importlib-metadata: upgrade 4.10.1 -> 4.11.2
Date: Thu,  3 Mar 2022 12:44:09 -0800
Message-Id: <20220303204410.1206736-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 20:44:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162699

inherit setuptools_build_meta

v4.11.2
369: Fixed bug where EntryPoint.extras was returning match objects and not the extras strings.

v4.11.1
367: In Distribution.requires for egg-info, if requires.txt is empty, return an empty list.

v4.11.0
bpo-46246: Added __slots__ to EntryPoints.

v4.10.2
365 and bpo-46546: Avoid leaking method_name in DeprecatedList.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
index ff40def563f..15c468e41b7 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e"
+SRC_URI[sha256sum] = "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


