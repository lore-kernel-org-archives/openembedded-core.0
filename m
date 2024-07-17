Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D18C3DA60
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 20:28:05 +0000 (UTC)
Subject: [scarthgap][master] license archiving is failed to tmp/deploy/licenses
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.20)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jul 2024 13:28:05 -0700
Message-ID: <ylX1.1721248085237883271.dozv@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 20:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202179

License file archiving is broken, package/recipe folders are fully empty in=
 tmp/deploy/licenses directory after the finished image build, manifest fil=
es also missing in it.

It seems to me this is broken for me since the following patch:
https://github.com/openembedded/openembedded-core/commit/1a4ab9fc26659507e6=
78e87312b514e8ea515673

This is my settings for it in my local.conf. What goes wrong?
INHERIT +=3D "archiver"
ARCHIVER_MODE[src] =3D "patched"
ARCHIVER_MODE[compression] =3D "bz2"
ARCHIVER_MODE[mirror] =3D "combined"
COPYLEFT_RECIPE_TYPES =3D "target"
COPYLEFT_AVAILABLE_RECIPE_TYPES =3D "target"

# Don't filter the license
COPYLEFT_LICENSE_INCLUDE =3D ""
COPYLEFT_LICENSE_EXCLUDE =3D ""

# Deploy licenses
COPY_LIC_MANIFEST =3D "1"
COPY_LIC_DIRS =3D "1"
LICENSE_CREATE_PACKAGE =3D "1"

