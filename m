Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.16076.1625264374455053528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 15:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TCGypXMG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id m1so15133143edq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JvEe25zBiItdN0mECpuX/X6sKU7DW5PKfFJzWVn7Mms=;
        b=TCGypXMGcCpy/U3Bz5D4tpksQtS4RokFerUyXlO/sGN/c2Yom24Ooe+fuVzwFtjBbm
         tS0N1yR7WEnGLm/celL6Zv3OZRDU2q0fO2MqO9AMG/o17mcvrtgPn+n1fbg8z2pTpulX
         jN4TJhHRJCXtSgLJ/cMS+qo+MwYIfib0INKxqCcoF4X2WnrD6RE6c4RxPSRzWIenK+Ne
         cMphkUsMFbctWNbSDfbFD7o0ynAV1VapJ2DrSrGDg6aixUGElbuTnwEIVOHC8dCsfFNY
         7PvSNpEM5L1ozDQM0NLIFLFj/TY4dVdLrhl48yCEhf/EkQsW6Dua5tfIpzqIla9IPkNm
         HKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JvEe25zBiItdN0mECpuX/X6sKU7DW5PKfFJzWVn7Mms=;
        b=EJnwlA2WcKjR5BgxT9TlZ/mAQUfkhaPQE4JuDk6nTGjjOqCrJeI/UKd5f+1A3Fq8p6
         t2UPDPAPFV25iZRIEB1tAV+V5DWTQZKRcrPr9IJiQNnHqlhdovEv4HQtJDTFpF5BFHVj
         iekcD+bGeCHs2NUPWjkhhmQgGyueZgRiFhRVm9lUvBtyfTT+jLwE6hT4NnbBnIex2keM
         ZqOX/l3p3z/ef0Lvo4QRWfOZ9tCzdvUUtYyVlkSGqAujensQFfWdG1SxQQSQ0kAKSVuw
         ClIAGSXOXzHIv/wn2BI8gqraNoOs4khm76X0UdAGSW/ojoAHUUrh3E1PHyaFBWMP+JQG
         hEJw==
X-Gm-Message-State: AOAM532FGoaZ6syPTbizVGw3jINXa2+ND3UlMlSjTeoOHxGLtCJetQHZ
	3Q9SYBEtZvqPLStyDuMYZTuADy7An2GkFA==
X-Google-Smtp-Source: ABdhPJy28kCVdxMtDHNTnL44AcJFu1kGX9Cmn24HUx1DD2Aw8FW+gmjzzKGV5DmQ91kl0GgKax6YSw==
X-Received: by 2002:aa7:c996:: with SMTP id c22mr2017735edt.374.1625264373112;
        Fri, 02 Jul 2021 15:19:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jx17sm1492414ejc.60.2021.07.02.15.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 15:19:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] iputils: correct upstream version check
Date: Sat,  3 Jul 2021 00:19:24 +0200
Message-Id: <20210702221924.2342084-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702221924.2342084-1-alex.kanavin@gmail.com>
References: <20210702221924.2342084-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/iputils/iputils_20210202.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20210202.bb b/meta/recipes-extended/iputils/iputils_20210202.bb
index 6200b2c1d7..02a303782e 100644
--- a/meta/recipes-extended/iputils/iputils_20210202.bb
+++ b/meta/recipes-extended/iputils/iputils_20210202.bb
@@ -17,7 +17,7 @@ SRCREV = "cc16da6b574ce6637f3e6e9ab3c1a728663006ff"
 
 S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 
 # Fixed in 2000-10-10, but the versioning of iputils
 # breaks the version order.
-- 
2.31.1

