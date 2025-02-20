Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A33C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 18:35:17 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.4652.1740076507168923125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 10:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=f72nUlvh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502201835041bc289cd6b1968bee0-cpyabx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502201835041bc289cd6b1968bee0
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Feb 2025 19:35:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8pQeC9u5sC9/WyRKq7kyD5jbAfeevTvtDxrLcQrH+ck=;
 b=f72nUlvh/LbolRwyMD/+7eHNRUOV6Zk8DxzfnUYLD6DkH89f02h0/wxHg3TcoPTVxHEZI2
 h32OcwAIzVpnDJAg/C5gC4vBCvf2DxtZhVyEZKNRoQ0H7+YJ7u5HOg8PxmyKlgiLcMgVj2q8
 BPCLUPVd/Kq+Rl2cGbCjMiKD9zSwYrr2r4ihf5fuJBnlRiYy9aRk8t3877fO5MJ+Aak58IO0
 XUH7F9fA80KZyLPSihVtfGvtXafzlGx41wbIlAWFQvW/6fIktMjM+rWZDFx1HzR+XFWWlO4P
 YnuCBh8pNtJ871pOF9Fu1KoF/BEGsNY4M9GaFHrgLLEoPM7iPrKk3nAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] ffmpeg: ignore 5 CVEs
Date: Thu, 20 Feb 2025 19:34:15 +0100
Message-Id: <20250220183416.179109-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 18:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211773

From: Peter Marko <peter.marko@siemens.com>

There is no release which is vulnerable to these CVEs.
These vulnerabilities are in new features being developed and were fixed
before release.

NVD most likely does not accept CVE rejection from a non-maintainer and
non-reporter, so ignoring this CVE should be acceptable solution.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index b5b11496f4..bded23bc35 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -57,6 +57,24 @@ SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a
 # https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
 CVE_CHECK_IGNORE += "CVE-2023-39018"
 
+# There is no release which is vulnerable to these CVEs
+# These vulnerabilities are in new features being developed and fixed before releasing them
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/bf814387f42e9b0dea9d75c03db4723c88e7d962
+CVE_CHECK_IGNORE += "CVE-2023-46407"
+# feature (evc parser): https://github.com/FFmpeg/FFmpeg/commit/34e4f18360c4ecb8e5979cab8f389478d8cd7819
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/4565747056a11356210ed8edcecb920105e40b60
+CVE_CHECK_IGNORE += "CVE-2023-47470"
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/d2e8974699a9e35cc1a926bf74a972300d629cd5
+CVE_CHECK_IGNORE += "CVE-2024-22860"
+# feature (oqs audio decoder): https://github.com/FFmpeg/FFmpeg/commit/7ef9d31071021c05e6b792af3f25b7b9ceaa9258
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/87b8c1081959e45ffdcbabb3d53ac9882ef2b5ce
+CVE_CHECK_IGNORE += "CVE-2024-22861"
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/ca09d8a0dcd82e3128e62463231296aaf63ae6f7
+CVE_CHECK_IGNORE += "CVE-2024-22862"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

