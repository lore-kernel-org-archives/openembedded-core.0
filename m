Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1FAC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33382.1790499629470991091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YrOyo1+m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260927090027316c7c8faa0002076b-7omezj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260927090027316c7c8faa0002076b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RJK46qcr08BARfhbw57JcE4qNNQmMS1sP3WLFgYqCW8=;
 b=YrOyo1+mWClcLiSooqyZQjv188dFXsKWgAk4xkhBLm3Y2bSQquxVPjZ/Bidi6gsFvALU8A
 8G+vd4SraxbJA60mRk+yLn8ylW7zFE4jL3AJSqbo7xuPaVRVGdmBy0Lx/utBRsO2b9iSFuKF
 sDzZ8t4aRVGqV/lIMWofht8gHbOpWeHLF67PoafagcJCKQDQE/wF9wRwaeQm+h5az0cxhBQ4
 YBIwJ8JhM1DwU+u/Qk81Vuk2c1OyBXlIJVZfjKB+mhlbWhZ1uEviRM8sZ7WBAMRb0/X/58s5
 BAA08gha0EEXKzlh64JYcbLnJVUTVb6FRa25ExukmP2VAlgcUf8S2owA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 7/8] ppp: set status for CVE-2020-15704
Date: Sun, 27 Sep 2026 10:59:35 +0200
Message-ID: <20260927085936.114900-7-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246685

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this is Ubuntu-specific issue.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15704

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1f875a76c3b5aca955f705163b07dd1fe20373be)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 37e223b4ab..698d6930eb 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -79,3 +79,4 @@ SUMMARY:${PN}-password = "Plugin for PPP to get passwords via a pipe"
 SUMMARY:${PN}-l2tp     = "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-tools    = "Additional tools for the PPP package"
 
+CVE_STATUS[CVE-2020-15704] = "not-applicable-platform: specific to Ubuntu"

