Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C86C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1867.1645557453662021108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HhKOCosb;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so409935pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=HhKOCosb+nl+rK8budcgg/tOp/easK3vDWmIanJfLS3UXy1cD51TX4lIFblelkI0/z
         b8Bb+1J8rV3nNtvlFijOazwDV4C6NZeBmLQlHpglpD9A4zEyfxwqzP5cGkbXq4PZQp4f
         o13gonqjmDc8JM2hOWL4EbFn5297vKHIT0QWnIrFFcIT6u4PjvoDqUf4ZlaCrHdIKxH8
         E9JrkpUe7n9kTQ5fZToZqXGZTDkwBE4iVqcGaasFdOMtOdvrzc6kHgMrW3tA8XZqE9gU
         /BoBidfmKT7WZ+yMHVrdcM9Jly2Mb36OIxRbKCPsLfEwpJR5MRRos8YI+323QAmq+kq6
         K51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=GRsGSRYoVWdVdKHRZjERu72c3HkDQSLfsrVcBNeMmuReAY2CBzNBI9YEemnE4WEgRi
         bA3ZBPjlWti72a8w0QInheewO7mxvW8fq/rHkYycKYCyR3xoYdX12WZblLMWxvrP7Ahn
         v36nPifEqbHCUpbCsqQwtMnyG+C+kjS7uWVfSy9OLh++as9ZkFde+paluVKFLbaZMVar
         Haw9b2d0TW1yQ66GHyDGBJRJbUStArehrVv1iJGW5x40jtbdhDbl+P96eTzHJUtSQgKi
         XdNvfZQtDPQHGmyYShSQ9we9mymh1h9YR4igEmufDYcxguevZpYi4aA0oJMRtAer70/E
         fQCA==
X-Gm-Message-State: AOAM532OW8hhYZrd7+bbZrTTvO59CvxYbk6tdx+WWNeOTH0Q0qM1e7dQ
	Y0zZol2Ma824VuEKlXLXh7qS/uEeoXldRw==
X-Google-Smtp-Source: 
 ABdhPJx2Yvh2SqSysMQdo7kKZq7d/SFbcgEsgFui4eV0DnYAdFTg4WvJA4Xosfdkr4J0KTQ3kVgjPA==
X-Received: by 2002:a17:90a:d511:b0:1bc:50c9:8d8a with SMTP id
 t17-20020a17090ad51100b001bc50c98d8amr5581833pju.112.1645557452818;
        Tue, 22 Feb 2022 11:17:32 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 18/32] python3-more-itertools: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:44 -0800
Message-Id: 
 <75876ed10f62c215c2b72c46a9402f8496b1977d.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162209

Define PIP_INSTALL_PACKAGE as more_itertools to match the name of the
wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
index c1e34b205da..5788af3f71e 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d24
 
 inherit pypi setuptools3 ptest
 
+PIP_INSTALL_PACKAGE = "more_itertools"
+
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.30.2


