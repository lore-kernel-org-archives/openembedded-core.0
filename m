Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE08C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 22:09:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.2372.1645654166308816429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GcBFnLA7;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so4464546pjq.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2XS6aTgAhUVyT5Vb36/Su4CJvd33fwxXR+B4iPESTb4=;
        b=GcBFnLA7kFqyXFdDKRMLHn/l+M6l0k3v265AFclcu9peCRtTwIZIpEzTt5PiyyBhrm
         l07PRWoFTHFKfE1Rd8OIEY7x7qVWz4eZock2VFJoqDOtIMkc+mqwTLOy/aZo8+5fImbG
         /BFtDeaukC00xdRRso8wBh/TA/hgBiqnHH95iBbHEK6LeL8i71Fx1Kkr7dOSnvGj+Muj
         BlLHmWG9TxKmpJzBqsVXTEOAxFvP+BZkxQlH1va4nygk9v+e2T5o1Oj7U95MbzT5ZW3y
         C6DbARv8kiEz3Oxl670KHyi4xzT7ppjity/cOm3mstPIt6p53ghnpgcbgI3r+t3SBDd2
         XAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2XS6aTgAhUVyT5Vb36/Su4CJvd33fwxXR+B4iPESTb4=;
        b=Uf25Tbmd5I9mnw8YkCM4RkQ4TDcplWfLBFomwrayQEhbL9y1w2Zq6UbAZstpAIht46
         AZwkNdlbJr71m7XVpPz4rtyIekdeeG6fDJWMFrgwMJV8ber+RfGs5DgzFCyxBvIKWAME
         7foHIkdrL6vqMb6fxTqWE3JpqVsudZK22VLZvxZuJrku+W12W8Yd7quj0nol1//WFmOO
         mCLj/KDC16WAvib4LTrZk0qemd3HAPRBfW0R7pydLINHesE/0OtNwVHd99g7ngGatOHD
         iGixcd5cKGpIV892G/v3a23UPINlD9j81BThuGD8p+C/bE3JEXr39seNfU6Mxj3eWqXp
         /v8w==
X-Gm-Message-State: AOAM530wtjEDO/EHIZZTYlE6oZVKZAd3Ok2UsnPCDTIQvsBO5DcOfjd0
	GXFKi2J/gAS9TjP8gFASsTF6UQTgkWY8oA==
X-Google-Smtp-Source: 
 ABdhPJxZbZ6fL1k61BEpp14BKG75YHche5JrF1WwfOICvIoLVBZbSijAYPX67VuhNSs3PUwMfyLrNw==
X-Received: by 2002:a17:902:8497:b0:14f:919:9fdd with SMTP id
 c23-20020a170902849700b0014f09199fddmr1841319plo.52.1645654165263;
        Wed, 23 Feb 2022 14:09:25 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:16be:5024:1d60:b2cd])
        by smtp.gmail.com with ESMTPSA id i3sm454465pgq.65.2022.02.23.14.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:09:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/4] python3-scons-native: drop from maintainers.inc
Date: Wed, 23 Feb 2022 14:09:11 -0800
Message-Id: <20220223220913.2057644-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223220913.2057644-1-tim.orling@konsulko.com>
References: <20220223220913.2057644-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 22:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162278

The python3-scons and python3-scons-native recipes have been merged
into one.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 333685cd8b8..3fceb6701bb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -635,7 +635,6 @@ RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-scons-native = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-- 
2.30.2


