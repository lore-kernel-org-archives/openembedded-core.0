Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A2C6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 21:20:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6469.1678224009833123364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 13:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Klg3fwxU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id k37so8713836wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 13:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678224008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCGk5EIKGHS7w8G29XujXVbFbHFMkYybaELgKGj+7xg=;
        b=Klg3fwxUoGLKAKrqsq4lEOJEYa6MVVxkoii1fEdGv/HNs525/q4bFnQPGuaKjmDDt1
         UIstP4cO8Ge4wrk/VJN00yGhbgCsb8JEdauiyjocgJMEv6Eo1KX/w5BJ7JJXmMe24aAK
         UDctg+5KOmmcmcDghkrTq9NDPLGXjrHlQ76vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678224008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCGk5EIKGHS7w8G29XujXVbFbHFMkYybaELgKGj+7xg=;
        b=e6gIPJq1kWER+oD4E/FLsKL8kI/AnUczOgVjX4BmTvHzsRujMEnQAj4rR8nHdGXb0R
         pKVj0OUdYPOZ39hdxtEQFQCD6vVQVv9f+xECiU8pW2QMaAJV5BEzflJV9VoHGHlNuorl
         avGpwWRBu8/U+i9mvVvL+YSDgrdZ4mjhdEQj0seXWf7lN/7iNr2E7HRoJa5lQ4oh9i0J
         vuP0cePNvZcgkk6tGVdhS0E99AUYum1ag/tvkDyKFGLtgLGLkv09/zzzmULv+leFENeX
         wzCqUlsbmvR8UYqPFa7oKAt7p+eu1Nx6brxDtJNfDT/dKucDnpxjh+bdNF6TTVH+eMwD
         XBjw==
X-Gm-Message-State: AO0yUKU0aH5eKxvKmIpeEc6F9AHhvlE/aLx1xUIkVj9X1h9uKZv0Sa85
	usQv2lz9VmXTEkRdPTj5SHjTJDurltIJ7LB5/n8=
X-Google-Smtp-Source: AK7set9ed4BGLtZmCUk+PvSqbrQIg+0yNBpZ+OOzTxoYuw1Ot/Z5/2XCm5d2tMyKtDn/pBGiB7sNcg==
X-Received: by 2002:a05:600c:468e:b0:3eb:2e66:9 with SMTP id p14-20020a05600c468e00b003eb2e660009mr14705476wmo.30.1678224007763;
        Tue, 07 Mar 2023 13:20:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c189500b003e71a6be279sm13657201wmp.37.2023.03.07.13.20.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:20:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdb: Mark patch as backport
Date: Tue,  7 Mar 2023 21:20:06 +0000
Message-Id: <20230307212006.2610543-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 21:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178121

I submitted the patch upstream and it was accepted/merged. Update the
status to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch b/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
index 9385aa99c66..f05ebf19d01 100644
--- a/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
+++ b/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
@@ -16,7 +16,7 @@ and probably needs to be put back upstream.
 The bug is rare to reproduce as it depends on the host libzstd was built
 against.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=5fc6b6d44cd63651c2902cbfc5b9734a55aaa617]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: gdb-13.1/gdb/acinclude.m4
-- 
2.38.1


