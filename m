Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14301.1793811923503050002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 09:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=c/F81Ge9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202611041705262312e6af610002077f-tdn9iu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611041705262312e6af610002077f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 04 Nov 2026 18:05:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3QS/RqBeZg7iSC8/ohy2bAxo/JoMwbSTvsT+ASlhECk=;
 b=c/F81Ge9xpno29UJKEkdXgNvZ90H91nO7N3otBqza05VAcVFwA6Kk/F+o+cbWltCXLC8hd
 cLvYVUumFEby4Tv1yQnWLom95MHV5jwU80axOT5QywCFO8zOu+mMuguApgCWZsRnKCd531Jt
 ZA/FqSwwCMcubc6ZwZkAFHWzi2NwWwVrqLyHFTl2/bYHv2KglGkLNxlsVL8LxBcqqntcLs+7
 BiNrviAQ2jV3fRHHuUMtXzdslypdFwfcy/Kf5Dvok2uA4jTmj5dnzESZnVaf3SaDV16tOiVB
 XAwOWe+9utYQSiKRb5iqg6H8QvE3GRtfA4N9Q8HDZwmo57blP52d0o8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] popt: correct CVE-2026-18739.patch metadata
Date: Wed,  4 Nov 2026 18:04:32 +0100
Message-ID: <20261104170432.23123-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 17:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249409
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

There was a typo in CVE tag in this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/popt/popt/CVE-2026-18739.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
index 0a1e8f35907..94366f63437 100644
--- a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -14,7 +14,7 @@ Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
 
 Fixes: CVE-2026-18739
 
-CVE: CVE-2026-18743
+CVE: CVE-2026-18739
 Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
