Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AE1CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:53:02 +0000 (UTC)
Subject: Re: [walnascar][PATCH 3/3] systemd.bbclass: Make systemd_postinst run as intended
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: DK (79.171.149.174)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 22:52:58 -0700
References: <20743.1758782219733650322@lists.openembedded.org>
In-Reply-To: <20743.1758782219733650322@lists.openembedded.org>
Message-ID: <18494.1759125178700011203@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nudMAxDIY1cIggjygKwq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224116

--nudMAxDIY1cIggjygKwq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Just fyi, issue appears related to non-instantiated template services - i.e=
. the below contruct:

SYSTEMD_SERVICE:${BPN} =3D "${BPN}@.service"

which in the past was not an issue for the rootfs creation.

It may have been an "undocumented feature" so far, and I guess such service=
s in fact should be disabled (SYSTEMD_AUTO_ENABLE =3D "disable"). At least,=
 doing so enables the rootfs to succeed.

Thanks

--nudMAxDIY1cIggjygKwq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Just fyi, issue appears related to non-instantiated template services =
- i.e. the below contruct:</div>
<div>&nbsp;</div>
<div>SYSTEMD_SERVICE:${BPN} =3D "${BPN}@.service"</div>
<div>&nbsp;</div>
<div>which in the past was not an issue for the rootfs creation.</div>
<div>&nbsp;</div>
<div>It may have been an "undocumented feature" so far, and I guess such se=
rvices in fact should be disabled (SYSTEMD_AUTO_ENABLE =3D "disable"). At l=
east, doing so enables the rootfs to succeed.</div>
<div>&nbsp;</div>
<div>Thanks</div>

--nudMAxDIY1cIggjygKwq--

