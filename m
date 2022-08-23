Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C2DC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.4507.1661294175883869342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=q0APU0j/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id g8so10184047plq.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ZznAQCdJpycaYXmVqxmQmieNzoHJzqFQQaZsb7s0bxg=;
        b=q0APU0j/uDC8WNz/QH7FEKRG8P3ZuMCJMQvwS7feTpr8QZn6H8jYNpamljFV4aNCGB
         6QYnEEtnWbzN6K2YrDXSGdBtDKUgcXn35tm29XV3rHUwN6xQCyY7sdzJGdMmK53gQNMS
         ELf5YSHdWtNXxQQSWgpVq+XkhtjZbT039kNMmidhqhMC2r5ak+TUmX+xLd9d31AJyKnD
         m0Q7CErowuroFkgqczDBS7nA25YsYbdBqm3zT8QqJaiIE9V31Ps73MVBAOqLXYT+VOFs
         nR1AzDhDWjMfswU8dbGB+bqnQdatdHgK1tNv1iohxHzV3J4KZ4LnTWN7EWAWEYijm/CN
         dvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ZznAQCdJpycaYXmVqxmQmieNzoHJzqFQQaZsb7s0bxg=;
        b=MrgmWTj1DTORrxLKPqgooqI1Wil0s9Jjjm0mgTp5uhwx/9/OZ0GZLwDOrLlqcnA+M0
         5nv1ID+anH/x6a0X7JQna6tMWSdtRAp5Q8ZIR9M0zIfiuPZBJuqQl0zjUmnUdfIB80IG
         PdQbfh6YJkquwDw+oo9ICQGi4xIeMS8PK3ROzaXTGArOOKBsSt+xrOn/WwxRrgclWIpv
         DLOijNJHvoPAq20TvwDqgmTh4gfSRjyot10kbdjoRAKWK6SiWs4Hhx8+xWsnAt1s/PZm
         0x6sJ0DzZ2dPtmxcPAIcW22pMJd6dRpFCyiGOi9nM+j2jdoHL5AgZYBSWMKg+oA/3OUE
         fR2Q==
X-Gm-Message-State: ACgBeo3gB6gM0iP53ZBcQkqXTtzi+LEnQMBlScbYDMu3poLwBWO9yBjr
	LLauooHfLmf0/y0PWSGl+LW4/WWEDooGAxr6
X-Google-Smtp-Source: 
 AA6agR7L+/iujYn+k2FOAhX0h+4Qd+p+3sXCm23W6+UbR93apWwIl9x4AwTPzk48R5wslL3vFBiumQ==
X-Received: by 2002:a17:902:710e:b0:170:8d34:9447 with SMTP id
 a14-20020a170902710e00b001708d349447mr26030459pll.126.1661294174939;
        Tue, 23 Aug 2022 15:36:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/28] iso-codes: upgrade 4.10.0 -> 4.11.0
Date: Tue, 23 Aug 2022 12:35:24 -1000
Message-Id: 
 <2d0254acde343c2d9cdcb94b488dc1308bae319f.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169744

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes from 4.10.0:

- Update ISO 639-3 codes from SIL website. Fixes #40
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a269e59a960a56ac038f4e96c199a7577202b186)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.10.0.bb => iso-codes_4.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.10.0.bb => iso-codes_4.11.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
index 857fe463ef..be573981b0 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "9a6c24ee40e737ab34273c1af13a8dabcae888dd"
+SRCREV = "2651d7fe65582263c57385a852b0c6d8a49f6985"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


