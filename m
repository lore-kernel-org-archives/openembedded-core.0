Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039DFC55843
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:02:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4232.1785794560997683277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Stg97gKc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202608032202389a2749f38a000207a6-5qxbrm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608032202389a2749f38a000207a6
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=v/CQWxwsZn2OlQzLRIL4YpVVfNrLzhXiKVNtgD8kq8I=;
 b=Stg97gKcDsM/1m29jyoF6sFBtjM6w2UiltQhqEYInOx6e1WJq35fMdKwcfGnLkI9fb1trK
 Wz+9CoFYYwTv2VW9d0LvTnYVzw4ZOivsN0exwUGM9JmPBKhfra6boVA5U2yFMvNyrZYuz1AA
 3kh19MeEO336RbckZAHe/Vg0jkjDW+vkbIhaQmiaTrx2Qpj6iotqgrCea6J26UNczPW5FLOt
 9TT5uJMaVne5pH4MioiYaI8DWF0rsonzd0HNYXvJZkWoNZSFpPwvOi/iqlq+uf+xnDVomjzb
 U6iiK1Z0QK3jT3G27U55X6RlnmcAY4rXEhuUv/4aycW6c0FMw/3hAyew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 04/15] ffmpeg: set status for CVE-2026-8461 and CVE-2026-40962
Date: Tue,  4 Aug 2026 00:01:44 +0200
Message-ID: <20260803220157.1520377-4-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242660

From: Peter Marko <peter.marko@siemens.com>

[1] shows that CVE-2026-8461 was fixed by [2] backported as [3].
[4] shows that CVE-2026-40962 was fixed by [4] backported as [4].

[1] https://security-tracker.debian.org/tracker/CVE-2026-8461
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/c23d4da3128c279b714b282e6ec292e8755007e3
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/3e8f3537f957da011d7360acacc9941f3ce5c306
[4] https://security-tracker.debian.org/tracker/CVE-2026-40962
[5] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e392fb8c9c3949d975531d2b23c645d2465a7ebc
[6] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/2b14ba12669d75f5f73d8634c6db36e704144532

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index f2a729fc41..8a6eb4eb86 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -183,3 +183,5 @@ CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
+CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"

