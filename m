Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.14629.1604068609591766537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 07:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8fEGjJx;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id k9so6910217edo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gl+Gfce7pcET38c8uHhhrjHSbZKocwovD7/+a3RinQk=;
        b=q8fEGjJxfUnDm7s8Zla1okFfNA8Gpalmgl8iarINFaCtO4Zi+BuljgYUK8W+Ukpjww
         09PQindnW6KYv2Q6cbU8AQ7qBWaX7CWCJG0PdYLF2AjvLkbtXzySxpynisz+lnCRfvDu
         SGYOrofmvaKsgV70n6DnkQny6ejxRmXJYMSFrZtEJXY9pj6T4KoefQAGLnGtYp+xGJD+
         fkH/q9H195dXDvIrgTZCCY4UvPzg6l3ISV4WJpdaratMC2kw9EU9DNfSfwyO8IUKFRBm
         8nhZb4BX1MPqQLL+VVIyOGAr6cNxoNX/E5DKLIXfJ+gTsONBuCc8NrTS8y55pBHphzss
         MJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gl+Gfce7pcET38c8uHhhrjHSbZKocwovD7/+a3RinQk=;
        b=WD9DgY8aEquEcGnbH4NS8jgKrJrlHL2ipTXDqMTcJ0iye3qaOTVaQUxpsHxxuZ38zt
         8oS1bTq5V99LtfjiUUABGtgF1PhiQNBdtnJcsxciRflo3BVNZPbZP/isfOywemqcr9C6
         MHQvw9emyRSd+MrAMc/5lDD3SMVANkeO95LsKcNpHXWNIdFbpm2MK5kau6txLBHYOniS
         SpdHxaM+pJl9hktrkBbe1LcD8fZIjt9Iq2zftl3hjREfTiyXxG6a4Pno5ntP+xx9bu8p
         Px4iWwWw6Rp2DY31DpLtSmVVLG0LA0t4GL4jprm9MLFcZuATd76KUtMHnXnh32iBcvrk
         lTRA==
X-Gm-Message-State: AOAM532B6/TUUJq38bSy/9oeUn0Fxcj/l/hH5rvbCyvb4v6HoDWbrk9f
	KtAYaKsLTyrQrCsORpkfDvqWCDe2BvU=
X-Google-Smtp-Source: ABdhPJx2sHeyj1r47whT4VT9eTjQ2LI8MT26yHK4rH9e7SOdEYQQJNk4DhWW2/tCzETE4LSHrPOmMA==
X-Received: by 2002:a05:6402:6ca:: with SMTP id n10mr2735856edy.314.1604068607849;
        Fri, 30 Oct 2020 07:36:47 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dp1sm3025420ejc.74.2020.10.30.07.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 07:36:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] tune-arm9tdmi.inc: include arm9tdmi in PACKAGE_ARCHS
Date: Fri, 30 Oct 2020 15:36:44 +0100
Message-Id: <20201030143644.64539-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* when ARM_INSTRUCTION_SET isn't set to thumb, the tune-arm9tdmi.inc isn't
  usable and fails with:
  ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t arm9tdmit fake_arm9tdmi) for DEFAULTTUNE (arm9tdmi) does not contain TUNE_PKGARCH (arm9tdmi).

  Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-arm9tdmi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 6160664fd0..8a46f8e5df 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -10,4 +10,4 @@ AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
 # mcpu is used so don't use armv4t as we don't want march
 TUNE_FEATURES_tune-arm9tdmi = "arm thumb arm9tdmi"
-PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm9tdmit"
+PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm9tdmi arm9tdmit"
-- 
2.27.0

