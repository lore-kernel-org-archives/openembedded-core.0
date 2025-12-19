Return-Path: <opensource@nabladev.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150BDD767FF
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:14:09 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15472.1766146448097040490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nabladev.com header.s=dkim header.b=UP05rr0z;
 spf=pass (domain: nabladev.com, ip: 178.251.229.89, mailfrom: opensource@nabladev.com)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 055E01086B6;
	Fri, 19 Dec 2025 13:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1766146446; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RtvHyp7iNElVWgF0cSHmpUXOP1tF7iZrM7AZyhuY2jA=;
	b=UP05rr0z4ZPxRX3vu5bC3lR+9buhjzFdihYypCXKLG6N2pdULDKeJKPENsZWX461jycCq6
	Ik3EFALflN4e7o2uRQ9p21ay0LknplrM07nPnPr+8a1qx6M9g7eTpFO4aLN3JyuCdR9rDz
	cY++6T7XjApBWUyQ7aKlzCRNgAQciuiG8Va0AQYSBxL1jxmF7O+YKeY9GbRO0KPY6WesNR
	hd83Zp4sLv3PPIqeOsSEBotX5KdcJZ0OccIHnrPeu7Oj0Ztf9PGP6/m4xDHjt8+kW8xneH
	Anq1QN7e4rMvE9b0HNow/Hiz+RdjSFf4QW996Z967bEiaIPTsq6rJAJAg0t9aA==
From: opensource@nabladev.com
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@nabladev.com>
Subject: [PATCH] maintainers.inc: update mail for libubootenv
Date: Fri, 19 Dec 2025 13:14:03 +0100
Message-ID: <20251219121403.23404-1-opensource@nabladev.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228227

From: Stefano Babic <sbabic@nabladev.com>

Signed-off-by: Stefano Babic <sbabic@nabladev.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 523ac09b53..e987ac5282 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -421,7 +421,7 @@ RECIPE_MAINTAINER:pn-libunistring =3D "Unassigned <un=
assigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libunwind =3D "Bruce Ashfield <bruce.ashfield@gmail=
.com>"
 RECIPE_MAINTAINER:pn-liburcu =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libusb1 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@denx.de>"
+RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@nabladev.com=
>"
 RECIPE_MAINTAINER:pn-libuv =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libva =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libva-initial =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
--=20
2.43.0


