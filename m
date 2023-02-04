Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCC5C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 17:37:12 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.11311.1675532231700118729
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 09:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qLUEdwHZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id k13so8305471plg.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1mXEfNSaspKwsPPhLmmOn5xWhGyWEy6E06KSc6mIAs=;
        b=qLUEdwHZsUxkMnq+ccxNazVrlSzLgQUfTrGbIlFew5lf/jOMqrTOHxTXDc7ankMSDz
         HUxqsnf4kVvmsCLSKHGMkAl8MPO7SHBhLZ3SLQqj03NWXo6aDxXQIRxJjd0wj3zGa/jO
         OJRggKRlXDoKvdmCbOi1EuSsnW5qI6y/f09Wf1tp56ywyQlwK7IiB4nd4dTX29y2gTse
         /RBRTMBUouFdQQl2CXK9Zo5SYfZke8HQUiGgsh763A/EB/ae1P9DM7XUENQYW4+1Qe+v
         aUdq+HQ0H71NeciKtfRGkYkzz0RQSOVmdhsbdzWWNL1cUNWuIL7MPyvvRRJyvBoQnAU1
         sXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1mXEfNSaspKwsPPhLmmOn5xWhGyWEy6E06KSc6mIAs=;
        b=wzK8rLJcIvVtc6lYipceL140HUE5kei3jbKMTpxQjqfT6lKR8TegcEGIzr1JKqDG1I
         uVrWhvPIGPwgyZu/GgXRE16Ieh2U2to+u3K7RA9xeWJ5c1opkNVH62YcmWfENL8HeSuR
         GFV63xcGyRHtEQdQCauAUAsmybeOxfHUeYa0x16umhKW8gRrnVqX1mqNRfm0T5piXhC3
         h2500Uukj4ObDSbkfLdmAjTH7exOHBQwe+lqGyaZpIPPEZ/Fb3NsVvUP6LcttGsx4kzz
         IEZHVoAkCyrS/5jMxyQ9PsPsg0OqJVpELnWKP20yZh+C+PsvYBm2ZbAOi0gBNnRpHuIs
         2n9g==
X-Gm-Message-State: AO0yUKVAgwz7bJYBVRB09F3NymJsbvdIJWIhvTRV7BA5CZFea7jNkfj/
	a4MNW77/CnDnSBPWcu3FaQ3X5/smIyU=
X-Google-Smtp-Source: AK7set8P47v1w5uhVZ0uucWHEGFQOG6suA22QBALNBUlr3/Iv+z9rh6cmnYlB6fuXFhPb02bvqQ8ag==
X-Received: by 2002:a17:902:e5c3:b0:197:9036:e70d with SMTP id u3-20020a170902e5c300b001979036e70dmr17869049plf.29.1675532230406;
        Sat, 04 Feb 2023 09:37:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8249:534d:6deb:94ee])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902868900b0019460ac7c6asm3636284plo.283.2023.02.04.09.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 09:37:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 14/14 v2] python3-sphinx: upgrade 6.0.0 -> 6.1.3
Date: Sat,  4 Feb 2023 09:35:43 -0800
Message-Id: <20230204173542.2440494-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <8a230841f0fb99c8a40943862b49dd899bc52b99.1675446372.git.tim.orling@konsulko.com>
References: <8a230841f0fb99c8a40943862b49dd899bc52b99.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176765

License-Update: Update copyright years

https://www.sphinx-doc.org/en/master/changes.html#release-6-1-3-released-jan-10-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-2-released-jan-07-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-1-released-jan-05-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-0-released-jan-05-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-0-1-released-jan-05-2023

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
* Remove FIXME and add License-Update reason (thank you RP)

 .../{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
index 5e565e745d6..f75988a6a0d 100644
--- a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2214a89317448c7f792f5b75dd6726e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=066da51ab732319a06beae4f10788577"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "58c140ecd9aa0abbc8ff6da48a266648eac9e5bfc8e49576efd2979bf46f5961"
+SRC_URI[sha256sum] = "0dac3b698538ffef41716cf97ba26c1c7788dba73ce6f150c1ff5b4720786dd2"
 
 inherit python_flit_core pypi
 
-- 
2.30.2


