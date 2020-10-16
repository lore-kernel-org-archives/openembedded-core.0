Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.12514.1602843974622474798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q+b+5fz6;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a3so2330274ejy.11
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDIVRORszsT5c3I4LKdZtkAUYXCN9Mv53yG+Nc6sQ2o=;
        b=Q+b+5fz6KY1uuBqDHABf+CxA4sAYW99Sid8jXQ9g7WLuIeq5JmGyyson9VaLDyBkyj
         2pShNMB69P+XniMh0641kTj7qXmOe0UhF3TQR52ppUcsYfw6j5Ox4sIVKhlsLuYjMFKD
         HNZuYL15/gUHiHCcGhD7F26+r92d0+ZGZMEECLrwIRxZMowYaO6cZGE2HW+xvjmS/E7F
         yHUWhUyvViRpqY4VCMFjaVxR0D27eFN9MHQ/GTETkwyPLBeG8Hc6RzorpuyBSGmSn16O
         hNWjrd1Pu7hGs+l05mOx0+a6Kdx0uEZ2duSuS0OVN0eR43NFxMQv18Kh8+IhsuyXTbh6
         HCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDIVRORszsT5c3I4LKdZtkAUYXCN9Mv53yG+Nc6sQ2o=;
        b=Q3n5hCXmpm2gCKH70ZBkVkZreh/2hPsIx/WmRp6fCtIWzlgYlEaRhCAcGwBIk+hquH
         ShRBg8xZ8p1ItjPdOt1G/8q4af8xDQFF8k3kny+R3DgxUlK85vHhBElMAZp92CL5wVBh
         P1cHp+MCEa4U3fbF4gBs2zoO9vtM8hjNNwqTvwoJIl91ZmdEINLr4gHUuXtXi0MzIh+w
         UND+5FHMaobpKQa93pfcCFR4GtLyOnzfEqXi/v9tUg73ihYrSIaMy7JOvtdc+OtWQTYT
         cUKA8S2pWAY4AEb0LNffRfuPl+vDWegxKkLOS6Pi4JKohaZRRiA41wrxb0UAgVNgeRfd
         Fa3A==
X-Gm-Message-State: AOAM530awIdu873q75GsGiMh1FNt2Nic44UYBH50K4vnpKP+CQ5Y2Xpy
	/R2alwa8I8nVJ6wbWzCxVJQ4akNllM0=
X-Google-Smtp-Source: ABdhPJxQjoNuaRkHZUBcHftvu7FaNBtOaoq68lwuWR2naA3eX3XzySVxHrkNExC7LThcRNR/s/3VAg==
X-Received: by 2002:a17:907:42a6:: with SMTP id nf6mr3025074ejb.69.1602843972880;
        Fri, 16 Oct 2020 03:26:12 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r24sm1068526eds.67.2020.10.16.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 03:26:12 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][RFC] tune-supersparc.inc: remove
Date: Fri, 16 Oct 2020 12:26:10 +0200
Message-Id: <20201016102610.914048-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it doesn't seem actively used

* last change in this file was:
  commit 3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Fri Jul 22 15:13:03 2011 +0100

    conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH

  but it was probably broken long before that

* it was never migrated to use DEFAULTTUNE mechanism, currently failing with:
  scripts/tune/log.fake-supersparc:    Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc) for DEFAULTTUNE (None) does not contain TUNE_PKGARCH (supersparc).Toolchain tunings invalid:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-supersparc.inc | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-supersparc.inc

diff --git a/meta/conf/machine/include/tune-supersparc.inc b/meta/conf/machine/include/tune-supersparc.inc
deleted file mode 100644
index 0faa361f18..0000000000
--- a/meta/conf/machine/include/tune-supersparc.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-TUNE_ARCH = "sparc"
-
-TUNE_CCARGS = "-mcpu=supersparc"
-TUNE_PKGARCH = "supersparc"
