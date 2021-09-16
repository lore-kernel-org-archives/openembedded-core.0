Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.5005.1631832012938965303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 15:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=O/w/ucVt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id b64so11523792qkg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EUoKun3kZsRb/0l56vDZn8mqJ1gNrl70DrY0f4nWfKU=;
        b=O/w/ucVt4IpJN7Ng0fZxE/oXikZnuFZlGaMkJT5C0iN8TLVeGbRrDR0L3mEOzSGdMV
         uhN8ZMHwiU/LCSMpDAsjZ+wJ42eHHJl4vH2qUIWCWuVKFzzDred5d5kV26oqKc8TlXM1
         rToydUoLMihvshbDG0lW7sB08ROX4QltfCxwZO8aBBM9J9MEUCPD84Ydo/vjeuFrBccH
         eQdUcrqVhBxQM0nSdwyMyFybUM+1kcxFx3eFVXG+oD/INBO0BO07qOll+qu6DTGO7n/1
         xtpUOexdEP51AjCv1xh+t1Ew21im64BSBt/fSVWq4v7FY3ySDN2/P0fZhgaX4TCSNJU0
         w6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUoKun3kZsRb/0l56vDZn8mqJ1gNrl70DrY0f4nWfKU=;
        b=RJyKaTQqZDOGKUJt3MnReRDwGdHkOl4X20yaMP1JA7RUcAS1Lzt1E83PkRalimC9uf
         VCjBS/qGqCOXS+aOoVsPDzU5/8F6JgzV262BuKl8/cmMEaNYf+pV0vAMzO5U0w2MN25H
         H0PiTNNBthPrLnR2lb3zYAHgsiN1EaSBluI734K55sAboXSt+3JxnA8xkOl2tfnIn9dm
         8kLZ/PlwgPKUO6H6GhzxffCLaNmmkWTTs/KzNE97UIcZ0qBIeXtDHOz3HiNz2lsfEz6S
         7eS8zQrlTkNMZ5fzGIM5pK8F34OfsNEm0q4Ahjf9F9py7GWAxRlA3q7SYptX6oMiWsfQ
         c2gA==
X-Gm-Message-State: AOAM531ttMSfUb9k+NqrYqrdw3kqbEzP0Mz53qMz0/ce1FkLIvUHw5zz
	UBogh1oilWKguGtfEcWHoxXK1OKaG2nuow==
X-Google-Smtp-Source: ABdhPJzytEWydovGy62EjEE1qZHdujZ5pnqamr8MnxyMQmHTwf2YvbsLSt8gTgXy++RhYrjoPiZH2w==
X-Received: by 2002:a37:bc8:: with SMTP id 191mr7482960qkl.25.1631832012031;
        Thu, 16 Sep 2021 15:40:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:b85d:4277:577e:3e0a])
        by smtp.gmail.com with ESMTPSA id x3sm3308865qkx.62.2021.09.16.15.40.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:40:11 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] README: update mailing list address
Date: Thu, 16 Sep 2021 18:40:09 -0400
Message-Id: <20210916224010.21213-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916224010.21213-1-jdmason@kudzu.us>
References: <20210916224010.21213-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta-yocto-bsp/README.hardware.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.hardware.md
index 9803af006ae7..095815e1bca2 100644
--- a/meta-yocto-bsp/README.hardware.md
+++ b/meta-yocto-bsp/README.hardware.md
@@ -37,7 +37,7 @@ variable value corresponding to the board is given in brackets.
 Reference Board Maintenance
 ===========================
 
-Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@yoctoproject.org
+Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@lists.yoctoproject.org
 
 Maintainers: Kevin Hao <kexin.hao@windriver.com>
              Bruce Ashfield <bruce.ashfield@windriver.com>
-- 
2.20.1

