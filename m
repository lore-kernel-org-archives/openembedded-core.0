Return-Path: <ripastri@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE814C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 23:51:31 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.765.1657842681636014994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 16:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=WqZAmTFI;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: ripastri@linux.microsoft.com)
Received: from leda.corp.microsoft.com (unknown [50.35.98.180])
	by linux.microsoft.com (Postfix) with ESMTPSA id 07B4E20FD0C8;
	Thu, 14 Jul 2022 16:51:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 07B4E20FD0C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657842681;
	bh=lQEl3COAEmY5TWrdJprqqBYQwS7pza+6hQwJ+v/YgFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WqZAmTFIZJ7zdHPgTRKb4lStAEtNnt2wuAaThfUCzuKsA6Cz7PCa2XGviKPnIKj2l
	 mKEm6FZUtLiHP70ccHcvAuNSKm+DQ4ps/SBs0fvU+YpQQlnN2jpN+LCeL2hpDy1CAB
	 vEiFP4JYpmLD5S2vnPtHOAmniCkO1+CSWVx8JmmY=
From: Richard Pastrick <ripastri@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com
Subject: [kirkstone][PATCH 2/2] externalsrc.bbclass: support crate fetcher on
 externalsrc
Date: Thu, 14 Jul 2022 16:51:03 -0700
Message-Id: <20220714235103.75188-2-ripastri@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714235103.75188-1-ripastri@linux.microsoft.com>
References: <20220714235103.75188-1-ripastri@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 23:51:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168053

From: Chanho Park <chanho61.park@samsung.com>

To support crate:// fetcher on externalsrc, we need to make pass-through
the URIs in SRC_URI.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Pastrick <ripastri@linux.microsoft.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index b2f216f361..90792a737b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,7 +68,7 @@ python () {
             url_data =3D fetch.ud[url]
             parm =3D url_data.parm
             if (url_data.type =3D=3D 'file' or
-                    url_data.type =3D=3D 'npmsw' or
+                    url_data.type =3D=3D 'npmsw' or url_data.type =3D=3D=
 'crate' or
                     'type' in parm and parm['type'] =3D=3D 'kmeta'):
                 local_srcuri.append(url)
=20
--=20
2.25.1


