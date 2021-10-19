Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523A7C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.11538.1634657706678280875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TrVqLsvj;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so3366331wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NgQDy7qex/du3q5V9M31HVhKNFdhKqfU/YYLhMqyjq8=;
        b=TrVqLsvjnCIQfSkMEi3FyD8wipTqN2VvK5/2K26UQM2Qs+XRt8Ji+bBFry09Kg7fO2
         VkgOnUuT2ppzJVwTHNHrQGevHsc4SGADnSDZ9bH12LE7Tbv2x545ykEDKTiH29ZUxQjb
         7KgsLJoQhAu6H5TuWMT1f4YO8BiWQpfzIVR2H+QQWFyWsP1yEwx/ZadIG+tJtBSPLK65
         o5ThwukfEEOdBm+9Ep9hA39009MmJYg0r3ldNOSUS6SayPeRmJjMEIwwwC1Akmp4/waf
         R+5E5H+etbdjphJa5V71JeyAyTSj54GkvODxRvmYTIQ7qsoyuFkiu5g66z4V6w3pdzSm
         NPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NgQDy7qex/du3q5V9M31HVhKNFdhKqfU/YYLhMqyjq8=;
        b=ybPdJuMVefb6d/EPyZFiQ2D4jgFn87h4exedHtV1jKFiqLcXL5ygctsi+yaUhRhKsx
         OcRDzcN1eibeFzDsMxnLkG2pJE21raL1iq2TA7+btCXPIBydUf1qIN8UxBIaQCW2JabA
         Q1Bf87S7pujRZ0DS6ABboqPMBJKp8qnreGv5r0KkO59W0F+ELBmnmqfXWVY44VGUn7yW
         h6Ybq62iqekkXH3+s3tbj/ZbhPIQivtuqD1Ghm/qKE3Eh0FVfwKpR+Rc9H03ZObGuNhS
         MzNovWelhk/k4oJi/A4m4/rYxQYkxJX99fyZKQrZrCORPlQnNKT5FJEtjAvY5QyGzqcZ
         QE5g==
X-Gm-Message-State: AOAM5321Ap+oEP9ejrFoZxnS62wONx17KLqDbAUSzZcQ60ADFzCDdW1Q
	MuDz/RG2Xn8bjV+/hWRdE4Zq6+GweEQ=
X-Google-Smtp-Source: 
 ABdhPJyn28fDChIPlpBt4fGU+RHcK7cxik29pV8tsqKHGAThGQ0+CYE6XqaG6QJvOS3bvwUuCDN+Uw==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr46403802wrr.386.1634657705282;
        Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 58/65] iso-codes: upgrade 4.6.0 -> 4.7.0
Date: Tue, 19 Oct 2021 17:34:12 +0200
Message-Id: <20211019153419.3319802-58-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157177

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iso-codes/{iso-codes_4.6.0.bb => iso-codes_4.7.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.6.0.bb => iso-codes_4.7.0.bb} (93%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.7.0.bb
similarity index 93%
rename from meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.7.0.bb
index 6dd9bfa24c..46988a7e80 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.7.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "3c012d266acaeda93d3e61ec11b8c18c1964fce1" 
+SRCREV = "59767ed869f3952575f7d0f639a290a4c4b315e5"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.20.1


