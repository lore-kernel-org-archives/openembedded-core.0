Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9F5E98E08
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:11:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31279.1771834290757720634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rCO1pVUp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D7324E4102A;
	Mon, 23 Feb 2026 08:11:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CFF15FD43;
	Mon, 23 Feb 2026 08:11:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9287710368A24;
	Mon, 23 Feb 2026 09:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771834287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=spN49kUT5LOHCyS3FtOV0ETp2CFmoi2kUBm8uAXSpbs=;
	b=rCO1pVUp08Kg6dF4vOQaOqa+Q5XrniY+HLCO5cWmwCRbUFGyi+JTdlpvrAWFTavZoqTxfv
	tYf+H5y9LBs4Od8jEtO3bjA9Q/GC4eQMGlIcCi1XOcgpE+TpbqGNWFbGqnYHzbbB8rWlfA
	MrpRKYebuik4MFSplorTF025hJioH08KBmvc0EaIXXw+82/OpgMna2Jb2wJr0cPCYf4Y1U
	0T7TyiP9WIuw3BRg5p4yb56tN1XzofO7rClx0KpYW3Pa50LnD9qEYXBIvkEtKkOyIJDjVL
	M/Hb1wYwE/xtViGli8HZJIsptvscFq8saG0mXJVoLBgSKh08zPKI+JPUSJaLHQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH v2 0/2] meta: remove reference in patches to rejected CVE
Date: Mon, 23 Feb 2026 09:11:07 +0100
Message-Id: <20260223-update-patch-with-rejected-cve-v2-0-851e6f96b910@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw7CIBQAr9Kw9hk+aowr72G6oI9XeUYLAURN0
 7uLPYHLmcXMLDIlpixO3SwSVc4cpgZ60wn0droSsGsstNQHqbWEZ3S2EERb0MOLi4dEN8JCDrA
 SKINOmWEwtBtFi8REI7/XwaVv7DmXkD7rr6qf/TtdFUjAUSnjjlbt0Z6HEMqdpy2Gh+iXZfkCh
 7q1mc4AAAA=
X-Change-ID: 20260220-update-patch-with-rejected-cve-13cd13bb3e4f
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, thomas.petazzoni@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
 jpewhacker@gmail.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Peter Marko <peter.marko@siemens.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231652

Remove the reference of 2 CVE identifiers in patch files, since the
CVEs are rejected. Remove reference to CVE-2025-62813 and to
CVE-2021-3502.

These 2 issues were found by using sbom-cve-check on the whole layer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Update title of commit messages: use the recipe name as prefix
- Link to v1: https://lore.kernel.org/r/20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com

---
Benjamin Robin (Schneider Electric) (2):
      avahi: Remove a reference to the rejected CVE-2021-36217
      lz4: Remove a reference to the rejected CVE-2025-62813

 meta/recipes-connectivity/avahi/files/local-ping.patch                  | 1 -
 .../lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch}     | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                                  | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 74ba238ff1ba1e9b612aece1989b828f3a8f8770
change-id: 20260220-update-patch-with-rejected-cve-13cd13bb3e4f

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


