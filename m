Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4D4C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 19:03:31 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2101.1718391806264359273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 12:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMppdUiZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70432d3406bso2189665b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718391805; x=1718996605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzBIahUvUolVVE2gM5gBdVa4RPo/aa7eUPTrS4OmJ3w=;
        b=KMppdUiZbW3ucEUFRpQIg9EZq0fmWVeDNXzMZ6o69PbqpGzbYdj4c0dPjURdIK+84J
         7O0DrNw1Vux/U+1anXl3c6dk7EBnfjfqjL8ukgyss1v5xoCiP6UxY866vPY228KNXOTe
         qMiIRY7kzzwzj/yIee9xPTNHikCb/ZrPQugdVOO/eg3zU8WNzUYx27iUdjAhl4rqWb7v
         TXv4Eyjf82Kv4SUbo6FxgJqTir/Ea55R4Rwr+pLYfPlCjuAUu9Q1iBSeo3jjRyZ7ZPic
         YnHKYK8+z8eLogSZzzdboUiLZyP/8fprPzYdbRKL5xqsT2ZmwYfjNm588jmLI2rdzk4/
         9KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718391805; x=1718996605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzBIahUvUolVVE2gM5gBdVa4RPo/aa7eUPTrS4OmJ3w=;
        b=MroVYLu2YeoVbhF7R0BnW4gDqd+JVAeVIzBGdssmYKa8ctnzkQVi9wOReoeOGXCNMp
         N+nVzKnHvuwZHTkVaS6n28yrF/a6PKxMKjOBGNyH5uD+TYz3cGYMyJorwMsy1lEon7Yu
         C5M2p7hfpvoOolRHQrHU4zAEUHUxDdtDMdV6DBvczW/9QhR0U1cC3q7v+vYUqn4V8u+a
         Uy3cAaJcD0hO8yJo0iPqrqUO+b7Xw8FMZk5sPV4yo+APcm13zp9NcMn/12pZbaV2WrFQ
         wupaZq9Cf3yRCR2FWYJG2mtsLL4tqm7I7E0mJn8aydXYTa2ugiGXqr6QW7qKuMMbKCaa
         xn9w==
X-Gm-Message-State: AOJu0YzgSLXjfi8pmlbVrPf4+hiJ057wmMJaF8k0+FLi3w4zqqRCifwp
	eSExQakwKtJgC/T3tMmKUO2wGDKW7DKFMgLRVnkhI8icIgzP8DUJCovqFA==
X-Google-Smtp-Source: AGHT+IH+37PIrYlpembJRfmmEJ7mAIEeHfn2n+9vv8OEGsYJUA1299e3ekf8G/yaFpojNaUP1BEkOQ==
X-Received: by 2002:a05:6a00:1c88:b0:704:16ec:4654 with SMTP id d2e1a72fcca58-705d70ebf8amr3968931b3a.6.1718391805351;
        Fri, 14 Jun 2024 12:03:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91e133sm3376222b3a.24.2024.06.14.12.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 12:03:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gawk: Remove References to /usr/local/bin/gawk
Date: Fri, 14 Jun 2024 12:03:22 -0700
Message-ID: <20240614190322.726408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 19:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200658

Also replace the hashbangs using /bin/gawk to use
${bindir}/gawk

This fixes issues such as
https://github.com/riscv/meta-riscv/issues/384

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index e94cf19db48..ac9d8500d60 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -52,6 +52,8 @@ do_install_ptest() {
 		cp ${S}/test/$i* ${D}${PTEST_PATH}/test
 	done
 	sed -i \
+	    -e 's|#! /bin/gawk|#! ${bindir}/gawk|g' \
+	    -e 's|#! /usr/local/bin/gawk|#! ${bindir}/gawk|g' \
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 
 	sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests

