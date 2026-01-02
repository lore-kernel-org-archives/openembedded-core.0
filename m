Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44FEFA3742
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:34:58 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4175.1767357294103244258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 04:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UHXS2gRp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260102123450535c13331600020722-wpowtf@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260102123450535c13331600020722
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 13:34:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LMUi6i8YzT8joLIkeO3q40sWfaa3ltfKleoxH1fvydA=;
 b=UHXS2gRptWnE4SqxdYlPCe46zRCKYwNuy/4rS+M7Q/NcnOuc0joPQcjo9RyThiaYUegRWO
 RHXpLSg/9M0JtGRDJTKoBy/1mbkSb0aC6ePXYuvol47/9bG0THyEQmVBQvFFMrtlOji2nvqb
 QMc3xbS4h/oqyXX8UWGO6xgHNUd8/f/V3y70+XEFkIsQdOiwjhWz+Jr1fA9fqJE3nNmKO88V
 RjYZkkwET2AyTMtuJEweWy4Kc8YSVD0DU5gH+aRkWR5m1bpLojDHGk/2OwMys0ud4QpSvOJL
 JIF9l8SjjleyqueNNJf7cav5NuekGH8fwptnGwzvlKQgon2kw+nFCFXw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libpcap: upgrade 1.10.5 -> 1.10.6
Date: Fri,  2 Jan 2026 13:34:40 +0100
Message-Id: <20260102123440.2540755-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 12:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228841

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-11961 and CVE-2025-11964.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 7ad52acd06..1b10001035 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
-SRC_URI[sha256sum] = "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
+SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 
 inherit autotools binconfig-disabled pkgconfig
 

