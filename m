Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EADC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:10 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.1722.1645114209423242032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9MfIMvy;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id p14so8379141ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0W+7T3YNJxmPo/EskHS/qvtY08uxh8bmz/SaJrIvEw=;
        b=p9MfIMvylj4C8Ej7u+w7bJbbfd4NT17M2vjyzw8rBjckWx+rOwtdfzIlD9sroRfl2w
         PUlRf82StpbUbsjyrSJ/BpaxoYE7771a4c2vJzGfqIwEuMdeFJgZmN2l/RagZOde2veV
         CfajecKm2z0kGmPLSa7szlr5fXQzvUFPl5neBp2J2ArQS+jcshdzW+IpfWO7nBQzJxYT
         feD3q8sLo84gQHyV8OaTVqXsuYANHc/R4AaYb1SuZ4SDw08+cRmTMjcOZwZANvwQqIoR
         kP2P7tvyiQwleXZ9JuKkiOYYun89Xo4bw/Xxnuzb42GVaosBUip0E9nAxGHQ8IH5D6uL
         qRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0W+7T3YNJxmPo/EskHS/qvtY08uxh8bmz/SaJrIvEw=;
        b=WOC3LY1/Q1mdjg3DBOY17POIuhyIPteus+ZdKw7lX63mxf5gbyJ/tiuGC7TcN09/0K
         y65PL9PPG2GskbvUvcMUKj7XYmHhXjlr6LwEMUgWF4fi9sWkw3+inogkKFqsF0xXsvou
         aM6vJB6ifjleGCqqr15aqM1YPPIKDSSA914UZ8IpTRYW6kr7ArpKROgj8B+IuKYUvMhU
         yGckyGtCfh4/BbyYsnJe3bfJvx65UgD8a9oeWP5J48uJSQVA2bWkYIxEj5UxJwY7KwBk
         HyXqRQKAHMB0EjJSChdDZ9UGjad4o2wa4k2jdCwTIbWjEjXqFT/N+5fUjMzD40PMqhze
         FStQ==
X-Gm-Message-State: AOAM531D4/krbqdr4Id4gYWwaOSlJnAciaKVsScdvktodXA0OgkyoObT
	s/7gZfOuctWulfKYaKouphpxFu3rvp0=
X-Google-Smtp-Source: 
 ABdhPJzOYRjgcCgrxdUuojOAFLWXYUI8U90rLQ3SnFRFx0BEFhuq98Ao2s3sQuFcjRWbG8NakGeqUg==
X-Received: by 2002:a17:906:f2cc:b0:6ce:7164:ac9a with SMTP id
 gz12-20020a170906f2cc00b006ce7164ac9amr2846301ejb.629.1645114208011;
        Thu, 17 Feb 2022 08:10:08 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/28] python3-pytest: upgrade 7.0.0 -> 7.0.1
Date: Thu, 17 Feb 2022 17:09:31 +0100
Message-Id: <20220217160939.1424397-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161837

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pytest_7.0.0.bb => python3-pytest_7.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.0.0.bb => python3-pytest_7.0.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.0.bb b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.0.0.bb
rename to meta/recipes-devtools/python/python3-pytest_7.0.1.bb
index a68b452a0a..2501406489 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "dad48ffda394e5ad9aa3b7d7ddf339ed502e5e365b1350e0af65f4a602344b11"
+SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
 
 DEPENDS = "python3-setuptools-scm-native"
 
-- 
2.20.1


