Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00992C7618D
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2191.1678928603393518661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m0PBgDe5;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id le6so82952plb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84NKsuGHdf47Jo5bpwhIZ2GVibbaTaVrC29nd+DJEms=;
        b=m0PBgDe5d2dUWsg19+txsdyhTcDGGcZY5KxFxgtf27IRxn6Y11DVXZYEbFYcVffgs9
         B2HDObYXFapLBxlCEV07MspZvI+GSEr23WBWQxYouHUl6qV7iV5/kFqwq3UhSfOFX92p
         YH+pTYSqGBZfugjU63K+XapieIMunJldYHdqwTL53n/8U0tzpAcNjhysD+8RQ0ElP+Zr
         GS1rhKs2qb7VSePj3Q+wlhc4syMfVtNlaDuL7PeFmk2Y+L2i6wfNX4SUMSy4wi6Nlda4
         HgexmaZjQA/XKf2It5U3Bq6fqL7yXvNmuSkJLd1/VoXbdNQpybE8ESXCKdarEJwSkJ2n
         TQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84NKsuGHdf47Jo5bpwhIZ2GVibbaTaVrC29nd+DJEms=;
        b=LhF4cb5lBwZLVZIybmcawbx5llLX86uonK5bMkjh742e/zjmgFOPY+J20TKgvQySfV
         aG3z3nQ9Gy0N/OhNnMvaZ7IQJkX62XgL+d23pcGu/pxfwdhRQoxlVyoM/IjRDkV9lab9
         IN68U6xi3kDa8SIx/MQWouRcjQ3p1WuogSgR4Jw4jHC4vl7MsUkXBxXmSz0ME9JJ53fm
         XJZK7g7xRxlaVI2Bd+fqhW7pq203TnpAri6DMJVexI9N1cpfCpSOeRhXEsPmQPI8J4y3
         d72e+gcieDsb0ZhPdrJ4gwSw288unnCIuIdY9/rr7FLXyCuNq5uErXUXn8snfTQwffBm
         ccJA==
X-Gm-Message-State: AO0yUKXyhXmEWT24lkzOH/yDj82pbLBXu+PS6qGI4siB8dggnO/KD/vQ
	PKClPW1sVcblv2+lWm1vvwPNLRGY3wI=
X-Google-Smtp-Source: AK7set+aMjoqucq9D+mTIQwsl1aADAgOH5Osg411gaTe+vileX1xxeoC+rQDE4lUWYIpujFhaYbE+A==
X-Received: by 2002:a17:903:41c5:b0:19a:9833:6f8 with SMTP id u5-20020a17090341c500b0019a983306f8mr1795683ple.35.1678928602563;
        Wed, 15 Mar 2023 18:03:22 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:22 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-urllib3: upgrade 1.26.14 -> 1.26.15
Date: Wed, 15 Mar 2023 18:03:00 -0700
Message-Id: <e398e2551757d47e8251a846f4be10e0f661fda3.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1678928363.git.tim.orling@konsulko.com>
References: <cover.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178669

https://github.com/urllib3/urllib3/blob/1.26.x/CHANGES.rst#12615-2023-03-10

1.26.15 (2023-03-10)
* Fix socket timeout value when HTTPConnection is reused (#2645)
* Remove "!" character from the unreserved characters in IPv6 Zone ID parsing (#2899)
* Fix IDNA handling of 'x80' byte (#2901)

https://github.com/urllib3/urllib3/issues/2645
https://github.com/urllib3/urllib3/issues/2899
https://github.com/urllib3/urllib3/issues/2901

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
index f35a141df26..d2de7c4c022 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
+SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
 
 inherit pypi setuptools3
 
-- 
2.30.2


