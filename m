Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E26DC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:14 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=ptJXEBnB;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1245; q=dns/txt;
  s=NAESA-Selector1; t=1789047246; x=1820583246;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bbjRwY67YqmumpAPmDGg688Un1aFSsIyNKuNkrvfxqU=;
  b=ptJXEBnBofiaO3dOgQkgnu2ejtmJajABcoqKE7TZr344RsvS8ivUbRj0
   ChQ/CKjcHaxpWZRtsF5t/pg7wzXj1KwDZNDVVQpVtfyDplYX9UUByVoVg
   8b8NsH+lAOjtrs5/6E/nl6fgY2pEuL1OdkRApqvnjYASqM6eBEK59zwKw
   3yyrFOJFGGc133HJAgoj9pOpYwAeLtnInTvU19MusK12wYKCa4YeJMMyD
   wzyxGPYWF2W5qPH8l2zYFWiMqrJIY21AmbCg436JWmU5NExHb0xyKFg95
   2W3ADnZNogNHbqc3GX93kuAv/GXr+T1C+vaGMk+b6GI1CZDkJUe0a6nqr
   g==;
X-CSE-ConnectionGUID: ruaX25CSRfWXRVkOMzLGaQ==
X-CSE-MsgGUID: SbVa4nW6QIK3Serpa/ASIQ==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105800"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:05 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 02/10] ffmpeg: set CVE_STATUS for CVE-2026-64831
Date: Thu, 10 Sep 2026 19:01:36 +0530
Message-ID: <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245571

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Analysis:
- CVE-2026-64831 affects Vulkan HEVC hardware acceleration.[1]
- The ffmpeg recipe does not enable or build Vulkan HEVC hardware acceleration by default.
- Hence CVE is not applicable.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-64831

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8c1969369b..af05ab4af9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -186,3 +186,4 @@ CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
 CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"
+CVE_STATUS[CVE-2026-64831] = "not-applicable-config: Vulkan HEVC hardware acceleration is not enabled or built by this recipe."
-- 
2.43.0


