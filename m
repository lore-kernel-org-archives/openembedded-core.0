Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC1BC44528
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:01:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4185.1784534466323248191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2BndOQWi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14F0C1A1103;
	Mon, 20 Jul 2026 08:01:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD59360360;
	Mon, 20 Jul 2026 08:01:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7345C11BD1242;
	Mon, 20 Jul 2026 10:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784534462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=D+A9zit8mWMR1EOzVmEsq81mUszhj/3Z/F23NyiuZJ4=;
	b=2BndOQWiwnSRj5Z/Hs0KFYQp1HUmN8KurMDPlij6s0qmeRfZPcE/3T89y6l16BxdTYTeIp
	hVwGJK4SIMG/WNDQB4tzmZKb9fAypzRRtww2DD+dVvBYxt+xy/xyXetZYhULNcl4pNC+6j
	HR47YHybBqtUv6gBLkDBlvgym3d5PMY84oB7bHoQS289xczD6NihR0CK2bZy5Ye/9ub4nv
	itqc+FPqh6CAmQp9ApUYYkEcUzQ1PRBNQwI7rz+D22gHqmk5ROXcYDNQGegPzgGw0vKh5F
	JfkgFTZRuwc1tXFCzCfo95r/pqmvw4z7B2g2F8disYS8gc4s07LgpK/MWs4LVQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [scarthgap][PATCH v2 0/3] python3: fix CVE-2026-11940,
 CVE-2026-11972 and CVE-2026-9669
Date: Mon, 20 Jul 2026 10:01:00 +0200
Message-Id: <20260720-fix-cves-python-scarthgap-v2-0-fe434ff03f49@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw6CMBREf8V07TUtIiWu/A/Coo8LrdGWtLWRE
 P7dgolrlyeZMzMLiRgsRnI9LCRgttF6V6A6Hogywo0IVhcmFa0aymkDg32DyhhhmpPxDqISIZl
 RTMAblDWy4ax5S4o/BSzhvbvrvxxf8o4qbYXdT+y3sLEx+TDvPzLblH8mMwMKrb4wLVk9cKFu0
 vv0sO6k/JP067p+AGe70YjhAAAA
X-Change-ID: 20260706-fix-cves-python-scarthgap-76eb4e1f3d78
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241334

This series fix the following CVEs:
 - CVE-2026-11940
 - CVE-2026-11972
 - CVE-2026-9669

On master and wrynose the CVE-2026-9669 patch is not necessary since it is
already included in 3.14.6

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Add back Co-authored-by in CVE-2026-11972 patch
  It had been deleted by mistake due to a lack of knowledge regarding how
  to handle it.
- Fix commit author of CVE-2026-9669 patch to use the original author and
  not the bot named Miss Islington.
- Link to v1: https://patch.msgid.link/20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com

---
Benjamin Robin (Schneider Electric) (3):
      python3: fix CVE-2026-11940
      python3: fix CVE-2026-11972
      python3: fix CVE-2026-9669

 .../python/python3/CVE-2026-11940.patch            | 66 +++++++++++++++
 .../python/python3/CVE-2026-11972.patch            | 60 ++++++++++++++
 .../python/python3/CVE-2026-9669.patch             | 96 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.12.13.bb    |  3 +
 4 files changed, 225 insertions(+)
---
base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
change-id: 20260706-fix-cves-python-scarthgap-76eb4e1f3d78

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


