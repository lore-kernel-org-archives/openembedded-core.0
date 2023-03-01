Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DF3C7EE33
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:11:10 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.30595.1677694267323244452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 10:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYv2gP7a;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u5so11508307plq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYg7FLtrQIu4Rp6qDJyXxAUK2PFlYq1shFWqT0eP3cM=;
        b=VYv2gP7a59UWBMs0NP7FCUWj5m9EuFIAvhdKugmR4duhdap0tgMm40fpLIJBXEdy4G
         k9ak4eV1IrmQuUmR1UfjL2HkKXNTdTLLYvgwuZzsSjJ8wCIntcb8Y19MSbEnvUeJg+Go
         UX5ZYQaMroGaXSRRT+2XXKRHHpEhmgj8nMla1QgnidEofiBu/+Adr5V1c6JaS502xquS
         x3vFHBrWX1XxjoLU46i3cjxzz8db6RpfE28KEnQmDU//9Tp579N3LmcraN6oPL14629+
         fWOEIZZ3t4o1lOUfWa/4VvP1dGH3iTlW80hpK6Xu0LIVyE87Gmfo6UtX7Xp4TVd9DTZr
         UlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYg7FLtrQIu4Rp6qDJyXxAUK2PFlYq1shFWqT0eP3cM=;
        b=nRLtm+z1d6y94F5rcjLR61iK/IzClzQklVC5jvCqoIsG1MQYdiV++PlD728I8BxVsF
         23TyucK6X6X4UvtOsBlbgEqchmvgNeY4fh7t01hAt3Eob8dJfCpdHe126HvRO3OQIHit
         an5Uo+Lsaig0ysUKGv2Uj8o40LwI8xmWpaJgWuMh9Mnv4ZBihgZnHOsypU6OZxIBUxTm
         Pz9iC+SLFt5d5kJXyZosCIbt7aZRmNzOLpiUAtMkZfLxGJGi7zTUzwRajgEz0o71mJFf
         4YM+JeAU0vM5YqBU09hZ4SrCwRF+nASL1fhfMtgtc6nEib2B5iJlrhF5/9a3rg171TGk
         sfXA==
X-Gm-Message-State: AO0yUKUksS1gS7Exc9sd/NRjk9TCnSVUX4bw7uHqqdcurpexfB13oUU8
	G36o5bHAM4VUAKBYfm1hMY0XHBQSRBnW/Q==
X-Google-Smtp-Source: AK7set80YUaBy01OB7yfpkQGXL/6snvJKFTKIs14SYKGg7VAvOXtPKniw9RGasYoFmulOkPtIWd/mw==
X-Received: by 2002:a17:903:234a:b0:196:595b:2580 with SMTP id c10-20020a170903234a00b00196595b2580mr8758676plh.0.1677694266396;
        Wed, 01 Mar 2023 10:11:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8ecb:2eaa:9ab3:bdee])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019928ce257dsm8715614pll.99.2023.03.01.10.11.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:11:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-zipp: upgrade 3.14.0 -> 3.15.0
Date: Wed,  1 Mar 2023 10:10:42 -0800
Message-Id: <a1ce3ef647bb64243f4afc946f4f1d4bc71cb23f.1677693991.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677693991.git.tim.orling@konsulko.com>
References: <cover.1677693991.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 18:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177950

https://zipp.readthedocs.io/en/latest/history.html#v3-15-0

v3.15.0 (24 Feb 2023)
* gh-102209: test_implied_dirs_performance now tests measures the time
  complexity experimentally.

Reference:
https://github.com/python/cpython/issues/102209

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.14.0.bb b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.14.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.15.0.bb
index dc5091f6c70..5b42dd8139b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.14.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "9e5421e176ef5ab4c0ad896624e87a7b2f07aca746c9b2aa305952800cb8eecb"
+SRC_URI[sha256sum] = "112929ad649da941c23de50f356a2b5570c954b65150642bccdd66bf194d224b"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


