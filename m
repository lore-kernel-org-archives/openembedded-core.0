Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C102BCA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:44:41 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66567.1790624680724734191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a9TZDUab;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202609281944389abca6146d00020789-sicny8@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609281944389abca6146d00020789
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5TOaetAshojw+ftGDYclwDoP5SiJA+99qynjm8kLYRg=;
 b=a9TZDUabbSs/MdJTy2Cm/eYs8A1/w23j/3VS7Nk7FrjAKbD3rjt5fHih+MWGULTD5vXbY/
 wrXI05n526fDS7vrtXmMRVN0sEwanOaC1DmNQ5YgYpRIA2kPQmU6cv6WGaSnMMMSqlnMMouU
 NM6IvAnOQBZYZczLEz7cyPVwh2+vB+MK2Xi1Nzz966++wonF1ZIzb99lHCU/jqGYjTXeQXhU
 RPQFL8Rhgm4bXzV1kMcAR8VyKgyWlGZynWttAVkDSRcRvPycsJBWvczmq3rsxMQEg2/4wDKT
 VjtO7ERs6+wPhyUWpoKDi40i7+o4jP5cXCRv4UFumVRjx7gOmTVNJlrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 4/4] xserver-xorg: set status for CVE-2026-55999 and CVE-2026-56000
Date: Mon, 28 Sep 2026 21:43:57 +0200
Message-ID: <20260928194357.37972-4-peter.marko@siemens.com>
In-Reply-To: <20260928194357.37972-1-peter.marko@siemens.com>
References: <20260928194357.37972-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246797

From: Peter Marko <peter.marko@siemens.com>

Per [1], CVE-2026-55999 was fixed by [2] which was backported as [3].
Per [4], CVE-2026-56000 was fixed by [5] which was backported as [6].

[1] https://security-tracker.debian.org/tracker/CVE-2026-55999
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/fbf7bac22e2c6bd627fb042742a23318263edae1
[3] https://gitlab.freedesktop.org/xorg/xserver/-/commit/0f1f4bcbfb1f23b800dfe386782d3a0f05b6756f
[4] https://security-tracker.debian.org/tracker/CVE-2026-56000
[5] https://gitlab.freedesktop.org/xorg/xserver/-/commit/2779affbdb4354e894f490e56f962527d6125043
[6] https://gitlab.freedesktop.org/xorg/xserver/-/commit/d6d96084f305a142eb3db7f720d7edd21e4c98b4

cvelistV5 has correct version identification, so CNA (SUSE) has it
correct, too.
NVD however shows non-existing version 21.2.24 (probably from CVE
description), so it's showing up in reports as unfixed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b6ab21c7e75acb65a3993565929be9c72f4a3d39)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 782c1f76ca..419e539a54 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -31,6 +31,8 @@ available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
 CVE_STATUS[CVE-2026-34000] = "fixed-version: fixed since v21.1.22"
 CVE_STATUS[CVE-2026-34002] = "fixed-version: fixed since v21.1.22"
+CVE_STATUS[CVE-2026-55999] = "fixed-version: fixed since v21.1.24"
+CVE_STATUS[CVE-2026-56000] = "fixed-version: fixed since v21.1.24"
 
 S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 

