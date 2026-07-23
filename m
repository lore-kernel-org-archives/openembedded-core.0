Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C50C531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:48:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6138.1784839721781482918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 13:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V5Zf/4qy;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1183037a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784839721; x=1785444521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjNmOxU+E4IXVpJgD+eag1j6YAzRO0lSHBR3cDm4OOI=;
        b=V5Zf/4qyoRf+N6Kwj32wqRvauP9L1PPEAunqeEEs3GjoOYODIxgWNUYCciMq9lHLVB
         MTxlEEqPmUrvTuCXFEY8SlCQsk319Jlbi9WjvWGz1++qqLxB8m8yV8JXPWRjJ+2DQHXq
         iWeyoCCQsF1Pe0QrHUPm2dKNDHVD7LxQUkmVXJuYEM5GzoijM12NJ79nm3NeValMaMDW
         5J+W7gIPRE6Dnnfb4weiwJmGVNxeMG3eXjALOlviGSXLVavVUlYVvo53xap3iFxQB5tW
         AyA95Rm7WjVs8I1cfeKXRNhdgJRW0X2zitf1zzgZF0Dhi9/gMciH6kC1Lx+kFLXXNd5o
         w6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784839721; x=1785444521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjNmOxU+E4IXVpJgD+eag1j6YAzRO0lSHBR3cDm4OOI=;
        b=TDN30/6FN6fFzkvDJ6xJaqsAPF7uq1XxmmlZHauI0pbgtWEzCf21ujYeQ5bOyEcCHH
         0fqk9t2FrP7Nn39cGMl7Ql5mQUnF90dPgNLvFKkXz5A0KOjXWsyZJcH9sozlaydVF6XH
         p3ql0jaC4QTsWKMDPxeG2Z6z2/e3MI47svF5jz+Q/NJCtTcpg5tlgw/2tyXnsQmQ6Fb/
         +JyRC+d+WDXPGe37Sei9ySsC2W6wR5YDjOe0P51+6JS5uMMTJA894nuS1Ffxyu9b1Z+x
         5D7H3K79rZwguKGg/ezhUfAxr4ke0Bzp921XVydUZSAenmIJsLMrHqx9eU7Zh33B9VuK
         D4Fw==
X-Gm-Message-State: AOJu0YzWUUiCmPY7GO4Z6Fb480dC3LRZUzgBYQpQfKIGl7XvRDCFdGDy
	oNyieEOqwf5z/VCwZ/xlnL5lBqF6DfvGIiSwZwMaQ13m2CMh+xQJp2905hiwuw==
X-Gm-Gg: AR+sD13kJk2semYCiDypsZVpwEub0JezQih7HdMW89x2cYfWQ7yxwxVtN166qXgCMu8
	TGp0u1sEwaUYQhH5y2onBS5cGj89vYRa2K0BuItyKq/WPpUSKBPd6p1kGq4PONKoxiOk2N4fWEa
	baSFQJRmokzy0RKOUf5Vi2mM2v84cmydKk0YwsWl1rFcN1E6GZSwwY2BvC5ihouW8W9LS/VPLIu
	tmHU/kRmx/6vmAF1F4dBYFUwJuR1G0OfWvt4mcYZwmh9tFQytmAl4P4GXLu6tdDhOe6y2gy5sa3
	PlcjRsdbNzk5MOG+K5cNdcFsXsAbGsbwfySS2yANm/OICxWuemWU4T5kfpwMsHhy6htrQww2Wpg
	UlG/YoweWSIPuVn8G+3BAGrpy1FrnTivNi16Yi99MSCQUpjBBiP/7uP33OnBPipJ1bqSRIH9hvy
	5+mcwFTVj31W7v3XR7MM86epDfb03+ZPYwlfBhYGeV8Umvbq0qZ1pf6DuJ9iGkRro/wEBS64iBK
	Q==
X-Received: by 2002:a17:90b:57e4:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38ec6566203mr4770963a91.23.1784839720973;
        Thu, 23 Jul 2026 13:48:40 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eabesm438508a91.6.2026.07.23.13.48.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jul 2026 13:48:40 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] fragments/yocto/sbom-cve-check: fix conflict with tag=
Date: Thu, 23 Jul 2026 13:48:31 -0700
Message-ID: <20260723204833.43562-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 20:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241871

Fixes: 00864cf5bc meta: Add tag in SRC_URI to multiple recipes

When this fragment is enabled, SRCREV is set to AUTOREV, but this then
causes do_unpack to fail for both sbom-cve-check-update-cvelist-native
and sbom-cve-check-update-nvd-native, since the tag SRCREV does not
match with the 'main' HEAD AUTOREV.

Rather than allow the tag to float, for those that desire reproducible
builds with just IMAGES_CLASSES:append = " sbom-cve-check" and not
this fragment, set SRC_URI **without** the tag= in this fragment.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/fragments/yocto/sbom-cve-check.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fragments/yocto/sbom-cve-check.conf
index 73ed35be27..46f6965a0d 100644
--- a/meta/conf/fragments/yocto/sbom-cve-check.conf
+++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
@@ -13,6 +13,9 @@ IMAGE_CLASSES:append = " sbom-cve-check"
 
 SRCREV:pn-sbom-cve-check-update-nvd-native = "${AUTOREV}"
 SRCREV:pn-sbom-cve-check-update-cvelist-native = "${AUTOREV}"
+# Drop the tag= or else do_unpack fails
+SRC_URI:pn-sbom-cve-check-update-cvelist-native = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
+SRC_URI:pn-sbom-cve-check-update-nvd-native = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 
 SPDX_INCLUDE_VEX = "all"
 SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto = "1"
-- 
2.55.0


