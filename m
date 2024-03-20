Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9F5C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:09:03 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
 by mx.groups.io with SMTP id smtpd.web10.49208.1710950942206870027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=RmZC2rDZ;
 spf=pass (domain: protonmail.com, ip: 185.70.40.131, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710950940; x=1711210140;
	bh=cHQfHurycuGVblUq7sJThwS/J7icBuybq6Irn2gBtXI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RmZC2rDZnkdDi42GPZoGf0BtXNlWPwPSrf2A3Zod2/iLwzp5AFoxggiThbITGUL5P
	 H65+iuGt6mjzQC4ytcVKolWYuo6tuZYu6jMdeExVatzM2miGQ30f7ihneKQsESY9Ns
	 arZpqpuafYZspqElaKAWb+F942a2dozJWf576fG04IVu2FJDiZgk+VWNQU4hEYSjIl
	 Pn6n7xEw7WrDEk8FmqdL3YGvCIaN6gmebqPDvT82cn/QrfWLPkAS/dzWKLl7/72nTb
	 gohsiuwzIKQveA5z8ai+yJqqAayPuL7yVOstTz8TiooUaRr3bWLPKHSR4mW5VY/JiS
	 TkVPNZGA+9X8w==
Date: Wed, 20 Mar 2024 16:08:53 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH v2] file: add CVE_PRODUCT
Message-ID: <20240320160849.231211-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197367

Having only file as the CVE product is too generic. What we actually
want is file from file_project to match the correct CVE(s).

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
Changes in v2:
- I forgot to sign the first version.

 meta/recipes-devtools/file/file_5.45.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtool=
s/file/file_5.45.bb
index fa8dc576dccd..0144328b701c 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -8,6 +8,8 @@ SECTION =3D "console/utils"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9=
a72c502ecfdda1b"
=20
+CVE_PRODUCT =3D "file_project:file"
+
 DEPENDS =3D "file-replacement-native"
 DEPENDS:class-native =3D "bzip2-replacement-native"
=20
--=20
2.44.0



