Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089FFFF8860
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17279.1777205022226187826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Mv+J5PQc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026042612033994e59179110002071f-obla65@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026042612033994e59179110002071f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NK/K5WAdf1zNw3vYc+96fVL7Wpbq7G/vbfqAmLt6qj0=;
 b=Mv+J5PQc37CCoKvIPrm4VghhvKmYTaI5jk/n197WlOx8LCp5aq5U/glgRusFNvArHy7Arl
 5JRok/6NJRXIWw8cyo/T4+IKWh8C3qqDGKrZYYvSdxh2qMSj29ySJzsGEZhN6N1LivFrPyPD
 ++h9c0JgwPe6/Hr536G2bLyfe8u29wF0CZtoUIyHmDk0ReT+Ek00nsRDW1MZuKnEjOnXBf4u
 ei0FUqYS2nCzM+1bmdVA2T23NAo7S/c5xZBxy0wVrf+jtZudHTF4trAWMvXt405jmVZ0zNDj
 emdSKm8OLAX35EG324hhAHxxHA1TrD/3ZLyI5Nv/nFW1q2sptE0cB4uQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/8] base-files: set status for CVE-2018-6557
Date: Sun, 26 Apr 2026 14:02:50 +0200
Message-ID: <20260426120253.825060-5-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235956

From: Peter Marko <peter.marko@siemens.com>

CPE in NVD [1] shows ubuntu.
Debian [1] says "Ubuntu specific motd update code".
cvelistV5 has unparseable CPE so it sbom-cve-check assumes vulnerable
  ("lessThan": "10.1ubuntu2.2").

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 3f01bb35d9..d4d777b485 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -167,3 +167,5 @@ CONFFILES:${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname ${sysconf
 CONFFILES:${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
 
 INSANE_SKIP:${PN} += "empty-dirs"
+
+CVE_STATUS[CVE-2018-6557] = "not-applicable-platform: Ubuntu specific motd update code"

