Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B08C98300
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:40:17 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5860.1768592410723034522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BJ6f5XQk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260116194008df872a4057000207c5-vmgidd@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260116194008df872a4057000207c5
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 20:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9vfVKJtcSkcSaRAml3JiMFcWpFnKErid1p3BK3nnNX4=;
 b=BJ6f5XQkGi+xNJVcE4M6CnaPuEc0JtfPv1BA3w2VpATOjUIFcsnNY0PkUJlDSD78jnDg8G
 DZr2p6ZdnfsBdbxhZKDzYnAit3w0PKdHeLkgZ50UdRsjuvyAx5OgKrqZYOCi9OEQtfbfNd4g
 Rk8G5/mdtGfwyELPTwVGcSA30cO67M2bcQjW4hZA11JdRNUxOUbuunopYvDAmn1kjXo7kpmV
 PfxCYho8hUKZHyzaIQqEcfSY3N/ejzCwMPgTi+jy8m3LKk6x/qeLHvRJhdGgaoy+VeCL0z3z
 /DdZwMfbc/IxBBoErKDUI8ygE4AulRbOauTWznHb5FftAcaDch7juvgA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] zlib: ignore CVE-2026-22184
Date: Fri, 16 Jan 2026 20:40:07 +0100
Message-Id: <20260116194007.1015837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229567

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index dc8f7c6c855..8dd0a90b523 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -58,3 +58,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # this CVE is for cloudflare zlib
 CVE_CHECK_IGNORE += "CVE-2023-6992"
+# vulnerable file is not compiled
+CVE_CHECK_IGNORE += "CVE-2026-22184"

