Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DE6C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 15:37:23 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.48165.1710949033533206401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 08:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=kmaqeHAm;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710949031; x=1711208231;
	bh=qWxhrcxVUqSKw1yvjLBsojISo8ILzQCe3l4l3x9UXNs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kmaqeHAmp/2Z0A/u7fIO2lu9OjcF73Fe3KWCJUqU4XyfUbrwBtgDVSVDJ1EA53K0L
	 G3LBufYTFz9bErsNgO4fTfGfHEmEiOmEt1fPzVddBt8GN0LtVg26YVa/N3ckWnwoTS
	 Ev5I/yN3moa5xXcdEQrYnRz9U3HVDjYIkBTIGYJ1VZSvd0W8czYdpNcTfFqtcGeMcx
	 4/PfkyD3286GKHcvQspfd5zrRzwxqiws4UUoSBlH4qNDOV0UXksHoT9waViqekXjGK
	 NJ8MkJfNViUCo5/jX6jTHR0XLR4U33FgVfhCq6Q9lZya5DlU7MHLoZ+b5wCfmABqID
	 +wBXx+32hsgFw==
Date: Wed, 20 Mar 2024 15:36:48 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] file: add CVE_PRODUCT
Message-ID: <20240320153643.199309-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 15:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197362

Having only file as the CVE product is too generic. What we actually
want is file from file_project to match the correct CVE(s).
---
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



