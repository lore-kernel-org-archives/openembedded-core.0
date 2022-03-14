Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C380C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.3442.1647298148179541362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hN08d+Yr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id r65so10211976wma.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lBCdBRnBaf6R3H2ZnnQ/XGSAOKWjtoO5rtQdYhenUFg=;
        b=hN08d+YrSuHskWpeD2Ul6dvXG4SDSWo8q2Mo2Dhdvd6atjFq9jbAZpk6zutcApWe0k
         KxrsxpJURzjzMq0iI2zX59fzZ1r1ACeA49dNlPTeJ0r+RbObN4imqpKlB4ukNhpBhLn4
         yHSuNlkUooJwikCBgM7zhsazcNdLVCRQ8IbZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lBCdBRnBaf6R3H2ZnnQ/XGSAOKWjtoO5rtQdYhenUFg=;
        b=24If3bqEVBoMn/pI9tC/4KOGYK4F4Epk8JM0N7LK1VybLOTrtdoY1LPdYuJWpIwaMZ
         7dCiqQXLxIk6EwrtBaAeER2Gaaa/oGyw4vUm7jklaV/lNbZUgGZ3z9yAxxcLukloHiWN
         W2NnY9pN+RAwXk/1bmKc+SQePJEDEgW3HIi3uerYauLI1HlEg9cn12zVjO2Wx0L7y9l8
         ndPGa+SVOQJbTiLWoim8gY5u5ev82Sa/r2ZrQ5fahwRek6Pb43mtsrVLTlE2lUZzHOq9
         23Xcyn4/wIT27vhvFiccLZGQxsp9LI2dAGDrBzdSDqImvlJrHQ+3XwwFlpMoNBISQLP7
         PMeA==
X-Gm-Message-State: AOAM533nNvTmaRODl1eHkYF1owFleh4amBCf3vdSzwQSe7G5KAsOVkkG
	ums7dFSWXnxLW0vmLWXutlNhyJ+gnQAY7R2M
X-Google-Smtp-Source: 
 ABdhPJyotOx7n9Fg6ZfR64OtLPLJNay1hJLcXVqIKMG7l7lNsUEqubJHs0Fic9FL45Hz/7HrW+1rPA==
X-Received: by 2002:a05:600c:35ce:b0:389:ec57:1d7f with SMTP id
 r14-20020a05600c35ce00b00389ec571d7fmr949488wmq.149.1647298146439;
        Mon, 14 Mar 2022 15:49:06 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 27/33] ptest-packagelists.inc: add python3-cryptography
Date: Mon, 14 Mar 2022 22:48:31 +0000
Message-Id: <20220314224837.834776-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163193

From: Tim Orling <tim.orling@konsulko.com>

The python3-cryptography recipe has a lot of tests and uses a large
amount of memory. It is slow (> 30 seconds).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c503a6a5949..af8a57bec4f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -86,6 +86,7 @@ PTESTS_SLOW = "\
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
+    python3-cryptography-ptest \
     python3-ptest \
     strace-ptest \
     tcl-ptest \
-- 
2.32.0


