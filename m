Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FCEC6FA92
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:22 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.20267.1664133493767765434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ngtbmEc1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so10491546pja.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=OGvrhj4mkCWJgFm7XJkv6dedhHOUPGOCnJxF+0e6gGk=;
        b=ngtbmEc1ASEN8e9bOuhC0TgaUROTaGo5qPmafUj9mDi+NFuE377MGsKYNWnIcHZtOJ
         XG5yNCU0sBwoX6QfsC4TIzKd4zTPxznUhBz9xBWtB85fFIII4QQcHzlhQauvpg58bS1V
         drnCMkM4VjT7UxyIVmTkdgGfxwxtk5/s2mu4uTV6zRkuv5G6hkDTGI0vPU32AxSgyhzg
         Y9kcYgP9oojColPLnKndhCLIMESNRMOJR5nXPld6vq+bA823eM5MbZ7EJQzFoJV5+6yq
         OuCxkAmPPLE/gtTmZyhHBjvobDufoYL7gvAdpi6eylPL5jaH21uzdn3C543RbA1FJCws
         vSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OGvrhj4mkCWJgFm7XJkv6dedhHOUPGOCnJxF+0e6gGk=;
        b=fqlj92xcTUs9a3dOs0Xv+BINxPSis9FraMvkTFlqiTFQ+axHkxGYjx+237IbWrGUJG
         eJ9wIQ+E7x0f6dbjfqWEpUKN/Or3eCTtcmzF/rtjaMgANn+KW740W42elNipZx4Jj7+c
         lnnd3ZPAXM9Gtip0jWuyX4b+axZCI7mxdfndOOwxdv1T5xoSfHWcTtQ2lE2vpcRA+BF1
         FQqJnDKAA6zf92MioH7t9fePsdWxqogqycnumhqh9qaJ+/+iSQu4NnT7inJ7gVXQfCCq
         bpBHhuIhWiyjbjLHWgEfCxveBa4QomSsZaoC7K4uxt6wDazdcqspxt9PbhK83YnXQVB2
         Cjbw==
X-Gm-Message-State: ACrzQf0vI0Kfnpj6XJ12h8JIWb+/Ryf6j7DgXKxW7S+SetGYIiozxD4h
	bXPwFHhtRgMcuVBtK2PmcKS9xBlcEP0R4IFh
X-Google-Smtp-Source: 
 AMsMyM4iQcTPTk+sO3pC46psfQNMTheHZzL0d2Lzhla+Kqgnk8aFdDSdQFR47czwWuTNG/N6QVKWQw==
X-Received: by 2002:a17:90b:4c91:b0:202:a345:b771 with SMTP id
 my17-20020a17090b4c9100b00202a345b771mr32505588pjb.128.1664133492868;
        Sun, 25 Sep 2022 12:18:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/33] vim: Upgrade 9.0.453 -> 9.0.541
Date: Sun, 25 Sep 2022 09:17:19 -1000
Message-Id: 
 <650ae29fc567e033205558fa85cc1c156d9f72a7.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171022

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2022-3234.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b54f37aa4db1457296b8981b630a49d251ceb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 70dc2dfecf..5ff60f8495 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0453"
-SRCREV = "83a19c5fda0556330860899bfb484addf9178cd0"
+PV .= ".0541"
+SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


