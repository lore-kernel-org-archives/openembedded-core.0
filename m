Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE103C433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:34:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.20182.1652013262334913687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CxVGuFNm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id k2so15967129wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W/BBkLNQ8MaLOzHWs655N9TP4vI1jDNMocJ8t4yocII=;
        b=CxVGuFNmm9f+6bq0uu+vlDx1nA9TrOxc2SFs/ZtYWr/IceWpZ1PUKzitzAdRy7P83F
         zxTS4Zdx3J6hAv/Ua2YAX2i0njVJJ+fawZuuwcVLklZVPROlQPAj/FbsQScUk2K1oLcy
         1zp3JrF34uHWT223TCuYLmydphtFI9DbH6dkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/BBkLNQ8MaLOzHWs655N9TP4vI1jDNMocJ8t4yocII=;
        b=18GKPsjCFmV0cOWV6/XLNMZ6jT34izXL1lek/Qq5e2T0xwcNV9CulddKUkH9+gLwgD
         +e+mQfKwFLZyltnBsnaZNmSZuvVTbBAj622clFbS0M/9hPH/pCZpNAeLrfnL+Va86z3c
         z9HqByDPqKHkQrWE9occBkCinpddVoQYVhA4tRTq8gVk/Mx4DoOEkWXte1gDjvcRueAn
         btyRsLIdTMH/YW+wEJFw7+XjrXKGeGHCaafIvXRwWnUIu+JWc3U4aJsco+r06FQ0i8Fw
         8HGh9Nt691pLYsVN3fCHiCiFsnUFUa2YmjE1ERtAjbGa1WIeSXxdiaon7wzVujEdHIbD
         gWNQ==
X-Gm-Message-State: AOAM532Lm2iKaVJNwFLBNJsmOHzYjhOgZ70GgwHi4o0dGyC5kwZvhk+L
	i7iVFrl75oLdpxD15DL62NDPseD5sCZlL4pq
X-Google-Smtp-Source: 
 ABdhPJwdD5hpSZkywVK97vHWjWpLhrCqYQlV0ITYNNIz9IhO4UUAevKNxvOEtN+CB0ggOiR61Vhleg==
X-Received: by 2002:adf:e44d:0:b0:20a:d88e:94ec with SMTP id
 t13-20020adfe44d000000b0020ad88e94ecmr9483184wrm.311.1652013260685;
        Sun, 08 May 2022 05:34:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b0020ac8c19ecfsm8039818wrb.3.2022.05.08.05.34.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:34:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
Date: Sun,  8 May 2022 13:34:18 +0100
Message-Id: <20220508123418.159142-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165371

Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../freetype/{freetype_2.12.0.bb => freetype_2.12.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.12.0.bb => freetype_2.12.1.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.12.0.bb b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.12.0.bb
rename to meta/recipes-graphics/freetype/freetype_2.12.1.bb
index 3034977cd47c..46c6182630a1 100644
--- a/meta/recipes-graphics/freetype/freetype_2.12.0.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033"
+SRC_URI[sha256sum] = "4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


