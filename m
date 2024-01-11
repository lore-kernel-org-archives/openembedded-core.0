Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D98C47422
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 15:21:31 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.13792.1704986489839675750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 07:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=pVBLyWm5;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id DD673240029
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1704986487; bh=NpqvIB6eIf9f65lg5nn1hnS8GjCvthAldb2XD5/NkzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=pVBLyWm5LdIhpX7MlqKKEptxiaSfLKuKLzkOhQw5iAkwJnCHTTG0eAAoUw3/B0Txi
	 Mp7U2DFOS11wbANOuyuKcyfiDl7p0OMHiIRxUGEDQJ09UG/bLOj9Hphy563AvFOIcx
	 4XhUM/kUqIfYrJT41jqyylY1x+qO901WZNH6+OpxbfwNLJGUxNgSCHyaK86FBxLQ/+
	 Oyad8huB+vs5WVc46xwYbM9MbcN0R3HpQ2GMfHcreCqGkMniN8qDdFewW1x1/0kAKZ
	 REolW3d3InL9MUn+On2B5UTbHy/QBaPO4qzYR7Z1EIqQliZB6uXi9+nIveyVj4Gjh+
	 oq5H/phjQz1/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4T9pKg1Q5Zz9rxB;
	Thu, 11 Jan 2024 16:21:26 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] glibc: Set status for CVE-2023-5156 & CVE-2023-0687
Date: Thu, 11 Jan 2024 15:20:56 +0000
Message-Id: <20240111152056.613280-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 15:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193547

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Set `CVE_STATUS`for those CVEs, they have already been fixed with the lat=
est
pull for stable branch fixes done in rev
e444d2bed0ea140a574414fcd5a689867e8ba312. Hence the issues are fixed
already.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
index ccf9d505c5..5f24a10826 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -10,4 +10,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+(\.(?!=
90)\d+)*)"
 CVE_STATUS[CVE-2023-4527] =3D "fixed-version: Fixed in stable branch upd=
ates"
 CVE_STATUS[CVE-2023-4911] =3D "fixed-version: Fixed in stable branch upd=
ates"
 CVE_STATUS[CVE-2023-4806] =3D "fixed-version: Fixed in stable branch upd=
ates"
+CVE_STATUS[CVE-2023-5156] =3D "fixed-version: Fixed in stable branch upd=
ates"
 CVE_STATUS[CVE-2023-4527] =3D "fixed-version: Fixed in stable branch upd=
ates"
+CVE_STATUS[CVE-2023-0687] =3D "fixed-version: Fixed in stable branch upd=
ates"
--=20
2.39.2


