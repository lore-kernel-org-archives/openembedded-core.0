Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AE1C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:44 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2856.1643917903862011863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EWz7Pfuw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so10991863pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ffCrmA2ZQK/mtp0CiDPtA9SNW4YxOEQ9g+1g/Q6TCFo=;
        b=EWz7PfuweWeng87YDBo4CjHDVjBSxfvWdu67R8Eb/XOf6XqwtAduGE8sJDThYEHQLX
         w4d28tkOmFl5LdM2hquo1JCPPJJRnEBFKDz+NBrISSPQhs13Rlp2Xp4dwN2NRJIilN+A
         KBMViPIl6gI1oFUuvDKvp2xePVMaj+1UIirnlRqYzwSnAHy80Dvla6F0CmbrE61K7bwk
         PMl+zare5VyBNTK0PFEweeQKdTUsRpNUNUuE3Dg8KKyPqAyJJCYryoKcCmdH4z+6+sOd
         9FX8jQRJDAeSDvjlhpf2G+RUA+9D5jnOt9x6eFrhRNWKaGBg3igHK56OQzphEl2reNBP
         GuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffCrmA2ZQK/mtp0CiDPtA9SNW4YxOEQ9g+1g/Q6TCFo=;
        b=KpLQcOFjAzFvTmKSJubBPXRWO/AC2Yqxxp2U5kNk/Eit2L5geSH3mRMETJkwwbfF42
         ITzSO3diZSfcjcvWjCSyb3MCbNIT1O59dI0s5BfeSoY8KwfMS3kttSlA887HR5BHSAKu
         aWMcD1jYzBCkSe4hjWzzmQT4u5wFdyXd8vfYRi9+IyAj1jXtC3leCcWNuQBuVnmjshOs
         229xLhCiHSif6VrvVCniK91f3CR08b+5Z5ybs0VgNVlz4Q8EW9on9ecCwjDzAa+SYFrr
         pDt5/ft/Z7n5Q0e5/QtqI0ZVZh2BzUHxe0uVjpSw9+L/CpUMPnqBsyv2hIvIkR6/YZ+3
         8epw==
X-Gm-Message-State: AOAM530wfhJMVPkwMyE/6lBu4c0Ey9ZJFrSB3Czq0puR4efwpUh4tbIs
	NKChS0H0QQkWiM2VErkWpdKwHFP/XQwHUxkR
X-Google-Smtp-Source: 
 ABdhPJxYYpKbFM+gi6Jfazh/rifrHsUyG0ZCp+36wTqKoVHgDHkYSpobcEiToIvZHyGjzW/1o0UmQw==
X-Received: by 2002:a17:902:c10a:: with SMTP id
 10mr37546940pli.108.1643917902772;
        Thu, 03 Feb 2022 11:51:42 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/20] libcap: Use specific BSD license variant
Date: Thu,  3 Feb 2022 09:50:42 -1000
Message-Id: 
 <94aae176545b4005e0607cc9acf386e8f7adb558.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161313

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 9e8b2bc55792932e23d3b053b393b7ff88bffd6b)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libcap/libcap_2.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.32.bb
index 325fa87a1b..d67babb5e9 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -4,7 +4,7 @@ These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
-LICENSE = "BSD | GPLv2"
+LICENSE = "BSD-3-Clause | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "hostperl-runtime-native gperf-native"
-- 
2.25.1


