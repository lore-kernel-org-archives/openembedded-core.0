Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1C5C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:00:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31063.1784660425873393431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I8ru0TGs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260721190028e71e0d9cbd000207bd-d_ktwz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260721190028e71e0d9cbd000207bd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0++2Nq9eCgJayJiN2+BMaxlZxZUS4BqbsgyUOClqjGU=;
 b=I8ru0TGso7MkCjHADxVE9/rovHr/RaKHJ1YPOiFUo/wzsz5+TYkXERybaPZrAcna4JB2It
 vxmPk5BiNaQubJDiL6VXELrfnspi3EuIfnQROsdN4pgikpufwDVDF2KbMPvX0yMiO939dDwr
 XfMjdKiWLtxTPJVYVdgIpnd3PswC8JTUU5p2qQqAP7io0ec+0K3mAbwqkuTPA6fQGtY+PcSk
 iODoJRr/dU+CWmMAn/FrDvPXs88jJ+K+n4Zko1CcV+EvU/9xBxksLHgo9ylws+Azbt9piVYE
 DyKH50RRs1PccqjT7FdRfCbc1i7C7SXB8ABZRvkXXigIjATRa0Q24ztg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/4] libinput: set status for CVE-2026-35094
Date: Tue, 21 Jul 2026 21:00:04 +0200
Message-ID: <20260721190005.49809-3-peter.marko@siemens.com>
In-Reply-To: <20260721190005.49809-1-peter.marko@siemens.com>
References: <20260721190005.49809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241570

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in 1.31.1 per [1]
It is present in CVE reports as open because it's RedHat version-less.
This was originally patched and CVE patch was removed during upgrade
1.30.2 -> 1.31.3 because the patch was integrated in that release.

[1] https://security-tracker.debian.org/tracker/CVE-2026-35094

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/wayland/libinput_1.31.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/libinput_1.31.3.bb b/meta/recipes-graphics/wayland/libinput_1.31.3.bb
index aed79951ea..11341af63f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.31.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.31.3.bb
@@ -47,3 +47,5 @@ RREPLACES:${PN} = "libinput"
 RCONFLICTS:${PN} = "libinput"
 
 FILES:${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"
+
+CVE_STATUS[CVE-2026-35094] = "fixed-version: Fixed since version 1.31.1"

