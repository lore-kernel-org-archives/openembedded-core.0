Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76327C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.6906.1645799215944013290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZOTG+Qle;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso8565810pju.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x3q6vPHDgGXXfIYqkf44PYlu+IP/zHfZNpx0uBVfXdg=;
        b=ZOTG+QleVaHjXVWljkp96zRy0hkaOwBhYJAc+qQshoR9ssrU8W2V7aueRkMYmVPlLx
         4Px+eo0/VI802Lew9n4LA2FOo7/1Exuhjclh8lcIs9yeqMqwPrHAkAk/tZT4P0DBwGkg
         qqov+2M2sHWnx+wurX4qEbeyy0+Pz/AwzI1WEsIKIjWolmiS+pQT1oUxnzf4zfPdjPG+
         GehscrM9PmKA2ojtNkuZuFv6GQ3gSKtfARy0qkw4tU3UdFjFld9o4BVMlDUmm9eftn8S
         4TZG/OR4pPra9Fd+S0i4FU3jE2enQX2NED3RKjmJpnveeA+Jc8mwxO0Vuh15q2nSqK9m
         hFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3q6vPHDgGXXfIYqkf44PYlu+IP/zHfZNpx0uBVfXdg=;
        b=Qo+upX6oLaAXlPaNEmSU3CW2DoNemW+kd2NVQY2HRlZl5LfKDADgFKSyWEwc5sRUWL
         ifN8jYTqMkFtsdL/xrt4TE7h6400XFS9aYF8ws1TetqAYCyiMuahJ/+13BtCMEHHTvtx
         6Kb5YXc/c0eRFVSEmwTDrkUJfUUtX6z4/L9iN6JzfJ6ArW5GL+Skah/tcr3Gj4fRiJP4
         dihf5+LIoF4DmUhoZ4wl6Y1AtEyLAcakkFriAMGsiHcYby38M141gVDJWYWz1TGUnzFm
         jv7VJNmd5bh7OJCmoT4N86VBa7GLV6XgRoz4z8cCYAWlKzv0tWpGelTTMsjfBYPUTy2E
         E6uQ==
X-Gm-Message-State: AOAM532ToqsvymVfyg0zBv3S7t4qdAb3iOHt/HW5B38WID4wdaItDqoh
	moCZXXLipddjBAKyiSHzF+M6t+rCM7ZJa0qg
X-Google-Smtp-Source: 
 ABdhPJwMmR6ccWrEGo94qmi88vyXLCVFo243ts1qTdV7LU/3UmshazippfIB3ySH3uosRLMWxFFScA==
X-Received: by 2002:a17:902:da84:b0:14f:deb1:8f6d with SMTP id
 j4-20020a170902da8400b0014fdeb18f6dmr7688356plx.103.1645799215018;
        Fri, 25 Feb 2022 06:26:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/50] ruby: 2.7.4 -> 2.7.5
Date: Fri, 25 Feb 2022 04:25:43 -1000
Message-Id: 
 <a7935c9c4a47098f0c1b2eefdf7773bd85891945.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:26:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162349

From: Chee Yang Lee <chee.yang.lee@intel.com>

This release includes security fixes.
CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date Parsing Methods
CVE-2021-41816: Buffer Overrun in CGI.escape_html
CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.4.bb b/meta/recipes-devtools/ruby/ruby_2.7.5.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.4.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.5.bb
index dafa7d2f6b..44a2527ee7 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.5.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "823cd21d93c69e4168b03dd127369343"
-SRC_URI[sha256sum] = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"
+SRC_URI[md5sum] = "ede247b56fb862f1f67f9471189b04d4"
+SRC_URI[sha256sum] = "2755b900a21235b443bb16dadd9032f784d4a88f143d852bc5d154f22b8781f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


