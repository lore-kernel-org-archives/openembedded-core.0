Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CD1C4332F
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:35 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.9328.1665273333826651994
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NCy/yCyE;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so7583796pjo.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apgcqjJWetnyaTOriZO8hFxj6YSOFwibC9RYD7tIuJw=;
        b=NCy/yCyEI1kxzyV2BOuH36hCeIx+hFlJCEIlmHOvWBqhXF5cxe7lF62Y4JHKVnQiol
         7XEYmnKDf0DJQboJ2sYjBI1VI+476FucTgavybGuW+Wke8XkIXxIDqbUkqqG8P72dZHs
         vxywc2LcCPUfo6zf9mauZ6ge/p8thPHFn37nj16XRXCNBPRFHBz5V4yQrLOf3B9pmcyo
         dPstavXzOpDwZWJm7Cj8Yss11Lc2GNDHVT2Ka53rQgJHOeborAOEO8fqeYGg1wL3iENC
         etueUJ4CXs6He8N1l4yR9zwm/Ai3GKRA6f8L7KxoWbG9sycNTkqO04RDW1IuRCQePr2K
         LMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apgcqjJWetnyaTOriZO8hFxj6YSOFwibC9RYD7tIuJw=;
        b=ZL3Vdb6SS2kw+lqi6fLnfYyg+zRuj63ZMg16v7HKPHaNANLKR4LOSlkndAyTezwm2B
         9BGmAckjOT7CNfzcVG9O+At9/OOgOQapywiVn/KM+xhDW4I/5bwb1Ak7GVL7R7ArNX/t
         LuiMmkPxVZ4kZGPN0nL72rOa9BUGLrwCphq/ue0tBTEKVVNU70x8Mh2ukJgyU2qZyDQY
         RfbNWsSjFksSKo0nNynDCUF7ulfiWZ2j8VS82LsApO+AIf/ZdmsV3H+M/WKEFtC9guN3
         8ImEUlZQOQh2rSqw/o/m2O56cqOSPFwiPRBrYLPYU4MwTRTG29H079f6L+RyqJYGXi7a
         9VDg==
X-Gm-Message-State: ACrzQf2jrjb7jkNLSIXIr/MZ1VeTzY9IH/OKysxRV49bS5zKvGIZ0Yqv
	X7c7lbwnHclO7nstuwkk4UE1Sm/1O18=
X-Google-Smtp-Source: 
 AMsMyM7yF+gIjIoljYazGND3TOg0h2e1wZeEhblsWGVqBzXmMPcPAhW1+DMx1QfwYW+Z4txl0lImjA==
X-Received: by 2002:a17:90b:4fc3:b0:20c:dbba:e614 with SMTP id
 qa3-20020a17090b4fc300b0020cdbbae614mr4815725pjb.163.1665273332891;
        Sat, 08 Oct 2022 16:55:32 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] python3-iso8601: upgrade 1.0.2 -> 1.1.0
Date: Sat,  8 Oct 2022 16:54:53 -0700
Message-Id: 
 <2550f045ed05a464068da1f4425584860b510c4b.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171547

e3b4ed3 Release 1.1.0
56da11c missed a comma
fde429d raise ParseError if we get an exception on is_iso8601()
21f5368 Add is_iso8601() function
406db6f Update license years

License-Update: copyright years updated.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-iso8601_1.0.2.bb => python3-iso8601_1.1.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-iso8601_1.0.2.bb => python3-iso8601_1.1.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
rename to meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
index 93af233d296..797607f81e4 100644
--- a/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple module to parse ISO 8601 dates"
 HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
-SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
+SRC_URI[sha256sum] = "32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


