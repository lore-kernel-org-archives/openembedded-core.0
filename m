Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A461C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.19483.1676150640596151609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EnIqRkQF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id r3so281030pfh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66Epp1WT//CDylnV1yd1XfOX/Z1jYHp03l1Hrh79QlE=;
        b=EnIqRkQFwVASR+BjBPYYWrcAXUcSAwhVjDCQU5xK7Wy2ajUQ7ohzOJi3hYH+0oZjlz
         HV/0udUwm9hJSE7EmEITFDnvpNBGnhqv1JfgFNh4FLhNxpGdmNJdViCx4sPPvl8LmlxH
         HXBJnGx5FN/CWnstXVdKfcLeRD220KQGhogd5fYDkC04iHhcI7gf+hPoL2XxzMTDeIh1
         gihmXh3rDiNSUcPpYuGYckRR/TAE1i+brH4EBAxu5NYkx6BS9/mwo+FXHirOcfkAcwc9
         xdViWdigd6+7BN5skCOUsTeSrshTAN3tOcfdmTgYTaxSRx86D2m4DBOjt7MWkam3O6km
         wG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66Epp1WT//CDylnV1yd1XfOX/Z1jYHp03l1Hrh79QlE=;
        b=f/xNQZ+TgWIDIpWz7K2eEENzbH1iULgJMNkYwnt8bZ8br7zlknrfqCBtVlpBF6xUDC
         QovkZ7UoCuhrB0z8oYeamXzwiz+38heiK25A2CS5QdYe9UiwUmPM7gTbsfTeSXYI1cuk
         rQWwF9q8yh/t/rJLq277b7a1R2MLfsgD7rOqKo7pGJgJqtGQEw3fEIik3RXZDlfi8Ec5
         5S7dw85A0149ZuOEPmMSXFzSsEBCVN1HYmV1QTAiyj601vGGkFr4OZlE+Wva0Ogi2MQr
         wTxrNOhL4wf2kxGvEDlVgLjVR6AfCx+a/wtmcbSGtVPyY8kMBtXWMtgoXaTkd7JKtvWI
         s8pQ==
X-Gm-Message-State: AO0yUKXrrmXN3l31w+bZsEXi9m/xz4ys5ATG3IF2qVuek8vgNVwWAt8s
	R9TIh/jm+TbG7ofoB9STSHUoa28nhpTDd1w9fq8=
X-Google-Smtp-Source: AK7set8WuoJB9JBwxGw9rwDgF+0pguq+kWLXa3kLPVkQ/WtM33xF7wJO4zqhfKw0hhu01VyDRnWAhw==
X-Received: by 2002:aa7:95b7:0:b0:593:adeb:39c0 with SMTP id a23-20020aa795b7000000b00593adeb39c0mr18152767pfk.30.1676150639493;
        Sat, 11 Feb 2023 13:23:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.23.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:23:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/28] git: ignore CVE-2022-41953
Date: Sat, 11 Feb 2023 11:23:24 -1000
Message-Id: <e06bed59b2ad4f6ac152c50b445092a208c43ee5.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177011

From: Ross Burton <ross.burton@arm.com>

This is specific to Git-for-Windows.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8849af809e0213d43e18e5d01067eeeb61b330d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.37.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.37.4.bb b/meta/recipes-devtools/git/git_2.37.4.bb
index 2205a50d16..8342b38313 100644
--- a/meta/recipes-devtools/git/git_2.37.4.bb
+++ b/meta/recipes-devtools/git/git_2.37.4.bb
@@ -31,6 +31,8 @@ CVE_PRODUCT = "git-scm:git"
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_IGNORE += "CVE-2022-24975"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE += "CVE-2022-41953"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


