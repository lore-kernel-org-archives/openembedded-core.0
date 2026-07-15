Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74F3C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12277.1784133843212092760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=a0SCcUQs;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 681C11477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:43:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 517A83F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784133842; bh=3YjaWo79GdcVla5ymYOgD9uamjLaVrAfvwob6009icg=;
	h=From:To:Subject:Date:From;
	b=a0SCcUQszi52QVZAcZQFO9oqc/VBpG6eB0501Gg6NWt/8SeZ53HZSoqcS7IZXmL9P
	 iR/1U3Lobg+9jufZ9jFksWtITHlz7gTAGp0IR3U0+7b+BPOg7InUMEzeuTHL7r/Qtc
	 s81eAG4dV2uv+ctLjayggIGpsFpNQkStv+lbN53E=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] buildhistory_analysis: show changes to RSUGGESTS
Date: Wed, 15 Jul 2026 17:43:48 +0100
Message-ID: <20260715164351.903912-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240989

Not a lot of recipes use RSUGGESTS, but systemd does when generating
optional dependencies via the .dlopen ELF notes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhist=
ory_analysis.py
index 4a95a928adf..40788ffc84f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -29,7 +29,7 @@ list_order_fields =3D ['PACKAGES']
 defaultval_map =3D {'PKG': 'PKG', 'PKGE': 'PE', 'PKGV': 'PV', 'PKGR': 'P=
R'}
 numeric_fields =3D ['PKGSIZE', 'IMAGESIZE', 'SDKSIZE']
 # Fields to monitor
-monitor_fields =3D ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES',=
 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'SDKSIZE',=
 'PKG']
+monitor_fields =3D ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS',=
 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE=
', 'SDKSIZE', 'PKG']
 ver_monitor_fields =3D ['PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold =3D 10
--=20
2.43.0


