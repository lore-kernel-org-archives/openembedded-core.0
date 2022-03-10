Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB481C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:00:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.704.1646938829401952067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yQ0MIYSE;
 spf=pass (domain: linaro.org, ip: 209.85.160.169,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f169.google.com with SMTP id a1so5412725qta.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIb/snM2MSOUyTV+nImf79//gcq/u4lU6gPX9QCg6fM=;
        b=yQ0MIYSEuVraepjZ/lytOBS9hz2OvUGwdyxSpXgJTXPGWGytGrtuK6gS6y6eXUVau3
         CUhU328Ih2o3JD6nCjEnIdWDXdVHAK2mxZGxm+GlXbXGwje71QK4bqm3X0a8Sy8qf4/S
         nXPKjADZCF60Y+YCqfRySc9NWasNFGXcutU9wCdxDuxRbxkGjOy7t+UJjmoPs59MhA7f
         az/2Cl2v+OoXIngFOWK30dTVt0EMTMV2Aaq9qvRwcpWJnIxF7qzeia5DEv/VtDWrel6A
         4WWBdRgEnFLKfAxkGBpxiEpIPZfBKijqObT7fCK0BdeGSjlxt8k+4CJJTk+p/22eP/RC
         GhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIb/snM2MSOUyTV+nImf79//gcq/u4lU6gPX9QCg6fM=;
        b=MJ+IEcty46sqhGDM/SaZip/9Q0Q8AXf46NH4qgCVJaIfi8vaBr8BYwh7eJLupWg/wv
         lZ++JHpwrmXps1W0PzScGdIDdG8nO6mtt8tSy9NWCTluBXVrg8C2tQdcTan4fbt+f0im
         OoWN5qiFr33fu0TbBEh1M240FFVEjEtjkNQAnhTauvjD7nIoyz6JEyyzZ9k3rJnWpFOI
         qB2g9oBNKHAECnbdIScU3abfxzjvbaTc/YgktWhnHcCj1gWwjD/ndRXRdJpAB3g/uFz2
         /kMHICRSbvzhnb/Dk21Z/Aqnc9HwgsTbbL8OgDR3Z4TFDJ8zx5Fr0GrURXB0Ui7QjrCU
         IGGw==
X-Gm-Message-State: AOAM532rRYwo4p8ZATjjH99feJxCS6Ak9Gl+EX8WxFE0NLqz7CvHxGFr
	AgP8eheGuNZb1I28c+vNWNXcvpaTHPm40g==
X-Google-Smtp-Source: 
 ABdhPJylzdFcwNVeh3WWMhSpLErXF1m01IWSL1wBl1f3Q6/WYpkaUDbKkN3eXf/VzB8QHp9+VjGIig==
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr5187678qtb.678.1646938828457;
        Thu, 10 Mar 2022 11:00:28 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 a13-20020ac85b8d000000b002e1b2620a4dsm1395936qta.95.2022.03.10.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 11:00:27 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH v2] bind: update to 9.11.36
Date: Thu, 10 Mar 2022 14:00:24 -0500
Message-Id: <20220310190024.608965-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 19:00:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163037

Notes for BIND 9.11.36

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
--
Changes from v1:
  - commit message format adjusted to match previous updates

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


