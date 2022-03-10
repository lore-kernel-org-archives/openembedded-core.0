Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943D2C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:32:56 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.362.1646937175011549094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x3w5ogng;
 spf=pass (domain: linaro.org, ip: 209.85.222.177,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f177.google.com with SMTP id q194so5137066qke.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ubDoPNaTfirYdb/Nno7TmELVWzjVfRHl/w6oJs9M/Ps=;
        b=x3w5ognggtbqvUkObCqVGeg/lJl+BRf2wAXodCLF1+aBsk8wleo7j361IXL4LWoGcA
         2KJ6ZBO+atWWerkEpXkJmuX7z0YDIt9YSkXE9jD6zT8kBwq+WFuWqX/9C/8XFptNPgfy
         NAnPlKFC0NoidKk+MS18VAdYdZc88gcMxgR4kwIXxqKB32U6vdDnRKy1f2+xKL0VrvDY
         OSrJGvhOq0fATzMviLkQ7mJrzJL4qwol9zLx3cOCMU7RnlGWVz7RATTwu6kf+l54sb6h
         nFAugIJGakxGUCsL150vkKalDDSjgoPZSY0iAbNgGHctotw1BGuP3cvwq5mPT8i+6ay+
         oXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ubDoPNaTfirYdb/Nno7TmELVWzjVfRHl/w6oJs9M/Ps=;
        b=dAUPHMKEjuIDqKZTKix/XuBa+P/7FSbhohGagau5URDWpCqtCmpuYslATgDu55NgRL
         2GkXFlk9I9mCh+j5nAnNEpywsfgC/BPP8dwydBMntusrCILmQKt8oKUw+aqakX6yVcRd
         MW6x2D3RMPV/pP+CPoLAXjQUaq1jjl68jiKnQ5tDgntzFK7Qk1+A3b4KQlOQo8XNeW6h
         G5XRyTatfQrOU+4h6/wVZVHT07OF2UiGVATaxp4RIEVRcWKHFXOx+SfC8DKrXiBqnq8E
         Z1IiD6TBA37oer0pc2gNQLih/h7GAuOKPJQZPAJ9zl3Pu4Y7nsmSVoGmnJN8ClKswrVN
         mvtA==
X-Gm-Message-State: AOAM531u2+VblqOlImUbW3Gq8luCgSXMbvBKQzIYwU5dblAbnNOp/vcN
	WzAe7WJWKTwY3DAzd3TAmxJRjerbd8rbFw==
X-Google-Smtp-Source: 
 ABdhPJx9NGOtRttknQxn4+KcWSdSWvgEa8y0599FZAWTXxj8nmW9iBz5hcMr5u9vxbdxAiO+Fw7Ksg==
X-Received: by 2002:a37:5d2:0:b0:67b:136a:3b1e with SMTP id
 201-20020a3705d2000000b0067b136a3b1emr3991271qkf.169.1646937173977;
        Thu, 10 Mar 2022 10:32:53 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 bk41-20020a05620a1a2900b0067d4997c579sm1759518qkb.33.2022.03.10.10.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:32:53 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] bind: update to 9.11.36
Date: Thu, 10 Mar 2022 13:32:34 -0500
Message-Id: <20220310183234.608500-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 18:32:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163036

Security Fixes

The lame-ttl option controls how long named caches certain types of
broken responses from authoritative servers (see the security advisory
for details). This caching mechanism could be abused by an attacker to
significantly degrade resolver performance. The vulnerability has been
mitigated by changing the default value of lame-ttl to 0 and overriding
any explicitly set value with 0, effectively disabling this mechanism
altogether. ISC's testing has determined that doing that has a
negligible impact on resolver performance while also preventing abuse.
Administrators may observe more traffic towards servers issuing certain
types of broken responses than in previous BIND 9 releases, depending on
client query patterns. (CVE-2021-25219)

ISC would like to thank Kishore Kumar Kothapalli of Infoblox for
bringing this vulnerability to our attention. [GL #2899]

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../bind/{bind_9.11.35.bb => bind_9.11.36.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.35.bb => bind_9.11.36.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.35.bb b/meta/recipes-connectivity/bind/bind_9.11.36.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.35.bb
rename to meta/recipes-connectivity/bind/bind_9.11.36.bb
index 4652529623..872baf6d2f 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.35.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.36.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562"
+SRC_URI[sha256sum] = "c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


