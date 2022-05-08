Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC4EC433FE
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:34:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.20181.1652013262237394900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NOihwNmi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id x18so16007128wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xsyZ4SXaJU4hPAgglvithmT9gTpp6eqWvPqiubcR0zg=;
        b=NOihwNmijkKmG4tvVtLImqRVWGa1eJ3n9xGIeBcmVj5aVDmcIaJXvT72whr/oWS7NB
         mMWQsGOfmIL19umRSylDe6Zgh3S3jr28gFiQV0RDIwBlUc5t7Y31jpvGXD0HGubi2NbO
         YDGxmpIqoXCUjgHLrC3HlKhyEeZw+8l7pIR3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xsyZ4SXaJU4hPAgglvithmT9gTpp6eqWvPqiubcR0zg=;
        b=pxtUsOs4TJt+NSwIDpn6064aPQ7HBGko6i93P0i2DC/Mj2IdZ03Fi0uVK3YxTmSGPy
         qlYnOBxENtAjFW+6YV22PfFiqhJ3j+QMpUShJcdiKJLvk4DdbXsbf4F4q4FSKoxb8DPR
         R0JAsBEzAZc9vSaJ1saIaQwoUgf0hD6Bpn+Gau+qQA5OG920Qi/Hs86wDfDRqrSIfsBp
         QIj8Ik1EtYxa4aXwpiV8eD/EAQjXoR5O7KDr2I1CgY5dAul69FFNkE/d9J7w3QjZjS1W
         55l+ZrJoCRjMuFyI/zwNE4a80RV/sC65pWYw1qSBTt4pCqt4ivM53U2IOKTH7C1YihvQ
         1nUA==
X-Gm-Message-State: AOAM531V3Y1ypkkhluAxM2yvmdNFEdQ7tr56Cjo6JOAusz65oQ5Xf9Q0
	aIAITGdzUohOwK1v0E1/yHPp4DMvOsxv3yAR
X-Google-Smtp-Source: 
 ABdhPJwujmzWjrE8hN/lYd7HhCXtiz4ZI8wW4pnATUVghpeswh58x5bSev1AB7vIPfV40xO2/ulvfw==
X-Received: by 2002:a05:6000:1809:b0:20a:cafc:fd39 with SMTP id
 m9-20020a056000180900b0020acafcfd39mr9839255wrh.255.1652013260132;
        Sun, 08 May 2022 05:34:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b0020ac8c19ecfsm8039818wrb.3.2022.05.08.05.34.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:34:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] vim: Upgrade 8.2.4681 -> 8.2.4912
Date: Sun,  8 May 2022 13:34:17 +0100
Message-Id: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165370

Includes fixes for CVE-2022-1381, CVE-2022-1420.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 21ff036cf4cf..c5922b7fcd71 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4681"
-SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
+PV .= ".4912"
+SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


