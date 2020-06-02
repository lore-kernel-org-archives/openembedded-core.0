Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9198.1591100334754614900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Quuzzln3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q11so3200758wrp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UNBJgmWLFITY/Z7ERcXRLU5h4/KtNrHwQZwarWbddbA=;
        b=Quuzzln3hucPQb3Mb4SI7NyqJ0rYfK7xFneCYcVBrpXU+X1vN0JXq8BBpKy1z9EEoo
         3qbBsQZc16tC/kIhEgLuR4ytjUPBxzT/UdV0McXwsdCPrJ4oLHkyL28ApVA6ARunEIwM
         hiujLCAGGraly367BDlwIExS3qdXc7MRHra00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UNBJgmWLFITY/Z7ERcXRLU5h4/KtNrHwQZwarWbddbA=;
        b=tGBapgr+GdwUpUkmlGyFvxlU+vNP6lZAzsrdA9jI3f3MVcgBlE7S1KttetxHDJsSMk
         SKTLAmC+88kdroIKTBFdadcd4p6xalNSoPsGTceZuTuHAvbaMzC5l9Q7BP8MZrMgSf8v
         QlgjMydpWBGQSQRCBy/StAg9lqlqTiCyq8MDXz/Ec1Rr1dIFwwALhsQdeKgkkPHUZ4tA
         KbnuUpqTJNhx5sWxQO+bTNkFMUOHEzST4d5D9tuTctBtwdVjWfPpdwfS/9cxSRwM35tk
         kmX7R62aAxCCrwGvS4v+7hEI1ogWkznAbQn8hvrMp347Lz/itadSAMxQNGh9h0aULeHL
         x71A==
X-Gm-Message-State: AOAM533Nzsj2g/yN939ySR08ei6yIO37YIOy2olhYxOCAbjuHJ5p8Ys4
	zPlUxlljynjiF4uxUvyYjoIkgVwXW697Dw==
X-Google-Smtp-Source: ABdhPJw9SJw370HA5c/9Q0x4WJ4dllH1FkhJEPTMuhz6FPl2Z4OHIFpS2gKdUbOC90bBQ6GoZivV0Q==
X-Received: by 2002:a5d:4948:: with SMTP id r8mr25502721wrs.290.1591100332918;
        Tue, 02 Jun 2020 05:18:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l1sm4163788wrb.31.2020.06.02.05.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 05:18:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] logrotate: Drop obsolete setting/comment
Date: Tue,  2 Jun 2020 13:18:49 +0100
Message-Id: <20200602121849.4152981-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200602121849.4152981-1-richard.purdie@linuxfoundation.org>
References: <20200602121849.4152981-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment applies to an old version and the WORKDIR setting matches
the default so drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/logrotate/logrotate_3.16.0.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.16.0.bb b/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
index 2b6ee0a19a3..1c9df5a3cad 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
@@ -9,13 +9,6 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-# When updating logrotate to latest upstream, SRC_URI should point to
-# a proper release tarball from https://github.com/logrotate/logrotate/releases
-# and we have to take the snapshot for now because there is no such
-# tarball available for 3.9.1.
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
-- 
2.25.1

