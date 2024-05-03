Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C701C25B10
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.3825.1714704053797780366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBbbJNjR;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7f3c389c04aso496161241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704053; x=1715308853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ6tGDejCaDtBNnaKI9ozV6VxwdydfvbKoivflZg6C4=;
        b=WBbbJNjRsGfBMVQLk8A9bOAR00xJ7HRLCzYRYSsaCMUrxlRZLcBv/+qQK+y85HdfiG
         eb8VI3iDaFV+5Ual4bcU7WWT25Bd3tDpqwKS9KwUVhYyHUvG8F+6HtekkHYAJZGCGCIT
         RRbZVi5GnQIToemyKmgJ55Q6A4rOg+9lvzUVxekra/xRiUUMuy+knXfPPkdFjPvD54wX
         E81w4r/SWv+cX4xKdB12Tchq9i6RmSye/LpdKl4NstoWDRYDAmqSiv0wcFSdNYU4RJnv
         pO110Zg5xSPz/RKDl4mzSIFzDTp4nyti58OLc2lVcVmEMo/C+gOKZbTBTlEBJdUvZjq8
         Sauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704053; x=1715308853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ6tGDejCaDtBNnaKI9ozV6VxwdydfvbKoivflZg6C4=;
        b=pmEmSbL8bP7W1XAUaykPnM+fwYsvUVQJgg6Xev3gT672UR1tSdvy7RDmEdppdK8n9a
         lNqcQ1oqWYstgdtPC9mRKqPS2cPvgA2gD5+2UlhewXlOs3B61vU8AOQmcN9zqc+EWT1t
         JACVGlSGOA5wtK2wZA5Z7mS7VzbJltNOIK9aALaFAuXmDgel89huKzKAbXkOJZGLAej/
         osaPI0EqgVLyNPZsaGi8ASOdBjX9yGAFaBJ68A75Xz6cLu95s66cRC9x6dmGL9rVWcKZ
         qkvdlLA9R1lyM/bvf9NhJ2v0xTRGPr+rWSkk1OpYIAK56VUwB+L+t8FIgwBYAS6Ffjhn
         0jgA==
X-Gm-Message-State: AOJu0YzufuHebI3whkwqzMe7KyGnO3Fxgx8vnb5ucVH8HI1ibi3G1+LG
	GrOzQE8VjJOGlbaIP+a6O+V6DoInIbj4ADwNbFV/pRWD+MWQf/SvZHFADQ==
X-Google-Smtp-Source: AGHT+IHhe7aVlmdCoO/Oz5/toZKQcbFx8WwOvKxiv2BDmkd10XnDyQ9dJUa+OqJlvCzmpu1KN9XhMA==
X-Received: by 2002:a05:6102:1801:b0:47e:ee4d:8431 with SMTP id jg1-20020a056102180100b0047eee4d8431mr1585888vsb.3.1714704051831;
        Thu, 02 May 2024 19:40:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] linux-yocto/6.6: update CVE exclusions (6.6.27)
Date: Thu,  2 May 2024 22:40:35 -0400
Message-Id: <bc5d362b9ba3b9ee5c28fa97b40e7975871e7e00.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198939

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.6.inc               | 2720 ++++++++++++-----
 1 file changed, 1998 insertions(+), 722 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 4a7086a84b..9e5be066a5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-09 14:35:54.393486+00:00 for version 6.6.25
+# Generated at 2024-04-15 16:05:11.813475+00:00 for version 6.6.27
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.25"
+    this_version = "6.6.27"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -2980,6 +2980,10 @@ CVE_STATUS[CVE-2019-25044] = "fixed-version: Fixed from version 5.2rc4"
 
 CVE_STATUS[CVE-2019-25045] = "fixed-version: Fixed from version 5.1"
 
+CVE_STATUS[CVE-2019-25160] = "fixed-version: Fixed from version 5.0"
+
+CVE_STATUS[CVE-2019-25162] = "fixed-version: Fixed from version 6.0rc1"
+
 CVE_STATUS[CVE-2019-3016] = "fixed-version: Fixed from version 5.6rc1"
 
 CVE_STATUS[CVE-2019-3459] = "fixed-version: Fixed from version 5.1rc1"
@@ -3452,6 +3456,32 @@ CVE_STATUS[CVE-2020-36694] = "fixed-version: Fixed from version 5.10"
 
 CVE_STATUS[CVE-2020-36766] = "fixed-version: Fixed from version 5.9rc1"
 
+CVE_STATUS[CVE-2020-36775] = "fixed-version: Fixed from version 5.7rc1"
+
+CVE_STATUS[CVE-2020-36776] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36777] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36778] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36779] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36780] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36781] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36782] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36783] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36784] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36785] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36786] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2020-36787] = "fixed-version: Fixed from version 5.13rc1"
+
 CVE_STATUS[CVE-2020-3702] = "fixed-version: Fixed from version 5.12rc1"
 
 CVE_STATUS[CVE-2020-4788] = "fixed-version: Fixed from version 5.10rc5"
@@ -3940,1445 +3970,2691 @@ CVE_STATUS[CVE-2021-45868] = "fixed-version: Fixed from version 5.16rc1"
 
 CVE_STATUS[CVE-2021-46283] = "fixed-version: Fixed from version 5.13rc7"
 
-CVE_STATUS[CVE-2022-0001] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46904] = "fixed-version: Fixed from version 5.12rc7"
 
-CVE_STATUS[CVE-2022-0002] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46905] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-0168] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46906] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-0171] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2021-46908] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0185] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-46909] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0264] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2021-46910] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0286] = "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2021-46911] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0322] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2021-46912] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0330] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-46913] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0382] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2021-46914] = "fixed-version: Fixed from version 5.12rc8"
 
-# CVE-2022-0400 has no known resolution
+CVE_STATUS[CVE-2021-46915] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0433] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-46916] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0435] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-46917] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0480] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2021-46918] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0487] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-46919] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0492] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2021-46920] = "fixed-version: Fixed from version 5.12rc8"
 
-CVE_STATUS[CVE-2022-0494] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2021-46921] = "fixed-version: Fixed from version 5.12"
 
-CVE_STATUS[CVE-2022-0500] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.12"
 
-CVE_STATUS[CVE-2022-0516] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-46923] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0617] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-46924] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0644] = "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2021-46925] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0646] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2021-46926] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-0742] = "fixed-version: Fixed from version 5.17rc7"
+CVE_STATUS[CVE-2021-46927] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0812] = "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2021-46928] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-0847] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-46929] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0850] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2021-46930] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0854] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46931] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0995] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46932] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-0998] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-46933] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-1011] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46934] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-1012] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-46935] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-1015] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46936] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-1016] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46937] = "fixed-version: Fixed from version 5.16rc8"
 
-CVE_STATUS[CVE-2022-1043] = "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2021-46938] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1048] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46939] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1055] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2021-46940] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-1116 has no known resolution
+CVE_STATUS[CVE-2021-46941] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1158] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46942] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1184] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46943] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1195] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2021-46944] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1198] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-46945] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1199] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-46947] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1204] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46948] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1205] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46949] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-1247 has no known resolution
+CVE_STATUS[CVE-2021-46950] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1263] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2021-46951] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1280] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2021-46952] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1353] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-46953] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1419] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2021-46954] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1462] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2021-46955] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1508] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2021-46956] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1516] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46957] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1651] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46958] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1652] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-46959] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1671] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46960] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1678] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2021-46961] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1679] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-46962] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1729] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2021-46963] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1734] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-46964] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1786] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2021-46965] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1789] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2021-46966] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1836] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2021-46967] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1852] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46968] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1882] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2021-46969] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1943] = "fixed-version: Fixed from version 5.18rc7"
+CVE_STATUS[CVE-2021-46970] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1966] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46971] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1972] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46972] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1973] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46973] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1974] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-46974] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-1975] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-46976] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-1976] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46977] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-1998] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2021-46978] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20008] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2021-46979] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20132] = "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2021-46980] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20141] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2021-46981] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20148] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2021-46982] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20153] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2021-46983] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20154] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2021-46984] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20158] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-46985] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20166] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2021-46986] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20368] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-46987] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20369] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-46988] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20409] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2021-46989] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20421] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2021-46990] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-20422] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-46991] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20423] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-46992] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20424] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2021-46993] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20565] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2021-46994] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20566] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2021-46995] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20567] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2021-46996] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20568] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2021-46997] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-20572] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46998] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2078] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-46999] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21123] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2021-47000] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21125] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2021-47001] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21166] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2021-47002] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21385] = "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2021-47003] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21499] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47004] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-21505] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2021-47005] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2153] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47006] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2196] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47007] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-2209 has no known resolution
+CVE_STATUS[CVE-2021-47008] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-22942] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-47009] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-23036] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47010] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23037] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47011] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23038] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47012] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23039] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47013] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23040] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47014] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23041] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47015] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23042] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47016] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2308] = "fixed-version: Fixed from version 6.0"
+CVE_STATUS[CVE-2021-47017] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2318] = "fixed-version: Fixed from version 5.19rc5"
+CVE_STATUS[CVE-2021-47018] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23222] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-47019] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2327] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2021-47020] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2380] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47021] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23816] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2021-47022] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-23825 has no known resolution
+CVE_STATUS[CVE-2021-47023] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-23960] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47024] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-24122] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-47025] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-24448] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-47026] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-24958] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-47027] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-24959] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-47028] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2503] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47029] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-25258] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-47030] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-25265 has no known resolution
+CVE_STATUS[CVE-2021-47031] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-25375] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-47032] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-25636] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-47033] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2585] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47034] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2586] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47035] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2588] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47036] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2590] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2021-47037] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2602] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47038] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-26365] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47039] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-26373] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47040] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2639] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2021-47041] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-26490] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-47042] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2663] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2021-47043] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-26878 has no known resolution
+CVE_STATUS[CVE-2021-47044] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-26966] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-47045] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-27223] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-47046] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-27666] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2021-47047] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-27672] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2021-47048] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2785] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47049] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-27950] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2021-47050] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28356] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47051] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28388] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47052] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28389] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47053] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28390] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47054] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2873] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47055] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28796] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47056] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-28893] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2021-47057] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2905] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2021-47058] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-29156] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2021-47059] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2938] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2021-47060] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-29581] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2021-47061] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-29582] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2021-47062] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2959] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47063] = "fixed-version: Fixed from version 5.13rc1"
 
-# CVE-2022-2961 has no known resolution
+CVE_STATUS[CVE-2021-47064] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2964] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2021-47065] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2977] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47066] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-2978] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47067] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-29900] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2021-47068] = "fixed-version: Fixed from version 5.13rc1"
 
-CVE_STATUS[CVE-2022-29901] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2021-47069] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-2991] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2021-47070] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-29968] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2021-47071] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3028] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2021-47072] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-30594] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47073] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3061] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2021-47074] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3077] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47075] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3078] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47076] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3103] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2021-47077] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3104] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47078] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3105] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2021-47079] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3106] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2021-47080] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3107] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-47081] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3108] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-47082] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3110] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47083] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3111] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47086] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3112] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47087] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3113] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47088] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3114] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47089] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3115] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47090] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3169] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47091] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3170] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2021-47092] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3176] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2021-47093] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3202] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47094] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-32250] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47095] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-32296] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2021-47096] = "fixed-version: Fixed from version 5.16rc7"
 
-# CVE-2022-3238 has no known resolution
+CVE_STATUS[CVE-2021-47097] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3239] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2021-47098] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-32981] = "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2021-47099] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3303] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2021-47100] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3344] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2021-47101] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33740] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47102] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33741] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47103] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33742] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47104] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33743] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47105] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33744] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47106] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-33981] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2021-47107] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3424] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47108] = "fixed-version: Fixed from version 5.16rc7"
 
-CVE_STATUS[CVE-2022-3435] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47109] = "fixed-version: Fixed from version 5.13rc7"
 
-CVE_STATUS[CVE-2022-34494] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47110] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-34495] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47111] = "fixed-version: Fixed from version 5.13rc6"
 
-CVE_STATUS[CVE-2022-34918] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47112] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-3521] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47113] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3522] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47114] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3523] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47116] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3524] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47117] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3526] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2021-47118] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3531] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47119] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3532] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47120] = "fixed-version: Fixed from version 5.13rc5"
 
-# CVE-2022-3533 has no known resolution
+CVE_STATUS[CVE-2021-47121] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3534] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47122] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3535] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47123] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-3541] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47124] = "fixed-version: Fixed from version 5.13rc2"
 
-CVE_STATUS[CVE-2022-3542] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47125] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3543] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47126] = "fixed-version: Fixed from version 5.13rc5"
 
-# CVE-2022-3544 has no known resolution
+CVE_STATUS[CVE-2021-47127] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3545] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47128] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3564] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2021-47129] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3565] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47130] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3566] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47131] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3567] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47132] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3577] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47133] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3586] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2021-47134] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3594] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47135] = "fixed-version: Fixed from version 5.13rc5"
 
-CVE_STATUS[CVE-2022-3595] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47136] = "fixed-version: Fixed from version 5.13rc4"
 
-# CVE-2022-3606 has no known resolution
+CVE_STATUS[CVE-2021-47137] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-36123] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2021-47138] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3619] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2021-47139] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3621] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47140] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3623] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2021-47141] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3624] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47142] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3625] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47143] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3628] = "fixed-version: Fixed from version 6.1rc5"
+CVE_STATUS[CVE-2021-47144] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-36280] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2021-47145] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3629] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47146] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3630] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47147] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3633] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47148] = "fixed-version: Fixed from version 5.13rc4"
 
-CVE_STATUS[CVE-2022-3635] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2021-47149] = "fixed-version: Fixed from version 5.13rc3"
 
-CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2021-47150] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47151] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47152] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47153] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47158] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47159] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47160] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47161] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47162] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47163] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47164] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47165] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47166] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47167] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47168] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47169] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47170] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47171] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47172] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47173] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47174] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47175] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47176] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47177] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47178] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2021-47180] = "fixed-version: Fixed from version 5.13rc4"
+
+CVE_STATUS[CVE-2022-0001] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-0002] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-0168] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-0171] = "fixed-version: Fixed from version 5.18rc4"
+
+CVE_STATUS[CVE-2022-0185] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-0264] = "fixed-version: Fixed from version 5.16rc6"
+
+CVE_STATUS[CVE-2022-0286] = "fixed-version: Fixed from version 5.14rc2"
+
+CVE_STATUS[CVE-2022-0322] = "fixed-version: Fixed from version 5.15rc6"
+
+CVE_STATUS[CVE-2022-0330] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-0382] = "fixed-version: Fixed from version 5.16"
+
+# CVE-2022-0400 has no known resolution
+
+CVE_STATUS[CVE-2022-0433] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-0435] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-0480] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2022-0487] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-0492] = "fixed-version: Fixed from version 5.17rc3"
+
+CVE_STATUS[CVE-2022-0494] = "fixed-version: Fixed from version 5.17rc5"
+
+CVE_STATUS[CVE-2022-0500] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-0516] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-0617] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-0644] = "fixed-version: Fixed from version 5.15rc7"
+
+CVE_STATUS[CVE-2022-0646] = "fixed-version: Fixed from version 5.17rc5"
+
+CVE_STATUS[CVE-2022-0742] = "fixed-version: Fixed from version 5.17rc7"
+
+CVE_STATUS[CVE-2022-0812] = "fixed-version: Fixed from version 5.8rc6"
+
+CVE_STATUS[CVE-2022-0847] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-0850] = "fixed-version: Fixed from version 5.14rc1"
+
+CVE_STATUS[CVE-2022-0854] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-0995] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-0998] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-1011] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-1012] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2022-1015] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1016] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1043] = "fixed-version: Fixed from version 5.14rc7"
+
+CVE_STATUS[CVE-2022-1048] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1055] = "fixed-version: Fixed from version 5.17rc3"
+
+# CVE-2022-1116 has no known resolution
+
+CVE_STATUS[CVE-2022-1158] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1184] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1195] = "fixed-version: Fixed from version 5.16rc7"
+
+CVE_STATUS[CVE-2022-1198] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-1199] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-1204] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1205] = "fixed-version: Fixed from version 5.18rc1"
+
+# CVE-2022-1247 has no known resolution
+
+CVE_STATUS[CVE-2022-1263] = "fixed-version: Fixed from version 5.18rc3"
+
+CVE_STATUS[CVE-2022-1280] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2022-1353] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-1419] = "fixed-version: Fixed from version 5.6rc2"
+
+CVE_STATUS[CVE-2022-1462] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-1508] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2022-1516] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1651] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1652] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2022-1671] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-1678] = "fixed-version: Fixed from version 4.20rc1"
+
+CVE_STATUS[CVE-2022-1679] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-1729] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2022-1734] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2022-1786] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-1789] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2022-1836] = "fixed-version: Fixed from version 5.18rc5"
+
+CVE_STATUS[CVE-2022-1852] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1882] = "fixed-version: Fixed from version 5.19rc8"
+
+CVE_STATUS[CVE-2022-1943] = "fixed-version: Fixed from version 5.18rc7"
+
+CVE_STATUS[CVE-2022-1966] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1972] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1973] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1974] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2022-1975] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2022-1976] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-1998] = "fixed-version: Fixed from version 5.17rc3"
+
+CVE_STATUS[CVE-2022-20008] = "fixed-version: Fixed from version 5.17rc5"
+
+CVE_STATUS[CVE-2022-20132] = "fixed-version: Fixed from version 5.16rc5"
+
+CVE_STATUS[CVE-2022-20141] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2022-20148] = "fixed-version: Fixed from version 5.16rc1"
+
+CVE_STATUS[CVE-2022-20153] = "fixed-version: Fixed from version 5.13rc1"
+
+CVE_STATUS[CVE-2022-20154] = "fixed-version: Fixed from version 5.16rc8"
+
+CVE_STATUS[CVE-2022-20158] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-20166] = "fixed-version: Fixed from version 5.10rc1"
+
+CVE_STATUS[CVE-2022-20368] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-20369] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-20409] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-20421] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-20422] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-20423] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-20424] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-20565] = "fixed-version: Fixed from version 5.9rc4"
+
+CVE_STATUS[CVE-2022-20566] = "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-20567] = "fixed-version: Fixed from version 4.16rc5"
+
+CVE_STATUS[CVE-2022-20568] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-20572] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-2078] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-21123] = "fixed-version: Fixed from version 5.19rc3"
+
+CVE_STATUS[CVE-2022-21125] = "fixed-version: Fixed from version 5.19rc3"
+
+CVE_STATUS[CVE-2022-21166] = "fixed-version: Fixed from version 5.19rc3"
+
+CVE_STATUS[CVE-2022-21385] = "fixed-version: Fixed from version 4.20"
+
+CVE_STATUS[CVE-2022-21499] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-21505] = "fixed-version: Fixed from version 5.19rc8"
+
+CVE_STATUS[CVE-2022-2153] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-2196] = "fixed-version: Fixed from version 6.2rc1"
+
+# CVE-2022-2209 has no known resolution
+
+CVE_STATUS[CVE-2022-22942] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-23036] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23037] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23038] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23039] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23040] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23041] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-23042] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-2308] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-2318] = "fixed-version: Fixed from version 5.19rc5"
+
+CVE_STATUS[CVE-2022-23222] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-2327] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-2380] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-23816] = "fixed-version: Fixed from version 5.19rc7"
+
+# CVE-2022-23825 has no known resolution
+
+CVE_STATUS[CVE-2022-23960] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-24122] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-24448] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-24958] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-24959] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-2503] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-25258] = "fixed-version: Fixed from version 5.17rc4"
+
+# CVE-2022-25265 has no known resolution
+
+CVE_STATUS[CVE-2022-25375] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-25636] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-2585] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-2586] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-2588] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-2590] = "fixed-version: Fixed from version 6.0rc3"
+
+CVE_STATUS[CVE-2022-2602] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-26365] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-26373] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-2639] = "fixed-version: Fixed from version 5.18rc4"
+
+CVE_STATUS[CVE-2022-26490] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-2663] = "fixed-version: Fixed from version 6.0rc5"
+
+# CVE-2022-26878 has no known resolution
+
+CVE_STATUS[CVE-2022-26966] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-27223] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-27666] = "fixed-version: Fixed from version 5.17rc8"
+
+CVE_STATUS[CVE-2022-27672] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-2785] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-27950] = "fixed-version: Fixed from version 5.17rc5"
+
+CVE_STATUS[CVE-2022-28356] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-28388] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-28389] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-28390] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-2873] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-28796] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-28893] = "fixed-version: Fixed from version 5.18rc2"
+
+CVE_STATUS[CVE-2022-2905] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-29156] = "fixed-version: Fixed from version 5.17rc6"
+
+CVE_STATUS[CVE-2022-2938] = "fixed-version: Fixed from version 5.17rc2"
+
+CVE_STATUS[CVE-2022-29581] = "fixed-version: Fixed from version 5.18rc4"
+
+CVE_STATUS[CVE-2022-29582] = "fixed-version: Fixed from version 5.18rc2"
+
+CVE_STATUS[CVE-2022-2959] = "fixed-version: Fixed from version 5.19rc1"
+
+# CVE-2022-2961 has no known resolution
+
+CVE_STATUS[CVE-2022-2964] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-2977] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-2978] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-29900] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-29901] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-2991] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2022-29968] = "fixed-version: Fixed from version 5.18rc5"
+
+CVE_STATUS[CVE-2022-3028] = "fixed-version: Fixed from version 6.0rc3"
+
+CVE_STATUS[CVE-2022-30594] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-3061] = "fixed-version: Fixed from version 5.18rc5"
+
+CVE_STATUS[CVE-2022-3077] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3078] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-3103] = "fixed-version: Fixed from version 6.0rc3"
+
+CVE_STATUS[CVE-2022-3104] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3105] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2022-3106] = "fixed-version: Fixed from version 5.16rc6"
+
+CVE_STATUS[CVE-2022-3107] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-3108] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-3110] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3111] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-3112] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-3113] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-3114] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3115] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3169] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3170] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-3176] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2022-3202] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-32250] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-32296] = "fixed-version: Fixed from version 5.18rc6"
+
+# CVE-2022-3238 has no known resolution
+
+CVE_STATUS[CVE-2022-3239] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-32981] = "fixed-version: Fixed from version 5.19rc2"
+
+CVE_STATUS[CVE-2022-3303] = "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2022-3344] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2022-33740] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-33741] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-33742] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-33743] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-33744] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-33981] = "fixed-version: Fixed from version 5.18rc5"
+
+CVE_STATUS[CVE-2022-3424] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3435] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-34494] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-34495] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-34918] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-3521] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3522] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3523] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3524] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3526] = "fixed-version: Fixed from version 5.18rc3"
+
+CVE_STATUS[CVE-2022-3531] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3532] = "fixed-version: Fixed from version 6.2rc1"
+
+# CVE-2022-3533 has no known resolution
+
+CVE_STATUS[CVE-2022-3534] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3535] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3541] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3542] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3543] = "fixed-version: Fixed from version 6.1rc1"
+
+# CVE-2022-3544 has no known resolution
+
+CVE_STATUS[CVE-2022-3545] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3564] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-3565] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3566] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3567] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3577] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-3586] = "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2022-3594] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3595] = "fixed-version: Fixed from version 6.1rc1"
+
+# CVE-2022-3606 has no known resolution
+
+CVE_STATUS[CVE-2022-36123] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-3619] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-3621] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3623] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3624] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3625] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3628] = "fixed-version: Fixed from version 6.1rc5"
+
+CVE_STATUS[CVE-2022-36280] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3629] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3630] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3633] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3635] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
 
 CVE_STATUS[CVE-2022-3640] = "fixed-version: Fixed from version 6.1rc4"
 
-CVE_STATUS[CVE-2022-36402] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2022-36402] = "fixed-version: Fixed from version 6.5"
+
+# CVE-2022-3642 has no known resolution
+
+CVE_STATUS[CVE-2022-3643] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-3646] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3649] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-36879] = "fixed-version: Fixed from version 5.19rc8"
+
+CVE_STATUS[CVE-2022-36946] = "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-3707] = "fixed-version: Fixed from version 6.2rc3"
+
+# CVE-2022-38096 has no known resolution
+
+CVE_STATUS[CVE-2022-38457] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2022-3903] = "fixed-version: Fixed from version 6.1rc2"
+
+CVE_STATUS[CVE-2022-3910] = "fixed-version: Fixed from version 6.0rc6"
+
+CVE_STATUS[CVE-2022-39188] = "fixed-version: Fixed from version 5.19rc8"
+
+CVE_STATUS[CVE-2022-39189] = "fixed-version: Fixed from version 5.19rc2"
+
+CVE_STATUS[CVE-2022-39190] = "fixed-version: Fixed from version 6.0rc3"
+
+CVE_STATUS[CVE-2022-3977] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-39842] = "fixed-version: Fixed from version 5.19rc4"
+
+CVE_STATUS[CVE-2022-40133] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2022-40307] = "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2022-40476] = "fixed-version: Fixed from version 5.19rc4"
+
+CVE_STATUS[CVE-2022-40768] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-4095] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-40982] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2022-41218] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-41222] = "fixed-version: Fixed from version 5.14rc1"
+
+CVE_STATUS[CVE-2022-4127] = "fixed-version: Fixed from version 5.19rc6"
+
+CVE_STATUS[CVE-2022-4128] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-4129] = "fixed-version: Fixed from version 6.1rc6"
+
+CVE_STATUS[CVE-2022-4139] = "fixed-version: Fixed from version 6.1rc8"
+
+CVE_STATUS[CVE-2022-41674] = "fixed-version: Fixed from version 6.1rc1"
+
+# CVE-2022-41848 has no known resolution
+
+CVE_STATUS[CVE-2022-41849] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-41850] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-41858] = "fixed-version: Fixed from version 5.18rc2"
+
+CVE_STATUS[CVE-2022-42328] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-42329] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-42432] = "fixed-version: Fixed from version 6.0rc7"
+
+CVE_STATUS[CVE-2022-4269] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2022-42703] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-42719] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42720] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42721] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42722] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42895] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-42896] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-43750] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-4378] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-4379] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-4382] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-44032] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2022-44033] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2022-44034] = "fixed-version: Fixed from version 6.4rc1"
+
+# CVE-2022-4543 has no known resolution
+
+CVE_STATUS[CVE-2022-45869] = "fixed-version: Fixed from version 6.1rc7"
+
+# CVE-2022-45884 has no known resolution
+
+# CVE-2022-45885 has no known resolution
+
+CVE_STATUS[CVE-2022-45886] = "fixed-version: Fixed from version 6.4rc3"
+
+CVE_STATUS[CVE-2022-45887] = "fixed-version: Fixed from version 6.4rc3"
+
+CVE_STATUS[CVE-2022-45888] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-45919] = "fixed-version: Fixed from version 6.4rc3"
+
+CVE_STATUS[CVE-2022-45934] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-4662] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2022-4696] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-4744] = "fixed-version: Fixed from version 5.16rc7"
+
+CVE_STATUS[CVE-2022-47518] = "fixed-version: Fixed from version 6.1rc8"
+
+CVE_STATUS[CVE-2022-47519] = "fixed-version: Fixed from version 6.1rc8"
+
+CVE_STATUS[CVE-2022-47520] = "fixed-version: Fixed from version 6.1rc8"
+
+CVE_STATUS[CVE-2022-47521] = "fixed-version: Fixed from version 6.1rc8"
+
+CVE_STATUS[CVE-2022-47929] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2022-47938] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-47939] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-47940] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-47941] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-47942] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-47943] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-47946] = "fixed-version: Fixed from version 5.12rc2"
+
+CVE_STATUS[CVE-2022-4842] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-48423] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-48424] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-48425] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2022-48502] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2022-48626] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2022-48627] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-48628] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2022-48629] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48630] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
+
+CVE_STATUS[CVE-2023-0045] = "fixed-version: Fixed from version 6.2rc3"
+
+CVE_STATUS[CVE-2023-0047] = "fixed-version: Fixed from version 5.16rc1"
+
+CVE_STATUS[CVE-2023-0122] = "fixed-version: Fixed from version 6.0rc4"
+
+CVE_STATUS[CVE-2023-0160] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-0179] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-0210] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2023-0240] = "fixed-version: Fixed from version 5.10rc1"
+
+CVE_STATUS[CVE-2023-0266] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2023-0386] = "fixed-version: Fixed from version 6.2rc6"
+
+CVE_STATUS[CVE-2023-0394] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2023-0458] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-0459] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-0461] = "fixed-version: Fixed from version 6.2rc3"
+
+CVE_STATUS[CVE-2023-0468] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-0469] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-0590] = "fixed-version: Fixed from version 6.1rc2"
+
+CVE_STATUS[CVE-2023-0597] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-0615] = "fixed-version: Fixed from version 6.1rc3"
+
+CVE_STATUS[CVE-2023-1032] = "fixed-version: Fixed from version 6.3rc2"
+
+CVE_STATUS[CVE-2023-1073] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1074] = "fixed-version: Fixed from version 6.2rc6"
+
+CVE_STATUS[CVE-2023-1075] = "fixed-version: Fixed from version 6.2rc7"
+
+CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-1077] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-1078] = "fixed-version: Fixed from version 6.2rc8"
+
+CVE_STATUS[CVE-2023-1079] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-1095] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-1118] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-1192] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-1193] = "fixed-version: Fixed from version 6.3rc6"
+
+CVE_STATUS[CVE-2023-1194] = "fixed-version: Fixed from version 6.4rc6"
+
+CVE_STATUS[CVE-2023-1195] = "fixed-version: Fixed from version 6.1rc3"
+
+CVE_STATUS[CVE-2023-1206] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-1249] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2023-1252] = "fixed-version: Fixed from version 5.16rc1"
+
+CVE_STATUS[CVE-2023-1281] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-1295] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2023-1380] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
+
+# CVE-2023-1476 has no known resolution
+
+CVE_STATUS[CVE-2023-1513] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
+
+CVE_STATUS[CVE-2023-1583] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-1611] = "fixed-version: Fixed from version 6.3rc5"
+
+CVE_STATUS[CVE-2023-1637] = "fixed-version: Fixed from version 5.18rc2"
+
+CVE_STATUS[CVE-2023-1652] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1670] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-1829] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-1838] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2023-1855] = "fixed-version: Fixed from version 6.3rc3"
+
+CVE_STATUS[CVE-2023-1859] = "fixed-version: Fixed from version 6.3rc7"
+
+CVE_STATUS[CVE-2023-1872] = "fixed-version: Fixed from version 5.18rc2"
+
+CVE_STATUS[CVE-2023-1989] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-1990] = "fixed-version: Fixed from version 6.3rc3"
+
+CVE_STATUS[CVE-2023-1998] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-2002] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-2006] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-2007] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-2008] = "fixed-version: Fixed from version 5.19rc4"
+
+CVE_STATUS[CVE-2023-2019] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-20569] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-20588] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-20593] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-20928] = "fixed-version: Fixed from version 6.0rc1"
+
+# CVE-2023-20937 has no known resolution
+
+CVE_STATUS[CVE-2023-20938] = "fixed-version: Fixed from version 5.18rc5"
+
+# CVE-2023-20941 has no known resolution
+
+CVE_STATUS[CVE-2023-21102] = "fixed-version: Fixed from version 6.2rc4"
+
+CVE_STATUS[CVE-2023-21106] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-2124] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-21255] = "fixed-version: Fixed from version 6.4rc4"
+
+CVE_STATUS[CVE-2023-21264] = "fixed-version: Fixed from version 6.4rc5"
+
+# CVE-2023-21400 has no known resolution
+
+CVE_STATUS[CVE-2023-2156] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-2162] = "fixed-version: Fixed from version 6.2rc6"
+
+CVE_STATUS[CVE-2023-2163] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-2166] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2023-2176] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-2177] = "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2023-2194] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-2235] = "fixed-version: Fixed from version 6.3rc3"
+
+CVE_STATUS[CVE-2023-2236] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-2248] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-2269] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-22995] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2023-22996] = "fixed-version: Fixed from version 5.18rc1"
+
+CVE_STATUS[CVE-2023-22997] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-22998] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-22999] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2023-23000] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2023-23001] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2023-23002] = "fixed-version: Fixed from version 5.17rc1"
+
+CVE_STATUS[CVE-2023-23003] = "fixed-version: Fixed from version 5.16rc6"
+
+CVE_STATUS[CVE-2023-23004] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2023-23005] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-23006] = "fixed-version: Fixed from version 5.16rc8"
+
+# CVE-2023-23039 has no known resolution
+
+CVE_STATUS[CVE-2023-23454] = "fixed-version: Fixed from version 6.2rc3"
+
+CVE_STATUS[CVE-2023-23455] = "fixed-version: Fixed from version 6.2rc3"
+
+CVE_STATUS[CVE-2023-23559] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-23586] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2023-2430] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-2483] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-25012] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-25775] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-2598] = "fixed-version: Fixed from version 6.4rc1"
+
+# CVE-2023-26242 has no known resolution
+
+# CVE-2023-2640 has no known resolution
+
+CVE_STATUS[CVE-2023-26544] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-26545] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-26605] = "fixed-version: Fixed from version 6.1rc7"
+
+CVE_STATUS[CVE-2023-26606] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-26607] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2023-28327] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2023-28328] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-28410] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2023-28464] = "fixed-version: Fixed from version 6.3rc7"
+
+CVE_STATUS[CVE-2023-28466] = "fixed-version: Fixed from version 6.3rc2"
+
+CVE_STATUS[CVE-2023-2860] = "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2023-28746] = "cpe-stable-backport: Backported in 6.6.22"
+
+CVE_STATUS[CVE-2023-28772] = "fixed-version: Fixed from version 5.14rc1"
+
+CVE_STATUS[CVE-2023-28866] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-2985] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-3006] = "fixed-version: Fixed from version 6.1rc1"
+
+# Skipping CVE-2023-3022, no affected_versions
+
+CVE_STATUS[CVE-2023-30456] = "fixed-version: Fixed from version 6.3rc3"
+
+CVE_STATUS[CVE-2023-30772] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-3090] = "fixed-version: Fixed from version 6.4rc2"
+
+CVE_STATUS[CVE-2023-3106] = "fixed-version: Fixed from version 4.8rc7"
+
+# Skipping CVE-2023-3108, no affected_versions
+
+# CVE-2023-31081 has no known resolution
+
+# CVE-2023-31082 has no known resolution
+
+CVE_STATUS[CVE-2023-31083] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-31084] = "fixed-version: Fixed from version 6.4rc3"
+
+CVE_STATUS[CVE-2023-31085] = "fixed-version: Fixed from version 6.6rc5"
+
+CVE_STATUS[CVE-2023-3111] = "fixed-version: Fixed from version 6.0rc2"
+
+CVE_STATUS[CVE-2023-3117] = "fixed-version: Fixed from version 6.4rc7"
+
+CVE_STATUS[CVE-2023-31248] = "fixed-version: Fixed from version 6.5rc2"
+
+CVE_STATUS[CVE-2023-3141] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-31436] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-3159] = "fixed-version: Fixed from version 5.18rc6"
+
+CVE_STATUS[CVE-2023-3161] = "fixed-version: Fixed from version 6.2rc7"
+
+CVE_STATUS[CVE-2023-3212] = "fixed-version: Fixed from version 6.4rc2"
+
+CVE_STATUS[CVE-2023-3220] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-32233] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32247] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32248] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32250] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32252] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32254] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32257] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32258] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-32269] = "fixed-version: Fixed from version 6.2rc7"
+
+# CVE-2023-32629 has no known resolution
+
+CVE_STATUS[CVE-2023-3268] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-3269] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-3312] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-3317] = "fixed-version: Fixed from version 6.3rc6"
+
+CVE_STATUS[CVE-2023-33203] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-33250] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-33288] = "fixed-version: Fixed from version 6.3rc4"
+
+CVE_STATUS[CVE-2023-3338] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2023-3355] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-3357] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2023-3358] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-3359] = "fixed-version: Fixed from version 6.2rc7"
+
+CVE_STATUS[CVE-2023-3389] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2023-3390] = "fixed-version: Fixed from version 6.4rc7"
+
+CVE_STATUS[CVE-2023-33951] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-33952] = "fixed-version: Fixed from version 6.4rc1"
+
+# CVE-2023-3397 has no known resolution
+
+CVE_STATUS[CVE-2023-34255] = "fixed-version: Fixed from version 6.4rc1"
+
+CVE_STATUS[CVE-2023-34256] = "fixed-version: Fixed from version 6.4rc2"
+
+CVE_STATUS[CVE-2023-34319] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-34324] = "fixed-version: Fixed from version 6.6rc6"
 
-# CVE-2022-3642 has no known resolution
+CVE_STATUS[CVE-2023-3439] = "fixed-version: Fixed from version 5.18rc5"
 
-CVE_STATUS[CVE-2022-3643] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-35001] = "fixed-version: Fixed from version 6.5rc2"
 
-CVE_STATUS[CVE-2022-3646] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-3567] = "fixed-version: Fixed from version 6.2rc7"
 
-CVE_STATUS[CVE-2022-3649] = "fixed-version: Fixed from version 6.1rc1"
+# CVE-2023-35693 has no known resolution
 
-CVE_STATUS[CVE-2022-36879] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2023-35788] = "fixed-version: Fixed from version 6.4rc5"
 
-CVE_STATUS[CVE-2022-36946] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2023-35823] = "fixed-version: Fixed from version 6.4rc1"
 
-CVE_STATUS[CVE-2022-3707] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2023-35824] = "fixed-version: Fixed from version 6.4rc1"
 
-# CVE-2022-38096 has no known resolution
+CVE_STATUS[CVE-2023-35826] = "fixed-version: Fixed from version 6.4rc1"
 
-CVE_STATUS[CVE-2022-38457] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-35827] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-3903] = "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2023-35828] = "fixed-version: Fixed from version 6.4rc1"
 
-CVE_STATUS[CVE-2022-3910] = "fixed-version: Fixed from version 6.0rc6"
+CVE_STATUS[CVE-2023-35829] = "fixed-version: Fixed from version 6.4rc1"
 
-CVE_STATUS[CVE-2022-39188] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2023-3609] = "fixed-version: Fixed from version 6.4rc7"
 
-CVE_STATUS[CVE-2022-39189] = "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2023-3610] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2022-39190] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2023-3611] = "fixed-version: Fixed from version 6.5rc2"
 
-CVE_STATUS[CVE-2022-3977] = "fixed-version: Fixed from version 6.1rc1"
+# CVE-2023-3640 has no known resolution
 
-CVE_STATUS[CVE-2022-39842] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2023-37453] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2022-40133] = "fixed-version: Fixed from version 6.2rc4"
+# CVE-2023-37454 has no known resolution
 
-CVE_STATUS[CVE-2022-40307] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
 
-CVE_STATUS[CVE-2022-40476] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
 
-CVE_STATUS[CVE-2022-40768] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-3776] = "fixed-version: Fixed from version 6.5rc2"
 
-CVE_STATUS[CVE-2022-4095] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2023-3777] = "fixed-version: Fixed from version 6.5rc3"
 
-CVE_STATUS[CVE-2022-40982] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2023-3812] = "fixed-version: Fixed from version 6.1rc4"
 
-CVE_STATUS[CVE-2022-41218] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-38409] = "fixed-version: Fixed from version 6.3rc7"
 
-CVE_STATUS[CVE-2022-41222] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2023-38426] = "fixed-version: Fixed from version 6.4rc3"
 
-CVE_STATUS[CVE-2022-4127] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2023-38427] = "fixed-version: Fixed from version 6.4rc6"
 
-CVE_STATUS[CVE-2022-4128] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2023-38428] = "fixed-version: Fixed from version 6.4rc3"
 
-CVE_STATUS[CVE-2022-4129] = "fixed-version: Fixed from version 6.1rc6"
+CVE_STATUS[CVE-2023-38429] = "fixed-version: Fixed from version 6.4rc3"
 
-CVE_STATUS[CVE-2022-4139] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2023-38430] = "fixed-version: Fixed from version 6.4rc6"
 
-CVE_STATUS[CVE-2022-41674] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-38431] = "fixed-version: Fixed from version 6.4rc6"
 
-# CVE-2022-41848 has no known resolution
+CVE_STATUS[CVE-2023-38432] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2022-41849] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-3863] = "fixed-version: Fixed from version 6.5rc1"
 
-CVE_STATUS[CVE-2022-41850] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-3865] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2022-41858] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2023-3866] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2022-42328] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-3867] = "fixed-version: Fixed from version 6.5rc1"
 
-CVE_STATUS[CVE-2022-42329] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-39189] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2022-42432] = "fixed-version: Fixed from version 6.0rc7"
+CVE_STATUS[CVE-2023-39191] = "fixed-version: Fixed from version 6.3rc1"
 
-CVE_STATUS[CVE-2022-4269] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-39192] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2022-42703] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2023-39193] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-39194] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-39197] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-39198] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-4004] = "fixed-version: Fixed from version 6.5rc3"
+
+# CVE-2023-4010 has no known resolution
+
+CVE_STATUS[CVE-2023-4015] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-40283] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-40791] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-4128] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-4132] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-4133] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-4134] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-4147] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-4155] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-4194] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-4206] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-4207] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-4208] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-4244] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-4273] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-42752] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-42753] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-42754] = "fixed-version: Fixed from version 6.6rc3"
+
+CVE_STATUS[CVE-2023-42755] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-42756] = "fixed-version: Fixed from version 6.6rc3"
+
+CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2023-4387] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2023-4389] = "fixed-version: Fixed from version 5.18rc3"
+
+CVE_STATUS[CVE-2023-4394] = "fixed-version: Fixed from version 6.0rc3"
+
+CVE_STATUS[CVE-2023-44466] = "fixed-version: Fixed from version 6.5rc2"
+
+CVE_STATUS[CVE-2023-4459] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2023-4563] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-4569] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-45862] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-45863] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-45871] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-45898] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-4610] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-4611] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-4622] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-4623] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-46343] = "fixed-version: Fixed from version 6.6rc7"
+
+CVE_STATUS[CVE-2023-46813] = "fixed-version: Fixed from version 6.6rc7"
+
+CVE_STATUS[CVE-2023-46838] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-46862] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-47233] = "cpe-stable-backport: Backported in 6.6.24"
+
+CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
+
+CVE_STATUS[CVE-2023-4881] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-4921] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-50431] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-5090] = "fixed-version: Fixed from version 6.6rc7"
+
+CVE_STATUS[CVE-2023-51042] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-51043] = "fixed-version: Fixed from version 6.5rc3"
+
+CVE_STATUS[CVE-2023-5158] = "fixed-version: Fixed from version 6.6rc5"
+
+CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.6.9"
+
+CVE_STATUS[CVE-2023-5178] = "fixed-version: Fixed from version 6.6rc7"
+
+CVE_STATUS[CVE-2023-51780] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2023-51781] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2023-5197] = "fixed-version: Fixed from version 6.6rc3"
+
+CVE_STATUS[CVE-2023-52340] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-52429] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-52434] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2023-52435] = "cpe-stable-backport: Backported in 6.6.11"
+
+CVE_STATUS[CVE-2023-52436] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52438] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52439] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52440] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-52441] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-52442] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-52443] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52444] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52445] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52446] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52447] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52448] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52449] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52450] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52451] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52452] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52453] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52454] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52455] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52456] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52457] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52458] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52459] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52460] = "fixed-version: only affects 6.7rc1 onwards"
+
+CVE_STATUS[CVE-2023-52461] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2022-42719] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52462] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-42720] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52463] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-42721] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52464] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-42722] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52465] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-42895] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2023-52467] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-42896] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2023-52468] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-43750] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52469] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-4378] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-52470] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-4379] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52471] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2022-4382] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52472] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-52473] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2022-44032] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52474] = "fixed-version: Fixed from version 6.4rc1"
 
-CVE_STATUS[CVE-2022-44033] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52475] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-44034] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52476] = "fixed-version: Fixed from version 6.6rc6"
 
-# CVE-2022-4543 has no known resolution
+CVE_STATUS[CVE-2023-52477] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-45869] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52478] = "fixed-version: Fixed from version 6.6rc6"
 
-# CVE-2022-45884 has no known resolution
+CVE_STATUS[CVE-2023-52479] = "fixed-version: Fixed from version 6.6rc5"
 
-# CVE-2022-45885 has no known resolution
+CVE_STATUS[CVE-2023-52480] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2022-45886] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2023-52481] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2022-45887] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2023-52482] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2022-45888] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52483] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-45919] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2023-52484] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2022-45934] = "fixed-version: Fixed from version 6.1"
+# CVE-2023-52485 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2022-4662] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2023-52486] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-4696] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2023-52487] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-4744] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2023-52488] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47518] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2023-52489] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47519] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2023-52490] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47520] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2023-52491] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47521] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2023-52492] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47929] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-52493] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47938] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52494] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47939] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52495] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47940] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2023-52497] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47941] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52498] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2022-47942] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52499] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-47943] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52500] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2022-47946] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2023-52501] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2022-4842] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52502] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-48423] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52503] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-48424] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52504] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-48425] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52505] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2022-48502] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52506] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2023-52507] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2023-52508] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2023-0045] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2023-52509] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2023-0047] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2023-52510] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2023-0122] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2023-52511] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-0160] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52512] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2023-0179] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52513] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0210] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-52515] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0240] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2023-52516] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-0266] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-52517] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-0386] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2023-52518] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0394] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-52519] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0458] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52520] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0459] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52522] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0461] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2023-52523] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0468] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52524] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0469] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0590] = "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2023-52526] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0597] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52527] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-0615] = "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2023-52528] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1032] = "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2023-52529] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1073] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52530] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1074] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2023-52531] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1075] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2023-52532] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52559] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-1077] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52560] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1078] = "fixed-version: Fixed from version 6.2rc8"
+CVE_STATUS[CVE-2023-52561] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-1079] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52562] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1095] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52563] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1118] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52564] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1192] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52565] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1193] = "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2023-52566] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1194] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2023-52567] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1195] = "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2023-52568] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1206] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2023-52569] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2023-1249] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2023-52570] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1252] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2023-52571] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-1281] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-52572] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1295] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2023-52573] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1380] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52574] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52575] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2023-52576] = "fixed-version: Fixed from version 6.6rc3"
 
-# CVE-2023-1476 has no known resolution
+CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1513] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-52578] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2023-52580] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1583] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-52581] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1611] = "fixed-version: Fixed from version 6.3rc5"
+CVE_STATUS[CVE-2023-52582] = "fixed-version: Fixed from version 6.6rc3"
 
-CVE_STATUS[CVE-2023-1637] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2023-52583] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1652] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52584] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1670] = "fixed-version: Fixed from version 6.3rc4"
+# CVE-2023-52585 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-1829] = "fixed-version: Fixed from version 6.3rc1"
+# CVE-2023-52586 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-1838] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2023-52587] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1855] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2023-52588] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1859] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2023-52589] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1872] = "fixed-version: Fixed from version 5.18rc2"
+# CVE-2023-52590 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-1989] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-52591] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1990] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2023-52593] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-1998] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52594] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2002] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52595] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2006] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52596] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2007] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52597] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2008] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2023-52598] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2019] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52599] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-20569] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2023-52600] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-20588] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2023-52601] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-20593] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2023-52602] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-20928] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52603] = "cpe-stable-backport: Backported in 6.6.16"
 
-# CVE-2023-20937 has no known resolution
+CVE_STATUS[CVE-2023-52604] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-20938] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2023-52606] = "cpe-stable-backport: Backported in 6.6.16"
 
-# CVE-2023-20941 has no known resolution
+CVE_STATUS[CVE-2023-52607] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-21102] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2023-52608] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-21106] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52609] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-2124] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-52610] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-21255] = "fixed-version: Fixed from version 6.4rc4"
+CVE_STATUS[CVE-2023-52611] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-21264] = "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2023-52612] = "cpe-stable-backport: Backported in 6.6.14"
 
-# CVE-2023-21400 has no known resolution
+CVE_STATUS[CVE-2023-52613] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-2156] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-52614] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-2162] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2023-52615] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-2163] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-52616] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-2166] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-52617] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2176] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-52618] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2177] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2023-52619] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2194] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-52620] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-2235] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2023-52621] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2236] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2023-52622] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2248] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-52623] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-2269] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2023-52624 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-22995] = "fixed-version: Fixed from version 5.17rc1"
+# CVE-2023-52625 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-22996] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2023-52626] = "fixed-version: only affects 6.7rc2 onwards"
 
-CVE_STATUS[CVE-2023-22997] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52627] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-22998] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-52628] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-22999] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2023-52629] = "fixed-version: Fixed from version 6.6rc1"
 
-CVE_STATUS[CVE-2023-23000] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2023-52630] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-23001] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2023-52631] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-23002] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2023-52632] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-23003] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2023-52633] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-23004] = "fixed-version: Fixed from version 5.19rc1"
+# CVE-2023-52634 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-23005] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-52635] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-23006] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2023-52636] = "cpe-stable-backport: Backported in 6.6.17"
 
-# CVE-2023-23039 has no known resolution
+CVE_STATUS[CVE-2023-52637] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-23454] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2023-52638] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-23455] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2023-52639] = "cpe-stable-backport: Backported in 6.6.22"
 
-CVE_STATUS[CVE-2023-23559] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-52640] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-23586] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2023-52641] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-2430] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2023-5345] = "fixed-version: Fixed from version 6.6rc4"
 
-CVE_STATUS[CVE-2023-2483] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-5633] = "fixed-version: Fixed from version 6.6rc6"
 
-CVE_STATUS[CVE-2023-25012] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-5717] = "fixed-version: Fixed from version 6.6rc7"
 
-CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2023-5972] = "fixed-version: Fixed from version 6.6rc7"
 
-CVE_STATUS[CVE-2023-25775] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2023-6039] = "fixed-version: Fixed from version 6.5rc5"
 
-CVE_STATUS[CVE-2023-2598] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
 
-# CVE-2023-26242 has no known resolution
+CVE_STATUS[CVE-2023-6111] = "cpe-stable-backport: Backported in 6.6.3"
 
-# CVE-2023-2640 has no known resolution
+CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.6.4"
 
-CVE_STATUS[CVE-2023-26544] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
 
-CVE_STATUS[CVE-2023-26545] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-6200] = "cpe-stable-backport: Backported in 6.6.9"
 
-CVE_STATUS[CVE-2023-26605] = "fixed-version: Fixed from version 6.1rc7"
+# CVE-2023-6238 has no known resolution
 
-CVE_STATUS[CVE-2023-26606] = "fixed-version: Fixed from version 6.2rc1"
+# CVE-2023-6240 has no known resolution
 
-CVE_STATUS[CVE-2023-26607] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-6270] = "cpe-stable-backport: Backported in 6.6.23"
 
-CVE_STATUS[CVE-2023-28327] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2023-6356] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-28328] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.6.7"
 
-CVE_STATUS[CVE-2023-28410] = "fixed-version: Fixed from version 5.19rc1"
+# CVE-2023-6535 has no known resolution
 
-CVE_STATUS[CVE-2023-28464] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2023-6536] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-28466] = "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2023-6546] = "fixed-version: Fixed from version 6.5rc7"
 
-CVE_STATUS[CVE-2023-2860] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2023-6560] = "cpe-stable-backport: Backported in 6.6.5"
 
-CVE_STATUS[CVE-2023-28772] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.6.9"
 
-CVE_STATUS[CVE-2023-28866] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
 
-CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.6.7"
 
-CVE_STATUS[CVE-2023-2985] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-3006] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.6.7"
 
-# Skipping CVE-2023-3022, no affected_versions
+CVE_STATUS[CVE-2023-6915] = "cpe-stable-backport: Backported in 6.6.13"
 
-CVE_STATUS[CVE-2023-30456] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.6.7"
 
-CVE_STATUS[CVE-2023-30772] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.6.5"
 
-CVE_STATUS[CVE-2023-3090] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2023-7042] = "cpe-stable-backport: Backported in 6.6.23"
 
-CVE_STATUS[CVE-2023-3106] = "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2023-7192] = "fixed-version: Fixed from version 6.3rc1"
 
-# Skipping CVE-2023-3108, no affected_versions
+CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
 
-# CVE-2023-31081 has no known resolution
+CVE_STATUS[CVE-2024-0340] = "fixed-version: Fixed from version 6.4rc6"
 
-# CVE-2023-31082 has no known resolution
+CVE_STATUS[CVE-2024-0443] = "fixed-version: Fixed from version 6.4rc7"
 
-CVE_STATUS[CVE-2023-31083] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-0562] = "fixed-version: Fixed from version 6.0rc3"
 
-CVE_STATUS[CVE-2023-31084] = "fixed-version: Fixed from version 6.4rc3"
+# CVE-2024-0564 has no known resolution
 
-CVE_STATUS[CVE-2023-31085] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-0565] = "cpe-stable-backport: Backported in 6.6.8"
 
-CVE_STATUS[CVE-2023-3111] = "fixed-version: Fixed from version 6.0rc2"
+CVE_STATUS[CVE-2024-0582] = "cpe-stable-backport: Backported in 6.6.5"
 
-CVE_STATUS[CVE-2023-3117] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-0584] = "cpe-stable-backport: Backported in 6.6.5"
 
-CVE_STATUS[CVE-2023-31248] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-0607] = "cpe-stable-backport: Backported in 6.6.3"
 
-CVE_STATUS[CVE-2023-3141] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-0639] = "fixed-version: Fixed from version 6.5rc1"
 
-CVE_STATUS[CVE-2023-31436] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-0641] = "fixed-version: Fixed from version 6.6rc5"
 
-CVE_STATUS[CVE-2023-3159] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-0646] = "cpe-stable-backport: Backported in 6.6.7"
 
-CVE_STATUS[CVE-2023-3161] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-0775] = "fixed-version: Fixed from version 6.4rc2"
 
-CVE_STATUS[CVE-2023-3212] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-0841] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-3220] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-32233] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-32247] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-1151] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-32248] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-1312] = "fixed-version: Fixed from version 6.5rc4"
 
-CVE_STATUS[CVE-2023-32250] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2024-21803 has no known resolution
 
-CVE_STATUS[CVE-2023-32252] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2024-2193 has no known resolution
 
-CVE_STATUS[CVE-2023-32254] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-22099] = "cpe-stable-backport: Backported in 6.6.23"
 
-CVE_STATUS[CVE-2023-32257] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2024-22386 has no known resolution
 
-CVE_STATUS[CVE-2023-32258] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
 
-CVE_STATUS[CVE-2023-32269] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-23196] = "fixed-version: Fixed from version 6.5rc1"
 
-# CVE-2023-32629 has no known resolution
+CVE_STATUS[CVE-2024-23307] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-3268] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2024-23848 has no known resolution
 
-CVE_STATUS[CVE-2023-3269] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-3312] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-23850] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-3317] = "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2024-23851] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-33203] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-24855] = "fixed-version: Fixed from version 6.5rc2"
 
-CVE_STATUS[CVE-2023-33250] = "fixed-version: Fixed from version 6.5rc1"
+# CVE-2024-24857 has no known resolution
 
-CVE_STATUS[CVE-2023-33288] = "fixed-version: Fixed from version 6.3rc4"
+# CVE-2024-24858 has no known resolution
 
-CVE_STATUS[CVE-2023-3338] = "fixed-version: Fixed from version 6.1rc1"
+# CVE-2024-24859 has no known resolution
 
-CVE_STATUS[CVE-2023-3355] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-24860] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3357] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-24861] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-3358] = "fixed-version: Fixed from version 6.2rc5"
+# CVE-2024-24864 has no known resolution
 
-CVE_STATUS[CVE-2023-3359] = "fixed-version: Fixed from version 6.2rc7"
+# CVE-2024-25739 has no known resolution
 
-CVE_STATUS[CVE-2023-3389] = "fixed-version: Fixed from version 6.0rc1"
+# CVE-2024-25740 has no known resolution
 
-CVE_STATUS[CVE-2023-3390] = "fixed-version: Fixed from version 6.4rc7"
+# CVE-2024-25741 has no known resolution
 
-CVE_STATUS[CVE-2023-33951] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-25744] = "cpe-stable-backport: Backported in 6.6.7"
 
-CVE_STATUS[CVE-2023-33952] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
 
-# CVE-2023-3397 has no known resolution
+CVE_STATUS[CVE-2024-26582] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-34255] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26583] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-34256] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-26584] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-34319] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-26585] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-34324] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-26586] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3439] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-26587] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35001] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-26588] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3567] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-26589] = "cpe-stable-backport: Backported in 6.6.14"
 
-# CVE-2023-35693 has no known resolution
+CVE_STATUS[CVE-2024-26590] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35788] = "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2024-26591] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35823] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26592] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35824] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26593] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-35826] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26594] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35827] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-26595] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-35828] = "fixed-version: Fixed from version 6.4rc1"
+# CVE-2024-26596 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-35829] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-26597] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3609] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-26598] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3610] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-26599] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-3611] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-26600] = "cpe-stable-backport: Backported in 6.6.17"
 
-# CVE-2023-3640 has no known resolution
+CVE_STATUS[CVE-2024-26601] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-37453] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26602] = "cpe-stable-backport: Backported in 6.6.18"
 
-# CVE-2023-37454 has no known resolution
+CVE_STATUS[CVE-2024-26603] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26604] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26605] = "fixed-version: only affects 6.7 onwards"
 
-CVE_STATUS[CVE-2023-3776] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-26606] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-3777] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-26607] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-3812] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-26608] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38409] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-26610] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38426] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-26611] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38427] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-26612] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38428] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-26614] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38429] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-26615] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38430] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-26616] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-38431] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-26617] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-38432] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-26618] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-3863] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26619] = "fixed-version: only affects 6.7rc5 onwards"
 
-CVE_STATUS[CVE-2023-3865] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-26620] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-3866] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-26621] = "fixed-version: only affects 6.7 onwards"
 
-CVE_STATUS[CVE-2023-3867] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26622] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2023-39189] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26623] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-39191] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26625] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-39192] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26626] = "fixed-version: only affects 6.8rc1 onwards"
 
-CVE_STATUS[CVE-2023-39193] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26627] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-39194] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26629] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-39197] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26630] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2023-39198] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26631] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-4004] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-26632] = "cpe-stable-backport: Backported in 6.6.14"
 
-# CVE-2023-4010 has no known resolution
+CVE_STATUS[CVE-2024-26633] = "cpe-stable-backport: Backported in 6.6.14"
 
-CVE_STATUS[CVE-2023-4015] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-26634] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-40283] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26635] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-40791] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-26636] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4128] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26637] = "fixed-version: only affects 6.7 onwards"
 
-CVE_STATUS[CVE-2023-4132] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26638] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4133] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-26639] = "fixed-version: only affects 6.8rc1 onwards"
 
-CVE_STATUS[CVE-2023-4134] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26640] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-4147] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-26641] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-4155] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-26642] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-4194] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26643] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-4206] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26644] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4207] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26645] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4208] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26646] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4244] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26647] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4273] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26648] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-42752] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26649] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-42753] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26650] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-42754] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-26651] = "cpe-stable-backport: Backported in 6.6.23"
 
-CVE_STATUS[CVE-2023-42755] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26652] = "cpe-stable-backport: Backported in 6.6.22"
 
-CVE_STATUS[CVE-2023-42756] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-26653] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-26654] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-4387] = "fixed-version: Fixed from version 5.18"
+# CVE-2024-26655 needs backporting (fixed from 6.9rc2)
 
-CVE_STATUS[CVE-2023-4389] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-26656] = "cpe-stable-backport: Backported in 6.6.24"
 
-CVE_STATUS[CVE-2023-4394] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-26657] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-44466] = "fixed-version: Fixed from version 6.5rc2"
+# CVE-2024-26658 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-4459] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-26659] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4563] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-26660] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4569] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26661] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-45862] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26662] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-45863] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26663] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-45871] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26664] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-45898] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26665] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4610] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-26666] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4611] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-26667] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4622] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26668] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-4623] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26669] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-46343] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26670] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2023-46813] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26671] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-46838] = "cpe-stable-backport: Backported in 6.6.14"
+# CVE-2024-26672 needs backporting (fixed from 6.8rc1)
 
-CVE_STATUS[CVE-2023-46862] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2024-26673] = "cpe-stable-backport: Backported in 6.6.16"
 
-# CVE-2023-47233 has no known resolution
+CVE_STATUS[CVE-2024-26674] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-26675] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4881] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26676] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-4921] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26677] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-50431] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26678] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-5090] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26679] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-51042] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26680] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-51043] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-26681] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-5158] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-26682] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-26683] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-5178] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26684] = "cpe-stable-backport: Backported in 6.6.17"
 
-CVE_STATUS[CVE-2023-51780] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-26685] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-51781] = "cpe-stable-backport: Backported in 6.6.8"
+# CVE-2024-26686 needs backporting (fixed from 6.8rc4)
 
-CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-26687] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-5197] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-26688] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52340] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26689] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52429] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26690] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26691] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52434] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-26692] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52435] = "cpe-stable-backport: Backported in 6.6.11"
+CVE_STATUS[CVE-2024-26693] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52436] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-26694] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52438] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-26695] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52439] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-26696] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52440] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-26697] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52441] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-26698] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52442] = "fixed-version: Fixed from version 6.5rc4"
+# CVE-2024-26699 needs backporting (fixed from 6.8rc5)
 
-CVE_STATUS[CVE-2023-52443] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26700] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52444] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26702] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52445] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26703] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52446] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26704] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52447] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26705] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52448] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26706] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52449] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26707] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52450] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26708] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52451] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26709] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-52452] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26710] = "fixed-version: only affects 6.8rc1 onwards"
 
-CVE_STATUS[CVE-2023-52453] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26711] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52454] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26712] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52455] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26713] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52456] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26714] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52457] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26715] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52458] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26716] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52459] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26717] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52460] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-26718] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52461] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-26719] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52462] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26720] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-52463] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26721] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-52464] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26722] = "fixed-version: only affects 6.7rc5 onwards"
 
-CVE_STATUS[CVE-2023-5345] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-26723] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-5633] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-26724] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-5717] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26725] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-5972] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-26726] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-6039] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-26727] = "cpe-stable-backport: Backported in 6.6.18"
 
-CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-26728] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-6111] = "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-26729] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.6.4"
+CVE_STATUS[CVE-2024-26730] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-26731] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6200] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-26732] = "fixed-version: only affects 6.7rc1 onwards"
 
-# CVE-2023-6238 has no known resolution
+CVE_STATUS[CVE-2024-26733] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-6240 has no known resolution
+CVE_STATUS[CVE-2024-26734] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-6270 has no known resolution
+CVE_STATUS[CVE-2024-26735] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-6356 has no known resolution
+CVE_STATUS[CVE-2024-26736] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26737] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-6535 has no known resolution
+CVE_STATUS[CVE-2024-26738] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-6536 has no known resolution
+CVE_STATUS[CVE-2024-26739] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6546] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-26740] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6560] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-26741] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-26742] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-26743] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26744] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-26745] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26746] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2023-6915] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-26747] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26748] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-26749] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2023-7042 has no known resolution
+CVE_STATUS[CVE-2024-26750] = "fixed-version: only affects 6.8rc5 onwards"
 
-CVE_STATUS[CVE-2023-7192] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-26751] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-26752] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0340] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-26753] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0443] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-26754] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0562] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-26755] = "fixed-version: only affects 6.7rc1 onwards"
 
-# CVE-2024-0564 has no known resolution
+# CVE-2024-26756 needs backporting (fixed from 6.8rc6)
 
-CVE_STATUS[CVE-2024-0565] = "cpe-stable-backport: Backported in 6.6.8"
+# CVE-2024-26757 needs backporting (fixed from 6.8rc6)
 
-CVE_STATUS[CVE-2024-0582] = "cpe-stable-backport: Backported in 6.6.5"
+# CVE-2024-26758 needs backporting (fixed from 6.8rc6)
 
-CVE_STATUS[CVE-2024-0584] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-26759] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0607] = "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-26760] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0639] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-26761] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0641] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-26762] = "fixed-version: only affects 6.7rc1 onwards"
 
-CVE_STATUS[CVE-2024-0646] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26763] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-0775] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-26764] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-0841 has no known resolution
+CVE_STATUS[CVE-2024-26765] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26766] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-26767] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-1151] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26768] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-1312] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-26769] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-21803 has no known resolution
+CVE_STATUS[CVE-2024-26770] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-22099 has no known resolution
+CVE_STATUS[CVE-2024-26771] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-22386 has no known resolution
+CVE_STATUS[CVE-2024-26772] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-26773] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-23196 has no known resolution
+CVE_STATUS[CVE-2024-26774] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-23307 has no known resolution
+CVE_STATUS[CVE-2024-26775] = "cpe-stable-backport: Backported in 6.6.19"
 
-# CVE-2024-23848 has no known resolution
+CVE_STATUS[CVE-2024-26776] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-26777] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-23850] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26778] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-23851] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26779] = "cpe-stable-backport: Backported in 6.6.19"
 
-CVE_STATUS[CVE-2024-24855] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-26780] = "fixed-version: only affects 6.8rc4 onwards"
 
-# CVE-2024-24857 has no known resolution
+CVE_STATUS[CVE-2024-26781] = "fixed-version: only affects 6.8rc6 onwards"
 
-# CVE-2024-24858 has no known resolution
+CVE_STATUS[CVE-2024-26782] = "cpe-stable-backport: Backported in 6.6.21"
 
-# CVE-2024-24859 has no known resolution
+CVE_STATUS[CVE-2024-26783] = "cpe-stable-backport: Backported in 6.6.22"
 
-CVE_STATUS[CVE-2024-24860] = "cpe-stable-backport: Backported in 6.6.14"
+# CVE-2024-26784 needs backporting (fixed from 6.8rc7)
 
-# CVE-2024-24861 has no known resolution
+# CVE-2024-26785 needs backporting (fixed from 6.8rc7)
 
-# CVE-2024-24864 has no known resolution
+CVE_STATUS[CVE-2024-26786] = "cpe-stable-backport: Backported in 6.6.21"
 
-# CVE-2024-25739 has no known resolution
+CVE_STATUS[CVE-2024-26787] = "cpe-stable-backport: Backported in 6.6.21"
 
-# CVE-2024-25740 has no known resolution
+CVE_STATUS[CVE-2024-26788] = "cpe-stable-backport: Backported in 6.6.21"
 
-# CVE-2024-25741 has no known resolution
+CVE_STATUS[CVE-2024-26789] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-25744] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-26790] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-26791] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26582] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26792] = "fixed-version: only affects 6.8rc4 onwards"
 
-CVE_STATUS[CVE-2024-26583] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26793] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26584] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26794] = "fixed-version: only affects 6.8rc6 onwards"
 
-CVE_STATUS[CVE-2024-26585] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26795] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26586] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26796] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26587] = "cpe-stable-backport: Backported in 6.6.14"
+# CVE-2024-26797 needs backporting (fixed from 6.8rc7)
 
-CVE_STATUS[CVE-2024-26588] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26798] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26589] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26799] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26590] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26800] = "fixed-version: only affects 6.8rc5 onwards"
 
-CVE_STATUS[CVE-2024-26591] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26801] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26592] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26802] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26593] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-26803] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26594] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26804] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26595] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26805] = "cpe-stable-backport: Backported in 6.6.21"
 
-# CVE-2024-26596 needs backporting (fixed from 6.8rc1)
+# CVE-2024-26806 needs backporting (fixed from 6.8rc7)
 
-CVE_STATUS[CVE-2024-26597] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26807] = "cpe-stable-backport: Backported in 6.6.21"
 
-CVE_STATUS[CVE-2024-26598] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26808] = "cpe-stable-backport: Backported in 6.6.15"
 
-CVE_STATUS[CVE-2024-26599] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-26809] = "cpe-stable-backport: Backported in 6.6.23"
 
-- 
2.39.2


