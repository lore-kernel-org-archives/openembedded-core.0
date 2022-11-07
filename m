Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7668EC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 11:33:51 +0000 (UTC)
Subject: Re: [master][PATCH v2] image_types: Add 7-Zip support in conversion types and commands
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Fegyvernek, Jász-Nagykun-Szolnok, HU (178.48.208.198)
X-Originating-Platform: Windows Chrome 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 03:33:48 -0800
References: <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
In-Reply-To: <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
Message-ID: <5045.1667820828098527074@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0g8uiUVIAOGCuMYyB3Gc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 11:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172835

--0g8uiUVIAOGCuMYyB3Gc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Good point for this zip extension conflict, you are right. If somebody is a=
 overzealous developer can use IMAGE_TYPES =3D "wic.zip wic.7zip" then sure=
 there will be an extension conflict after the compression in deploy time. =
This escaped my notice this because this use case is not so realistic (norm=
aly enough only one zip pack for wic image) but can be a real issue. 100% s=
ure 7ZIP_EXTENSION ?=3D 7z can be better for default value, then it can be =
overridable to .zip extension in users's local.conf if needed (for example =
for me it .zip will be better).

Do i need to resend again the patch in a new thread/topic if i like to solv=
e the missing signed-off issue?

--0g8uiUVIAOGCuMYyB3Gc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Good point for this zip extension conflict, you are right. If somebody i=
s a overzealous developer can use IMAGE_TYPES =3D "wic.zip wic.7zip" then s=
ure there will be an extension conflict after the compression in deploy tim=
e. This escaped my notice this because this use case is not so realistic (n=
ormaly enough only one zip pack for wic image) but can be a real issue. 100=
% sure 7ZIP_EXTENSION ?=3D 7z can be better for default value, then it can =
be overridable to .zip extension in users's local.conf if needed (for examp=
le for me it .zip will be better).</p>
<p>&nbsp;</p>
<p>Do i need to resend again the patch in a new thread/topic if i like to s=
olve the missing&nbsp;<span style=3D"white-space: pre-wrap;">signed-off iss=
ue?</span></p>

--0g8uiUVIAOGCuMYyB3Gc--

