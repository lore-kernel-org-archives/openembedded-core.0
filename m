Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E04C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 10:31:26 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35989.1789641077120887844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 03:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mBBimCfr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260917103113b9c9ced01d00020741-5j8kfh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260917103113b9c9ced01d00020741
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 12:31:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AGgRk3/tJRxyb9k85QIdk23ofjaC8Rp1B2jNoSa1hjE=;
 b=mBBimCfrBl1H1Q/KHoOxYpj7yp4rq074L0QcFUs5+Yw91tWA9NEB9vwfqPL00VZKOSnUd+
 fxq3XdesC8aGmqNV3j/S8GIFbWnxszdSfAAkFIrxqKNEYGsMYRcJECjcQgnKte8RiuIvJ9g+
 NNod6kIVHDp3DrYOnPMsawN2m5lsqcFdeuDC+SMHHlXjf4LZcgSqDBxA0oHwyi1WayZmLI2d
 iYYq0EhIBSSStSakcu674rw9XRObUVqjDWPIKhJnOU6gxYMpOnmxar5/hsUjbRgKpPDixF45
 g/Oi9q0RvFKH4Eh/FPjhRYTMQi6aHs1iKtIDlR2W9Jv5HrF2GIE2nE+g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] fmt: update branch name to main
Date: Thu, 17 Sep 2026 12:30:59 +0200
Message-ID: <20260917103059.26343-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 10:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246052

From: Peter Marko <peter.marko@siemens.com>

Upstream repository has renamed branch master to main.
Fetching currently does not work (except from downloads mirror).

Master branch has updated this in upgrade commit
* 3336a94097f57485e4b06e91e7bddd5fdef99e80

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/fmt/fmt_12.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/fmt/fmt_12.1.0.bb b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
index 22cab6f138..b51e0eed65 100644
--- a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
            "

