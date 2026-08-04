Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F364DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:52 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25352.1785873884541944998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L82trQIT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026080420044270b655d486000207ee-ed9g25@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026080420044270b655d486000207ee
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3dU4YmJALPkDOnqZAlPprArxpGnobTPci1BuVenuvfw=;
 b=L82trQIT/B2MPSOklwbcgq1wfVHTzIFQh4pplhkx6vcIYN1Bwthu3BDsgIJfRnjLZ0obvc
 bFlHKxrZ/jb8wCrTdd+qHi8Blz7lURwdx6hkuKtBLXL8M6bGxT8h7FnHYP0H0zUiQEZwYFKZ
 IXqNP9I+OmtKUUzNZynYvAWZ/Qq31Rgsl8m1k4J9y0nTaCx4D3o2LOuibMXmcKeXy+GsyPC+
 joDhMax7wk8rKhpsQlouockqAP4WDL3r79WO5tAUUqv2u723XwhmTurWiTm1XHF7MiciPSuY
 a8ontya8PbggLG6oU3TXx7SXpnIqodeuFUn5ssdRB/iodWpa8gZQ4SPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 5/6] libxml2: set status for CVE-2026-6732
Date: Tue,  4 Aug 2026 22:03:55 +0200
Message-ID: <20260804200356.2093270-5-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-1-peter.marko@siemens.com>
References: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242800

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
[1] points to [2] and [3].
These were backported as [4] and [5] in v2.15.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-6732
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/226b560837b90dea9b14431eca6e6fda8fb01ab4
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7cea3fd1557437b88f2c7b5e1b71a2d5fb152b55
[4] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad0f009a8366860272acb8e05c41a401798f2855
[5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/65d0fe61c6f36ee40431aeb041ea703e839ff60d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 7a75c7c8485cb9225f1714c4c08e1fd05a95f145)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
index 02507d8042..abf9889b3f 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -25,6 +25,7 @@ SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
+CVE_STATUS[CVE-2026-6732] = "fixed-version: fixed in version 2.15.3"
 
 BINCONFIG = "${bindir}/xml2-config"
 

