Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B11C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.17903.1675446663082409502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iEWxDGPw;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so9504816pjd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykivUW5u6npdIvRoEWxL6NCWEvDk4wUqnCxXElMqpyY=;
        b=iEWxDGPwLVQll3+d7bR668jGQ6GwYIpmKjU8zH4oJtjL89PhbvNdCDp/p2DhxGom++
         /EF6gFY/wHNOsBZMyoXvk1L6fuGgE4c2dqoke+G5RfBZfR6Y9rg9i5jsf0Q0JoX/Rczk
         bUa+4ZdA8o1WoLgsYMskXy7OPeqOcTz1hextjzZ1per1aASdSIkv8hK+1Tex2rHZQSir
         r9JTBRLVrC1INo3uDsTDG5zPSZQWO+YOkW5Pc+1mpIzs5Y7SPTsPoPpWotnxPmrSNMVX
         wGEDGh+Q8tsoxBVIhqt5rZIPUCmQuOl+wWYub9ZulnRcjGDMi2vhm49c9Al4U5mvjRHu
         N8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykivUW5u6npdIvRoEWxL6NCWEvDk4wUqnCxXElMqpyY=;
        b=uiP8KQX9+BL3shE+zhYFyxUMFO9NarY6FlUfGM/M+28jaAR/F4TSyHKD5plJimHnIA
         /SG4DQ4fSw73WNVKTeYlE9AwqitxquxQx/q3DGDo/tfpTmwGg0t58ljmo+c+vCMCfc4r
         z4TcPoBNGYO7pKJfo+4UvOehXR/tlwC6lfi5zMytaeUVogw4qUOZsdzgqxFXZupEtxbj
         6RLnMDW0hMO6he2C9g699MiWGlTUZgExVkX/3j3Q9u9UyXumqh9eQ+hAIwu9RvpwOU3u
         L4tvov/j2gGP/V4ZATiOcQf3S3+c9VGLAVabQbjSLiexA96W98ykreXW7sPRHjoaEYjB
         TBtg==
X-Gm-Message-State: AO0yUKVh/2E8yarg3/rlde7QkzrT6nkPjpnuiVbf9uM5KJcmnSbQLXmq
	Z00KIEPRyw9oWNr8k5GiyCJYUEV2K5w=
X-Google-Smtp-Source: AK7set8QPbADwkOgnXPDEj+08U7xvxEvlCRePW+Zr3tw6fguhG+44me/2QijmROQrXsbpbZBkrjhig==
X-Received: by 2002:a05:6a20:931f:b0:bc:c663:41bd with SMTP id r31-20020a056a20931f00b000bcc66341bdmr10481997pzh.4.1675446677046;
        Fri, 03 Feb 2023 09:51:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] python3-urllib3: upgrade 1.26.13 -> 1.26.14
Date: Fri,  3 Feb 2023 09:50:34 -0800
Message-Id: <2f3eb8ab75c3550aab385df078fca4d556e46d4f.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176747

https://github.com/urllib3/urllib3/blob/1.26.14/CHANGES.rst#12614-2023-01-11

1.26.14 (2023-01-11)
    Fixed parsing of port 0 (zero) returning None, instead of 0. (#2850)
    Removed deprecated getheaders() calls in contrib module.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
index 7af95117cf1..f35a141df26 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
+SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
 
 inherit pypi setuptools3
 
-- 
2.30.2


