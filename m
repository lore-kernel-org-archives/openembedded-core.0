Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D4C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 14:31:49 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web10.33428.1676817103639270524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 06:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id D21EE161A3;
	Sun, 19 Feb 2023 16:31:40 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id oTVajPhPR3wm; Sun, 19 Feb 2023 16:31:40 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 8A3AE1618D;
	Sun, 19 Feb 2023 16:31:40 +0200 (EET)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 6A4A72C63;
	Sun, 19 Feb 2023 16:31:38 +0200 (EET)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] ref-manual: Fix invalid feature name
Date: Sun, 19 Feb 2023 16:31:33 +0200
Message-Id: <20230219143133.66511-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 14:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177332

Replace the invalid feature name with correct one which helps to avoid
following bitbake error

  ERROR: Nothing PROVIDES 'core-image-minimal'
  core-image-minimal was skipped: 'empty-root-passwd' in IMAGE_FEATURES (=
added via EXTRA_IMAGE_FEATURES) is not a valid image feature.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
index 794a6fd15b..051bf9320a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -294,11 +294,11 @@ Here are the image features available for all image=
s:
    forced in ``/etc/passwd`` and ``/etc/shadow`` if such files exist.
=20
    .. note::
-       ``empty-root-passwd`` doesn't set an empty root password by itsel=
f.
+       ``empty-root-password`` doesn't set an empty root password by its=
elf.
        You get an initial empty root password thanks to the
        :oe_git:`base-passwd </openembedded-core/tree/meta/recipes-core/b=
ase-passwd/>`
        and :oe_git:`shadow </openembedded-core/tree/meta/recipes-extende=
d/shadow/>`
-       recipes, and the presence of ``empty-root-passwd`` or ``debug-twe=
aks``
+       recipes, and the presence of ``empty-root-password`` or ``debug-t=
weaks``
        just disables the mechanism which forces an non-empty password fo=
r the
        root user.
=20
--=20
2.39.0


