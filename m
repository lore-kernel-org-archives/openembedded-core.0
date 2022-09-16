Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041CAC6FA93
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.940.1663362506287748797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkPWjr5I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b5so37910889wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=2thC+dM1CKW2d5GXmlQI+GRwwXXaybwt7TRPf7t47TM=;
        b=PkPWjr5IpFP1YaUQfH55dAsf1AxqV98oLbDwu2cJ+KNiQbnJhCMSKz7rSnPZghhzAr
         Udy3QPbzAMtmVo1p9LEuXvWDHnUM9N38foluFyPxZJHFfQ28Jl3sNz8NX4F4dr6hGJaP
         0M7v782lFYjbS84VYdaoQr8OdmO1Sst8+XSvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2thC+dM1CKW2d5GXmlQI+GRwwXXaybwt7TRPf7t47TM=;
        b=TSjF8bXTzvVgMjrqjQFo+P1xNqMl/IAIBXReFT1nupXaRMauepkIXNOPZsptaUi6yu
         edZ3lHlo/a5IsQPIG3SdqGTSvIEPtT3r3Vt8hvzLGpSTB/kguv4PkMP8LRonz2uvuk9z
         83ljzETKZBIcgQLOLMIUZrjK0d+pfiUG1MDZTGbewAK8LIdeTQOFnaFl0MVVbO4C6zW2
         y5tYIjlSX/5fJ8u9PqlxG323bUCBwYZ4btvcAxcsZ+Ky20dKxKCv0qBsa8FOTmXqJxHg
         l7PSAckWpqPFZLJeEAAku/JWKVv6MbVK3KeiykrwXm23dpJN/g6q4L1ZpOUOK2q5W7Hn
         hmAQ==
X-Gm-Message-State: ACrzQf1R4CRq5nxlWlSCPn2FTRmWMownDIR7z3jjp/WwsKdM2QAdRSBq
	oUuZ3pKc1Qo2ZEmbrczXxEBWcCSmjPbu+Q==
X-Google-Smtp-Source: 
 AMsMyM6MnYNhztBsJkOG2nkC1YzlwuaRgA7ylaokz/caHXjNVTIIjxaXTwsKDP1LtLeb1o7KDVC0XA==
X-Received: by 2002:a05:6000:1b0e:b0:22a:e807:caf0 with SMTP id
 f14-20020a0560001b0e00b0022ae807caf0mr451951wrz.569.1663362504522;
        Fri, 16 Sep 2022 14:08:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/24] git: upgrade 2.37.2 -> 2.37.3
Date: Fri, 16 Sep 2022 22:08:00 +0100
Message-Id: <20220916210818.1228761-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170804

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/{git_2.37.2.bb => git_2.37.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.2.bb => git_2.37.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.2.bb b/meta/recipes-devtools/git/git_2.37.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.2.bb
rename to meta/recipes-devtools/git/git_2.37.3.bb
index b7858e2e467..2eed85e807f 100644
--- a/meta/recipes-devtools/git/git_2.37.2.bb
+++ b/meta/recipes-devtools/git/git_2.37.3.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "4c428908e3a2dca4174df6ef49acc995a4fdb1b45205a2c79794487a33bc06e5"
+SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
-- 
2.34.1


