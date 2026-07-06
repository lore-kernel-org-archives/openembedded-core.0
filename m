Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D76C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:00:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147663.1783335637349415749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wQb/bp9W;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2B10C8EC76;
	Mon,  6 Jul 2026 11:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6804601A2;
	Mon,  6 Jul 2026 11:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8334B11BBA10E;
	Mon,  6 Jul 2026 13:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=k6QhE4NqSh9iKjwKahYQH98ECqKtMAsUkvSkOpNYQKM=;
	b=wQb/bp9W28p8e4naEKefs197hcyua/3G6zfBemTO5yFG4A0lytcBJmXer1IXz9PJmEqh0H
	ZPpWetCfVyQdwejHHvzGQvYE3OHN6NcDn/JCY5T3yjI7+q8rn75idtbGvNIRZAYVnT01Ep
	vaDrvxkT1BdIkr7vmcoW9OlMHfnXDIM+Ldn/AXVIroh951zrYLoMVGwDPhxfaeiyICdVdJ
	MsOikdVdHBVW8j0dKXodWs808rUdSGcixtCgDh3U+Kw6yjkPSyJJADMn44GYTiK3p7Z2YR
	CKN3ufK6vVXYNcPgniHKosopUW/X7KIJrXa/lmHLGIpbtjHoAS824sBs3IzCVA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [wrynose][PATCH 0/3] python3: upgrade 3.14.5 -> 3.14.6 and fix
 CVEs
Date: Mon, 06 Jul 2026 13:00:23 +0200
Message-Id: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MzQrCMBAGX6Xs2YW1YAK+SumhiZ92PSQlW6ul9
 N2NP8eBmdnIUBRG52ajgkVNc6pwPDQUxyHdwHqpTK20Trw4vuqL4wLjaZ3HnPhZ1pQNLN6Fkzg
 ZfADVeiqo6vfc9T+2R7gjzp9d98962vc3+5Z10IQAAAA=
X-Change-ID: 20260706-fix-cves-python-wrynose-076b5060a7be
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Peter Marko <peter.marko@siemens.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240248

This series fixes the following CVEs:
 - CVE-2026-11940
 - CVE-2026-11972
 - CVE-2026-3276
 - CVE-2026-7210
 - CVE-2026-7774
 - CVE-2026-8328
 - CVE-2026-9669

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (2):
      python3: fix CVE-2026-11940
      python3: fix CVE-2026-11972

Peter Marko (1):
      python3: upgrade 3.14.5 -> 3.14.6

 ...x-ThreadingMock-call-count-race-condition.patch | 37 ------------
 .../python/python3/CVE-2026-11940.patch            | 67 ++++++++++++++++++++++
 .../python/python3/CVE-2026-11972.patch            | 59 +++++++++++++++++++
 .../{python3_3.14.5.bb => python3_3.14.6.bb}       |  9 ++-
 4 files changed, 130 insertions(+), 42 deletions(-)
---
base-commit: 5d1aa5c806c061a2994f4decb59016610f093213
change-id: 20260706-fix-cves-python-wrynose-076b5060a7be

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


