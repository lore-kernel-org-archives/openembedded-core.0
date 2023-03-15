Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1023C7619A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8786.1678888902880020754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Z1fPM6Xt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id v21so10000155ple.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXzX0gdS//EIMxZzQUaZCbLKFQDz8MeQa6aWrRdF6OA=;
        b=Z1fPM6XtWk2neFJJt5qFuqXnj3ocvNU7FDoEWP5OSeRZMIfnkezK4dPbB28AE+Zlv2
         doupQpNpl6zECWeeQoeqoQb+T6Hz6AqAAnI+03ZVZNdrazPxFKYsd2kV5hNRTjvhXN7Y
         Sck6x4k0CqsNYuWjzFFwvray+bzkKmshARwcyKWrujZ/YsUMJl9YBIIsw7Ym7d58+cvs
         7YIvCk9GvSyoQGJcNB/hnNrPBy4+/HbMKomkjH3VzAAsLx9QVO/ktdxl7p+wOFsmQMv0
         /hs/TmnG7Lr3i6NtEdZPh/JklojHT8C/OGGu+ZENrQWTPHqGJdzNuOCt+WmYm4IdXG93
         37jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXzX0gdS//EIMxZzQUaZCbLKFQDz8MeQa6aWrRdF6OA=;
        b=MIwO5pEYUs/f1gN8/pReW4SU15iwQxGuNHNeW4BLDTXlAlRT9FNHkuLRQT2+5+H5BF
         TrUVVDz3DM2hy9Cb6w+shSg+QHSrpkDRrKM0ESe3gQ9cZUv5fVLpbPT4cLeF4fouPqGq
         3MM+JXhKvzbT53En+6ZMvS1QekrMFa3HvRbmZGEctjv7pifKSgs7ADRSk7AEM7EWTO6K
         ty+QoKZ5oeAAaCRaWv55ykeibbCDMUqtLiAuWTBIWVAW/dIWZTwouGuwvZiNJ02Ihie9
         mOf3VmwcntSAId7mfClHXqsNijMgN3Vk9h7zFp9PtiC2PO2jA0yfQ70MnGpwAXsPi07N
         JreQ==
X-Gm-Message-State: AO0yUKWrqRsLTczkf1pcLrBp7RL5u8sgFDR5LDTM3zlE8KN9DZgqA1CB
	E2UTyNq6fQqx8rcM2coliiyWQWdxzkxXfuLnUDc=
X-Google-Smtp-Source: AK7set+b9WM7R2x9WKLFesV0F3DHDgqF+r06/90be7Y2EDHIP1vrZDrmcAIEQ/E91yHW8a16+BM54Q==
X-Received: by 2002:a17:902:d4c7:b0:19c:eb9a:7712 with SMTP id o7-20020a170902d4c700b0019ceb9a7712mr3448110plg.1.1678888903405;
        Wed, 15 Mar 2023 07:01:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/22] linux-yocto-rt/5.15: update to -rt59
Date: Wed, 15 Mar 2023 04:01:02 -1000
Message-Id: <7819b6b18dd7f77e8990644e42fb637095feb973.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178562

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4d335265c101 'Linux 5.15.94-rt59'
    c3b4464f5d2b 'Linux 5.15.93-rt58'
    c67bd325f576 'Linux 5.15.92-rt57'
    48e551ae0f55 'Linux 5.15.86-rt56'
    977a63a270ad 'Linux 5.15.85-rt55'
    adaa1d9e19a5 'Linux 5.15.79-rt54'
    ff3c61c5ead1 'Linux 5.15.76-rt53'
    e17260e8d340 'Linux 5.15.73-rt52'
    c83f436b7981 'Linux 5.15.71-rt51'
    e01c9e3ba82d 'Linux 5.15.70-rt50'
    debedeb4264e mm/memcg: Only perform the debug checks on !PREEMPT_RT
    1ef2cd0b8676 mm/memcg: Add a comment regarding the release `obj'.
    f8d153e08d42 mm/memcg: Add missing counter index which are not update in interrupt.
    11624404f67a mm/memcg: Disable migration instead of preemption in drain_all_stock().
    0a1f4de6ed4f mm/memcg: Protect memcg_stock with a local_lock_t
    3f15202f27da mm/memcg: Opencode the inner part of obj_cgroup_uncharge_pages() in drain_obj_stock()
    40dbbd2f9773 mm/memcg: Protect per-CPU counter by disabling preemption on PREEMPT_RT where needed.
    6269831106f5 mm/memcg: Disable threshold event handlers on PREEMPT_RT
    8da0e71b7b7d mm/memcg: Revert ("mm/memcg: optimize user context object stock access")

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f318c27fdc4ac276743bd37c466e3fc7296bcfd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index caa5e5197f..0f557ba2c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c69881f9ba51496f0930cd39bd67f9dfb8d3a612"
+SRCREV_machine ?= "4d335265c1010cdf45dc0169b1b79638323a5109"
 SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.34.1


