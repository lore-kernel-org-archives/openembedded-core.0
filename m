Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C03BFD0045
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 21:46:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127850.1772315163890673756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 13:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HBFh44SX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260228214606e0eb8a603f000207fa-jfzeqj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260228214606e0eb8a603f000207fa
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Feb 2026 22:46:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DohqgkCVDCDRLLkThrVg+I6O3TBW20Fnf4qwuzTCDMg=;
 b=HBFh44SX8HdFGrR75zANYFyRUiwYploQ+qvQkClke7MJINPheFuiqC1oHMRVj9Pq3SNQm4
 NGZAphEU2Uj36VwIo8KclENT6K7OUpUGBOdIQCE8S3Xl13tVmmxLHLZ29gMZ9gVoIkOk+P41
 1Z+5ptYmIp1YiwV1SwbtCWBB7hTsQPApBRpaER6tRBGSsGO1gkiSnluy/Ke9KzILNpBMq/M/
 29eHUUGsPCxgDRbEfm8SH5ap/EX5groFoqPYoBsErGFyg0sBEemGZRENHKNEAcE3kUlXp7s6
 zUEjneBAxJo5bdi+RnZzT6FwO9+jvr1KWCq3pp8Vvf8lXmrPluydf5Bw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/2] ffmpeg: set status for CVE-2025-12343
Date: Sat, 28 Feb 2026 22:45:23 +0100
Message-Id: <20260228214523.451806-2-peter.marko@siemens.com>
In-Reply-To: <20260228214523.451806-1-peter.marko@siemens.com>
References: <20260228214523.451806-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 21:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232131

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n6.1.3.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/6250ed77a6fb5bb089e533e30985d197e8323dcf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 080241d34f9..849835c8493 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256 CVE-2025-12343"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"

