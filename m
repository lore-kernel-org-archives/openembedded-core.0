Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277FEC4706F
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 17:01:33 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.84530.1703610087080707390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 09:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CNjwo+x2;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: skulkarni@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso1507845a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 09:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703610085; x=1704214885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnwrFE06E0RiqZudSJ+fvHE1NP+ny0cFVJPc8qh1CRg=;
        b=CNjwo+x2SWqqggYw7YtobyWxM0beoHblpeKSzy14t5Kdb4rTeksCwojE4yLV63Nxbj
         P+qPhP946+VnG2F4mgDDxqUKZmS72XJNgqZyzWSIAM/oB4bGFGheREZdE/CiaIIRedQb
         5a02404pG9WiI7OLQ7XRifquiksds3zCTl4Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703610085; x=1704214885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnwrFE06E0RiqZudSJ+fvHE1NP+ny0cFVJPc8qh1CRg=;
        b=Wt6rE74m8Gl19nwdv85chlL8eTjeKE4dPGX5GFxv0HOXqfENIdwDtT/GiT/kbKm+Hi
         duBlHDsSIkWjh5aqxLmxqFOqGpUBM1v0TsF38s81219mV+sHE1tyRFtp3CgXM1aBvd4f
         YmF4WbTsKSt/csS0TjxjvKV0wrvbeSosZauiN3nE3JL8Mq79+eSQafXRdrk0aLXvF2W8
         ZslPNdhMAuS13TClFLr9yKn+zL+w+jLq2/89eJO9og6vhgLz0+Wj1s01s8jWbSstXn20
         FaWbuLd+xAcVQ/bqrAP7VPMM10wWwOaNCCGU/bnXBH1bMMmoAOYC0lTkkXXpSfouC56B
         9Flw==
X-Gm-Message-State: AOJu0Yzd2dcaz2vYmGGI28uq8TUrXjiaCnA4L6/edlj8e+wKzGtZEJpM
	gCJmx/hrp4FaouWfu1Zb3JG1jZr4hxJAOK/P+DIGslWJ8Po=
X-Google-Smtp-Source: AGHT+IE18MnYHbHLuIXde5Z4LXfHsotE+ANWJ+ZxmBeqnuMJHYfK6gY3Psrkw0+iIbKmSJFsYLfeKg==
X-Received: by 2002:a05:6a20:100a:b0:195:a540:5d1f with SMTP id gs10-20020a056a20100a00b00195a5405d1fmr962849pzc.43.1703610085366;
        Tue, 26 Dec 2023 09:01:25 -0800 (PST)
Received: from MVIN00032.mvista.com ([103.134.108.34])
        by smtp.gmail.com with ESMTPSA id d9-20020a62f809000000b006d9aa51f0a3sm5738168pfh.171.2023.12.26.09.01.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 09:01:24 -0800 (PST)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][PATCH] tzdata: Upgrade to 2023d
Date: Tue, 26 Dec 2023 22:30:54 +0530
Message-ID: <20231226170054.15270-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 17:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192912

From: Shubham Kulkarni <skulkarni@mvista.com>

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 14a1ce18f3..2774e5e730 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023c"
+PV = "2023d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
-SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
+SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
+SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
-- 
2.42.0


