Return-Path: <Emily.Vekariya@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A35EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 12:40:57 +0000 (UTC)
Received: from naesa02.arrow.com (naesa02.arrow.com [216.150.161.1])
 by mx.groups.io with SMTP id smtpd.web10.87151.1691584850198046319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 05:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=JqrKPsWJ;
 spf=pass (domain: einfochips.com, ip: 216.150.161.1, mailfrom: emily.vekariya@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1936; q=dns/txt;
  s=NAESA-Selector1; t=1691584850; x=1723120850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j9Tj89kBc4QXIyBrG2Asc7BsoulgjyfEoHGy4ht+aOc=;
  b=JqrKPsWJEpCCrcVmn3OWKdz3o/1SYm6DcoIKqB3SUNpnpekQCl9riSoz
   dqijNng1qstHr9OobWOGB+qEr6+MMsfbOWUW//uwEe3iXZ5MMJW3Pw4I1
   8cTZ3Ujuteh0xB6UTxr5dKkzfvSuEZg45eq5lPm2CIlKqsrnk/VGCPXPg
   uSgIJQgSXfzUo4sPjU5tSD1I3dNEZyBHhdpI7WidL3p971vWpR2gINm7E
   Xo3WGkiiFY1LvwM4/VIYKOImClf5lkeidsiSDzT+ETatLR0OQvFnf+KSA
   GXeNuF0kk5dy5kfW+qvCqOANOWMYEjAcsMYgJvj7dkjyR8SEbnzJdk5fy
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684821600"; 
   d="scan'208";a="15477410"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa02out.arrow.com with ESMTP; 09 Aug 2023 06:40:47 -0600
Received: from AHMCPU2167.ap.corp.arrow.com ([172.25.9.210]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Wed, 9 Aug 2023 18:10:46 +0530
From: emily.vekariya@einfochips.com
To: openembedded-core@lists.openembedded.org
Cc: chee.yang.lee@intel.com,
	martin.jansa@gmail.com,
	deepak.rathore@einfochips.com,
	Emily Vekariya <emily.vekariya@einfochips.com>
Subject: [dunfell] [PATCH] qemu: CVE-ID correction for CVE-2020-35505
Date: Wed,  9 Aug 2023 18:10:44 +0530
Message-Id: <20230809124044.2813849-1-emily.vekariya@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Aug 2023 12:40:46.0508 (UTC) FILETIME=[B8145EC0:01D9CABE]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 12:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185701

From: Emily Vekariya <emily.vekariya@einfochips.com>

- The commit [https://github.com/qemu/qemu/commit/995457517340]
  ("esp: ensure cmdfifo is not empty and current_dev is non-NULL")
  fixes CVE-2020-35505 instead of CVE-2020-35504.
- Hence, corrected the CVE-ID in CVE-2020-35505.patch.
- Reference: https://bugzilla.redhat.com/show_bug.cgi?id=1909769

Signed-off-by: Emily Vekariya <emily.vekariya@einfochips.com>
---
 meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
index c5ff6e89ff..40c0b1e74f 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
@@ -20,16 +20,19 @@ Reviewed-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
 Tested-by: Alexander Bulekov <alxndr@bu.edu>
 Message-Id: <20210407195801.685-7-mark.cave-ayland@ilande.co.uk>
 
-CVE: CVE-2020-35504
+CVE: CVE-2020-35505
 Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2020-35505.patch?h=ubuntu/focal-security Upstream commit https://github.com/qemu/qemu/commit/99545751734035b76bd372c4e7215bb337428d89  ]
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+Signed-off-by: Emily Vekariya <emily.vekariya@einfochips.com>
 ---
- hw/scsi/esp.c | 3 +++
- 1 file changed, 3 insertions(+)
+ hw/scsi/esp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
+diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
+index c7d701bf..c2a67bc8 100644
 --- a/hw/scsi/esp.c
 +++ b/hw/scsi/esp.c
-@@ -193,6 +193,10 @@ static void do_busid_cmd(ESPState *s, ui
+@@ -193,6 +193,10 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
  
      trace_esp_do_busid_cmd(busid);
      lun = busid & 7;
-- 
2.25.1


