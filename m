Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4C2C433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14673.1639070740692784329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IpaHIiZC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso7109453wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0lPGm2JQTxVGUPnkN4GzM1PkVuwhcWRmaBqx1mRDmFg=;
        b=IpaHIiZC/kVAa2hy9+8XNYbxUovYv1jgrZVXuTpmY0hRjyj8H77HZkrthQM/1ziTXH
         F3ajD0RDYKSB2wz65XnYhwZd76D1Qeu40kmXzLfr9YULBox//dpfl9uOB9fj2se77XhQ
         8y5eIKl5D1h3+Ws+PHQXcqwJqAyHLulRJYBrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0lPGm2JQTxVGUPnkN4GzM1PkVuwhcWRmaBqx1mRDmFg=;
        b=1LqORcwlxKrEqP1/d36d1LiWS9PWVdmrABpYLqeofea/tWtofYOQLGtoT62NxDLIJY
         VQ5t6zcozP8sW9J42+Uo+J9MCyftRyr8tnYQWrjyRoKMzTlwQ+hgHp/QaIGfJ/1mm0cf
         OizZKUOQYYH407kqKhyrerob4FQ3s65b5g1L9h3IGAP3aM4qUt+N045N2WmQF8VVJ7y+
         X6SJs9OzPVcAJU+3a6g+E2SYUbyHQywmK9wu17X3fIYDZGHgomKdwtno7qLRfNZPgCNp
         UXOhs0HP4eq1M3TdJnP1lbo5PJugK/ughyd0K8oln1/2ENZvmnmSI60yXWpw13wfz/jE
         PfWw==
X-Gm-Message-State: AOAM533mqW/PUTpRcWAy+M8QjsJympLOBjQkgi7t5NnMIvc/iI9ePb2L
	rm+a2aCENhG+a2yzCKLKiK+J3XUMyqljaA==
X-Google-Smtp-Source: 
 ABdhPJw6i+4xthSSDL8dEe52/amV25irVc2PYsqGx10FDI8Zebrv5ykWFx6v7cNflQnuqg9hXVx3JA==
X-Received: by 2002:a1c:800e:: with SMTP id b14mr9048293wmd.155.1639070738704;
        Thu, 09 Dec 2021 09:25:38 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id i7sm304146wro.58.2021.12.09.09.25.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] binutils: Add more detail to the ppc patch
Date: Thu,  9 Dec 2021 17:25:35 +0000
Message-Id: <20211209172537.641755-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:25:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159463

This adds useful detail from the orginal commit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 389232c1e3e..a271f55ea1a 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -3,6 +3,10 @@ From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
 
+The wait mnemonic for ppc targets is incorrectly assembled into 0x7c00003c due
+to duplicated address definition with waitasec instruction. The issue causes
+kernel boot calltrace for ppc targets when wait instruction is executed.
+
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
 Upstream-Status: Pending
-- 
2.32.0


