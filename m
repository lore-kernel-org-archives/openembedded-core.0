Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBA3C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.8741.1654338392965262361
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RuHVXOFu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id r129so5184537wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v0BcZDNdET2H7VqZ4eK3cA/p2GfHTREPzXTSlOc8KVk=;
        b=RuHVXOFu0jyk65XobAzhqS02FXEaK4Gd7W1wXCG4yYTcA5qq4FF5lNOehwH6TT4DnR
         mQku5TNqTOyg55jaCe3JsPDzOYIwvO2O5dtqBHuMmYHqOjhYNEBwkopJjrVQyV9lkpIC
         vIk4yfFZjN5S6hu+So55ARstVAqBp+MI30IL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v0BcZDNdET2H7VqZ4eK3cA/p2GfHTREPzXTSlOc8KVk=;
        b=twBeG4lKKw2UbQrZ0kywkgBJUfzsWCWAhrBeVUBRCYdo2JO7/FSHuaimOV3FsPkvZw
         rPYPqtFGh5gpp+9i7X7cbjo+XX/EAccsa7/UDCLfPSdIiqGbjRLO4ubdSimfKoESRNtG
         D+zVhF17jxSvebIlQbThkeVT+X4/c3qE2oRXxqiyWRSEKcbg4Vc5/XevY5xxXzaunU/o
         HLqgDUGM6fwJk90ftR08SItGr/3q+9NkApA+6ge/9nuOtcwP9lzuT9l7qBg0kRdLcmQC
         0Nk4X3acUsuCtvJ2yxVWVqNKqWg+k5GxkwMRiBVdH9tnQbEX3Z7txftaz+Mp/5SZBgb9
         Ipuw==
X-Gm-Message-State: AOAM530amnrs3K3YBRll0QlzfvDUoXmg6Hrd7ycjb0BvpXi1jLNh/Q2S
	4h6okXrX1K717aIw9NZTK6KyaSIOz2KM/14E
X-Google-Smtp-Source: 
 ABdhPJzmg48us0imATmeKI2KfTgRzMmfNtlRi0+uXIqoCD57vBm7XzOOT/fE6gRFF5JxHQ8zrhiJxw==
X-Received: by 2002:a05:600c:1547:b0:394:882a:3b5 with SMTP id
 f7-20020a05600c154700b00394882a03b5mr13073829wmg.97.1654338395218;
        Sat, 04 Jun 2022 03:26:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/17] sysstat: upgrade 12.4.5 -> 12.6.0
Date: Sat,  4 Jun 2022 11:26:18 +0100
Message-Id: <20220604102625.199845-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166556

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysstat/{sysstat_12.4.5.bb => sysstat_12.6.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.5.bb => sysstat_12.6.0.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.5.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.0.bb
index fe3db4d8a51..273c5c18152 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
+SRC_URI[sha256sum] = "699fd948836d77f9ad0541fd5dcf75cd2505f9da4ec14df669286ad047c23d97"
-- 
2.34.1


