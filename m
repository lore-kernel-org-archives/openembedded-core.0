Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40A4C7112E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6326.1650022685728386263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fMF3cox3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b19so10339045wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AfQh51LGW+V1eglzTSeBfC/xBpxA/kecozkZMKEpy5U=;
        b=fMF3cox3O3sirXiANyjvbvbVFAEKM0dDzN8MRj8IS3ElI/3IJOgJfLv92bKQ2BHJP1
         xEl4H9jv1pIWT1+VkoWa+ODPYElU8nG3xVoqnGxqCtluAyPchnDl5tLliopmQlVsgzil
         WGa3CODlcst9QCR7RG0aZ2MJMxHqGiuGMElks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfQh51LGW+V1eglzTSeBfC/xBpxA/kecozkZMKEpy5U=;
        b=JN8wjzw48Dvdt6vQ+Y8YXHjV2I5UDddvvtCQwvqHP+2TSMovRZxuPtpzUJFETxcRhP
         +IgSMos+9If+fSxLKnBP4/Ciih9Qv1O7oqKqjqdv1K2JFBFDnrLm3zU9mFcPcuVt8Vrm
         f09TEVsmJI9ZrXPYeOllRewMmuwFksTl9SMTgx/k/z+unInHQdbUzTShSmJ0+tgi2bjO
         56aLeszuDAClOk8KgEr7VWL8NwJnn/fm6iabBUW4/J3QnAbWF2nxOUUcC8q6vvB/NU0L
         XYTujg2BHBFLDzHGuUVu/scCfMG4IDLRITLQbt8Oc8PfmV66h7rT8frLLWYewZAB/zUn
         6/qQ==
X-Gm-Message-State: AOAM530oBMQ/1Vj7+GTLYcQk+ZA9M2FDl8CyIF9+j43SJNnufCoxu7Lz
	A2WIsmDQCBbnUeEzI/pAiOUflVmJfKmsrA==
X-Google-Smtp-Source: 
 ABdhPJx7hUJDDRRR72xU7GyQnm9gFImO393dLpN3mOilaMNBxUFfXWoJjXLwdNW4hr+tWISoQSVWRg==
X-Received: by 2002:a5d:5982:0:b0:20a:7dbe:f3af with SMTP id
 n2-20020a5d5982000000b0020a7dbef3afmr1951860wri.216.1650022684014;
        Fri, 15 Apr 2022 04:38:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a0560001acd00b002078e242847sm3776574wry.97.2022.04.15.04.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:38:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] git: Upgrade 2.35.1 -> 2.35.2
Date: Fri, 15 Apr 2022 12:37:58 +0100
Message-Id: <20220415113758.2290861-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
References: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164426

This includes a fix for CVE-2022-24765

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/{git_2.35.1.bb => git_2.35.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.1.bb => git_2.35.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtools/git/git_2.35.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.1.bb
rename to meta/recipes-devtools/git/git_2.35.2.bb
index e39142128b3..98125492217 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.2.bb
@@ -156,4 +156,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "9845a37dd01f9faaa7d8aa2078399d3aea91b43819a5efea6e2877b0af09bd43"
+SRC_URI[tarball.sha256sum] = "0decc02a47e792f522df3183c38a61ad8fbb38927502ca6781467a6599a888cb"
-- 
2.32.0


