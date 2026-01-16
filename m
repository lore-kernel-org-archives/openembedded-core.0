Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42458C982FD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:39:37 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5582.1768592371706523067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AIVBIh5F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202601161939281b05b415fa000207c3-lr_f3c@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202601161939281b05b415fa000207c3
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 20:39:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MCnf6h5tL9IFdWt8iSg///zu14cEojCyO4hO4aCJDLw=;
 b=AIVBIh5FgKAVyUunFWgwDbyf380BQCBHCmgEDBt62Iv4hQGHjrWaqBrp+ZXrtbW6U6PChm
 iCHXEBbOeTy0tLLPTMcZefFxnz9Tj2dUpM6Jigstj3yyrmbIQFoevx4GHpgnkc3v8lVp+kCa
 ZaPDdbTsmetOm0WkepASJJM6ACR4b8bwz9Iigb5wBLtFsUdrMWfoh2vQMDPPtPjVyAoxQ5Vd
 ncPKHQmfGG1M6o5MvVou1CqS9YSqk+G70nA2tmalqZfND1l0LCBlRv0cXnz6ETUT0AWMDM+G
 63c8ruYBcUyd5loFiyYHS6PriL8cVU98zNHWzQN8Vnn2rEcpPKSs8UIw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] zlib: ignore CVE-2026-22184
Date: Fri, 16 Jan 2026 20:39:21 +0100
Message-Id: <20260116193921.1015772-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229564

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 592b7f1422..ef83142121 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -51,3 +51,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

