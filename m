Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D598C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 12:20:52 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.16894.1708258849321909310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 04:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=IhdyRGXb;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id BF3FF240028
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 13:20:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708258846; bh=2wRNEsO4CpIXe5X40qUDWZ57+QOb6f/a2RSguHCvIRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=IhdyRGXb9ZxApL02A3iM87nn/uXj9SvomoZys14tsDDZKrhJNqJ+ifMvdVLbKhzda
	 48VQeCOlMzFxWWH1KqWTr59+9eBhA7+V9G3LGjcbVSLItqAuN1LiHE+jg7GaHGm5sZ
	 pemiNXmuYvJzeBrq7gCj7N6TYJl7RHPWB7wzwwSc0rUhHKaSwYNVgMYZJYVZkdU/fI
	 FKdm5g6Mt15gdABJnoskkQHoXIhywbxsDCYqQT0U93BmI6H/gm73EILz6ivNV6dIKu
	 M9AhR35R8X1RvkMEb6/JkmOO0Jfc7KFkz8Ux4ihFj14tj4xE0AtPo20lnQSEUykONI
	 XmIV8S2DlQELg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Td4Wd188Lz9rxQ;
	Sun, 18 Feb 2024 13:20:44 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] grub2: ignore CVE-2024-1048, Redhat only issue
Date: Sun, 18 Feb 2024 12:20:36 +0000
Message-Id: <20240218122036.1377001-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 12:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195826

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Redhat/Fedora specific as it affects the grub2-set-bootflag extension
added by Redhat to grub.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index 47dc921798..83cf6047de 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -26,6 +26,7 @@ SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650=
f60cfb80cc6237fa1e2b6f56154
 CVE_STATUS[CVE-2019-14865] =3D "not-applicable-platform: applies only to=
 RHEL"
 CVE_STATUS[CVE-2021-46705] =3D "not-applicable-platform: Applies only to=
 SUSE"
 CVE_STATUS[CVE-2023-4001]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
+CVE_STATUS[CVE-2024-1048]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
--=20
2.39.2


