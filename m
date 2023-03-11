Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94C5C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.55880.1678574518845948704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XM6orsQy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id k37so5647961wms.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2369VZMDrvBnBL6t9IGaDf+P9eG6i34JBpMP1RcGehw=;
        b=XM6orsQy3FcQ4O+gETb9wSxvuay4oEN3+ZB/zmNdKpi4meY3wEP5RST1O3mB+j2nuz
         QXVWYTKgw9Ok5cCkgtso/5BWWzFWWCGiSwmzEmMSbzZaQ2iQg1HwzPMpSFCYjzn926o/
         dEMmpIT6E6qOYiZoZJbykFxm6jilAx/VKfpxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2369VZMDrvBnBL6t9IGaDf+P9eG6i34JBpMP1RcGehw=;
        b=IGxmiGqxNmKAEbjjxC03UFxiraU3T70jpRlI6cYWBNzLFZqC2ylvC964jnbSOpTYxM
         zNcnhRrZrxoZYu69BySpQ/1gNGQkJH/AXCusIjD3SoGs/exNyG2ZGUs2zXgQzGauTo5t
         KEE7kFf5RNwOBG1r2XjiMNUtNOThqEdPE4TCtW4VJ6k5wpxZm9c+csr0QonEIqnim4JZ
         uPcaZ6B1iZv/f2BSkGt26pFgC/pFg+qqaFqZWUOvV6e2U6PHAZFIbRr2RDq/HegaBu7X
         0xPQon5qpI78AfKlPs1wFYu2lukgxf1xB7XP1MgXPFB6oxjnublg3cXgtM/3VK6ICpIs
         325w==
X-Gm-Message-State: AO0yUKU4hwmghF7jyZJKeG26HFVBJmUMiJKxXdWWuqAOSySGXqbF9LL2
	8C3QVcF6+4+SNea8pLqCOXWsdkuj/yL0BpdLFgg=
X-Google-Smtp-Source: AK7set9P0fP+a7ZqxxNppUCBG1IszjQENoYR9WSQeoOjft34B+hrY0uAg9CGf0n52E744RXS1Udq0Q==
X-Received: by 2002:a05:600c:1d84:b0:3eb:2de8:b72a with SMTP id p4-20020a05600c1d8400b003eb2de8b72amr6674407wms.7.1678574517148;
        Sat, 11 Mar 2023 14:41:57 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] glibc-tests: Add missing bash ptest dependency
Date: Sat, 11 Mar 2023 22:41:49 +0000
Message-Id: <20230311224155.3442306-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178368

The script has a bashism and needs bash to execute correctly. Mark it
as such and add the missing bash dependency so it executes in minimal
images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-tests_2.37.bb | 2 +-
 meta/recipes-core/glibc/glibc/run-ptest     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.37.bb b/meta/recipes-core/glibc/glibc-tests_2.37.bb
index bb6ef061623..9352a058fbe 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.37.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.37.bb
@@ -27,7 +27,7 @@ python __anonymous() {
 # Remove any leftovers from original glibc recipe
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = " glibc sed"
+RDEPENDS:${PN} = " glibc sed bash"
 RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
index f637986105e..c394b498660 100755
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ b/meta/recipes-core/glibc/glibc/run-ptest
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # ptest script for glibc - to run time related tests to
 # facilitate Y2038 validation
 # Run with 'ptest-runner glibc-tests'
-- 
2.38.1


