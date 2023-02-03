Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378C4C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.17960.1675446675717252407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C6SKXK1K;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so5025735pjp.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hF/E6DJLd5yja2emlKYpJFFaTgp8owqVN3G+xBkW8sE=;
        b=C6SKXK1KxVB/N63MAw9Je4e9UgE8itF4czB81IfToibFzWC1WbU9U0ZPK7MFdFROlY
         zxHlqRDLW4xOfVQ7qojt7RmA7wuPgzdfovbmsuZf/S0YgMPJMiZaLQHcF9WoqH4I+uGb
         +puKmjdGmvox4rgXiX/+uK9LzbG58FsnixrO/JxTRfv6Ys2YAgSamwMVCqwZlewDoWGn
         cIUspCfYKFOMWJNzifSVUvdtPguSLoBPfAgd/+DYMBj8L4sA94xqEzzpEslIfNmvjw15
         NgPVcnFg4RPgM+4lNoBHfk6/4OvmyRtIm5h9910VrqB9KZzgjxs1IDRSxHYn7mTvux3y
         WauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF/E6DJLd5yja2emlKYpJFFaTgp8owqVN3G+xBkW8sE=;
        b=glj6epwiegO66TwPYTvJ+JRNymIoCi/mA5RkDga9MxQsq5mSYR4Q19cpsvVMIhMXyk
         j5ystPSr3/rpzkQo6d888P+Q33EgEmUOS023ElZ+/pqXiDcsJ81pMrBoJX3OWunAlSpG
         Cd5iBkYZWa4G+opaOYCQsbLQ27ACa7J91H3sVMMQH7ALrBORQEKyRld3MGYOplCTDVSr
         1/VUIHjEji9vFz+ZKkgTkZZn+L3/75elVo22Ug6ssVMq6Wk+954LeuIOld4InYIM6QvB
         FW1rA/X7JI3PH2O9lat1aKMQ7UgzVm6QEAqXeXpV87wIbQ0GBOF9GQi/TSMwrHCSG/pa
         9rUw==
X-Gm-Message-State: AO0yUKUOd1FncI7vg2a54YXI9rvTv5aOkLovYay2GjyiwZfVB2bzJ3Wr
	ikNK4Lh0zc9AMoQ7SI62dPJW2pZBsOw=
X-Google-Smtp-Source: AK7set/i5erWqUL6+w4hmfWMpwhw/l33gDXeBUXVaOK0eR/IDlBTppPtSndtOEWg6aedr1nTnEnhzg==
X-Received: by 2002:a17:90b:218c:b0:228:de0e:c8af with SMTP id ku12-20020a17090b218c00b00228de0ec8afmr11755285pjb.16.1675446674771;
        Fri, 03 Feb 2023 09:51:14 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] python3-wcwidth: upgrade 0.2.5 -> 0.2.6
Date: Fri,  3 Feb 2023 09:50:33 -0800
Message-Id: <1aa4f47d794d6fca936e5f505bfcc621f086533e.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176746

https://github.com/jquast/wcwidth#history

0.2.6 2023-01-14
  * Updated tables to include Unicode Specification 14.0.0 and 15.0.0.
  * Changed developer tools to use pip-compile, and to use jinja2
    templates for code generation in bin/update-tables.py to prepare
    for possible compiler optimization release.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-wcwidth_0.2.5.bb => python3-wcwidth_0.2.6.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.5.bb => python3-wcwidth_0.2.6.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
index a532d3c5cb9..368146dba48 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
-SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
+SRC_URI[sha256sum] = "a5220780a404dbe3353789870978e472cfe477761f06ee55077256e509b156d0"
 
 inherit pypi setuptools3 ptest
 
-- 
2.30.2


