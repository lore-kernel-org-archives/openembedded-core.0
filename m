Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF24F531D3
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:08 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3533.1776114964846942084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ag8HLF/w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202604132116070f315b57e2000207c0-o564rh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202604132116070f315b57e2000207c0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BQCVtw1zGxl+Bru1GRftGM7iQUBhUUx21U68uS/ooRs=;
 b=ag8HLF/wb01D6zsgpX8DdSSHSpcUXCb2vuTiDd7crGg/fzecijAL+LBHiAIsYrSJ69Oyc5
 r5wTF0BD+vPd7sNPb1p9zK2PLVzbInQ2yMtr2a835MwPr1WO8kA1s6n0hgVrkCerOLjFj5Nt
 II6R0nS1qFkOxmjGXulygz59J9pjxYMwMmeST3cPDUTfC3IEHEKAf7Gvtgqpu/4gJT8/SYyv
 28/7A6JGylZ4AG39Se8Bl/LdVo9hJa+c+uk1zN0P7BAUmsqnyOHrocPontoiu0roqQfTC9W4
 UEikYYS1WzlmLeVFDYg/kHGaNx+IEKgmME31BftxRDlRhEbXkfVFwUeA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/6] wic: set CVE_PRODUCT
Date: Mon, 13 Apr 2026 23:14:43 +0200
Message-ID: <20260413211447.564257-2-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-1-peter.marko@siemens.com>
References: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235124

From: Peter Marko <peter.marko@siemens.com>

Current CVE reports show following CVE-2008-6713 as open.
NVD shows CPE as massive_entertainment:wic ([1]).

Set vendor as yoctoproject, which is best approximation of possible
future CVEs as it is already used for other yocto repositories.

[1] https://nvd.nist.gov/vuln/detail/CVE-2008-6713

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/wic/wic_0.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.0.bb
index a0a2773c76..c9732a359a 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -8,6 +8,9 @@ SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
 
 inherit python_hatchling
 
+# do not report CVEs for other wic tools
+CVE_PRODUCT = "yoctoproject:wic"
+
 RDEPENDS:${PN} += " \
     python3-core \
     python3-json \

