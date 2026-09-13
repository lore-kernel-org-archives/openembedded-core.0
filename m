Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFC5C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:59:50 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6829.1789333185388583723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ndGGMz14;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026091320594134d41b1f38000207dd-er8s_a@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026091320594134d41b1f38000207dd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:59:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oNOlvRynu3Itmfv+cKdWwMghR4o8HOL2zxCARcbibSw=;
 b=ndGGMz14iXHjj+V0XDFyVNdOm1mTwjZRQh1INzC4J9epfp657xwZAZdhPZIS+Vt5J4SFOB
 1+LBSLPpgJPz0NdhrubMxm/FL6ZMwTn73s79w+wILkroKKnM3zuV/Oq8JzBM530w4XYyhvay
 lUE/sROWD8n+jzkPcxtIgG57xeZrjuc400D26yCeqDZxxUDyzJNHThSOzudNtkYzMGQcFzoN
 6WCA5Si9bFQJVvC/owXqgvI0QXAX0YFBE1c8M2F6HY4koF0TJPVMHPk81ifDPtAspnk+bkHk
 bHdhPnJD14EGH7DuHEixNC84fe1CTDTgH3tniXWwnGWZqrAGvZXK+5sw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/3] go-helloworld: add +git to version
Date: Sun, 13 Sep 2026 22:59:09 +0200
Message-ID: <20260913205911.3638917-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245740

From: Peter Marko <peter.marko@siemens.com>

This recipes is not on tag (as there are no tags in the repository).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 77a13b39fe..b0b0bd8452 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=7998cb338f82d15c0eff93b7
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SRCREV = "7f05d217867b2af52b0a28c6d1c91df97e1b5b39"
 UPSTREAM_CHECK_COMMITS = "1"
+PV .= "+git"
 
 GO_IMPORT = "golang.org/x/example"
 GO_INSTALL = "${GO_IMPORT}/hello"

