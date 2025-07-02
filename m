Return-Path: <steve@sakoman.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAB8C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.15021.1751425944493449316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kq9XVWRL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74b54cead6cso51174b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425944; x=1752030744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhn45XODhUaQBRRoSmFlUa1tn6KZNj2BApP/CWPrOpg=;
        b=Kq9XVWRLTRRdxM+o1jf4O+d7sMUbeoXl0HOzRgxRQHC+GZIVhd0lY0PXG2eHcYoOCk
         Qo1O6gOCpv8NknP4QTwqPv4ROPX6E4moAzmJMe+YMvgOLV8O8xFNXNpeKF9Gm9DH6Eho
         sOnxStaEqgG+4LUGtUAkXhY2k/ywPgiPKmwj6iaev/OcZ56bKpMf1GlrgSd5He3s3An7
         ApEUewc82CqjZtQOkXtF/0M7knHizEOKyngjhGvqvIOxA2hULlFxGHDFETDeQu13itMU
         M5ggKTNac8N9fGJU33WzjdMYBh61Rtdgtgk7qY6ShDd7bK8mI/TJO+urJdsc6iLEsapF
         kIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425944; x=1752030744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhn45XODhUaQBRRoSmFlUa1tn6KZNj2BApP/CWPrOpg=;
        b=mpOIos+XbIYVBHxRFRDq4fd36MriPH1pIrjNRqIYVH0FivjnytZ0XYSQzH+UlaylqK
         CwYVSyE4S4CNr/u6lETy5iHuDt0mwGpz6br4oLkIjSfyroWm+Z6C2//MU0SH2rOIMCnh
         vhv+11edFqw+QAGadGRG9DfIXZz3xZLH0EzBXa9o89L7DG1FLIBGED+3EP7wlIAZRO9l
         W/H1OuYZphSVbLFz8Pt7iyQAQLrVYmI5uMPfmHf2CzB20F+7HQ6cRUEVXCh2LLvBZ00W
         Tu7ATAseYqp7rRcvSW7Cn7aM08N1n+8FClbMDnTpFPm1YDDrSOP+phiO8y5EbagwsyNe
         35pA==
X-Gm-Message-State: AOJu0Yw7KRewusuL7FMML2P9FBJ/O+3p+4zMogJtv0gssqBavBVS+645
	tQUDVj5YXOGucsQQiLW2VSoMQYhSzjn5ivpzxrWCgQSR4a+I0X2g5M/vNxCxbpe5X2/JlaO57JV
	LjwGy
X-Gm-Gg: ASbGnctOC6t/eZBWINEH34ahLK3g/h89NlDNTH2C3BNj7455RwjPfT9SN7s39hb6VAk
	R8j8z80lmL5ITNg/FJDtSE9ARBcq8jfkCI9XrIoafYP1Y3qk9E1R2GeY7BQml/Hg63gYvE2I7fs
	SS02FtkZm/eqyL9G9wSnSCSIAZSh4dQLCsrf4hNV9mpcLJblgH+5DXrlXBUcIN53M8Lfo7TINR7
	1k17UaKOlDxAqt5AaSVTPQm5SdF5zNapPrmgdiF5w/uWnuUvQC67FhydLvt05WTi9C06/2hXG5U
	KrZbIUCA05QQhe64XFd4kakn4PSzCACpNBxAMJeCW8Rkaaon8c2peg==
X-Google-Smtp-Source: AGHT+IHCAmZiORB0VWbHixq2bqRcirX+uxht9gqqP59sNfqbzxHvNRSPXEMDeyFsSdUX/RwKYaSMzA==
X-Received: by 2002:a05:6a20:6a0e:b0:220:10f9:c99f with SMTP id adf61e73a8af0-222d7e9993bmr2393228637.25.1751425942289;
        Tue, 01 Jul 2025 20:12:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/19] linux/cve-exclusion: Execute the script after changing to the new data source
Date: Tue,  1 Jul 2025 20:11:47 -0700
Message-ID: <ec9a04c6e86efe9d5351eb7956cfc3e94bcdc09a.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219756

From: Daniel Turull <daniel.turull@ericsson.com>

Execute new script generate-cve-exclusions.py
./generate-cve-exclusions.py ~/cvelistV5/ 6.12.19 > cve-exclusion_6.12.inc

After using the database from CVEproject, some old
CVEs did not have correct metadata, therefore moving missing ones
from old cve-exclusions_6.12.inc into cve-exclusion.inc

Comparing output from cve_check before and after, two CVEs are removed:
CVE-2023-52904 and CVE-2024-38381

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a7af09febc28477094de0999ab6321d910811b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc   |  118 +
 .../linux/cve-exclusion_6.12.inc              | 9194 +++++++++++------
 2 files changed, 5980 insertions(+), 3332 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 7857633943..5f96a81bdd 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -32,3 +32,121 @@ CVE_STATUS[CVE-2020-11935] = "not-applicable-config: Issue only affects aufs, wh
 CVE_STATUS[CVE-2023-23005] = "disputed: There are no realistic cases \
 in which a user can cause the alloc_memory_type error case to be reached. \
 See: https://bugzilla.suse.com/show_bug.cgi?id=1208844#c2"
+
+# Old CVES taken before using new data from kernel CNA
+
+CVE_STATUS[CVE-2014-8171] = "fixed-version: Fixed from version 3.12rc1"
+
+CVE_STATUS[CVE-2017-1000255] = "fixed-version: Fixed from version 4.14rc5"
+
+CVE_STATUS[CVE-2018-10840] = "fixed-version: Fixed from version 4.18rc1"
+
+CVE_STATUS[CVE-2018-10876] = "fixed-version: Fixed from version 4.18rc4"
+
+CVE_STATUS[CVE-2018-10882] = "fixed-version: Fixed from version 4.18rc4"
+
+CVE_STATUS[CVE-2018-10902] = "fixed-version: Fixed from version 4.18rc6"
+
+CVE_STATUS[CVE-2018-14625] = "fixed-version: Fixed from version 4.20rc6"
+
+CVE_STATUS[CVE-2019-3016] = "fixed-version: Fixed from version 5.6rc1"
+
+CVE_STATUS[CVE-2019-3819] = "fixed-version: Fixed from version 5.0rc6"
+
+CVE_STATUS[CVE-2019-3887] = "fixed-version: Fixed from version 5.1rc4"
+
+CVE_STATUS[CVE-2020-10742] = "fixed-version: Fixed from version 3.16rc1"
+
+CVE_STATUS[CVE-2020-16119] = "fixed-version: Fixed from version 5.15rc2"
+
+CVE_STATUS[CVE-2020-1749] = "fixed-version: Fixed from version 5.5rc1"
+
+CVE_STATUS[CVE-2020-25672] = "fixed-version: Fixed from version 5.12rc7"
+
+CVE_STATUS[CVE-2020-27815] = "fixed-version: Fixed from version 5.11rc1"
+
+CVE_STATUS[CVE-2020-8834] = "fixed-version: Fixed from version 4.18rc1"
+
+CVE_STATUS[CVE-2021-20194] = "fixed-version: Fixed from version 5.10rc1"
+
+CVE_STATUS[CVE-2021-20265] = "fixed-version: Fixed from version 4.5rc3"
+
+CVE_STATUS[CVE-2021-3564] = "fixed-version: Fixed from version 5.13rc5"
+
+CVE_STATUS[CVE-2021-3669] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2021-3759] = "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2021-4218] = "fixed-version: Fixed from version 5.8rc1"
+
+CVE_STATUS[CVE-2022-0286] = "fixed-version: Fixed from version 5.14rc2"
+
+CVE_STATUS[CVE-2022-1462] = "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-2308] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-2327] = "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-2663] = "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2022-2785] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3435] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3523] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3534] = "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3566] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3567] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3619] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-3621] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3624] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3629] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3630] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3633] = "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-36402] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2022-3646] = "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42895] = "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-4382] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1073] = "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1074] = "fixed-version: Fixed from version 6.2rc6"
+
+CVE_STATUS[CVE-2023-1075] = "fixed-version: Fixed from version 6.2rc7"
+
+CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-4155] = "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
+
+CVE_STATUS[CVE-2023-6270] = "cpe-stable-backport: Backported in 6.6.23"
+
+CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
+
+CVE_STATUS[CVE-2023-7042] = "cpe-stable-backport: Backported in 6.6.23"
+
+CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 32a0701edf..4cfe0944bc 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6660 +1,9190 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-06-06 20:41:33.044442+00:00 for version 6.6.32
+# Generated at 2025-04-10 09:01:06.745895+00:00 for version 6.12.19
 
-#python check_kernel_cve_status_version() {
-#    this_version = "6.6.29"
-#    kernel_version = d.getVar("LINUX_VERSION")
-#    if kernel_version != this_version:
-#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-#}
-#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+python check_kernel_cve_status_version() {
+    this_version = "6.12.19"
+    kernel_version = d.getVar("LINUX_VERSION")
+    if kernel_version != this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+}
+do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
-CVE_STATUS[CVE-2003-1604] = "fixed-version: Fixed from version 2.6.12rc2"
+CVE_STATUS[CVE-2019-25160] = "fixed-version: Fixed from version 5.0"
+
+CVE_STATUS[CVE-2019-25162] = "fixed-version: Fixed from version 6.0"
+
+# CVE-2019-3459 has no known resolution
+
+# CVE-2019-3460 has no known resolution
+
+CVE_STATUS[CVE-2020-36775] = "fixed-version: Fixed from version 5.7"
+
+CVE_STATUS[CVE-2020-36776] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36777] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36778] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36779] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36780] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36781] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36782] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36783] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36784] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36785] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36786] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36787] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36788] = "fixed-version: Fixed from version 5.15"
+
+# CVE-2021-28688 has no known resolution
+
+# CVE-2021-28691 has no known resolution
+
+# CVE-2021-28711 has no known resolution
+
+# CVE-2021-28712 has no known resolution
+
+# CVE-2021-28713 has no known resolution
+
+# CVE-2021-28714 has no known resolution
+
+# CVE-2021-28715 has no known resolution
+
+CVE_STATUS[CVE-2021-46904] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46905] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46906] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46908] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46909] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46910] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46911] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46912] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46913] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46914] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46915] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46916] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46917] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46918] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46919] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46920] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46921] = "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.10.33"
+
+CVE_STATUS[CVE-2021-46923] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46924] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46925] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46926] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46927] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46928] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46929] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46930] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46931] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46932] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46933] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46934] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46935] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46936] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46937] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46938] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46939] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46940] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46941] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46942] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46943] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46944] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46945] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46947] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46948] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46949] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46950] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46951] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46952] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46953] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46954] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46955] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46956] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46957] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46958] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46959] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46960] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46961] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46962] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46963] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46964] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46965] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46966] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46967] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46968] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46969] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46970] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46971] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46972] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46973] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46974] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46976] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46977] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46978] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46979] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46980] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46981] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46982] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46983] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46984] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46985] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46986] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46987] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46988] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46989] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46990] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46991] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46992] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46993] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46994] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46995] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46996] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46997] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46998] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46999] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47000] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47001] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47002] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47003] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47004] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47005] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47006] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47007] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47008] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47009] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47010] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47011] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47012] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47013] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47014] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47015] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47016] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47017] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47018] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47019] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47020] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47021] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47022] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47023] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47024] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47025] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47026] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47027] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47028] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47029] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47030] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47031] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47032] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47033] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47034] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47035] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47036] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47037] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47038] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47039] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47040] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47041] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47042] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47043] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47044] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47045] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47046] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47047] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47048] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47049] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47050] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47051] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47052] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47053] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47054] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47055] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47056] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47057] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47058] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47059] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47060] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47061] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47062] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47063] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47064] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47065] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47066] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47067] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47068] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47069] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47070] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47071] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47072] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47073] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47074] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47075] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47076] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47077] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47078] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47079] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47080] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47081] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47082] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47083] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47086] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47087] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47088] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47089] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47090] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47091] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47092] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47093] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47094] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47095] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47096] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47097] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47098] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47099] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47100] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47101] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47102] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47103] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47104] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47105] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47106] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47107] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47108] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47109] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47110] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47111] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47112] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47113] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47114] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47116] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47117] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47118] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47119] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47120] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47121] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47122] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47123] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47124] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47125] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47126] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47127] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47128] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47129] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47130] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47131] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47132] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47133] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47134] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47135] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47136] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47137] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47138] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47139] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47140] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47141] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47142] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47143] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47144] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47145] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47146] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47147] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47148] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47149] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47150] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47151] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47152] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47153] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47158] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47159] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47160] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47161] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47162] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47163] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47164] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47165] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47166] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47167] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47168] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47169] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47170] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47171] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47172] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47173] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47174] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47175] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47176] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47177] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47178] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 4.9.271"
+
+CVE_STATUS[CVE-2021-47180] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47181] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47182] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47183] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47184] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47185] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47186] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47187] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47188] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47189] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47190] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47191] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47192] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47193] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47194] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47195] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47196] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47197] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47198] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47199] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47200] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47201] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47202] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47203] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47204] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47205] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47206] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47207] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47209] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47210] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47211] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47212] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47214] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47215] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47216] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47217] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47218] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47219] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47221] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47222] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47223] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47224] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47225] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47226] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47227] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47228] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47229] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47230] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47231] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47232] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47233] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47234] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47235] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47236] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47237] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47238] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47239] = "fixed-version: Fixed from version 4.4.274"
+
+CVE_STATUS[CVE-2021-47240] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47241] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47242] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47243] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47244] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47245] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47246] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47247] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47248] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47249] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47250] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47251] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47252] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47253] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47254] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47255] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47256] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47257] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47258] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47259] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47260] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47261] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47262] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47263] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47264] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47265] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47266] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47267] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47268] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47269] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47270] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47271] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47272] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47273] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47274] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47275] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47276] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47277] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47278] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47279] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47280] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47281] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47282] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47283] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47284] = "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47286] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47287] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47288] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47289] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47290] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47291] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47292] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47293] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47294] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47295] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47296] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47297] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47298] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47299] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47300] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47301] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47302] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47303] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47304] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47305] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47306] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47307] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47308] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47309] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47310] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47311] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47312] = "fixed-version: Fixed from version 5.13.5"
+
+CVE_STATUS[CVE-2021-47313] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47314] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47315] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47316] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47317] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47318] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47319] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47320] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47321] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47322] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47323] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47324] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47325] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47327] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47328] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47329] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47330] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47331] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47332] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47333] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47334] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47335] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47336] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47337] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47338] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47339] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47340] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47341] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47342] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47343] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47344] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47345] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47346] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47347] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47348] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47349] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47350] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47351] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47352] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47353] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47354] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47355] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47356] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47357] = "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47358] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47359] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47360] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47361] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47362] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47363] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47364] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47365] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47366] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47367] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47368] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47369] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47370] = "fixed-version: Fixed from version 5.14.9"
+
+CVE_STATUS[CVE-2021-47371] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47372] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47373] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47374] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47375] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47376] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47378] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47379] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47380] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47381] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47382] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47383] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47384] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47385] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47386] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47387] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47388] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47389] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47390] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47391] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47392] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47393] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47394] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47395] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47396] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47397] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47398] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47399] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47400] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47401] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47402] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47403] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47404] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47405] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47406] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47407] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47408] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47409] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47410] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47412] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47413] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47414] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47415] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47416] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47417] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47418] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47419] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47420] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47421] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47422] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47423] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47424] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47425] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47426] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47427] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47428] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47429] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47430] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47431] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47432] = "fixed-version: Fixed from version 6.7"
+
+CVE_STATUS[CVE-2021-47433] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47434] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47435] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47436] = "fixed-version: Fixed from version 4.14.252"
+
+CVE_STATUS[CVE-2021-47437] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47438] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47439] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47440] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47441] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47442] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47443] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47444] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47445] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47446] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47447] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47448] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47449] = "fixed-version: Fixed from version 5.14.14"
+
+CVE_STATUS[CVE-2021-47450] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47451] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47452] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47453] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47454] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47455] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47456] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47457] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47458] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47459] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47460] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47461] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47462] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47463] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47464] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47465] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47466] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47467] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47468] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47469] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47470] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47471] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47473] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47474] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47475] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47476] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47477] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47478] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47479] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47480] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47481] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47482] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47483] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47484] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47485] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47486] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47489] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47490] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47491] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47492] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47493] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47494] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47495] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47496] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47497] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47498] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47499] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47500] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47501] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47502] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47503] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47504] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47505] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47506] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47507] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47508] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47509] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47510] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47511] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47512] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47513] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47514] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47515] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47516] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47517] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47518] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47519] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47520] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47521] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47522] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47523] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47524] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47525] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47526] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47527] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47528] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47529] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47530] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47531] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47532] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47533] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47534] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47535] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47536] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47537] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47538] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47539] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47540] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47541] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47542] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47544] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47546] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47547] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47548] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47549] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47550] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47551] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47552] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47553] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47554] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47555] = "fixed-version: Fixed from version 5.4.163"
+
+CVE_STATUS[CVE-2021-47556] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47557] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47558] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47559] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47560] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47561] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47562] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47563] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47564] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47565] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47566] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47567] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47568] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47569] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47570] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47571] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47572] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47576] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47577] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47578] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47579] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47580] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47582] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47583] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47584] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47585] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47586] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47587] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47588] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47589] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47590] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47591] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47592] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47593] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47594] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47595] = "fixed-version: Fixed from version 5.10.88"
+
+CVE_STATUS[CVE-2021-47596] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47597] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47598] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47599] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47600] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47601] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47602] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47603] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47604] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47605] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47606] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47607] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47608] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47609] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47610] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47611] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47612] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47613] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47614] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47616] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47617] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47618] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47619] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47620] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47622] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47623] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47624] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-4439] = "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-4440] = "fixed-version: Fixed from version 5.10.218"
+
+CVE_STATUS[CVE-2021-4441] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-4442] = "fixed-version: Fixed from version 5.12"
+
+# CVE-2022-26365 has no known resolution
+
+# CVE-2022-33740 has no known resolution
+
+# CVE-2022-33741 has no known resolution
+
+# CVE-2022-33742 has no known resolution
+
+# CVE-2022-33743 has no known resolution
+
+# CVE-2022-33744 has no known resolution
+
+# CVE-2022-3643 has no known resolution
+
+# CVE-2022-42328 has no known resolution
+
+# CVE-2022-42329 has no known resolution
+
+CVE_STATUS[CVE-2022-48626] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48627] = "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-48628] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2022-48629] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48630] = "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2022-48631] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48632] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48633] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48634] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48635] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48636] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48637] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48638] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48639] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48640] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48641] = "fixed-version: Fixed from version 4.14.295"
+
+CVE_STATUS[CVE-2022-48642] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48643] = "fixed-version: Fixed from version 5.10.146"
+
+CVE_STATUS[CVE-2022-48644] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48645] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48646] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48647] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48648] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48649] = "fixed-version: Fixed from version 5.19.12"
+
+CVE_STATUS[CVE-2022-48650] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48651] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48652] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48653] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48654] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48655] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48656] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48657] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48658] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48659] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48660] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48661] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48662] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48663] = "fixed-version: Fixed from version 5.10.146"
+
+CVE_STATUS[CVE-2022-48664] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48665] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48666] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48667] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48668] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48669] = "fixed-version: Fixed from version 6.9"
+
+CVE_STATUS[CVE-2022-48670] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48671] = "fixed-version: Fixed from version 5.4.215"
+
+CVE_STATUS[CVE-2022-48672] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48673] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48674] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48675] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48686] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48687] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48688] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48689] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48690] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48691] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48692] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48693] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48694] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48695] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48696] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48697] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48698] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48699] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48701] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48702] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48703] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48704] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48705] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48706] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48707] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48708] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48709] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48710] = "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-48711] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48712] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48713] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48714] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48715] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48716] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48717] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48718] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48719] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48720] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48721] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48722] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48723] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48724] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48725] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48726] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48727] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48728] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48729] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48730] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48731] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48732] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48733] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48734] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48735] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48738] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48739] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48740] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48741] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48742] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48743] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48744] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48745] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48746] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48747] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48748] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48749] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48750] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48751] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48752] = "fixed-version: Fixed from version 5.10.96"
+
+CVE_STATUS[CVE-2022-48753] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48754] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48755] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48756] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48757] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48758] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48759] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48760] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48761] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48762] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48763] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48764] = "fixed-version: Fixed from version 5.16.5"
+
+CVE_STATUS[CVE-2022-48765] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48766] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48767] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48768] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48769] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48770] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48771] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48772] = "fixed-version: Fixed from version 6.10"
+
+CVE_STATUS[CVE-2022-48773] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48774] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48775] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48776] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48777] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48778] = "fixed-version: Fixed from version 5.4.181"
+
+CVE_STATUS[CVE-2022-48779] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48780] = "fixed-version: Fixed from version 5.15.25"
+
+CVE_STATUS[CVE-2022-48781] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48782] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48783] = "fixed-version: Fixed from version 5.10.102"
+
+CVE_STATUS[CVE-2022-48784] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48785] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48786] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48787] = "fixed-version: Fixed from version 4.14.268"
+
+CVE_STATUS[CVE-2022-48788] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48789] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48790] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48791] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48792] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48793] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48794] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48795] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48796] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48797] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48798] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48799] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48800] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48801] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48802] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48803] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48804] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48805] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48806] = "fixed-version: Fixed from version 5.4.180"
+
+CVE_STATUS[CVE-2022-48807] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48808] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48809] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48810] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48811] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48812] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48813] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48814] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48815] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48816] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48817] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48818] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48819] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48820] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48821] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48822] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48823] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48824] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48825] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48826] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48827] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48828] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48829] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48830] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48831] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48832] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48833] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48834] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48835] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48836] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48837] = "fixed-version: Fixed from version 4.9.308"
+
+CVE_STATUS[CVE-2022-48838] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48839] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.15.31"
+
+CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48842] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48843] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48844] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48845] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48846] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48847] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48848] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48849] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48850] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48851] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48852] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48853] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48854] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48855] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48856] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48857] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48858] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48859] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48860] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48861] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48862] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48863] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48864] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48865] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48866] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48867] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48868] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48869] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48870] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48871] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48872] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48873] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48874] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48875] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48876] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48877] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48878] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48879] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48880] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48881] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48882] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48883] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48884] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48885] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48886] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48887] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48888] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48889] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48890] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48891] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48892] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48893] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48894] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48895] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48896] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48897] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48898] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48899] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48901] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48902] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48903] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48904] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48905] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48906] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48907] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48908] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48909] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48910] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48911] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48912] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48913] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48914] = "fixed-version: Fixed from version 4.19.233"
+
+CVE_STATUS[CVE-2022-48915] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48916] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 4.9.305"
+
+CVE_STATUS[CVE-2022-48918] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48919] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48920] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48921] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48922] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48923] = "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48924] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2004-0230] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48925] = "fixed-version: Fixed from version 5.17"
 
-# CVE-2005-3660 has no known resolution
+CVE_STATUS[CVE-2022-48926] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2006-3635] = "fixed-version: Fixed from version 2.6.26rc5"
+CVE_STATUS[CVE-2022-48927] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2006-5331] = "fixed-version: Fixed from version 2.6.19rc3"
+CVE_STATUS[CVE-2022-48928] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2006-6128] = "fixed-version: Fixed from version 2.6.19rc2"
+CVE_STATUS[CVE-2022-48929] = "fixed-version: Fixed from version 5.16.12"
 
-# CVE-2007-3719 has no known resolution
+CVE_STATUS[CVE-2022-48930] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2007-4774] = "fixed-version: Fixed from version 2.6.12rc2"
+CVE_STATUS[CVE-2022-48931] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2007-6761] = "fixed-version: Fixed from version 2.6.24rc6"
+CVE_STATUS[CVE-2022-48932] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2007-6762] = "fixed-version: Fixed from version 2.6.20rc5"
+CVE_STATUS[CVE-2022-48933] = "fixed-version: Fixed from version 5.17"
 
-# CVE-2008-2544 has no known resolution
+CVE_STATUS[CVE-2022-48934] = "fixed-version: Fixed from version 5.17"
 
-# CVE-2008-4609 has no known resolution
+CVE_STATUS[CVE-2022-48935] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2008-7316] = "fixed-version: Fixed from version 2.6.25rc1"
+CVE_STATUS[CVE-2022-48937] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2009-2692] = "fixed-version: Fixed from version 2.6.31rc6"
+CVE_STATUS[CVE-2022-48938] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2010-0008] = "fixed-version: Fixed from version 2.6.23rc9"
+CVE_STATUS[CVE-2022-48939] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2010-3432] = "fixed-version: Fixed from version 2.6.36rc5"
+CVE_STATUS[CVE-2022-48940] = "fixed-version: Fixed from version 5.17"
 
-# CVE-2010-4563 has no known resolution
+CVE_STATUS[CVE-2022-48941] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2010-4648] = "fixed-version: Fixed from version 2.6.37rc6"
+CVE_STATUS[CVE-2022-48942] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2010-5313] = "fixed-version: Fixed from version 2.6.38rc1"
+CVE_STATUS[CVE-2022-48943] = "fixed-version: Fixed from version 5.17"
 
-# CVE-2010-5321 has no known resolution
+CVE_STATUS[CVE-2022-48944] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2010-5328] = "fixed-version: Fixed from version 2.6.35rc1"
+CVE_STATUS[CVE-2022-48945] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2010-5329] = "fixed-version: Fixed from version 2.6.39rc1"
+CVE_STATUS[CVE-2022-48946] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2010-5331] = "fixed-version: Fixed from version 2.6.34rc7"
+CVE_STATUS[CVE-2022-48947] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2010-5332] = "fixed-version: Fixed from version 2.6.37rc1"
+CVE_STATUS[CVE-2022-48948] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2011-4098] = "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48949] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2011-4131] = "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-48950] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2011-4915] = "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48951] = "fixed-version: Fixed from version 6.1"
 
-# CVE-2011-4916 has no known resolution
+CVE_STATUS[CVE-2022-48952] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2011-4917 has no known resolution
+CVE_STATUS[CVE-2022-48953] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2011-5321] = "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48954] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2011-5327] = "fixed-version: Fixed from version 3.1rc1"
+CVE_STATUS[CVE-2022-48955] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-0957] = "fixed-version: Fixed from version 3.7rc2"
+CVE_STATUS[CVE-2022-48956] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2119] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48957] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2136] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48958] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2137] = "fixed-version: Fixed from version 3.5rc2"
+CVE_STATUS[CVE-2022-48959] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2313] = "fixed-version: Fixed from version 3.4rc6"
+CVE_STATUS[CVE-2022-48960] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2319] = "fixed-version: Fixed from version 3.4rc6"
+CVE_STATUS[CVE-2022-48961] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2372] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2022-48962] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2375] = "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-48963] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2390] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48964] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2669] = "fixed-version: Fixed from version 3.5rc4"
+CVE_STATUS[CVE-2022-48965] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2744] = "fixed-version: Fixed from version 2.6.34rc1"
+CVE_STATUS[CVE-2022-48966] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-2745] = "fixed-version: Fixed from version 3.4rc3"
+CVE_STATUS[CVE-2022-48967] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3364] = "fixed-version: Fixed from version 3.5rc6"
+CVE_STATUS[CVE-2022-48968] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3375] = "fixed-version: Fixed from version 3.4rc5"
+CVE_STATUS[CVE-2022-48969] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3400] = "fixed-version: Fixed from version 3.5rc5"
+CVE_STATUS[CVE-2022-48970] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3412] = "fixed-version: Fixed from version 3.6rc2"
+CVE_STATUS[CVE-2022-48971] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3430] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48972] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3510] = "fixed-version: Fixed from version 2.6.19rc4"
+CVE_STATUS[CVE-2022-48973] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3511] = "fixed-version: Fixed from version 3.5rc6"
+CVE_STATUS[CVE-2022-48974] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3520] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48975] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-3552] = "fixed-version: Fixed from version 3.0rc1"
+CVE_STATUS[CVE-2022-48976] = "fixed-version: Fixed from version 6.1"
 
-# Skipping CVE-2012-4220, no affected_versions
+CVE_STATUS[CVE-2022-48977] = "fixed-version: Fixed from version 6.1"
 
-# Skipping CVE-2012-4221, no affected_versions
+CVE_STATUS[CVE-2022-48978] = "fixed-version: Fixed from version 6.1"
 
-# Skipping CVE-2012-4222, no affected_versions
+CVE_STATUS[CVE-2022-48979] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4398] = "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-48980] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4444] = "fixed-version: Fixed from version 2.6.36rc4"
+CVE_STATUS[CVE-2022-48981] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4461] = "fixed-version: Fixed from version 3.7rc6"
+CVE_STATUS[CVE-2022-48982] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4467] = "fixed-version: Fixed from version 3.6rc5"
+CVE_STATUS[CVE-2022-48983] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4508] = "fixed-version: Fixed from version 3.7rc3"
+CVE_STATUS[CVE-2022-48984] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4530] = "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48985] = "fixed-version: Fixed from version 6.1"
 
-# CVE-2012-4542 has no known resolution
+CVE_STATUS[CVE-2022-48986] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-4565] = "fixed-version: Fixed from version 3.7rc4"
+CVE_STATUS[CVE-2022-48987] = "fixed-version: Fixed from version 4.9.336"
 
-CVE_STATUS[CVE-2012-5374] = "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48988] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-5375] = "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48989] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-5517] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48990] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6536] = "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48991] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6537] = "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48992] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6538] = "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48994] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6539] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48995] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6540] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48996] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6541] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48997] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6542] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48998] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6543] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48999] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6544] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49000] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6545] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49001] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6546] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49002] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6547] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49003] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6548] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49004] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6549] = "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49005] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6638] = "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-49006] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6647] = "fixed-version: Fixed from version 3.6rc2"
+CVE_STATUS[CVE-2022-49007] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6657] = "fixed-version: Fixed from version 3.6"
+CVE_STATUS[CVE-2022-49008] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6689] = "fixed-version: Fixed from version 3.6rc5"
+CVE_STATUS[CVE-2022-49009] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6701] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49010] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6703] = "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2022-49011] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6704] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49012] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2012-6712] = "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-49013] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0160] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49014] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0190] = "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49015] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0216] = "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49016] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0217] = "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49017] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0228] = "fixed-version: Fixed from version 3.8"
+CVE_STATUS[CVE-2022-49018] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0231] = "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49019] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0268] = "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2022-49020] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0290] = "fixed-version: Fixed from version 3.8"
+CVE_STATUS[CVE-2022-49021] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0309] = "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2022-49022] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0310] = "fixed-version: Fixed from version 3.5"
+CVE_STATUS[CVE-2022-49023] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0311] = "fixed-version: Fixed from version 3.7rc8"
+CVE_STATUS[CVE-2022-49024] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0313] = "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49025] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0343] = "fixed-version: Fixed from version 3.11rc7"
+CVE_STATUS[CVE-2022-49026] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0349] = "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2022-49027] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0871] = "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49028] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0913] = "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2022-49029] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-0914] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2022-49030] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-1059] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2022-49031] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-1763] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49032] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-1767] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49033] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-1772] = "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49034] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2013-1773] = "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-49035] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2013-1774] = "fixed-version: Fixed from version 3.8rc5"
+# CVE-2023-34319 has no known resolution
 
-CVE_STATUS[CVE-2013-1792] = "fixed-version: Fixed from version 3.9rc3"
+# CVE-2023-34324 has no known resolution
 
-CVE_STATUS[CVE-2013-1796] = "fixed-version: Fixed from version 3.9rc4"
+# CVE-2023-46838 has no known resolution
 
-CVE_STATUS[CVE-2013-1797] = "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-1798] = "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52434] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2013-1819] = "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2023-52435] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2013-1826] = "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2023-52436] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1827] = "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2023-52438] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1828] = "fixed-version: Fixed from version 3.9rc2"
+CVE_STATUS[CVE-2023-52439] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1848] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52440] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-1858] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52441] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2013-1860] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52442] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2013-1928] = "fixed-version: Fixed from version 3.7rc3"
+CVE_STATUS[CVE-2023-52443] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1929] = "fixed-version: Fixed from version 3.9rc6"
+CVE_STATUS[CVE-2023-52444] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2013-1935, no affected_versions
+CVE_STATUS[CVE-2023-52445] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1943] = "fixed-version: Fixed from version 3.0rc1"
+CVE_STATUS[CVE-2023-52446] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1956] = "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52447] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1957] = "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52448] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1958] = "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52449] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1959] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52450] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-1979] = "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52451] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2015] = "fixed-version: Fixed from version 3.8rc2"
+CVE_STATUS[CVE-2023-52452] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2017] = "fixed-version: Fixed from version 2.6.34"
+CVE_STATUS[CVE-2023-52453] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2058] = "fixed-version: Fixed from version 3.8rc4"
+CVE_STATUS[CVE-2023-52454] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2094] = "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52455] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2128] = "fixed-version: Fixed from version 2.6.34rc4"
+CVE_STATUS[CVE-2023-52456] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2140] = "fixed-version: Fixed from version 3.11rc3"
+CVE_STATUS[CVE-2023-52457] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2141] = "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52458] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2146] = "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52459] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2147] = "fixed-version: Fixed from version 3.12rc3"
+CVE_STATUS[CVE-2023-52460] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2148] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52461] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2164] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52462] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2013-2188, no affected_versions
+CVE_STATUS[CVE-2023-52463] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2206] = "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52464] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2013-2224, no affected_versions
+CVE_STATUS[CVE-2023-52465] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2232] = "fixed-version: Fixed from version 3.10"
+CVE_STATUS[CVE-2023-52467] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2234] = "fixed-version: Fixed from version 3.10"
+CVE_STATUS[CVE-2023-52468] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2237] = "fixed-version: Fixed from version 3.9rc6"
+CVE_STATUS[CVE-2023-52469] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2013-2239, no affected_versions
+CVE_STATUS[CVE-2023-52470] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2546] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52471] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2547] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52472] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2548] = "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52473] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2596] = "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52474] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2013-2634] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52475] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2635] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52476] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2636] = "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52477] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2850] = "fixed-version: Fixed from version 3.10rc4"
+CVE_STATUS[CVE-2023-52478] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2851] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52479] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2852] = "fixed-version: Fixed from version 3.10rc6"
+CVE_STATUS[CVE-2023-52480] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2888] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52481] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2889] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52482] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2890] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52483] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2891] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52484] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-2892] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52485] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2893] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52486] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2894] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52487] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2895] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52488] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2896] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52489] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2897] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52490] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2898] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52491] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2899] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52492] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2929] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52493] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-2930] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52494] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-3076] = "fixed-version: Fixed from version 3.9"
+CVE_STATUS[CVE-2023-52495] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-3222] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52497] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-3223] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52498] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-3224] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52499] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3225] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52500] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3226] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52501] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3227] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52502] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3228] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52503] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3229] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52504] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3230] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52505] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3231] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52506] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3232] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52507] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3233] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52508] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3234] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52509] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3235] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52510] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3236] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52511] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3237] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52512] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3301] = "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52513] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-3302] = "fixed-version: Fixed from version 3.8rc3"
+CVE_STATUS[CVE-2023-52515] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4125] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52516] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4127] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52517] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4129] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52518] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4162] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52519] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4163] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52520] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4205] = "fixed-version: Fixed from version 3.11rc5"
+CVE_STATUS[CVE-2023-52522] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4220] = "fixed-version: Fixed from version 3.10rc4"
+CVE_STATUS[CVE-2023-52523] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4247] = "fixed-version: Fixed from version 3.10rc5"
+CVE_STATUS[CVE-2023-52524] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4254] = "fixed-version: Fixed from version 3.11rc6"
+CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 4.14.327"
 
-CVE_STATUS[CVE-2013-4270] = "fixed-version: Fixed from version 3.12rc4"
+CVE_STATUS[CVE-2023-52526] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4299] = "fixed-version: Fixed from version 3.12rc6"
+CVE_STATUS[CVE-2023-52527] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4300] = "fixed-version: Fixed from version 3.11"
+CVE_STATUS[CVE-2023-52528] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4312] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2023-52529] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4343] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52530] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4345] = "fixed-version: Fixed from version 3.13rc2"
+CVE_STATUS[CVE-2023-52531] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4348] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52532] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4350] = "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52559] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4387] = "fixed-version: Fixed from version 3.12rc4"
+CVE_STATUS[CVE-2023-52560] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4470] = "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52561] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4483] = "fixed-version: Fixed from version 3.10rc1"
+CVE_STATUS[CVE-2023-52562] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4511] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52563] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4512] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52564] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4513] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52565] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4514] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52566] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4515] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52567] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4516] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52568] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4563] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52569] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4579] = "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52570] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4587] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52571] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4588] = "fixed-version: Fixed from version 2.6.33rc4"
+CVE_STATUS[CVE-2023-52572] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4591] = "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2023-52573] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-4592] = "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2023-52574] = "fixed-version: Fixed from version 6.6"
 
-# Skipping CVE-2013-4737, no affected_versions
+CVE_STATUS[CVE-2023-52576] = "fixed-version: Fixed from version 6.6"
 
-# Skipping CVE-2013-4738, no affected_versions
+CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 4.14.327"
 
-# Skipping CVE-2013-4739, no affected_versions
+CVE_STATUS[CVE-2023-52578] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-5634] = "fixed-version: Fixed from version 3.10rc5"
+CVE_STATUS[CVE-2023-52580] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-6282] = "fixed-version: Fixed from version 3.6rc6"
+CVE_STATUS[CVE-2023-52581] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-6367] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52582] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2013-6368] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52583] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6376] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52584] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6378] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52585] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6380] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52586] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6381] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52587] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6382] = "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52588] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6383] = "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52589] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2013-6392, no affected_versions
+CVE_STATUS[CVE-2023-52590] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6431] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52591] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6432] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52593] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-6885] = "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52594] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7026] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52595] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7027] = "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52596] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7263] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52597] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7264] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52598] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7265] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52599] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7266] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52600] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7267] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52601] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7268] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52602] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7269] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52603] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7270] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52604] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7271] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52606] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7281] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52607] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7339] = "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52608] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7348] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52609] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7421] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52610] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2013-7445 has no known resolution
+CVE_STATUS[CVE-2023-52611] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7446] = "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2023-52612] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2013-7470] = "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52613] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0038] = "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52614] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0049] = "fixed-version: Fixed from version 3.14rc5"
+CVE_STATUS[CVE-2023-52615] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0055] = "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52616] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0069] = "fixed-version: Fixed from version 3.14rc4"
+CVE_STATUS[CVE-2023-52617] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0077] = "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52618] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0100] = "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52619] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0101] = "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52620] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2014-0102] = "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52621] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0131] = "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52622] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0155] = "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52623] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0181] = "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52624] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0196] = "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52625] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0203] = "fixed-version: Fixed from version 2.6.33rc5"
+CVE_STATUS[CVE-2023-52626] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0205] = "fixed-version: Fixed from version 2.6.37rc1"
+CVE_STATUS[CVE-2023-52627] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-0206] = "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52628] = "fixed-version: Fixed from version 6.6"
 
-# Skipping CVE-2014-0972, no affected_versions
+CVE_STATUS[CVE-2023-52629] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2014-1438] = "fixed-version: Fixed from version 3.13"
+CVE_STATUS[CVE-2023-52631] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1444] = "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52632] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1445] = "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52633] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1446] = "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52634] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1690] = "fixed-version: Fixed from version 3.13rc8"
+CVE_STATUS[CVE-2023-52635] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1737] = "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52636] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1738] = "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52637] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1739] = "fixed-version: Fixed from version 3.15rc6"
+CVE_STATUS[CVE-2023-52638] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-1874] = "fixed-version: Fixed from version 3.14rc2"
+CVE_STATUS[CVE-2023-52639] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2038] = "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52640] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2039] = "fixed-version: Fixed from version 3.14rc3"
+CVE_STATUS[CVE-2023-52641] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2309] = "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52642] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2523] = "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52643] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2568] = "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52644] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2580] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52645] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-2672] = "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52646] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-2673] = "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52647] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2678] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52648] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2706] = "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52649] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2739] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52650] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2851] = "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52652] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-2889] = "fixed-version: Fixed from version 3.2rc7"
+CVE_STATUS[CVE-2023-52653] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-3122] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52654] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-3144] = "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52655] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-3145] = "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52656] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3153] = "fixed-version: Fixed from version 3.15"
+CVE_STATUS[CVE-2023-52657] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3180] = "fixed-version: Fixed from version 3.17rc4"
+CVE_STATUS[CVE-2023-52658] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3181] = "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52659] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-3182] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52660] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3183] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52661] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-3184] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52662] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-3185] = "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52663] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-3186] = "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52664] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2014-3519, no affected_versions
+CVE_STATUS[CVE-2023-52667] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3534] = "fixed-version: Fixed from version 3.16rc7"
+CVE_STATUS[CVE-2023-52668] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3535] = "fixed-version: Fixed from version 2.6.36rc1"
+CVE_STATUS[CVE-2023-52669] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3601] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52670] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3610] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52671] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3611] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52672] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3631] = "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52673] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3645] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52674] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3646] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52675] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3647] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52676] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3673] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52677] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3687] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52678] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3688] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52679] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3690] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52680] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3917] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52681] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-3940] = "fixed-version: Fixed from version 3.15"
+CVE_STATUS[CVE-2023-52682] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4014] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52683] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4027] = "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52684] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4157] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52686] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4171] = "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52687] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2014-4322, no affected_versions
+CVE_STATUS[CVE-2023-52688] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2014-4323, no affected_versions
+CVE_STATUS[CVE-2023-52689] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4508] = "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52690] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4608] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52691] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4611] = "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52692] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4652] = "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52693] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4653] = "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52694] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4654] = "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52695] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4655] = "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52696] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4656] = "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52697] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4667] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52698] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2014-4699] = "fixed-version: Fixed from version 3.16rc4"
+CVE_STATUS[CVE-2023-52699] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2014-4943] = "fixed-version: Fixed from version 3.16rc6"
+CVE_STATUS[CVE-2023-52700] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5045] = "fixed-version: Fixed from version 3.16rc7"
+CVE_STATUS[CVE-2023-52701] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5077] = "fixed-version: Fixed from version 3.16"
+CVE_STATUS[CVE-2023-52702] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5206] = "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52703] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5207] = "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52704] = "fixed-version: Fixed from version 6.2"
 
-# Skipping CVE-2014-5332, no affected_versions
+CVE_STATUS[CVE-2023-52705] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5471] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52706] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-5472] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52707] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-6410] = "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52708] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-6416] = "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52730] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-6417] = "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52731] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-6418] = "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52732] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7145] = "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52733] = "fixed-version: Fixed from version 6.2"
 
-# Skipping CVE-2014-7207, no affected_versions
+CVE_STATUS[CVE-2023-52735] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7283] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52736] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7284] = "fixed-version: Fixed from version 3.15rc7"
+CVE_STATUS[CVE-2023-52737] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7822] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52738] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7825] = "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52739] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7826] = "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52740] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7841] = "fixed-version: Fixed from version 3.18rc5"
+CVE_STATUS[CVE-2023-52741] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7842] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52742] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7843] = "fixed-version: Fixed from version 3.18rc5"
+CVE_STATUS[CVE-2023-52743] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7970] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52744] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-7975] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52745] = "fixed-version: Fixed from version 5.4.232"
 
-CVE_STATUS[CVE-2014-8086] = "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52746] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-8133] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52747] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2014-8134] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52748] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8159] = "fixed-version: Fixed from version 4.0rc7"
+CVE_STATUS[CVE-2023-52749] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8160] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52750] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8171] = "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52751] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8172] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52752] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8173] = "fixed-version: Fixed from version 3.13rc5"
+CVE_STATUS[CVE-2023-52753] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-8181, no affected_versions
+CVE_STATUS[CVE-2023-52754] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8369] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52755] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8480] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52757] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8481] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52760] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8559] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52761] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8709] = "fixed-version: Fixed from version 3.14rc3"
+CVE_STATUS[CVE-2023-52762] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8884] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52763] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-8989] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52764] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9090] = "fixed-version: Fixed from version 3.18rc6"
+CVE_STATUS[CVE-2023-52765] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9322] = "fixed-version: Fixed from version 3.18rc6"
+CVE_STATUS[CVE-2023-52766] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9419] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52767] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9420] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52768] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9428] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52769] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9529] = "fixed-version: Fixed from version 3.19rc4"
+CVE_STATUS[CVE-2023-52770] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9584] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52771] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9585] = "fixed-version: Fixed from version 3.19rc4"
+CVE_STATUS[CVE-2023-52772] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9644] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52773] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9683] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52774] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9710] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52775] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9715] = "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52776] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9717] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52777] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9728] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52778] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9729] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52779] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9730] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52780] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9731] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52781] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9777, no affected_versions
+CVE_STATUS[CVE-2023-52782] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9778, no affected_versions
+CVE_STATUS[CVE-2023-52783] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9779, no affected_versions
+CVE_STATUS[CVE-2023-52784] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9780, no affected_versions
+CVE_STATUS[CVE-2023-52785] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9781, no affected_versions
+CVE_STATUS[CVE-2023-52786] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9782, no affected_versions
+CVE_STATUS[CVE-2023-52787] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9783, no affected_versions
+CVE_STATUS[CVE-2023-52788] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9784, no affected_versions
+CVE_STATUS[CVE-2023-52789] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9785, no affected_versions
+CVE_STATUS[CVE-2023-52790] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9786, no affected_versions
+CVE_STATUS[CVE-2023-52791] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9787, no affected_versions
+CVE_STATUS[CVE-2023-52792] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9788, no affected_versions
+CVE_STATUS[CVE-2023-52794] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9789, no affected_versions
+CVE_STATUS[CVE-2023-52795] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9803] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52796] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9863, no affected_versions
+CVE_STATUS[CVE-2023-52797] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9864, no affected_versions
+CVE_STATUS[CVE-2023-52798] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9865, no affected_versions
+CVE_STATUS[CVE-2023-52799] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9866, no affected_versions
+CVE_STATUS[CVE-2023-52800] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9867, no affected_versions
+CVE_STATUS[CVE-2023-52801] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9868, no affected_versions
+CVE_STATUS[CVE-2023-52803] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9869, no affected_versions
+CVE_STATUS[CVE-2023-52804] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9870] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52805] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9871, no affected_versions
+CVE_STATUS[CVE-2023-52806] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9872, no affected_versions
+CVE_STATUS[CVE-2023-52807] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9873, no affected_versions
+CVE_STATUS[CVE-2023-52808] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9874, no affected_versions
+CVE_STATUS[CVE-2023-52809] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9875, no affected_versions
+CVE_STATUS[CVE-2023-52810] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9876, no affected_versions
+CVE_STATUS[CVE-2023-52811] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9877, no affected_versions
+CVE_STATUS[CVE-2023-52812] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9878, no affected_versions
+CVE_STATUS[CVE-2023-52813] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9879, no affected_versions
+CVE_STATUS[CVE-2023-52814] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9880, no affected_versions
+CVE_STATUS[CVE-2023-52815] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9881, no affected_versions
+CVE_STATUS[CVE-2023-52816] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9882, no affected_versions
+CVE_STATUS[CVE-2023-52817] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9883, no affected_versions
+CVE_STATUS[CVE-2023-52818] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9884, no affected_versions
+CVE_STATUS[CVE-2023-52819] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9885, no affected_versions
+CVE_STATUS[CVE-2023-52821] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9886, no affected_versions
+CVE_STATUS[CVE-2023-52825] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9887, no affected_versions
+CVE_STATUS[CVE-2023-52826] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9888] = "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52827] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9889, no affected_versions
+CVE_STATUS[CVE-2023-52828] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9890, no affected_versions
+CVE_STATUS[CVE-2023-52829] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9891, no affected_versions
+CVE_STATUS[CVE-2023-52831] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9892, no affected_versions
+CVE_STATUS[CVE-2023-52832] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9893, no affected_versions
+CVE_STATUS[CVE-2023-52833] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9894, no affected_versions
+CVE_STATUS[CVE-2023-52834] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9895] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52835] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9896, no affected_versions
+CVE_STATUS[CVE-2023-52836] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9897, no affected_versions
+CVE_STATUS[CVE-2023-52837] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9898, no affected_versions
+CVE_STATUS[CVE-2023-52838] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9899, no affected_versions
+CVE_STATUS[CVE-2023-52839] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2014-9900, no affected_versions
+CVE_STATUS[CVE-2023-52840] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9903] = "fixed-version: Fixed from version 3.14rc4"
+CVE_STATUS[CVE-2023-52841] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9904] = "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52842] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9914] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52843] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9922] = "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52844] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2014-9940] = "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52845] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-0239] = "fixed-version: Fixed from version 3.19rc6"
+CVE_STATUS[CVE-2023-52846] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-0274] = "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52847] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-0275] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52848] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2015-0777, no affected_versions
+CVE_STATUS[CVE-2023-52849] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2015-1328, no affected_versions
+CVE_STATUS[CVE-2023-52850] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1333] = "fixed-version: Fixed from version 4.2rc5"
+CVE_STATUS[CVE-2023-52851] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1339] = "fixed-version: Fixed from version 4.4rc5"
+CVE_STATUS[CVE-2023-52852] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1350] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2023-52853] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1420] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52854] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1421] = "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52855] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1465] = "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52856] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1573] = "fixed-version: Fixed from version 3.19rc5"
+CVE_STATUS[CVE-2023-52857] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1593] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52858] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-1805] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52859] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2041] = "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52860] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2042] = "fixed-version: Fixed from version 3.19"
+CVE_STATUS[CVE-2023-52861] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2150] = "fixed-version: Fixed from version 4.0rc4"
+CVE_STATUS[CVE-2023-52862] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2666] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52863] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2672] = "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2023-52864] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2686] = "fixed-version: Fixed from version 4.0rc6"
+CVE_STATUS[CVE-2023-52865] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2830] = "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2023-52866] = "fixed-version: Fixed from version 6.7"
 
-# CVE-2015-2877 has no known resolution
+CVE_STATUS[CVE-2023-52867] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2922] = "fixed-version: Fixed from version 4.0rc7"
+CVE_STATUS[CVE-2023-52868] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-2925] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52869] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3212] = "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2023-52870] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3214] = "fixed-version: Fixed from version 2.6.33rc8"
+CVE_STATUS[CVE-2023-52871] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3288] = "fixed-version: Fixed from version 4.2rc2"
+CVE_STATUS[CVE-2023-52872] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3290] = "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52873] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3291] = "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52874] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3331] = "fixed-version: Fixed from version 4.0rc5"
+CVE_STATUS[CVE-2023-52875] = "fixed-version: Fixed from version 6.7"
 
-# Skipping CVE-2015-3332, no affected_versions
+CVE_STATUS[CVE-2023-52876] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3339] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52877] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-3636] = "fixed-version: Fixed from version 4.1rc2"
+CVE_STATUS[CVE-2023-52878] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-4001] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52879] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-4002] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52880] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2015-4003] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52881] = "fixed-version: Fixed from version 6.7"
 
-CVE_STATUS[CVE-2015-4004] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52882] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2015-4036] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52883] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2015-4167] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52884] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2015-4170] = "fixed-version: Fixed from version 3.13rc5"
+CVE_STATUS[CVE-2023-52885] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2015-4176] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52886] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2015-4177] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52887] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2015-4178] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52888] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2015-4692] = "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2023-52889] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2015-4700] = "fixed-version: Fixed from version 4.1rc6"
+CVE_STATUS[CVE-2023-52893] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5156] = "fixed-version: Fixed from version 4.2rc7"
+CVE_STATUS[CVE-2023-52894] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5157] = "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52895] = "fixed-version: Fixed from version 6.1.8"
 
-CVE_STATUS[CVE-2015-5257] = "fixed-version: Fixed from version 4.3rc3"
+CVE_STATUS[CVE-2023-52896] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5283] = "fixed-version: Fixed from version 4.3rc3"
+CVE_STATUS[CVE-2023-52897] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5307] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52898] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5327] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52899] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5364] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52900] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5366] = "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52901] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5697] = "fixed-version: Fixed from version 4.2rc6"
+CVE_STATUS[CVE-2023-52902] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5706] = "fixed-version: Fixed from version 4.1rc3"
+CVE_STATUS[CVE-2023-52903] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-5707] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52904] = "fixed-version: Fixed from version 5.15.168"
 
-CVE_STATUS[CVE-2015-6252] = "fixed-version: Fixed from version 4.2rc5"
+CVE_STATUS[CVE-2023-52905] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-6526] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52906] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2015-6619 has no known resolution
+CVE_STATUS[CVE-2023-52907] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2015-6646 has no known resolution
+CVE_STATUS[CVE-2023-52908] = "fixed-version: Fixed from version 6.1.7"
 
-CVE_STATUS[CVE-2015-6937] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52909] = "fixed-version: Fixed from version 6.2"
 
-# Skipping CVE-2015-7312, no affected_versions
+CVE_STATUS[CVE-2023-52910] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-7509] = "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2023-52911] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-7513] = "fixed-version: Fixed from version 4.4rc7"
+CVE_STATUS[CVE-2023-52912] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-7515] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2023-52913] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2015-7550] = "fixed-version: Fixed from version 4.4rc8"
+CVE_STATUS[CVE-2023-52914] = "fixed-version: Fixed from version 6.2"
 
-# Skipping CVE-2015-7553, no affected_versions
+CVE_STATUS[CVE-2023-52915] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2015-7566] = "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2023-52916] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2015-7613] = "fixed-version: Fixed from version 4.3rc4"
+CVE_STATUS[CVE-2023-52917] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2015-7799] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52918] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2015-7833] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2023-52919] = "fixed-version: Fixed from version 6.6"
 
-# Skipping CVE-2015-7837, no affected_versions
+CVE_STATUS[CVE-2023-52920] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-7872] = "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2023-52921] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2015-7884] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52922] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2015-7885] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52923] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2015-7990] = "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2023-52924] = "fixed-version: Fixed from version 6.5"
 
-# Skipping CVE-2015-8019, no affected_versions
+CVE_STATUS[CVE-2023-52925] = "fixed-version: Fixed from version 6.4.12"
 
-CVE_STATUS[CVE-2015-8104] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8215] = "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8324] = "fixed-version: Fixed from version 2.6.34rc1"
+CVE_STATUS[CVE-2024-26583] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8374] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26584] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8539] = "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26585] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8543] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26586] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8550] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26587] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8551] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26588] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8552] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26589] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8553] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26590] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8569] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26591] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8575] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26592] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8660] = "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2024-26593] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8709] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26594] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8746] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26595] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8767] = "fixed-version: Fixed from version 4.3rc4"
+CVE_STATUS[CVE-2024-26596] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8785] = "fixed-version: Fixed from version 4.4rc5"
+CVE_STATUS[CVE-2024-26597] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8787] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26598] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8812] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26599] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8816] = "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26600] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8830] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2024-26601] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8839] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26602] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8844] = "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26603] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8845] = "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26604] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8937, no affected_versions
+CVE_STATUS[CVE-2024-26605] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8938, no affected_versions
+CVE_STATUS[CVE-2024-26606] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8939, no affected_versions
+CVE_STATUS[CVE-2024-26607] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8940, no affected_versions
+CVE_STATUS[CVE-2024-26608] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8941, no affected_versions
+CVE_STATUS[CVE-2024-26610] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8942, no affected_versions
+CVE_STATUS[CVE-2024-26611] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8943, no affected_versions
+CVE_STATUS[CVE-2024-26612] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2015-8944, no affected_versions
+CVE_STATUS[CVE-2024-26614] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8950] = "fixed-version: Fixed from version 4.1rc2"
+CVE_STATUS[CVE-2024-26615] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8952] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26616] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8953] = "fixed-version: Fixed from version 4.3"
+CVE_STATUS[CVE-2024-26617] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8955] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2024-26618] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8956] = "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26619] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8961] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26620] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8962] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26621] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8963] = "fixed-version: Fixed from version 4.4"
+CVE_STATUS[CVE-2024-26622] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8964] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26623] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8966] = "fixed-version: Fixed from version 4.4rc8"
+CVE_STATUS[CVE-2024-26625] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-8967] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26626] = "fixed-version: Fixed from version 6.1.77"
 
-CVE_STATUS[CVE-2015-8970] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26627] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-9004] = "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2024-26629] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-9016] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26630] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2015-9289] = "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26631] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0617] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26632] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0723] = "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2024-26633] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0728] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26634] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0758] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26635] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-0774, no affected_versions
+CVE_STATUS[CVE-2024-26636] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0821] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26637] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-0823] = "fixed-version: Fixed from version 4.0rc5"
+CVE_STATUS[CVE-2024-26638] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10044] = "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26640] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10088] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26641] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10147] = "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26642] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10150] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26643] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10153] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26644] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10154] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26645] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10200] = "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26646] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10208] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26647] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10229] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26648] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10318] = "fixed-version: Fixed from version 4.8rc6"
+CVE_STATUS[CVE-2024-26649] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10723] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-26651] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-10741] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26652] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-10764] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26653] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-10905] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26654] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-10906] = "fixed-version: Fixed from version 4.5rc6"
+CVE_STATUS[CVE-2024-26655] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-10907] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26656] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-1237] = "fixed-version: Fixed from version 4.7rc5"
+CVE_STATUS[CVE-2024-26657] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-1575] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26658] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-1576] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26659] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-1583] = "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26660] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2053] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26661] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2069] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26662] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2070] = "fixed-version: Fixed from version 4.4"
+CVE_STATUS[CVE-2024-26663] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2085] = "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26664] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2117] = "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26665] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2143] = "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26666] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2184] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26667] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2185] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26668] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2186] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26669] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2187] = "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26670] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2188] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-26671] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2383] = "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26672] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2384] = "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26673] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2543] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26674] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2544] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26675] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2545] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26676] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2546] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26677] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2547] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26678] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2548] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26679] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2549] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26680] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2550] = "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26681] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2782] = "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2024-26682] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-2847] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26683] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-2853, no affected_versions
+CVE_STATUS[CVE-2024-26684] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-2854, no affected_versions
+CVE_STATUS[CVE-2024-26685] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3044] = "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26686] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3070] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26687] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3134] = "fixed-version: Fixed from version 4.6rc2"
+CVE_STATUS[CVE-2024-26688] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3135] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26689] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3136] = "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26690] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3137] = "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26691] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3138] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26692] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3139] = "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2024-26693] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3140] = "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26694] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3156] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26695] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3157] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26696] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3672] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26697] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3689] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26698] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-3695, no affected_versions
+CVE_STATUS[CVE-2024-26699] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-3699, no affected_versions
+CVE_STATUS[CVE-2024-26700] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-3707, no affected_versions
+CVE_STATUS[CVE-2024-26702] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3713] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26703] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2016-3775 has no known resolution
+CVE_STATUS[CVE-2024-26704] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2016-3802 has no known resolution
+CVE_STATUS[CVE-2024-26705] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2016-3803 has no known resolution
+CVE_STATUS[CVE-2024-26706] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3841] = "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2024-26707] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3857] = "fixed-version: Fixed from version 4.8rc2"
+CVE_STATUS[CVE-2024-26708] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3951] = "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26709] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-3955] = "fixed-version: Fixed from version 4.6rc3"
+# CVE-2024-26710 has no known resolution
 
-CVE_STATUS[CVE-2016-3961] = "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26711] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4440] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26712] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4470] = "fixed-version: Fixed from version 4.7rc4"
+CVE_STATUS[CVE-2024-26714] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4482] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26715] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4485] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26716] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4486] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26717] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4557] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26718] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4558] = "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26719] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4565] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26721] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4568] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26722] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4569] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26723] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4578] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26724] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4580] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26725] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4581] = "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26726] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4794] = "fixed-version: Fixed from version 4.7rc4"
+CVE_STATUS[CVE-2024-26727] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4805] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26728] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4913] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26729] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4951] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26730] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4997] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26731] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-4998] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26732] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5195] = "fixed-version: Fixed from version 4.9rc2"
+CVE_STATUS[CVE-2024-26733] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5243] = "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26734] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5244] = "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26735] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-5340, no affected_versions
+CVE_STATUS[CVE-2024-26736] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-5342, no affected_versions
+CVE_STATUS[CVE-2024-26737] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-5343, no affected_versions
+CVE_STATUS[CVE-2024-26738] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-5344, no affected_versions
+CVE_STATUS[CVE-2024-26739] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5400] = "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26740] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5412] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26741] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5696] = "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26742] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5728] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26743] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5828] = "fixed-version: Fixed from version 4.7rc6"
+CVE_STATUS[CVE-2024-26744] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-5829] = "fixed-version: Fixed from version 4.7rc5"
+CVE_STATUS[CVE-2024-26745] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2016-5870 has no known resolution
+CVE_STATUS[CVE-2024-26746] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6130] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26747] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6136] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26748] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6156] = "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26749] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6162] = "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26750] = "fixed-version: Fixed from version 5.15.151"
 
-CVE_STATUS[CVE-2016-6187] = "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26751] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6197] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26752] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6198] = "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26753] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6213] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26754] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6327] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26755] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6480] = "fixed-version: Fixed from version 4.8rc3"
+CVE_STATUS[CVE-2024-26756] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6516] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26757] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-6753, no affected_versions
+CVE_STATUS[CVE-2024-26758] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6786] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26759] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6787] = "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26760] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-6828] = "fixed-version: Fixed from version 4.8rc5"
+CVE_STATUS[CVE-2024-26761] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7039] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26762] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7042] = "fixed-version: Fixed from version 4.9rc3"
+CVE_STATUS[CVE-2024-26763] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7097] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26764] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7117] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26765] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-7118, no affected_versions
+CVE_STATUS[CVE-2024-26766] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7425] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26767] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7910] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26768] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7911] = "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26769] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7912] = "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26770] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7913] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26771] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7914] = "fixed-version: Fixed from version 4.6rc4"
+CVE_STATUS[CVE-2024-26772] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7915] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26773] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7916] = "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26774] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-7917] = "fixed-version: Fixed from version 4.5rc6"
+CVE_STATUS[CVE-2024-26775] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8399] = "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26776] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-8401, no affected_versions
+CVE_STATUS[CVE-2024-26777] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-8402, no affected_versions
+CVE_STATUS[CVE-2024-26778] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-8403, no affected_versions
+CVE_STATUS[CVE-2024-26779] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-8404, no affected_versions
+CVE_STATUS[CVE-2024-26780] = "fixed-version: Fixed from version 6.1.81"
 
-CVE_STATUS[CVE-2016-8405] = "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-26781] = "fixed-version: Fixed from version 5.10.212"
 
-# Skipping CVE-2016-8406, no affected_versions
+CVE_STATUS[CVE-2024-26782] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-8407, no affected_versions
+CVE_STATUS[CVE-2024-26783] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8630] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26784] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8632] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26785] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8633] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26786] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8636] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-26787] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8645] = "fixed-version: Fixed from version 4.9rc6"
+CVE_STATUS[CVE-2024-26788] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8646] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26789] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8650] = "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26790] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8655] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26791] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8658] = "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.1.81"
 
-# CVE-2016-8660 has no known resolution
+CVE_STATUS[CVE-2024-26793] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-8666] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.6.21"
 
-CVE_STATUS[CVE-2016-9083] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26795] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9084] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26796] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9120] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26797] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9178] = "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26798] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9191] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-26799] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9313] = "fixed-version: Fixed from version 4.9rc3"
+CVE_STATUS[CVE-2024-26800] = "fixed-version: Fixed from version 6.6.21"
 
-CVE_STATUS[CVE-2016-9555] = "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26801] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9576] = "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26802] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9588] = "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26803] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9604] = "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-26804] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2016-9644, no affected_versions
+CVE_STATUS[CVE-2024-26805] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9685] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26806] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9754] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26807] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9755] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26808] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2016-9756] = "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26809] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-9777] = "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26810] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-9793] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26811] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-9794] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26812] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-9806] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26813] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2016-9919] = "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26814] = "fixed-version: Fixed from version 6.9"
 
-# Skipping CVE-2017-0403, no affected_versions
+CVE_STATUS[CVE-2024-26815] = "fixed-version: Fixed from version 6.9"
 
-# Skipping CVE-2017-0404, no affected_versions
+CVE_STATUS[CVE-2024-26816] = "fixed-version: Fixed from version 6.9"
 
-# Skipping CVE-2017-0426, no affected_versions
+CVE_STATUS[CVE-2024-26817] = "fixed-version: Fixed from version 6.9"
 
-# Skipping CVE-2017-0427, no affected_versions
+CVE_STATUS[CVE-2024-26818] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2017-0507 has no known resolution
+CVE_STATUS[CVE-2024-26820] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2017-0508 has no known resolution
+CVE_STATUS[CVE-2024-26822] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2017-0510, no affected_versions
+CVE_STATUS[CVE-2024-26823] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2017-0528, no affected_versions
+CVE_STATUS[CVE-2024-26824] = "fixed-version: Fixed from version 6.8"
 
-# Skipping CVE-2017-0537, no affected_versions
+CVE_STATUS[CVE-2024-26825] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2017-0564 has no known resolution
+CVE_STATUS[CVE-2024-26826] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-0605] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26828] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-0627] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26829] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2017-0630 has no known resolution
+CVE_STATUS[CVE-2024-26830] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2017-0749 has no known resolution
+CVE_STATUS[CVE-2024-26831] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-0750] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26832] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-0786] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26833] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-0861] = "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-26834] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000] = "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26835] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000111] = "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26836] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000112] = "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26837] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000251] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26838] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000252] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26839] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000253] = "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2024-26840] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000255] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26841] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000363] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-26842] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000364] = "fixed-version: Fixed from version 4.12rc6"
+CVE_STATUS[CVE-2024-26843] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000365] = "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-26844] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000370] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26845] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000371] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26846] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000379] = "fixed-version: Fixed from version 4.12rc6"
+CVE_STATUS[CVE-2024-26847] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000380] = "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-26849] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000405] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-26850] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000407] = "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-26851] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-1000410] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-26852] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-10661] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26853] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-10662] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26854] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-10663] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26855] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-10810] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26856] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-10911] = "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-26857] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-11089] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26858] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-11176] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26859] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-11472] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26860] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-11473] = "fixed-version: Fixed from version 4.13rc2"
+CVE_STATUS[CVE-2024-26861] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-11600] = "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-26862] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12134] = "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26863] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12146] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26864] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12153] = "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-26865] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12154] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26866] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12168] = "fixed-version: Fixed from version 4.9rc6"
+CVE_STATUS[CVE-2024-26867] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-12188] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26868] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12190] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26869] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12192] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26870] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12193] = "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26871] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-12762] = "fixed-version: Fixed from version 4.13rc4"
+CVE_STATUS[CVE-2024-26872] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13080] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26873] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13166] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26874] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13167] = "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26875] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13168] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-26876] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13215] = "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26877] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13216] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-26878] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13220] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2024-26879] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-13221 has no known resolution
+CVE_STATUS[CVE-2024-26880] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-13222 has no known resolution
+CVE_STATUS[CVE-2024-26881] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13305] = "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-26882] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13686] = "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26883] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-13693 has no known resolution
+CVE_STATUS[CVE-2024-26884] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-13694 has no known resolution
+CVE_STATUS[CVE-2024-26885] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13695] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-26886] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-13715] = "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26887] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14051] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26888] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14106] = "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-26889] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14140] = "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26890] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14156] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26891] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14340] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26892] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14489] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26893] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14497] = "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-26894] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14954] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26895] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-14991] = "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-26896] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15102] = "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26897] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15115] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26898] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15116] = "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26899] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15121] = "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2024-26900] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15126] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26901] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-15127] = "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26902] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15128] = "fixed-version: Fixed from version 4.14rc8"
+CVE_STATUS[CVE-2024-26903] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15129] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26906] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15265] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26907] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15274] = "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-26909] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15299] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26910] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15306] = "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26911] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15537] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26912] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15649] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26913] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15868] = "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2024-26914] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-15951] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26915] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16525] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26916] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16526] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26917] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16527] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26918] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16528] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26919] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16529] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26920] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-16530] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26921] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16531] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26922] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16532] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26923] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16533] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26924] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16534] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26925] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16535] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26926] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16536] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26927] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16537] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26928] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16538] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26930] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16643] = "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26931] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16644] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26932] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16645] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26933] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16646] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26934] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16647] = "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26935] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16648] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26936] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16649] = "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26937] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16650] = "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26938] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16911] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26939] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16912] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26940] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16913] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26941] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16914] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26942] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16939] = "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26943] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16994] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26944] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16995] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26945] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-16996] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26946] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17052] = "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26947] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17053] = "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26948] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17448] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26949] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17449] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26950] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17450] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26951] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17558] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26952] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17712] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26953] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17741] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26954] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17805] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26955] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17806] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26956] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17807] = "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-26957] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17852] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26958] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17853] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26959] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17854] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26960] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17855] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17856] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26962] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17857] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26963] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17862] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26964] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17863] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26965] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17864] = "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26966] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-17975] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-26967] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18017] = "fixed-version: Fixed from version 4.11rc7"
+CVE_STATUS[CVE-2024-26968] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18075] = "fixed-version: Fixed from version 4.15rc7"
+CVE_STATUS[CVE-2024-26969] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18079] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26970] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-18169 has no known resolution
+CVE_STATUS[CVE-2024-26971] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18174] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26973] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18193] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26974] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18200] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26975] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18202] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-26976] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18203] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26977] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18204] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26978] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18208] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-26980] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18216] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26981] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18218] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26982] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18221] = "fixed-version: Fixed from version 4.12rc4"
+CVE_STATUS[CVE-2024-26983] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18222] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26984] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18224] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26985] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18232] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26986] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18241] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26987] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18249] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26988] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18255] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26989] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18257] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26990] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18261] = "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26991] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18270] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26992] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18344] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26993] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18360] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-26994] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18379] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26995] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18509] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26996] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18549] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26997] = "fixed-version: Fixed from version 4.19.313"
 
-CVE_STATUS[CVE-2017-18550] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26998] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18551] = "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-26999] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18552] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27000] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-18595] = "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-27001] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2583] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27002] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2584] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27003] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2596] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27004] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2618] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27005] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2634] = "fixed-version: Fixed from version 2.6.25rc1"
+CVE_STATUS[CVE-2024-27006] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2636] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27007] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2647] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-27008] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-2671] = "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27009] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5123] = "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-27010] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5546] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27011] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5547] = "fixed-version: Fixed from version 4.10rc5"
+CVE_STATUS[CVE-2024-27012] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5548] = "fixed-version: Fixed from version 4.10rc5"
+CVE_STATUS[CVE-2024-27013] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5549] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27014] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5550] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27015] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5551] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27016] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5576] = "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-27017] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5577] = "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-27018] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5669] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27019] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5715] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-27020] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5753] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-27021] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5754] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-27022] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5897] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27023] = "fixed-version: Fixed from version 6.1.80"
 
-CVE_STATUS[CVE-2017-5967] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27024] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-5970] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27025] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5972] = "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-27026] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-5986] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27027] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6001] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27028] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6074] = "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27029] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6214] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27030] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6345] = "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27031] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6346] = "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27032] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6347] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27033] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6348] = "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27034] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6353] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27035] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6874] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27036] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-6951] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-27037] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7184] = "fixed-version: Fixed from version 4.11rc5"
+CVE_STATUS[CVE-2024-27038] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7187] = "fixed-version: Fixed from version 4.11rc5"
+CVE_STATUS[CVE-2024-27039] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7261] = "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27040] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7273] = "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27041] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7277] = "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27042] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7294] = "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27043] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7308] = "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27044] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7346] = "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-27045] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-7369 has no known resolution
+CVE_STATUS[CVE-2024-27046] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7374] = "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27047] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7472] = "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27048] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7477] = "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27049] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7482] = "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-27050] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7487] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27051] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7495] = "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-27052] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7518] = "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-27053] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7533] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27054] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7541] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27055] = "fixed-version: Fixed from version 6.6.25"
 
-CVE_STATUS[CVE-2017-7542] = "fixed-version: Fixed from version 4.13rc2"
+CVE_STATUS[CVE-2024-27056] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7558] = "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-27057] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7616] = "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27058] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-7618] = "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27059] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7645] = "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27060] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7889] = "fixed-version: Fixed from version 4.11rc7"
+CVE_STATUS[CVE-2024-27061] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7895] = "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27062] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-7979] = "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27063] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8061] = "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27064] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8062] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27065] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8063] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27066] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8064] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27067] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8065] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27068] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8066] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27069] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8067] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27070] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8068] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27071] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8069] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27072] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8070] = "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27073] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8071] = "fixed-version: Fixed from version 4.10rc7"
+CVE_STATUS[CVE-2024-27074] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8072] = "fixed-version: Fixed from version 4.10rc7"
+CVE_STATUS[CVE-2024-27075] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8106] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2024-27076] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8240] = "fixed-version: Fixed from version 3.19rc6"
+CVE_STATUS[CVE-2024-27077] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-8242 has no known resolution
+CVE_STATUS[CVE-2024-27078] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-8244 has no known resolution
+CVE_STATUS[CVE-2024-27079] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-8245 has no known resolution
+CVE_STATUS[CVE-2024-27080] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2017-8246 has no known resolution
+CVE_STATUS[CVE-2024-27388] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8797] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27389] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8824] = "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-27390] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8831] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27391] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8890] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27392] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8924] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27393] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-8925] = "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27394] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9059] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27395] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9074] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27396] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9075] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27397] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9076] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27398] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9077] = "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27399] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9150] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27400] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9211] = "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-27401] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2017-9242] = "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-27402] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9605] = "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-27403] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9725] = "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2024-27404] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9984] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27405] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9985] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27406] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2017-9986] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-27407] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1000004] = "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-27408] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1000026] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-27409] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1000028] = "fixed-version: Fixed from version 4.15"
+CVE_STATUS[CVE-2024-27410] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1000199] = "fixed-version: Fixed from version 4.16"
+CVE_STATUS[CVE-2024-27411] = "fixed-version: Fixed from version 6.7.9"
 
-CVE_STATUS[CVE-2018-1000200] = "fixed-version: Fixed from version 4.17rc5"
+CVE_STATUS[CVE-2024-27412] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1000204] = "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-27413] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10021] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27414] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10074] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27415] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10087] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27416] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10124] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27417] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10322] = "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-27418] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10323] = "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-27419] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1065] = "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-27431] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1066] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27432] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-10675] = "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-27433] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1068] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-27434] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-10840] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-27435] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-10853] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-27436] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1087] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27437] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-10872 has no known resolution
+CVE_STATUS[CVE-2024-31076] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10876] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-32936] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10877] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33619] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10878] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33621] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10879] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33847] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10880] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34027] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10881] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34030] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10882] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34777] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10883] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-35247] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2018-10901] = "fixed-version: Fixed from version 2.6.36rc1"
+CVE_STATUS[CVE-2024-35784] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10902] = "fixed-version: Fixed from version 4.18rc6"
+CVE_STATUS[CVE-2024-35785] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1091] = "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-35786] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1092] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35787] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1093] = "fixed-version: Fixed from version 4.17rc1"
+# CVE-2024-35788 has no known resolution
 
-CVE_STATUS[CVE-2018-10938] = "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-35789] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1094] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35790] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-10940] = "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35791] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1095] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35792] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-1108] = "fixed-version: Fixed from version 4.17rc2"
+CVE_STATUS[CVE-2024-35793] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1118] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35794] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1120] = "fixed-version: Fixed from version 4.17rc6"
+CVE_STATUS[CVE-2024-35795] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-1121 has no known resolution
+CVE_STATUS[CVE-2024-35796] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-11232] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-35797] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1128] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35798] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1129] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35799] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-1130] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35800] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-11412] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35801] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-11506] = "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35803] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-11508] = "fixed-version: Fixed from version 4.17rc5"
+CVE_STATUS[CVE-2024-35804] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2018-11987 has no known resolution
+CVE_STATUS[CVE-2024-35805] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12126] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35806] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12127] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35807] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12130] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35808] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12207] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-35809] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12232] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35810] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12233] = "fixed-version: Fixed from version 4.18rc2"
+CVE_STATUS[CVE-2024-35811] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12633] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35813] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12714] = "fixed-version: Fixed from version 4.18rc2"
+CVE_STATUS[CVE-2024-35814] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-12896] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35815] = "fixed-version: Fixed from version 4.19.312"
 
-CVE_STATUS[CVE-2018-12904] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35816] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2018-12928 has no known resolution
+CVE_STATUS[CVE-2024-35817] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-12929 has no known resolution
+CVE_STATUS[CVE-2024-35818] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-12930 has no known resolution
+CVE_STATUS[CVE-2024-35819] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-12931 has no known resolution
+CVE_STATUS[CVE-2024-35821] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13053] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35822] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13093] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35823] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-13094] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35824] = "fixed-version: Fixed from version 6.1.84"
 
-CVE_STATUS[CVE-2018-13095] = "fixed-version: Fixed from version 4.18rc3"
+CVE_STATUS[CVE-2024-35825] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-13096] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35826] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13097] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35827] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13098] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35828] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13099] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35829] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13100] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35830] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13405] = "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-35831] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-13406] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35832] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14609] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35833] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14610] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35834] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14611] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35835] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14612] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35836] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14613] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35837] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14614] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35838] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14615] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35839] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14616] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35840] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14617] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35841] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14619] = "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-35842] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2018-14625] = "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35843] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14633] = "fixed-version: Fixed from version 4.19rc6"
+CVE_STATUS[CVE-2024-35844] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14634] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-35845] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14641] = "fixed-version: Fixed from version 4.19rc4"
+CVE_STATUS[CVE-2024-35846] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14646] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35847] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14656] = "fixed-version: Fixed from version 4.19rc2"
+CVE_STATUS[CVE-2024-35848] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14678] = "fixed-version: Fixed from version 4.18rc8"
+CVE_STATUS[CVE-2024-35849] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-14734] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35850] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-15471] = "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35851] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-15572] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35852] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-15594] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35853] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16276] = "fixed-version: Fixed from version 4.18rc5"
+CVE_STATUS[CVE-2024-35854] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16597] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-35855] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16658] = "fixed-version: Fixed from version 4.19rc2"
+CVE_STATUS[CVE-2024-35856] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16862] = "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35857] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16871] = "fixed-version: Fixed from version 4.20rc3"
+CVE_STATUS[CVE-2024-35858] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16880] = "fixed-version: Fixed from version 5.0rc5"
+CVE_STATUS[CVE-2024-35859] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16882] = "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-35860] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-16884] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35861] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-16885 has no known resolution
+CVE_STATUS[CVE-2024-35862] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-17182] = "fixed-version: Fixed from version 4.19rc4"
+CVE_STATUS[CVE-2024-35863] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-17972] = "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35864] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-17977 has no known resolution
+CVE_STATUS[CVE-2024-35865] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18021] = "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35866] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18281] = "fixed-version: Fixed from version 4.19"
+CVE_STATUS[CVE-2024-35867] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18386] = "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-35868] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18397] = "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35869] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18445] = "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35870] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18559] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35871] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-18653 has no known resolution
+CVE_STATUS[CVE-2024-35872] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18690] = "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-35873] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18710] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35874] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-18955] = "fixed-version: Fixed from version 4.20rc2"
+CVE_STATUS[CVE-2024-35875] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-19406] = "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35877] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-19407] = "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35878] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-19824] = "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35879] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-19854] = "fixed-version: Fixed from version 4.20rc3"
+CVE_STATUS[CVE-2024-35880] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-19985] = "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-35882] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20169] = "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35883] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20449] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35884] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20509] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-35885] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20510] = "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-35886] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20511] = "fixed-version: Fixed from version 4.19rc5"
+CVE_STATUS[CVE-2024-35887] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20669] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35888] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20784] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35889] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20836] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35890] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20854] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35891] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20855] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35892] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20856] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35893] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20961] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35894] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-20976] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35895] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-21008] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35896] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-25015] = "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-35897] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-25020] = "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35898] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-3574 has no known resolution
+CVE_STATUS[CVE-2024-35899] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-3620] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35900] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-3639] = "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35901] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-3646] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35902] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-3665] = "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2024-35903] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-3693] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35904] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5332] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35905] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5333] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35907] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5344] = "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35908] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5390] = "fixed-version: Fixed from version 4.18rc7"
+CVE_STATUS[CVE-2024-35909] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5391] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35910] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5703] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35911] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5750] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35912] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5803] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35913] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5814] = "fixed-version: Fixed from version 4.17rc6"
+CVE_STATUS[CVE-2024-35914] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5848] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35915] = "fixed-version: Fixed from version 6.9"
 
-# Skipping CVE-2018-5856, no affected_versions
+CVE_STATUS[CVE-2024-35916] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5873] = "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-35917] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5953] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35919] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-5995] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35920] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-6412] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35921] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-6554] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35922] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-6555] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35924] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2018-6559 has no known resolution
+CVE_STATUS[CVE-2024-35925] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-6927] = "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-35926] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7191] = "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-35927] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7273] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35929] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7480] = "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-35930] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7492] = "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-35931] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7566] = "fixed-version: Fixed from version 4.16rc2"
+CVE_STATUS[CVE-2024-35932] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7740] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35933] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7754] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35934] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7755] = "fixed-version: Fixed from version 4.19rc5"
+CVE_STATUS[CVE-2024-35935] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7757] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35936] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-7995] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35937] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-8043] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35938] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-8087] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35939] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-8781] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35940] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-8822] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35942] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-8897] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35943] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9363] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35944] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9385] = "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35945] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9415] = "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35946] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9422] = "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-35947] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9465] = "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-35948] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9516] = "fixed-version: Fixed from version 4.18rc5"
+CVE_STATUS[CVE-2024-35949] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9517] = "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-35950] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9518] = "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-35951] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2018-9568] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-35952] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0136] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35953] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0145] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35954] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0146] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35955] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0147] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35956] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0148] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35957] = "fixed-version: Fixed from version 6.8.7"
 
-CVE_STATUS[CVE-2019-0149] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35958] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0154] = "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35959] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-0155] = "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35960] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10124] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10125] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35962] = "fixed-version: Fixed from version 5.10.216"
 
-CVE_STATUS[CVE-2019-10126] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35963] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-10140 has no known resolution
+CVE_STATUS[CVE-2024-35964] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10142] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35965] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10207] = "fixed-version: Fixed from version 5.3rc3"
+CVE_STATUS[CVE-2024-35966] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10220] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-35967] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10638] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35968] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-10639] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35969] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11085] = "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-35970] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11091] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35971] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11135] = "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35972] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11190] = "fixed-version: Fixed from version 4.8rc5"
+CVE_STATUS[CVE-2024-35973] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11191] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35974] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-1125] = "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-35975] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11477] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35976] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11478] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35977] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11479] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35978] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11486] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35979] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11487] = "fixed-version: Fixed from version 5.1rc5"
+CVE_STATUS[CVE-2024-35980] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11599] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-35981] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11683] = "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-35982] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11810] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35983] = "fixed-version: Fixed from version 5.4.275"
 
-CVE_STATUS[CVE-2019-11811] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35984] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11815] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35985] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11833] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35986] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-11884] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35987] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12378] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35988] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12379] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35989] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12380] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35990] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12381] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35991] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12382] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35992] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12454] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35993] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12455] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35994] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-12456 has no known resolution
+CVE_STATUS[CVE-2024-35995] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12614] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35996] = "fixed-version: Fixed from version 5.15.158"
 
-CVE_STATUS[CVE-2019-12615] = "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-35997] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12817] = "fixed-version: Fixed from version 5.2rc7"
+CVE_STATUS[CVE-2024-35998] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12818] = "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-35999] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12819] = "fixed-version: Fixed from version 5.0rc8"
+CVE_STATUS[CVE-2024-36000] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12881] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-36001] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-12984] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-36002] = "fixed-version: Fixed from version 6.8.9"
 
-CVE_STATUS[CVE-2019-13233] = "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-36003] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-13272] = "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-36004] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-13631] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36005] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-13648] = "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-36006] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14283] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36007] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14284] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36008] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14615] = "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-36009] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14763] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-36010] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2019-14814] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36011] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14815] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36012] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14816] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36013] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14821] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36014] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-14835] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36015] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-14895] = "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36016] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-14896] = "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-36017] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14897] = "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-36018] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-14898 has no known resolution
+CVE_STATUS[CVE-2024-36019] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-14901] = "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36020] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15030] = "fixed-version: Fixed from version 5.3rc8"
+CVE_STATUS[CVE-2024-36021] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15031] = "fixed-version: Fixed from version 5.3rc8"
+CVE_STATUS[CVE-2024-36022] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15090] = "fixed-version: Fixed from version 5.2rc2"
+CVE_STATUS[CVE-2024-36023] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15098] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36024] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15099] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36025] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15117] = "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-36026] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15118] = "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-36027] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15211] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36028] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15212] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36029] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15213] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36030] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15214] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36031] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15215] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36032] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15216] = "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-36033] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15217] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36244] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15218] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36270] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15219] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36281] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15220] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36286] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15221] = "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-36288] = "fixed-version: Fixed from version 6.9.4"
 
-CVE_STATUS[CVE-2019-15222] = "fixed-version: Fixed from version 5.3rc3"
+CVE_STATUS[CVE-2024-36476] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2019-15223] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36477] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2019-15239 has no known resolution
+CVE_STATUS[CVE-2024-36478] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2019-15290 has no known resolution
+CVE_STATUS[CVE-2024-36479] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15291] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36481] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15292] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36484] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15504] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36489] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-15505] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36880] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15538] = "fixed-version: Fixed from version 5.3rc6"
+CVE_STATUS[CVE-2024-36881] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15666] = "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-36882] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-15791 has no known resolution
+CVE_STATUS[CVE-2024-36883] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-15792 has no known resolution
+CVE_STATUS[CVE-2024-36884] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-15793 has no known resolution
+CVE_STATUS[CVE-2024-36886] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15794] = "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-36887] = "fixed-version: Fixed from version 6.6.31"
 
-CVE_STATUS[CVE-2019-15807] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36888] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-15902 has no known resolution
+CVE_STATUS[CVE-2024-36889] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15916] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36890] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15917] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36891] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15918] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36892] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15919] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36893] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15920] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36894] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15921] = "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-36895] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15922] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36896] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15923] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36897] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15924] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36898] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15925] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36899] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15926] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36900] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-15927] = "fixed-version: Fixed from version 5.0rc2"
+CVE_STATUS[CVE-2024-36901] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-16089 has no known resolution
+CVE_STATUS[CVE-2024-36902] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16229] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36903] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16230] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36904] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16231] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36905] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16232] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36906] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16233] = "fixed-version: Fixed from version 5.4rc5"
+# CVE-2024-36907 has no known resolution
 
-CVE_STATUS[CVE-2019-16234] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36908] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16413] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36909] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16714] = "fixed-version: Fixed from version 5.3rc7"
+CVE_STATUS[CVE-2024-36910] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16746] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36911] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16921] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-36912] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16994] = "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-36913] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-16995] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36914] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17052] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36915] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17053] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36916] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17054] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36917] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17055] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36918] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17056] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36919] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17075] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36920] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17133] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36921] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17351] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36922] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-17666] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36923] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18198] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36924] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18282] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36925] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18660] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36926] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18675] = "fixed-version: Fixed from version 4.17rc5"
+CVE_STATUS[CVE-2024-36927] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2019-18680 has no known resolution
+CVE_STATUS[CVE-2024-36928] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18683] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36929] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18786] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36930] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18805] = "fixed-version: Fixed from version 5.1rc7"
+CVE_STATUS[CVE-2024-36931] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18806] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36932] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18807] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36933] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18808] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36934] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18809] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36935] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18810] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36936] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18811] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36937] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18812] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36938] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18813] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36939] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18814] = "fixed-version: Fixed from version 5.7rc7"
+CVE_STATUS[CVE-2024-36940] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-18885] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36941] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19036] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36942] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19037] = "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36943] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19039] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-36944] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19043] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36945] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19044] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36946] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19045] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36947] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19046] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36948] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19047] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36949] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19048] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36950] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19049] = "fixed-version: Fixed from version 5.4rc5"
+CVE_STATUS[CVE-2024-36951] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19050] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36952] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19051] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36953] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19052] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36954] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19053] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36955] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19054] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36956] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19055] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36957] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19056] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36958] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19057] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36959] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19058] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36960] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19059] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19060] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36962] = "fixed-version: Fixed from version 6.1.91"
 
-CVE_STATUS[CVE-2019-19061] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36963] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19062] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36964] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19063] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36965] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19064] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36966] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-19065] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36967] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19066] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36968] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19067] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36969] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19068] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36970] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19069] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36971] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19070] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36972] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19071] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36973] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19072] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36974] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19073] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36975] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19074] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36976] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19075] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36977] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19076] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36978] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19077] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36979] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19078] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-37021] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19079] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-37026] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19080] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37078] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19081] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37354] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19082] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37356] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19083] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-38306] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19227] = "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38381] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19241] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38384] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19252] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38385] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19318] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38388] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19319] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38390] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19332] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38538] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19338] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38539] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19377] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-38540] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2019-19378 has no known resolution
+CVE_STATUS[CVE-2024-38541] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19447] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38542] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19448] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-38543] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19449] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-38544] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19462] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-38545] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19523] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-38546] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19524] = "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-38547] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19525] = "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-38548] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19526] = "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-38549] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19527] = "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38550] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19528] = "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-38551] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19529] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38552] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19530] = "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-38553] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19531] = "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38554] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19532] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-38555] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19533] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38556] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19534] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38557] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19535] = "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38558] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19536] = "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38559] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19537] = "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-38560] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19543] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38561] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19602] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38562] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19767] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38563] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19768] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-38564] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19769] = "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-38565] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19770] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-38566] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19807] = "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38567] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19813] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38568] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2019-19814 has no known resolution
+CVE_STATUS[CVE-2024-38569] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19815] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-38570] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19816] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38571] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19922] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38572] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19927] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-38573] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19947] = "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-38574] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19965] = "fixed-version: Fixed from version 5.5rc2"
+CVE_STATUS[CVE-2024-38575] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-19966] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38576] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-1999] = "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38577] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20054] = "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38578] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20095] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38579] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20096] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38580] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-2024] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-38581] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2019-2025] = "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-38582] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20422] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38583] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2054] = "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-38584] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20636] = "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-38585] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2019-20794 has no known resolution
+CVE_STATUS[CVE-2024-38586] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20806] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38587] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20810] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-38588] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20811] = "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38589] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20812] = "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-38590] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20908] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38591] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-20934] = "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-38592] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2101] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38593] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2181] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38594] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2182] = "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-38595] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2213] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-38596] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2214] = "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-38597] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-2215] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-38598] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-25044] = "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-38599] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-25045] = "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-38600] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-25160] = "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-38601] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-25162] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-38602] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3016] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-38603] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3459] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38604] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3460] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38605] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3701] = "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-38606] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3819] = "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38607] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3837] = "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-38608] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3846] = "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-38609] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3874] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38610] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3882] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38611] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3887] = "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38612] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3892] = "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-38613] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3896] = "fixed-version: Fixed from version 2.6.35rc1"
+CVE_STATUS[CVE-2024-38614] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3900] = "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-38615] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-3901] = "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-38616] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-5108] = "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-38617] = "fixed-version: Fixed from version 6.10"
 
-# Skipping CVE-2019-5489, no affected_versions
+CVE_STATUS[CVE-2024-38618] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-6133] = "fixed-version: Fixed from version 5.0rc2"
+CVE_STATUS[CVE-2024-38619] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-6974] = "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38620] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-7221] = "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38621] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-7222] = "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38622] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-7308] = "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-38623] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-8912] = "fixed-version: Fixed from version 5.0rc8"
+CVE_STATUS[CVE-2024-38624] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-8956] = "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38625] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-8980] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38626] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9003] = "fixed-version: Fixed from version 5.0rc4"
+CVE_STATUS[CVE-2024-38627] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9162] = "fixed-version: Fixed from version 5.0rc7"
+CVE_STATUS[CVE-2024-38628] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9213] = "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-38629] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9245] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-38630] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9444] = "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-38631] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9445] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38632] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9453] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38633] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9454] = "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-38634] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9455] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-38635] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9456] = "fixed-version: Fixed from version 4.16rc6"
+CVE_STATUS[CVE-2024-38636] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9457] = "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-38637] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9458] = "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-38659] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9466] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38661] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9500] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38662] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9503] = "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38663] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9506] = "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-38664] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2019-9857] = "fixed-version: Fixed from version 5.1rc2"
+CVE_STATUS[CVE-2024-38667] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0009] = "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-38780] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0030] = "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-39276] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0041] = "fixed-version: Fixed from version 5.5rc2"
+CVE_STATUS[CVE-2024-39277] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0066] = "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2024-39282] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2020-0067] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-39291] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0110] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-39292] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0255] = "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39293] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0305] = "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-39296] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-0347 has no known resolution
+CVE_STATUS[CVE-2024-39298] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0404] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39301] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0423] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39371] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0427] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-39461] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0429] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-39462] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0430] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-39463] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0431] = "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-39464] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0432] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39465] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0433] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-39466] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0435] = "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-39467] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0444] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-39468] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0465] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-39469] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0466] = "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-39470] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-0543] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39471] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10135] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39472] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10690] = "fixed-version: Fixed from version 5.5rc5"
+CVE_STATUS[CVE-2024-39473] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-10708 has no known resolution
+CVE_STATUS[CVE-2024-39474] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10711] = "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-39475] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10720] = "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-39476] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10732] = "fixed-version: Fixed from version 5.7"
+CVE_STATUS[CVE-2024-39477] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10742] = "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2024-39478] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10751] = "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39479] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10757] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39480] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10766] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39481] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10767] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39482] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10768] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39483] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10769] = "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-39484] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10773] = "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-39485] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-10774 has no known resolution
+CVE_STATUS[CVE-2024-39486] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10781] = "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-39487] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-10942] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-39488] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11494] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39489] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11565] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39490] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11608] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39491] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11609] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39492] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11668] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39493] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11669] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-39494] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-11725 has no known resolution
+CVE_STATUS[CVE-2024-39495] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-11884] = "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39496] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-11935 has no known resolution
+CVE_STATUS[CVE-2024-39497] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12114] = "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-39498] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12351] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39499] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12352] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39500] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12362] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39501] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12363] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39502] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12364] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39503] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12464] = "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-39504] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12465] = "fixed-version: Fixed from version 5.6rc6"
+CVE_STATUS[CVE-2024-39505] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12652] = "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-39506] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12653] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39507] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12654] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39508] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12655] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39509] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12656] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39510] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12657] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-40899] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12659] = "fixed-version: Fixed from version 5.7rc2"
+CVE_STATUS[CVE-2024-40900] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12768] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-40901] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12769] = "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-40902] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12770] = "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-40903] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12771] = "fixed-version: Fixed from version 5.8rc2"
+CVE_STATUS[CVE-2024-40904] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12826] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-40905] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12888] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40906] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-12912] = "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-40907] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-13143] = "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-40908] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-13974] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40909] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-14304 has no known resolution
+CVE_STATUS[CVE-2024-40910] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14305] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-40911] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14314] = "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-40912] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14331] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40913] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14351] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40914] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14353] = "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-40915] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14356] = "fixed-version: Fixed from version 5.8rc5"
+CVE_STATUS[CVE-2024-40916] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14381] = "fixed-version: Fixed from version 5.6rc6"
+CVE_STATUS[CVE-2024-40917] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14385] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40918] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14386] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40919] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-14390] = "fixed-version: Fixed from version 5.9rc6"
+CVE_STATUS[CVE-2024-40920] = "fixed-version: Fixed from version 6.1.95"
 
-CVE_STATUS[CVE-2020-14416] = "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-40921] = "fixed-version: Fixed from version 6.1.95"
 
-CVE_STATUS[CVE-2020-15393] = "fixed-version: Fixed from version 5.8rc3"
+CVE_STATUS[CVE-2024-40922] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-15436] = "fixed-version: Fixed from version 5.8rc2"
+CVE_STATUS[CVE-2024-40923] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-15437] = "fixed-version: Fixed from version 5.8rc7"
+CVE_STATUS[CVE-2024-40924] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-15780] = "fixed-version: Fixed from version 5.8rc3"
+CVE_STATUS[CVE-2024-40925] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-15802 has no known resolution
+CVE_STATUS[CVE-2024-40926] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-15852] = "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-40927] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-16119] = "fixed-version: Fixed from version 5.15rc2"
+CVE_STATUS[CVE-2024-40928] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-16120] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40929] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-16166] = "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-40930] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-1749] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-40931] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24394] = "fixed-version: Fixed from version 5.8rc4"
+CVE_STATUS[CVE-2024-40932] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24490] = "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-40933] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-24502 has no known resolution
+CVE_STATUS[CVE-2024-40934] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-24503 has no known resolution
+CVE_STATUS[CVE-2024-40935] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24504] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-40936] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24586] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40937] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24587] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40938] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-24588] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40939] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25211] = "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40940] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25212] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40941] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-25220 has no known resolution
+CVE_STATUS[CVE-2024-40942] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25221] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40943] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25284] = "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-40944] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25285] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40945] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25639] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-40947] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25641] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40948] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25643] = "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40949] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25645] = "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40950] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25656] = "fixed-version: Fixed from version 5.10rc2"
+CVE_STATUS[CVE-2024-40951] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-25661 has no known resolution
+CVE_STATUS[CVE-2024-40952] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-25662 has no known resolution
+CVE_STATUS[CVE-2024-40953] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25668] = "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-40954] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25669] = "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-40955] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25670] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40956] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25671] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40957] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25672] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40958] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25673] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40959] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25704] = "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-40960] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-25705] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40961] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26088] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40962] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26139] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40963] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26140 has no known resolution
+CVE_STATUS[CVE-2024-40964] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26141] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40965] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26142 has no known resolution
+CVE_STATUS[CVE-2024-40966] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26143 has no known resolution
+CVE_STATUS[CVE-2024-40967] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26145] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40968] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26147] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40969] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26541] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40970] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26555] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40971] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26556 has no known resolution
+CVE_STATUS[CVE-2024-40972] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26557 has no known resolution
+CVE_STATUS[CVE-2024-40973] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-26558] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40974] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26559 has no known resolution
+CVE_STATUS[CVE-2024-40975] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-26560 has no known resolution
+CVE_STATUS[CVE-2024-40976] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27066] = "fixed-version: Fixed from version 5.6"
+CVE_STATUS[CVE-2024-40977] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27067] = "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-40978] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27068] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-40979] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27152] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40980] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27170] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-40981] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27171] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-40982] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27194] = "fixed-version: Fixed from version 5.9"
+CVE_STATUS[CVE-2024-40983] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-2732] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-40984] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27418] = "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-40985] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27673] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40986] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27675] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40987] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27777] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40988] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27784] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40989] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27786] = "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-40990] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27815] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-40991] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27820] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-40992] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27825] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40993] = "fixed-version: Fixed from version 6.1.96"
 
-CVE_STATUS[CVE-2020-27830] = "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-40994] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-27835] = "fixed-version: Fixed from version 5.10rc6"
+CVE_STATUS[CVE-2024-40995] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28097] = "fixed-version: Fixed from version 5.9rc6"
+CVE_STATUS[CVE-2024-40996] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28374] = "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-40997] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28588] = "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-40998] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28915] = "fixed-version: Fixed from version 5.9"
+CVE_STATUS[CVE-2024-40999] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28941] = "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-41000] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-28974] = "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-41001] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29368] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41002] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29369] = "fixed-version: Fixed from version 5.8rc7"
+CVE_STATUS[CVE-2024-41003] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29370] = "fixed-version: Fixed from version 5.6rc7"
+CVE_STATUS[CVE-2024-41004] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29371] = "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-41005] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29372] = "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-41006] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29373] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-41007] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29374] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41008] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2020-29534] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41009] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29568] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41010] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29569] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41011] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2020-29660] = "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41012] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-29661] = "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41013] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-35499] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41014] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2020-35501 has no known resolution
+CVE_STATUS[CVE-2024-41015] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-35508] = "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-41016] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-35513] = "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-41017] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-35519] = "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41018] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-36158] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41019] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-36310] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41020] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-36311] = "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-41021] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-36312] = "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-41022] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2020-36313] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41023] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36322] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41025] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36385] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41026] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36386] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41027] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36387] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41028] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36516] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-41029] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36557] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41030] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36558] = "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41031] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36691] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41032] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36694] = "fixed-version: Fixed from version 5.10"
+CVE_STATUS[CVE-2024-41033] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36766] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41034] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36775] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41035] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36776] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41036] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36777] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41037] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36778] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41038] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36779] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41039] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36780] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41040] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36781] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41041] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36782] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41042] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36783] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41043] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36784] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41044] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36785] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41045] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36786] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41046] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-36787] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41047] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-3702] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41048] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-4788] = "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-41049] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-7053] = "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-41050] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8428] = "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-41051] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8647] = "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-41052] = "fixed-version: Fixed from version 6.6.41"
 
-CVE_STATUS[CVE-2020-8648] = "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41053] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8649] = "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-41054] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8694] = "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-41055] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2020-8832 has no known resolution
+CVE_STATUS[CVE-2024-41056] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8834] = "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-41057] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8835] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41058] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-8992] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-41059] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-9383] = "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-41060] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2020-9391] = "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41061] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0129] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41062] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0342] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41063] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0399 has no known resolution
+CVE_STATUS[CVE-2024-41064] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0447] = "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-41065] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0448] = "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-41066] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0512] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41067] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0605] = "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-41068] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0606 has no known resolution
+CVE_STATUS[CVE-2024-41069] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0695 has no known resolution
+CVE_STATUS[CVE-2024-41070] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0707] = "fixed-version: Fixed from version 5.11rc3"
+CVE_STATUS[CVE-2024-41072] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0920] = "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-41073] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0924 has no known resolution
+CVE_STATUS[CVE-2024-41074] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0929] = "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-41075] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0935] = "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-41076] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0936 has no known resolution
+CVE_STATUS[CVE-2024-41077] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0937] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41078] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0938] = "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-41079] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-0941] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41080] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-0961 has no known resolution
+CVE_STATUS[CVE-2024-41081] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-1048] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-41082] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20177] = "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-41083] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20194] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41084] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-20219 has no known resolution
+CVE_STATUS[CVE-2024-41085] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20226] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41086] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20239] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41087] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20261] = "fixed-version: Fixed from version 4.5rc5"
+CVE_STATUS[CVE-2024-41088] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20265] = "fixed-version: Fixed from version 4.5rc3"
+CVE_STATUS[CVE-2024-41089] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20268] = "fixed-version: Fixed from version 5.11rc5"
+CVE_STATUS[CVE-2024-41090] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-20292] = "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41091] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-20317] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-41092] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20320] = "fixed-version: Fixed from version 5.15rc3"
+CVE_STATUS[CVE-2024-41093] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20321] = "fixed-version: Fixed from version 5.15rc5"
+CVE_STATUS[CVE-2024-41094] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-20322] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-41095] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-21781] = "fixed-version: Fixed from version 5.11rc7"
+CVE_STATUS[CVE-2024-41096] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-22543] = "fixed-version: Fixed from version 5.13"
+CVE_STATUS[CVE-2024-41097] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-22555] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41098] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-22600] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-41149] = "fixed-version: Fixed from version 6.12.7"
 
-CVE_STATUS[CVE-2021-23133] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41932] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2021-23134] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41935] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2021-26401] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-42063] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-26708] = "fixed-version: Fixed from version 5.11rc7"
+CVE_STATUS[CVE-2024-42064] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-26930] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42065] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-26931] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42066] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-26932] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42067] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-26934 has no known resolution
+CVE_STATUS[CVE-2024-42068] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-27363] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42069] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-27364] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42070] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-27365] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42071] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28038] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42072] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28039] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42073] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28375] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42074] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28660] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42075] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28688] = "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42076] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28691] = "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-42077] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28711] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42078] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28712] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42079] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28713] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42080] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28714] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42081] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28715] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42082] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28950] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42083] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28951] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42084] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28952] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42085] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28964] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42086] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28971] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42087] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-28972] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42088] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29154] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42089] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29155] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42090] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29264] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42091] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29265] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42092] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29266] = "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42093] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29646] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42094] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29647] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42095] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29648] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42096] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29649] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42097] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29650] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42098] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-29657] = "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42099] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-30002] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42100] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-30178] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42101] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-31440] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42102] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3178] = "fixed-version: Fixed from version 5.11rc5"
+CVE_STATUS[CVE-2024-42103] = "fixed-version: Fixed from version 5.15.163"
 
-CVE_STATUS[CVE-2021-31829] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42104] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-31916] = "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42105] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-32078] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42106] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-32399] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42107] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-32606] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42108] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33033] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42109] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33034] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42110] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33061] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-42111] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33098] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42112] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33135] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-42113] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33200] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42114] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3347] = "fixed-version: Fixed from version 5.11rc6"
+CVE_STATUS[CVE-2024-42115] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3348] = "fixed-version: Fixed from version 5.11rc6"
+CVE_STATUS[CVE-2024-42117] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33624] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42118] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33630] = "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-42119] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33631] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-42120] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33655] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-42121] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33656] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42122] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-33909] = "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42123] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3411] = "fixed-version: Fixed from version 5.10"
+CVE_STATUS[CVE-2024-42124] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3428] = "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-42125] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3444] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42126] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-34556] = "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-42127] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-34693] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42128] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3483] = "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42129] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-34866] = "fixed-version: Fixed from version 5.14"
+CVE_STATUS[CVE-2024-42130] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3489] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42131] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3490] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42132] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3491] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42133] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3492 has no known resolution
+CVE_STATUS[CVE-2024-42134] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3493] = "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-42135] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-34981] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42136] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3501] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42137] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-35039] = "fixed-version: Fixed from version 5.13"
+CVE_STATUS[CVE-2024-42138] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3506] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42139] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3542 has no known resolution
+CVE_STATUS[CVE-2024-42140] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3543] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42141] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-35477] = "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-42142] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3564] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42144] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3573] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42145] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3587] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42146] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3600] = "fixed-version: Fixed from version 5.11"
+CVE_STATUS[CVE-2024-42147] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3609] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42148] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3612] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42149] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3635] = "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-42150] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3640] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42151] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3653] = "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42152] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3655] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42153] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3656] = "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42154] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3659] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42155] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3669] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42156] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3679] = "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42157] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3714 has no known resolution
+CVE_STATUS[CVE-2024-42158] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3715] = "fixed-version: Fixed from version 5.6"
+CVE_STATUS[CVE-2024-42159] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-37159] = "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42160] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3732] = "fixed-version: Fixed from version 5.14rc6"
+CVE_STATUS[CVE-2024-42161] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3736] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42162] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3739] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42223] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3743] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42224] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3744] = "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42225] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3752] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42227] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3753] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42228] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-37576] = "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42229] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3759] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42230] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3760] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42231] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3764] = "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42232] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3772] = "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42233] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38160] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42234] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38166] = "fixed-version: Fixed from version 5.14rc6"
+CVE_STATUS[CVE-2024-42235] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38198] = "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-42236] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38199] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42237] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38200] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42238] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38201] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42239] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38202] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42240] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38203] = "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-42241] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38204] = "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42242] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38205] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42243] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38206] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42244] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38207] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42245] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38208] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42246] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38209] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42247] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-38300] = "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42248] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3847 has no known resolution
+CVE_STATUS[CVE-2024-42249] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3864 has no known resolution
+CVE_STATUS[CVE-2024-42250] = "fixed-version: Fixed from version 6.10"
 
-# CVE-2021-3892 has no known resolution
+CVE_STATUS[CVE-2024-42251] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3894] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42252] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3896] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42253] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-3923] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42254] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39633] = "fixed-version: Fixed from version 5.14"
+CVE_STATUS[CVE-2024-42255] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39634] = "fixed-version: Fixed from version 5.9rc8"
+CVE_STATUS[CVE-2024-42256] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39636] = "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-42257] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39648] = "fixed-version: Fixed from version 5.11rc3"
+CVE_STATUS[CVE-2024-42258] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39656] = "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42259] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39657] = "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-42260] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39685] = "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-42261] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39686] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42262] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39698] = "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-42263] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39711] = "fixed-version: Fixed from version 4.18rc6"
+CVE_STATUS[CVE-2024-42264] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39713] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-42265] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-39714] = "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-42266] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2021-39800 has no known resolution
+CVE_STATUS[CVE-2024-42267] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2021-39801 has no known resolution
+CVE_STATUS[CVE-2024-42268] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2021-39802 has no known resolution
+CVE_STATUS[CVE-2024-42269] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4001] = "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42270] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4002] = "fixed-version: Fixed from version 5.16rc3"
+CVE_STATUS[CVE-2024-42271] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4023] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42272] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4028] = "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42273] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4032] = "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42274] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4037] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42275] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-40490] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42276] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4083] = "fixed-version: Fixed from version 5.16rc4"
+CVE_STATUS[CVE-2024-42277] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4090] = "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42278] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4093] = "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42279] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4095] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42280] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-41073] = "fixed-version: Fixed from version 5.15rc2"
+CVE_STATUS[CVE-2024-42281] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4135] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42282] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4148] = "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42283] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4149] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42284] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4150] = "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42285] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4154] = "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-42286] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4155] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42287] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4157] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42288] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4159] = "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-42289] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-41864] = "fixed-version: Fixed from version 5.15rc5"
+CVE_STATUS[CVE-2024-42290] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4197] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42291] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-42008] = "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42292] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4202] = "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42293] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4203] = "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42294] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4204] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42295] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-4218] = "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-42296] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-42252] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42297] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-42327] = "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42298] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-42739] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42299] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43056] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42300] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43057] = "fixed-version: Fixed from version 5.15rc3"
+CVE_STATUS[CVE-2024-42301] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43267] = "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42302] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43389] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42303] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43975] = "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42304] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-43976] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42305] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-44733] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42306] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-44879] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42307] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45095] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42309] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45100] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42310] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45402] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42311] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45469] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42312] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45480] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42313] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45485] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42314] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45486] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42315] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-45868] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42316] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46283] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42317] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46904] = "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42318] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46905] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42319] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46906] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42320] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46908] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42321] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46909] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42322] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46910] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43098] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2021-46911] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43815] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46912] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43816] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46913] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43817] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46914] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43818] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46915] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43819] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46916] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43820] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46917] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43821] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46918] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43822] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46919] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43823] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46920] = "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43824] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46921] = "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-43825] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-43826] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46923] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43827] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46924] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43828] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46925] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43829] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46926] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-43830] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46927] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43831] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46928] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-43832] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46929] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43833] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46930] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43834] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46931] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43835] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46932] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43836] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46933] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43837] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46934] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43838] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46935] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43839] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46936] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43840] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46937] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43841] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46938] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43842] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46939] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43843] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46940] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43844] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46941] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43845] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46942] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43846] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46943] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43847] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46944] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43848] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46945] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43849] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46947] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43850] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46948] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43851] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46949] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43852] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46950] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43853] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46951] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43854] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46952] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43855] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46953] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43856] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46954] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43857] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46955] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43858] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46956] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43859] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46957] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43860] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46958] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43861] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46959] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43862] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46960] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43863] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46961] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43864] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46962] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43865] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46963] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43866] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46964] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43867] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46965] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43868] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46966] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43869] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46967] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43870] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46968] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43871] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46969] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43872] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46970] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43873] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46971] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43874] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46972] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43875] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46973] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43876] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46974] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43877] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46976] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43878] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46977] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43879] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46978] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43880] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46979] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43881] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46980] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43882] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46981] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43883] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46982] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43884] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46983] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43886] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46984] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43887] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46985] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43888] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46986] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43889] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46987] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43890] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46988] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43891] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46989] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43892] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46990] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43893] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46991] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43894] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46992] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43895] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46993] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43896] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46994] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 5.15.167"
 
-CVE_STATUS[CVE-2021-46995] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43899] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46996] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43900] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46997] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43901] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46998] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43902] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-46999] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43904] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47000] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43905] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47001] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43906] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47002] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43907] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47003] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43908] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47004] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43909] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47005] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43910] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47006] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43911] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47007] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43912] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47008] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43913] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47009] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43914] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47010] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44931] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47011] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44932] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47012] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44933] = "fixed-version: Fixed from version 6.10.5"
 
-CVE_STATUS[CVE-2021-47013] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44934] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47014] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44935] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47015] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44936] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47016] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44937] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47017] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44938] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47018] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44939] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47019] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44940] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47020] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44941] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47021] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44942] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47022] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44943] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2021-47023] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44944] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47024] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44945] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47025] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44946] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47026] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44947] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47027] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44948] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47028] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44949] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47029] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44950] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47030] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44951] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47031] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44953] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47032] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44954] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47033] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44955] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47034] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44956] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47035] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44957] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47036] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44958] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47037] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44959] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47038] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44960] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47039] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44961] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47040] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44962] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47041] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44963] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47042] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44964] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47043] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44965] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47044] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44966] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47045] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44967] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47046] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44968] = "fixed-version: Fixed from version 6.1.105"
 
-CVE_STATUS[CVE-2021-47047] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44969] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47048] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44970] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47049] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44971] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47050] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44972] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47051] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44973] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47052] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44974] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47053] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44975] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47054] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44976] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47055] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44977] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47056] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44978] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47057] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44979] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47058] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44980] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47059] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44981] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47060] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44982] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47061] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44983] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47062] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44984] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47063] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44985] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47064] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44986] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47065] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44987] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47066] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44988] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47067] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44989] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47068] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44990] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47069] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44991] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47070] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44992] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47071] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44993] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47072] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44994] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47073] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44995] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47074] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44996] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47075] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44997] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47076] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44998] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47077] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44999] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47078] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45000] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47079] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45001] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47080] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45002] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47081] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45003] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47082] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45004] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47083] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45005] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47086] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45006] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47087] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45007] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47088] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45008] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47089] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45009] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47090] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45010] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47091] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45011] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47092] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45012] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47093] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45013] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47094] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45014] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47095] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45015] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47096] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45016] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47097] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45017] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47098] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45018] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47099] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45019] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47100] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45020] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47101] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45021] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47102] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45022] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47103] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45023] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47104] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45024] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47105] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45025] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47106] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45026] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47107] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45027] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47108] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45028] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47109] = "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-45029] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47110] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-45030] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47111] = "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-45828] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2021-47112] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46672] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47113] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46673] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47114] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46674] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47116] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46675] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47117] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46676] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47118] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46677] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47119] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46678] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47120] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46679] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47121] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46680] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47122] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46681] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47123] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46682] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47124] = "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46683] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47125] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46684] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47126] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46685] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47127] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46686] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47128] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46687] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47129] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46688] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47130] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46689] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47131] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46690] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47132] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46691] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47133] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46692] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47134] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46693] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47135] = "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46694] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47136] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46695] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47137] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46696] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47138] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46697] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47139] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46698] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47140] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46699] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47141] = "fixed-version: Fixed from version 5.13rc4"
+# CVE-2024-46700 has no known resolution
 
-CVE_STATUS[CVE-2021-47142] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46701] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47143] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46702] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47144] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46703] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47145] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46704] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47146] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46705] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47147] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46706] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47148] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46707] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47149] = "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46708] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47150] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46709] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47151] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46710] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47152] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46711] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47153] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46712] = "fixed-version: Fixed from version 6.10.8"
 
-CVE_STATUS[CVE-2021-47158] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46713] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47159] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46714] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47160] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46715] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47161] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46716] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47162] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46717] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47163] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46718] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47164] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46719] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47165] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46720] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47166] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46721] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47167] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46722] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47168] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46723] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47169] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46724] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47170] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46725] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47171] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46726] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47172] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46727] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47173] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46728] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47174] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46729] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47175] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46730] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47176] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46731] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47177] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46732] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47178] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46733] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46734] = "fixed-version: Fixed from version 5.15.167"
 
-CVE_STATUS[CVE-2021-47180] = "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46735] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0001] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46736] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0002] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46737] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0168] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46738] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0171] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-46739] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0185] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46740] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0264] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-46741] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0286] = "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-46742] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0322] = "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-46743] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0330] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46744] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0382] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-46745] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-0400 has no known resolution
+CVE_STATUS[CVE-2024-46746] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0433] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46747] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0435] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46748] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0480] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46749] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0487] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46750] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0492] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46751] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0494] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46752] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0500] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46753] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0516] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46754] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0617] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46755] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0644] = "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-46759] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0646] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46760] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0742] = "fixed-version: Fixed from version 5.17rc7"
+CVE_STATUS[CVE-2024-46761] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0812] = "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-46762] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0847] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46763] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0850] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-46764] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0854] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46765] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0995] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46766] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-0998] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46767] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1011] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46768] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1012] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46769] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1015] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46770] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1016] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46771] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1043] = "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-46772] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1048] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46773] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1055] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46774] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-1116 has no known resolution
+CVE_STATUS[CVE-2024-46775] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1158] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46776] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1184] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46777] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1195] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-46778] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1198] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46779] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1199] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46780] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1204] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46781] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1205] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46782] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-1247 has no known resolution
+CVE_STATUS[CVE-2024-46783] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1263] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-46784] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1280] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46785] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1353] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46786] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1419] = "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-46787] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1462] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-46788] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1508] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46789] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1516] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46790] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1651] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46791] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1652] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46792] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1671] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46793] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1678] = "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-46794] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1679] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46795] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1729] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-46796] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1734] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46797] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1786] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46798] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1789] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-46799] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1836] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-46800] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1852] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46801] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1882] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-46802] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1943] = "fixed-version: Fixed from version 5.18rc7"
+CVE_STATUS[CVE-2024-46803] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1966] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46804] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1972] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46805] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1973] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46806] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1974] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46807] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1975] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46808] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1976] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46809] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-1998] = "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46810] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20008] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46811] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20132] = "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-46812] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20141] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46813] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20148] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-46814] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20153] = "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-46815] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20154] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-46816] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20158] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46817] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20166] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-46818] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20368] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46819] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20369] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46820] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20409] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46821] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20421] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-46822] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20422] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46823] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20423] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46824] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20424] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46825] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20565] = "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-46826] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20566] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-46827] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20567] = "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-46828] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20568] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46829] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-20572] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46830] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2078] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46831] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21123] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46832] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21125] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46833] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21166] = "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46834] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21385] = "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-46835] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21499] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46836] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-21505] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-46837] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2153] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46838] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2196] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-46840] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-2209 has no known resolution
+CVE_STATUS[CVE-2024-46841] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-22942] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46842] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23036] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46843] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23037] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46844] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23038] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46845] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23039] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46846] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23040] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46847] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23041] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46848] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23042] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46849] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2308] = "fixed-version: Fixed from version 6.0"
+CVE_STATUS[CVE-2024-46850] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2318] = "fixed-version: Fixed from version 5.19rc5"
+CVE_STATUS[CVE-2024-46851] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23222] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46852] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2327] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46853] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2380] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46854] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23816] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-46855] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-23825 has no known resolution
+CVE_STATUS[CVE-2024-46856] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-23960] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46857] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-24122] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46858] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-24448] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46859] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-24958] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46860] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-24959] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46861] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2503] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46862] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-25258] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46863] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-25265 has no known resolution
+CVE_STATUS[CVE-2024-46864] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-25375] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46865] = "fixed-version: Fixed from version 5.10.227"
 
-CVE_STATUS[CVE-2022-25636] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46866] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2585] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46867] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2586] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46868] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2588] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46869] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2590] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-46870] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2602] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-46871] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-26365] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-46896] = "fixed-version: Fixed from version 6.12.7"
 
-CVE_STATUS[CVE-2022-26373] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47141] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-2639] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-47143] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-26490] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47408] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2022-2663] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47658] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2022-26878 has no known resolution
+CVE_STATUS[CVE-2024-47659] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-26966] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47660] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-27223] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47661] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-27666] = "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-47662] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-27672] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-47663] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2785] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47664] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-27950] = "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-47665] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-28356] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47666] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-28388] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47667] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-28389] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47668] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-28390] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47669] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2873] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47670] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-28796] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47671] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-28893] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-47672] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2905] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-47673] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-29156] = "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47674] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2022-2938] = "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-47675] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-29581] = "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-47676] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-29582] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-47677] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2959] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47678] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-2961 has no known resolution
+CVE_STATUS[CVE-2024-47679] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2964] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-47680] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2977] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47681] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2978] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47682] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-29900] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-47683] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-29901] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-47684] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-2991] = "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-47685] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-29968] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47686] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3028] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-47687] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-30594] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47688] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3061] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47689] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3077] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47690] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3078] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47691] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3103] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-47692] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3104] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47693] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3105] = "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-47694] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3106] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-47695] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3107] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-47696] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3108] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47697] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3110] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47698] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3111] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47699] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3112] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47700] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3113] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47701] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3114] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47702] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3115] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47703] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3169] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47704] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3170] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-47705] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3176] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47706] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3202] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47707] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-32250] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47708] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-32296] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-47709] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-3238 has no known resolution
+CVE_STATUS[CVE-2024-47710] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3239] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47711] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-32981] = "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2024-47712] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3303] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47713] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3344] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-47714] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33740] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47715] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33741] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47716] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33742] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47717] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33743] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47718] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33744] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47719] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-33981] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47720] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3424] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47721] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3435] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47723] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-34494] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47724] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-34495] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47726] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-34918] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47727] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3521] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47728] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3522] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47729] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3523] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47730] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3524] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47731] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3526] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-47732] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3531] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47733] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3532] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47734] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-3533 has no known resolution
+CVE_STATUS[CVE-2024-47735] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3534] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47736] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3535] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47737] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3541] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47738] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3542] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47739] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3543] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47740] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-3544 has no known resolution
+CVE_STATUS[CVE-2024-47741] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3545] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47742] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3564] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-47743] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3565] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47744] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3566] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47745] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3567] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47746] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3577] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47747] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3586] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47748] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3594] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47749] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3595] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47750] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-3606 has no known resolution
+CVE_STATUS[CVE-2024-47751] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-36123] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47752] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3619] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-47753] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3621] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47754] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3623] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47756] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3624] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47757] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3625] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47794] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3628] = "fixed-version: Fixed from version 6.1rc5"
+CVE_STATUS[CVE-2024-47809] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-36280] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-48873] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3629] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48875] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3630] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48876] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3633] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48881] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3635] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49568] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-49569] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2022-3640] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49571] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2022-36402] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2024-49573] = "cpe-stable-backport: Backported in 6.12.7"
 
-# CVE-2022-3642 has no known resolution
+CVE_STATUS[CVE-2024-49850] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3643] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49851] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3646] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49852] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3649] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49853] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-36879] = "fixed-version: Fixed from version 5.19rc8"
+# CVE-2024-49854 has no known resolution
 
-CVE_STATUS[CVE-2022-36946] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-49855] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3707] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49856] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-38096 has no known resolution
+CVE_STATUS[CVE-2024-49857] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-38457] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49858] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3903] = "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2024-49859] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3910] = "fixed-version: Fixed from version 6.0rc6"
+CVE_STATUS[CVE-2024-49860] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-39188] = "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-49861] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-39189] = "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2024-49862] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-39190] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-49863] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-3977] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49864] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-39842] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49865] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-40133] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49866] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-40307] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-49867] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-40476] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49868] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-40768] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49869] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4095] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49870] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-40982] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-49871] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41218] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49872] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41222] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-49873] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4127] = "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-49874] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4128] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-49875] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4129] = "fixed-version: Fixed from version 6.1rc6"
+CVE_STATUS[CVE-2024-49876] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4139] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49877] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41674] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49878] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-41848 has no known resolution
+CVE_STATUS[CVE-2024-49879] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41849] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49880] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41850] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49881] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-41858] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49882] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42328] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49883] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42329] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49884] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42432] = "fixed-version: Fixed from version 6.0rc7"
+CVE_STATUS[CVE-2024-49885] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4269] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49886] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42703] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49887] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42719] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49888] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42720] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49889] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42721] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49890] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42722] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49891] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42895] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49892] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-42896] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49893] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-43750] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49894] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4378] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49895] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4379] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49896] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4382] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49897] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49898] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-44032] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49899] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-44033] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49900] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-44034] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49901] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-4543 has no known resolution
+CVE_STATUS[CVE-2024-49902] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45869] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49903] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-45884 has no known resolution
+CVE_STATUS[CVE-2024-49904] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2022-45885 has no known resolution
+CVE_STATUS[CVE-2024-49905] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45886] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49906] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45887] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49907] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45888] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49908] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45919] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49909] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-45934] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49910] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4662] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49911] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4696] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-49912] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4744] = "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-49913] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47518] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49914] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47519] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49915] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47520] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49916] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47521] = "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49917] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47929] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49918] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47938] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49919] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47939] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49920] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47940] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-49921] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47941] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49922] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47942] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49923] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47943] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49924] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-47946] = "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-49925] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-4842] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49926] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48423] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49927] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48424] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49928] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48425] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49929] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48502] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49930] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-49931] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48626] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-49932] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48627] = "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-49933] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48628] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-49934] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48629] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-49935] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2022-48630] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-49936] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-49937] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0045] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49938] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0047] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-49939] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0122] = "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49940] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0160] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49941] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0179] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49942] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0210] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49943] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0240] = "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-49944] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0266] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49945] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0386] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-49946] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0394] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49947] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0458] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49948] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0459] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49949] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0461] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49950] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0468] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49951] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0469] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49952] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0590] = "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2024-49953] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0597] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49954] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-0615] = "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2024-49955] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1032] = "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2024-49956] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1073] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49957] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1074] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-49958] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1075] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-49959] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49960] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1077] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49961] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1078] = "fixed-version: Fixed from version 6.2rc8"
+CVE_STATUS[CVE-2024-49962] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1079] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49963] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1095] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49964] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1118] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49965] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1192] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49966] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1193] = "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2024-49968] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1194] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-49969] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1195] = "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2024-49970] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1206] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-49971] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1249] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-49972] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1252] = "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-49973] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1281] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-49974] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1295] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-49975] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1380] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49976] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49977] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-49978] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-1476 has no known resolution
+CVE_STATUS[CVE-2024-49979] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1513] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-49980] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-49981] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1583] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49982] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1611] = "fixed-version: Fixed from version 6.3rc5"
+CVE_STATUS[CVE-2024-49983] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1637] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49984] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1652] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49985] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1670] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49986] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1829] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49987] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1838] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-49988] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1855] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-49989] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1859] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-49990] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1872] = "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49991] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1989] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49992] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1990] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-49994] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-1998] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49995] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2002] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49996] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2006] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49997] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2007] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49998] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2008] = "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49999] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2019] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50000] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-20569] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50001] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-20588] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50002] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-20593] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50003] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-20928] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50004] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-20937 has no known resolution
+CVE_STATUS[CVE-2024-50005] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-20938] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-50006] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-20941 has no known resolution
+CVE_STATUS[CVE-2024-50007] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-21102] = "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-50008] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-21106] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50009] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2124] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50010] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-21255] = "fixed-version: Fixed from version 6.4rc4"
+CVE_STATUS[CVE-2024-50011] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-21264] = "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2024-50012] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-21400 has no known resolution
+CVE_STATUS[CVE-2024-50013] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2156] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50014] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2162] = "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-50015] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2163] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50016] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2166] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-50017] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2176] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50019] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2177] = "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-50020] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2194] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50021] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2235] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-50022] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2236] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-50023] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2248] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50024] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2269] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50025] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-22995] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50026] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-22996] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-50027] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-22997] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50028] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-22998] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50029] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-22999] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50030] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23000] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50031] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23001] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.6.57"
 
-CVE_STATUS[CVE-2023-23002] = "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50033] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23003] = "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-50034] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23004] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50035] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23005] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50036] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23006] = "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-50037] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-23039 has no known resolution
+CVE_STATUS[CVE-2024-50038] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23454] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-50039] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23455] = "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-50040] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23559] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50041] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-23586] = "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-50042] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2430] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50043] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2483] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50044] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-25012] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50045] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50046] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-25775] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50047] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2598] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50048] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-26242 has no known resolution
+CVE_STATUS[CVE-2024-50049] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-2640 has no known resolution
+CVE_STATUS[CVE-2024-50051] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-26544] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50055] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-26545] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-50056] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-26605] = "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-50057] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-26606] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50058] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-26607] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50059] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28327] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-50060] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28328] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50061] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28410] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50062] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28464] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-50063] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28466] = "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2024-50064] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2860] = "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-50065] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28746] = "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-50066] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28772] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-50067] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-28866] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50068] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50069] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-2985] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50070] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3006] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50071] = "fixed-version: Fixed from version 6.12"
 
-# Skipping CVE-2023-3022, no affected_versions
+CVE_STATUS[CVE-2024-50072] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-30456] = "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-50073] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-30772] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50074] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3090] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50075] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3106] = "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-50076] = "fixed-version: Fixed from version 6.12"
 
-# Skipping CVE-2023-3108, no affected_versions
+CVE_STATUS[CVE-2024-50077] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-31081 has no known resolution
+CVE_STATUS[CVE-2024-50078] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-31082 has no known resolution
+CVE_STATUS[CVE-2024-50079] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-31083] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50080] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-31084] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50081] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-31085] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50082] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3111] = "fixed-version: Fixed from version 6.0rc2"
+CVE_STATUS[CVE-2024-50083] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3117] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50084] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-31248] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50085] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3141] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50086] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-31436] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50087] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3159] = "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-50088] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3161] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50090] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3212] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50091] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3220] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50092] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32233] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50093] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32247] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50094] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32248] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50095] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32250] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32252] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50097] = "fixed-version: Fixed from version 6.6.57"
 
-CVE_STATUS[CVE-2023-32254] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50098] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32257] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50099] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32258] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50100] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-32269] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50101] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-32629 has no known resolution
+CVE_STATUS[CVE-2024-50102] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3268] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50103] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3269] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50104] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3312] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50105] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3317] = "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2024-50106] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-33203] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50107] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-33250] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50108] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-33288] = "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50109] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3338] = "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50110] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3355] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50111] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3357] = "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50112] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3358] = "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50113] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3359] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50114] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3389] = "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50115] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3390] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50116] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-33951] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50117] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-33952] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50118] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-3397 has no known resolution
+CVE_STATUS[CVE-2024-50119] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-34255] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50120] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-34256] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50121] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-34319] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50122] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-34324] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50123] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3439] = "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-50124] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35001] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50125] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3567] = "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50126] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-35693 has no known resolution
+CVE_STATUS[CVE-2024-50127] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35788] = "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2024-50128] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35823] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50129] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35824] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50130] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35826] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50131] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35827] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50132] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35828] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50133] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-35829] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50134] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3609] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50135] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3610] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50136] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3611] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50137] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-3640 has no known resolution
+CVE_STATUS[CVE-2024-50138] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-37453] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50139] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-37454 has no known resolution
+CVE_STATUS[CVE-2024-50140] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50141] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50142] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3776] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50143] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3777] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50144] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3812] = "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-50145] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38409] = "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-50146] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38426] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50147] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38427] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50148] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38428] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50149] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38429] = "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50150] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38430] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50151] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38431] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50152] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-38432] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50153] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3863] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50154] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3865] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50155] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3866] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50156] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-3867] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50157] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39189] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50158] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39191] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50159] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39192] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50160] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39193] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50161] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39194] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50162] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39197] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50163] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-39198] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50164] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4004] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50165] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-4010 has no known resolution
+CVE_STATUS[CVE-2024-50166] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4015] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50167] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-40283] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50168] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-40791] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50169] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4128] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50170] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4132] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50171] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4133] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50172] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4134] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50173] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4147] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50174] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4155] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50175] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4194] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50176] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4206] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50177] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4207] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50178] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4208] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50179] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4244] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50180] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4273] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50181] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-42752] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50182] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-42753] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50183] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-42754] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50184] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-42755] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50185] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-42756] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50186] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50187] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4387] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-50188] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4389] = "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-50189] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4394] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-50190] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-44466] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50191] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4459] = "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-50192] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4563] = "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50193] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4569] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50194] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-45862] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50195] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-45863] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50196] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-45871] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50197] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-45898] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50198] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4610] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50199] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4611] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50200] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4622] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50201] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4623] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50202] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-46343] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50203] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-46813] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50204] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-46838] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50205] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-46862] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2024-50206] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-47233] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-50207] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-50208] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4881] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50209] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-4921] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50210] = "fixed-version: Fixed from version 5.10.229"
 
-CVE_STATUS[CVE-2023-50431] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50211] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-5090] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50212] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51042] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50213] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51043] = "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50214] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-5158] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50215] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-50216] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-5178] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50217] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51780] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50218] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51781] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50220] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50221] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-5197] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50222] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52340] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50223] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52429] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-50224] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50225] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52434] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50226] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52435] = "cpe-stable-backport: Backported in 6.6.11"
+CVE_STATUS[CVE-2024-50227] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52436] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50229] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52438] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50230] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52439] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50231] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52440] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50232] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52441] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50233] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52442] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50234] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52443] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50235] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52444] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50236] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52445] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50237] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52446] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50238] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52447] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50239] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52448] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50240] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52449] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50241] = "fixed-version: Fixed from version 6.11.7"
 
-CVE_STATUS[CVE-2023-52450] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50242] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52451] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50243] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52452] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50244] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52453] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50245] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52454] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50246] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52455] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50247] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52456] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50248] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52457] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50249] = "fixed-version: Fixed from version 5.15.171"
 
-CVE_STATUS[CVE-2023-52458] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50250] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52459] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50251] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52460] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-50252] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52461] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-50253] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52462] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50254] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52463] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50255] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52464] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50256] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52465] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50257] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52467] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50258] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52468] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50259] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52469] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50260] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52470] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50261] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52471] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-50262] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52472] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50263] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52473] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50264] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52474] = "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50265] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52475] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50266] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52476] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50267] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52477] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50268] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52478] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50269] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52479] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50270] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52480] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50271] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52481] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50272] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52482] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-50273] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52483] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50274] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52484] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50275] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-52485 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-50276] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52486] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50277] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52487] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50278] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52488] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50279] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52489] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50280] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52490] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50281] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52491] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50282] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52492] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50283] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52493] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50284] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52494] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50285] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52495] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50286] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52497] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50287] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52498] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50288] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52499] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50289] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52500] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50290] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52501] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50291] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52502] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50292] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52503] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50293] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52504] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50294] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52505] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50295] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52506] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50296] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52507] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50297] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52508] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50298] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52509] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50299] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52510] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50300] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52511] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50301] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52512] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50302] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52513] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50303] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52515] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50304] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52516] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-51729] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2023-52517] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-52319] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2023-52518] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-52332] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52519] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53042] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52520] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53043] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52522] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53044] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52523] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53045] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52524] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53046] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53047] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52526] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53048] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52527] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53049] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52528] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53050] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52529] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53051] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52530] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53052] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52531] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53053] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52532] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53055] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52559] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53056] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52560] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53057] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52561] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-53058] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52562] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53059] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52563] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53060] = "fixed-version: Fixed from version 4.19.324"
 
-CVE_STATUS[CVE-2023-52564] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53061] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52565] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53062] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52566] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53063] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52567] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53064] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52568] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53065] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52569] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-53066] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52570] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53067] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52571] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53068] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52572] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53069] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52573] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53070] = "fixed-version: Fixed from version 5.15.172"
 
-CVE_STATUS[CVE-2023-52574] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53071] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52575] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53072] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52576] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53073] = "fixed-version: Fixed from version 6.11.7"
 
-CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53074] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52578] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53075] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52580] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53076] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52581] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53077] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52582] = "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53078] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52583] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53079] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52584] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53080] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-52585 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53081] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-52586 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53082] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52587] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53083] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52588] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53084] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52589] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53085] = "fixed-version: Fixed from version 6.12"
 
-# CVE-2023-52590 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53086] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52591] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53087] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52593] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53088] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52594] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53089] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52595] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53090] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52596] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53091] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52597] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53092] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52598] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53093] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52599] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53094] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52600] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53095] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52601] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52602] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53097] = "fixed-version: Fixed from version 5.10.230"
 
-CVE_STATUS[CVE-2023-52603] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53098] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52604] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53099] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52606] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53100] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52607] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53101] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52608] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53103] = "cpe-stable-backport: Backported in 6.12.1"
 
-CVE_STATUS[CVE-2023-52609] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53104] = "cpe-stable-backport: Backported in 6.12.1"
 
-CVE_STATUS[CVE-2023-52610] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53105] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52611] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53106] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52612] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53107] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52613] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53108] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52614] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53109] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52615] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53110] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52616] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53111] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52617] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53112] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52618] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53113] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52619] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53114] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2023-52620] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-53115] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53116] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53117] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53118] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53119] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53120] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53121] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53122] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53123] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53124] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53125] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53126] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53127] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53128] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53129] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53130] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53131] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53132] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53133] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53134] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53135] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53136] = "fixed-version: Fixed from version 4.19.325"
+
+CVE_STATUS[CVE-2024-53137] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53138] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53139] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53140] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53141] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53142] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53143] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53144] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53145] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53146] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53147] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53148] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53149] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53150] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53151] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53152] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53153] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53154] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53155] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53156] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53157] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53158] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53160] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53161] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53162] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53163] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53164] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-53165] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53166] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53167] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53168] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53169] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53170] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53171] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53172] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53173] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53174] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53175] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53176] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53177] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53178] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53179] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53180] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53181] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53182] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53183] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53184] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53185] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53186] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53187] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53188] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53189] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53190] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53191] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53192] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53193] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53194] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53195] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53196] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53197] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53198] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53199] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53200] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53201] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53202] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53203] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53204] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53205] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53206] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53207] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53208] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53209] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53210] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53211] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53212] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53213] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53214] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53215] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53216] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53217] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53218] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53219] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53220] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53221] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53222] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53223] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53224] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53225] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53226] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53227] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53228] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53229] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53230] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53231] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53232] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53233] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53234] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53235] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53236] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53237] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53238] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53239] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53240] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53241] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53680] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-53681] = "cpe-stable-backport: Backported in 6.12.9"
+
+CVE_STATUS[CVE-2024-53682] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53685] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-53687] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53690] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54031] = "fixed-version: Fixed from version 6.12.9"
+
+CVE_STATUS[CVE-2024-54191] = "fixed-version: Fixed from version 6.12.6"
+
+CVE_STATUS[CVE-2024-54193] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54455] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54460] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-54680] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54683] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55639] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55641] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55642] = "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55881] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-55916] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56368] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56369] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56372] = "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56531] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56532] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56533] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56534] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56535] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56536] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56537] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56538] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56539] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56540] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56541] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56542] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56543] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56544] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56545] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56546] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56547] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56548] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56549] = "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56550] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56551] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56552] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56553] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56554] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56555] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56556] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56557] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56558] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56559] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56560] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56561] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56562] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56563] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56564] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56565] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56566] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56567] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56568] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56569] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56570] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56572] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56573] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56574] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56575] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56576] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56577] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56578] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56579] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56580] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56581] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56582] = "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56583] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56584] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56585] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56586] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56587] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56588] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56589] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56590] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56591] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56592] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56593] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56594] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56595] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56596] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56597] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56598] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56599] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56600] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56601] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56602] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56603] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56604] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56605] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56606] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56607] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56608] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56609] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56610] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56611] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56612] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56613] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56614] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56615] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56616] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56617] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56618] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56619] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56620] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56621] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56622] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56623] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56624] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56625] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56626] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56627] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56628] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56629] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56630] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56631] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56632] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56633] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56634] = "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56635] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52621] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56636] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52622] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56637] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52623] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56638] = "cpe-stable-backport: Backported in 6.12.5"
 
-# CVE-2023-52624 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56639] = "cpe-stable-backport: Backported in 6.12.5"
 
-# CVE-2023-52625 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56640] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52626] = "fixed-version: only affects 6.7rc2 onwards"
+CVE_STATUS[CVE-2024-56641] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52627] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56642] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52628] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-56643] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52629] = "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-56644] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52630] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56645] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52631] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56646] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52632] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56647] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52633] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56648] = "cpe-stable-backport: Backported in 6.12.5"
 
-# CVE-2023-52634 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56649] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52635] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56650] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52636] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56651] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2023-52637] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56652] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-52638] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56653] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-52639] = "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-56654] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-52640] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-56655] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-52641] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-56656] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-5345] = "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-56657] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-5633] = "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-56658] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-5717] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-56659] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-5972] = "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-56660] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6039] = "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-56661] = "fixed-version: Fixed from version 6.12.6"
 
-CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-56662] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6111] = "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-56663] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.6.4"
+CVE_STATUS[CVE-2024-56664] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-56665] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6200] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-56666] = "cpe-stable-backport: Backported in 6.12.6"
 
-# CVE-2023-6238 has no known resolution
+CVE_STATUS[CVE-2024-56667] = "cpe-stable-backport: Backported in 6.12.6"
 
-# CVE-2023-6240 has no known resolution
+CVE_STATUS[CVE-2024-56668] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6270] = "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56669] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6356] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56670] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56671] = "cpe-stable-backport: Backported in 6.12.6"
 
-# CVE-2023-6535 has no known resolution
+CVE_STATUS[CVE-2024-56672] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6536] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56673] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6546] = "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-56674] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6560] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56675] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-56676] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-56677] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56678] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-56679] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56680] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6915] = "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-56681] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56682] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56683] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-7042] = "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56684] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2023-7192] = "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-56685] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-56687] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0340] = "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-56688] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0443] = "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-56689] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0562] = "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-56690] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-0564 has no known resolution
+CVE_STATUS[CVE-2024-56691] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0565] = "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-56692] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0582] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56693] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0584] = "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56694] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0607] = "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-56695] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0639] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-56696] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0641] = "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-56697] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0646] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56698] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0775] = "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-56699] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-0841] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56700] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56701] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56702] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-1151] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56703] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-1312] = "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-56704] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-21803 has no known resolution
+CVE_STATUS[CVE-2024-56705] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-2193 has no known resolution
+CVE_STATUS[CVE-2024-56706] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-22099] = "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56707] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-22386 has no known resolution
+CVE_STATUS[CVE-2024-56708] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-56709] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-23196] = "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-56710] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-23307] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-56711] = "cpe-stable-backport: Backported in 6.12.7"
 
-# CVE-2024-23848 has no known resolution
+CVE_STATUS[CVE-2024-56712] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56713] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-23850] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56714] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-23851] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56715] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-24855] = "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-56716] = "cpe-stable-backport: Backported in 6.12.7"
 
-# CVE-2024-24857 has no known resolution
+CVE_STATUS[CVE-2024-56717] = "cpe-stable-backport: Backported in 6.12.7"
 
-# CVE-2024-24858 has no known resolution
+CVE_STATUS[CVE-2024-56718] = "cpe-stable-backport: Backported in 6.12.7"
 
-# CVE-2024-24859 has no known resolution
+CVE_STATUS[CVE-2024-56719] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-24860] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56720] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-24861] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-56721] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-24864 has no known resolution
+CVE_STATUS[CVE-2024-56722] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-25739 has no known resolution
+CVE_STATUS[CVE-2024-56723] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-25740 has no known resolution
+CVE_STATUS[CVE-2024-56724] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-25741 has no known resolution
+CVE_STATUS[CVE-2024-56725] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-25744] = "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56726] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56727] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26582] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56728] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26583] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56729] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26584] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56730] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26585] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56739] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26586] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56740] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26587] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56741] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26588] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56742] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26589] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56743] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26590] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56744] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26591] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56745] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26592] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56746] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26593] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56747] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26594] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56748] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26595] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56749] = "cpe-stable-backport: Backported in 6.12.2"
 
-# CVE-2024-26596 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56750] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26597] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56751] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26598] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56752] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26599] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56753] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26600] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56754] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26601] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56755] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26602] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56756] = "cpe-stable-backport: Backported in 6.12.2"
 
-CVE_STATUS[CVE-2024-26603] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56757] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26604] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56758] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26605] = "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56759] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26606] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56760] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26607] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56761] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26608] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56763] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26610] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56764] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26611] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56765] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26612] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56766] = "fixed-version: Fixed from version 6.12.8"
 
-CVE_STATUS[CVE-2024-26614] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56767] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26615] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56768] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26616] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56769] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26617] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-56770] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2024-26618] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56771] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26619] = "fixed-version: only affects 6.7rc5 onwards"
+CVE_STATUS[CVE-2024-56772] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26620] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56773] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26621] = "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56774] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26622] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2024-56775] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26623] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56776] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26625] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56777] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26626] = "fixed-version: only affects 6.8rc1 onwards"
+CVE_STATUS[CVE-2024-56778] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26627] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56779] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26629] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56780] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26630] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2024-56781] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26631] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56782] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26632] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56783] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26633] = "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56784] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26634] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56785] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26635] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56786] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26636] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56787] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26637] = "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56788] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-26638] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57791] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-26639] = "fixed-version: only affects 6.8rc1 onwards"
+CVE_STATUS[CVE-2024-57792] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26640] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57793] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26641] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57795] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26642] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57798] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26643] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57799] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26644] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57800] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26645] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57801] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26646] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57802] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26647] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57804] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26648] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57805] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26649] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57806] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26650] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57807] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26651] = "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-57809] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26652] = "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-57838] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-26653] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57839] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26654] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57841] = "cpe-stable-backport: Backported in 6.12.9"
 
-# CVE-2024-26655 needs backporting (fixed from 6.9rc2)
+CVE_STATUS[CVE-2024-57843] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26656] = "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57844] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26657] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57849] = "cpe-stable-backport: Backported in 6.12.5"
 
-# CVE-2024-26658 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-57850] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26659] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57857] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26660] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57872] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26661] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57874] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26662] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57875] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26663] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57876] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26664] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57877] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26665] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57878] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-26666] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57879] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2024-26667] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57880] = "cpe-stable-backport: Backported in 6.12.6"
 
-CVE_STATUS[CVE-2024-26668] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57881] = "cpe-stable-backport: Backported in 6.12.7"
 
-CVE_STATUS[CVE-2024-26669] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57882] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26670] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57883] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26671] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57884] = "cpe-stable-backport: Backported in 6.12.9"
 
-# CVE-2024-26672 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-57885] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26673] = "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57886] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26674] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57887] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26675] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57888] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26676] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57889] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26677] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57890] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26678] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57891] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26679] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57892] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26680] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57893] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26681] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57894] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26682] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57895] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26683] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57896] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26684] = "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57897] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26685] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57898] = "cpe-stable-backport: Backported in 6.12.9"
 
-# CVE-2024-26686 needs backporting (fixed from 6.8rc4)
+CVE_STATUS[CVE-2024-57899] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26687] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57900] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26688] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57901] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26689] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57902] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26690] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57903] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26691] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57904] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26692] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57905] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26693] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57906] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26694] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57907] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26695] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57908] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26696] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57909] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26697] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57910] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26698] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57911] = "cpe-stable-backport: Backported in 6.12.10"
 
-# CVE-2024-26699 needs backporting (fixed from 6.8rc5)
+CVE_STATUS[CVE-2024-57912] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26700] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57913] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26702] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57914] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26703] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57916] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26704] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57917] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26705] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57918] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26706] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57919] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26707] = "cpe-stable-backport: Backported in 6.6.18"
+# CVE-2024-57920 has no known resolution
 
-CVE_STATUS[CVE-2024-26708] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57921] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26709] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57922] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26710] = "fixed-version: only affects 6.8rc1 onwards"
+CVE_STATUS[CVE-2024-57923] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26711] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57924] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26712] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57925] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26713] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57926] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26714] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57927] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26715] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57928] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26716] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57929] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26717] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57930] = "fixed-version: Fixed from version 6.12.9"
 
-CVE_STATUS[CVE-2024-26718] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57931] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26719] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57932] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26720] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57933] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26721] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57934] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26722] = "fixed-version: only affects 6.7rc5 onwards"
+CVE_STATUS[CVE-2024-57935] = "fixed-version: Fixed from version 6.12.9"
 
-CVE_STATUS[CVE-2024-26723] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57936] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26724] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57938] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26725] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57939] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26726] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57940] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26727] = "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57941] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26728] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57942] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26729] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57943] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26730] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57944] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26731] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57945] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26732] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-57946] = "cpe-stable-backport: Backported in 6.12.8"
 
-CVE_STATUS[CVE-2024-26733] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57947] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-26734] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57948] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26735] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57949] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26736] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57950] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26737] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57951] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26738] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57952] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26739] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21629] = "cpe-stable-backport: Backported in 6.12.9"
 
-CVE_STATUS[CVE-2024-26740] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26741] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21632] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26742] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21633] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26743] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21634] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26744] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21635] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26745] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21636] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26746] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21637] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26747] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21638] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26748] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21639] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26749] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21640] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26750] = "fixed-version: only affects 6.8rc5 onwards"
+CVE_STATUS[CVE-2025-21641] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26751] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21642] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26752] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21643] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26753] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21644] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26754] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21645] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26755] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2025-21646] = "cpe-stable-backport: Backported in 6.12.10"
 
-# CVE-2024-26756 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21647] = "cpe-stable-backport: Backported in 6.12.10"
 
-# CVE-2024-26757 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21648] = "cpe-stable-backport: Backported in 6.12.10"
 
-# CVE-2024-26758 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21649] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26759] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21650] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26760] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21651] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26761] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21652] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26762] = "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2025-21653] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26763] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21654] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26764] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21655] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26765] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21656] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26766] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21657] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26767] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21658] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26768] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21659] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26769] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21660] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26770] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21661] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26771] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21662] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26772] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21663] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26773] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21664] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2024-26774] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21665] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26775] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21666] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26776] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21667] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26777] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21668] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26778] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21669] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26779] = "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21670] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26780] = "fixed-version: only affects 6.8rc4 onwards"
+CVE_STATUS[CVE-2025-21671] = "fixed-version: Fixed from version 6.12.11"
 
-CVE_STATUS[CVE-2024-26781] = "fixed-version: only affects 6.8rc6 onwards"
+CVE_STATUS[CVE-2025-21672] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26782] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21673] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26783] = "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2025-21674] = "cpe-stable-backport: Backported in 6.12.11"
 
-# CVE-2024-26784 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21675] = "cpe-stable-backport: Backported in 6.12.11"
 
-# CVE-2024-26785 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21676] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26786] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21677] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26787] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21678] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26788] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21679] = "fixed-version: Fixed from version 6.12.11"
 
-CVE_STATUS[CVE-2024-26789] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21680] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26790] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21681] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26791] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21682] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26792] = "fixed-version: only affects 6.8rc4 onwards"
+CVE_STATUS[CVE-2025-21683] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26793] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21684] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26794] = "fixed-version: only affects 6.8rc6 onwards"
+CVE_STATUS[CVE-2025-21685] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26795] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21686] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26796] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21687] = "cpe-stable-backport: Backported in 6.12.14"
 
-# CVE-2024-26797 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21688] = "fixed-version: only affects 6.13 onwards"
 
-CVE_STATUS[CVE-2024-26798] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21689] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26799] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21690] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26800] = "fixed-version: only affects 6.8rc5 onwards"
+CVE_STATUS[CVE-2025-21691] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26801] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21692] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26802] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21693] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26803] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21694] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26804] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21695] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26805] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21696] = "cpe-stable-backport: Backported in 6.12.11"
 
-# CVE-2024-26806 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21697] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2024-26807] = "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21699] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2024-26808] = "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2025-21700] = "cpe-stable-backport: Backported in 6.12.13"
 
-CVE_STATUS[CVE-2024-26809] = "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2025-21701] = "cpe-stable-backport: Backported in 6.12.13"
 
-- 
2.43.0


