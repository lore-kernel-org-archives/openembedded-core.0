Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BA1E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:40:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.5178.1735810840354622562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YkAka0tb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025010209403609083795d0bd89bd07-5tp_r5@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025010209403609083795d0bd89bd07
        for <openembedded-core@lists.openembedded.org>;
        Thu, 02 Jan 2025 10:40:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fUfxm23Z2JgcbRSWpp93ZnjKMGYKb/7E0XDR9q4vX84=;
 b=YkAka0tbwi0YOHxKQvFfofy0pSiKbiErZE8py/baJxy0uVfhhiC4Ex/MviPUCrxy+t+LbC
 TYZl/K1D5v1HvdtJUlawotHxOaWvvOQmty1cZUTbu5AQ4PD3c59uyZZGDv5FEz2a8cyVmmIS
 Amu+3x5k1HTTLzZZwxYDWSlMbRWiM+ruhQ9jcwFVdJDcHb+FsS+LMzX/IM61G11VS+PbxNKD
 wzU8qMGhF0+MdmS8dLUlqho/id+5XSON5CFFSXWb/wFkgQ7OCmpQqEZLdh+NEDVNXpRgo6vR
 +W5pEMyGk1RK5WjBsJtYAc6fvVkSlmm5kyiN2o6hdimV9H5eraHs0WCQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: upgrade 3.10.15 -> 3.10.16
Date: Thu,  2 Jan 2025 10:39:49 +0100
Message-Id: <20250102093949.1354885-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209260

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2024-50602, CVE-2024-11168 and CVE-2024-9287.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch        | 2 +-
 .../python/{python3_3.10.15.bb => python3_3.10.16.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.15.bb => python3_3.10.16.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 5485020eb4..0086b1a0d6 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -14,7 +14,7 @@ diff --git a/setup.py b/setup.py
 index c190002..5ef368d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
+@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3_3.10.15.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.15.bb
rename to meta/recipes-devtools/python/python3_3.10.16.bb
index 0eb619dfa2..19a85a8770 100644
--- a/meta/recipes-devtools/python/python3_3.10.15.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "aab0950817735172601879872d937c1e4928a57c409ae02369ec3d91dccebe79"
+SRC_URI[sha256sum] = "bfb249609990220491a1b92850a07135ed0831e41738cf681d63cf01b2a8fbd1"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


