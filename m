Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A987FD0044
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 21:46:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127850.1772315163890673756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 13:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HdDdpKLm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260228214602dcd50dd4ae00020784-z4g35d@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260228214602dcd50dd4ae00020784
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Feb 2026 22:46:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wBTNC03WKgRKa7gCGsEB/HXRzj7hxFC9PLdwC+1qhvg=;
 b=HdDdpKLmtmdFjm7YzUZdaI7EirM7IEzWg30sFIoH9yrKz5xw5Y0ar62XJXdD3kWdcxPORv
 UDsl8DDsilDL/CCLXvdQFjZPCPSpYIubypvTbbDOvc8sS2R0ao2++Mm2KxLtxO0m42YeR4I+
 2R+0GnVMZMafKwsCuyoOkFe66wpkqJaVZ7VNgskZ5TilSe8+dxIKtf80z5gsaCZ+JyWPqlH+
 6fA/f7mzpq9SqG3/tiRSPFz2OxOyAd9H4BU6E2howeyPZprDU15Kclau+s0trgrJ/1ZEtAy5
 s1WsNlnygebiNqzepTaOEBHF70es5RVWaUnR38bmUd5Yn8NhILQkq41Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] ffmpeg: set status for CVE-2025-10256
Date: Sat, 28 Feb 2026 22:45:22 +0100
Message-Id: <20260228214523.451806-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 21:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232130

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n6.1.3.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-10256
[2] https://github.com/FFmpeg/FFmpeg/commit/a25462482c02c004d685a8fcf2fa63955aaa0931
[3] https://github.com/FFmpeg/FFmpeg/commit/00b5af29a4203a31574c11b3df892d78d5d862ec

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index eb64b5c8d59..080241d34f9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"

