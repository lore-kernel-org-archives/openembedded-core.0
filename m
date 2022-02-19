Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054C2C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:16:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.14148.1645301759413493045
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G47FQhew;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d3so4496235wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4B5bZUL+h2tqc/KAUmhG3mziXaRWKXWu+BlxQTVKwBw=;
        b=G47FQhewXpIPmGMcXAeHE1eRlwS0SP5V2p9qewQRvNtPiQNn4iHDt+/RHNbQpi9Ug9
         YfX4t3djIV5WT9XWqKoltRHcOZOBECGJLC1De8qC+PdgHxVrmKjkD3scr3sDrnV/rYtn
         n2/wY7Yca9dSm674r/PjYK//dRvI1loqvzHDGcyyM9JWzQz12bLfaVinD/AbUnH+Ebw0
         Xpp+TdcyhmfiGV3cpiEu1gz4MSf+e+yqu6qLk94HQGiWCyfVZqVr280Cy80311rStnJg
         GklpEAM/w08fo4TZU3gDNyJ+sUrFpaDURJkPAa/Ian6CyrVz88Lki9N/3zwf5KjXt5ri
         CjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4B5bZUL+h2tqc/KAUmhG3mziXaRWKXWu+BlxQTVKwBw=;
        b=lBCvuUEeniA05QxnjbxKLbcmBBgVLtP6+B9xhC2yU6AReR6mLfnslCdymDQgrovFBZ
         nJOJ9D84aOB+btioGt9yKyd9rCFdLr3UDlCDL8IlOBplPkcyBib4h8TunM27Vp5j1UHa
         t0fODcbaesTSRdI63JGKBzDe8eX19zs88GCuN7N1LTfUwpjQ341Y11gKohICzq6a+ZpS
         JvJ/klj8Xxy4/xYHclKETwvQBzJMza+X+M70UAQNbzfmy9g1DmgGBsNW9afejSXV/8bW
         CRilWBOnUYuu1ePSJaDhD5xhvJAHvgDP1njqNEiS5hcwLiaHSJkceQfznbaY23HbAXVq
         qRFw==
X-Gm-Message-State: AOAM533UnUW6p6qF9HB0opEXgEVAzUhBOfS5QDRgEv6UzjdOdCf/MMbp
	OPhPmo8/rGYNYDqV3PvkkXA/C6/XdDQ=
X-Google-Smtp-Source: 
 ABdhPJyfRMr8S3n7UgKJ8YXXDrV7QImITROR5XXCrcL0kPznZaE+bobTHoAQPo2VWPgA+K5jdaJ4hQ==
X-Received: by 2002:a5d:64cc:0:b0:1e8:f4ad:bf85 with SMTP id
 f12-20020a5d64cc000000b001e8f4adbf85mr9343509wri.630.1645301757605;
        Sat, 19 Feb 2022 12:15:57 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:57 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 12/12] gst-examples: 1.18.5 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:14 +0000
Message-Id: <20220219201514.1551306-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:16:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161976

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index a720bb73ff..2a7a3c3111 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
+SRCREV = "70e4fcf4fc8ae19641aa990de5f37d758cdfcea4"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


