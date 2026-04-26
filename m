Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C0FF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17277.1777205016552238237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=c3AW6PXc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260426120334052bf7b2ae00020732-uzow_8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260426120334052bf7b2ae00020732
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Tn2Kv7EJhMztk/eGfs5ArWesHiWR4lkf0RC4EiY1su4=;
 b=c3AW6PXcQGzQ2/cxNyHdqADMsV4EfeWZdCRjs/AUYwjneTEtF43gaYdh0hC3OuUcLu+qgT
 SPj/lLJ38/kME2jqsIaLHxjLZHZ6ijYQpLe8DLr3F5jE2dhQ2TynBfmpbu1O3eSuvcgiix5G
 BDhhaf/RJ9F7+SahuG/AqK011IbtkWbtsbcsVkP/5buws5dm70/qXK5pctAKy3KnO1aF7dSo
 xVzXihB/M9FgXwhjF21r6LXnSiA4eZauOM1GIs/Sfaq6kmfudEwWrYA8v9x6p2KmAbZbYXQ6
 AjYH93GRXwnTbq/HpDhd5Q/OwHfkR1ZpEK0Svwmk+uXzHslOg+paR3yw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/8] bind: set status for CVE-2017-3139
Date: Sun, 26 Apr 2026 14:02:49 +0200
Message-ID: <20260426120253.825060-4-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235955

From: Peter Marko <peter.marko@siemens.com>

NVD [1] has only redhat cpes.
Debian [2] says RHEL6 specific.
cvelistV5 [3] has unparseable (so assumes affected):
  "version": "shipped in Red Hat Enterprise Linux 6"

[1] https://nvd.nist.gov/vuln/detail/CVE-2017-3139
[2] https://security-tracker.debian.org/tracker/CVE-2017-3139
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2017/3xxx/CVE-2017-3139.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/bind/bind_9.20.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.22.bb b/meta/recipes-connectivity/bind/bind_9.20.22.bb
index c459cf28c9..318412a62c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.22.bb
@@ -108,3 +108,5 @@ FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 
 DEV_PKG_DEPENDENCY = ""
+
+CVE_STATUS[CVE-2017-3139] = "not-applicable-platform: RedHat specific issue"

