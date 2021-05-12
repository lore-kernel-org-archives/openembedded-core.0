Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.8363.1620831551345586107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0qlpOr6u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so14487702oth.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jWFYTSwBBtHsGInCgiP0ZVXK7qb3vh9blyEtScS4tBU=;
        b=0qlpOr6u/r33tbUZyNeHbMadCOfLpsYqxzH2MXzMWpYzwoVZTb/rIwRRq41XTaEuR6
         5Zd75GDwIeAc71Uq3gv/cAqt0B4kcd3fHiE2Zo0OrUkM3Rlha9++j/5bNrPxBtBTUrzV
         8GQobIF4x0b7dEACFDOghY+2TByaHT1HqFoUA6C54yJ5R/9wIDHNjCvm/bNsvRuhrLho
         Sy2sEjevlZwDPMF79lrqdi1m90LqOFbsYHk/6A6pVCh/P3ym8z+bwf8vEVw1W/wwllHt
         uf7taTgIpx8lrpOQK2y31NiIXCRx9LoZAug4ESemKQ9n5ZLO7rXBs+LNB7GbM4PI+BQi
         Qmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWFYTSwBBtHsGInCgiP0ZVXK7qb3vh9blyEtScS4tBU=;
        b=oVX3DOVMssaPPhX/eED1vmTih5VaxteIIQ/zW/uVm8vwdejKj6+QnPGwFT0n6VSaY4
         r46WR+NzLrR6P4QnWZEs+8texIrSX+MAQN8drSxttuWzzMhuBKprXZcYsCaBQaw6oGFw
         zjWglBfz1uKvuP9INnHeiXtVEj37S//Mt0B+86pgJawJ9+mP/iOG8/ezFq5rd4WK6QW+
         MscvoXziHRDXVpMXp08q7c+uX5gJjXAe971wXY5Qvay24MEtyJoX5cVPUW4/cmNUSS/8
         Kc7UVKSsirL4Tu2hUplhh6zFUpVz+3Stlp4gihWgc+xWTkpNgo0OoFpqRCTg65sZzgVO
         E66A==
X-Gm-Message-State: AOAM533PizWBUaz6erm8BpYy5PmMyNOt0ybFtoyfzonVgUOcIZTc/rNL
	psv5x+Gkl5A2f+iV+NCaHnH1WDdh2dfDrqLbCQY=
X-Google-Smtp-Source: ABdhPJyIEMwofKz87ORyqWO0Z/BWPFvXwLTmswwCy/aR/NeUhk5Zva4w77hqLfMYqvUuqldQU63Mbw==
X-Received: by 2002:a05:6830:1452:: with SMTP id w18mr31319255otp.227.1620831550285;
        Wed, 12 May 2021 07:59:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/22] db: update CVE_PRODUCT
Date: Wed, 12 May 2021 04:56:57 -1000
Message-Id: <63653f3eac7e0f9026dc726efb0cfaeaad38a153.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Update CVE_PRODUCT to also include 'berkeley_db'. For example,
CVE-2020-2981 uses 'berkeley_db'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 9cb57e6a53..b2ae98f05c 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
 
-CVE_PRODUCT = "oracle_berkeley_db"
+CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 CVE_VERSION = "11.2.${PV}"
 
 PR = "r1"
-- 
2.25.1

