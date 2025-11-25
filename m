Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC543CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:01:57 +0000 (UTC)
Subject: Re: [PATCH v3] udev-extraconf: Split automount and autonet into seperate packages
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.94)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Nov 2025 01:01:47 -0800
References: <20251124080022.2814003-1-vpuar@qti.qualcomm.com> <CANNYZj9iSMUDNP7oK7+6Ui=oezHjjk-JhzEpOPA90BKyUMg_cg@mail.gmail.com>
In-Reply-To: <CANNYZj9iSMUDNP7oK7+6Ui=oezHjjk-JhzEpOPA90BKyUMg_cg@mail.gmail.com>
Message-ID: <702331.1764061307827270799@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="rO9owWn2UsMaNI7ndyVk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226758

--rO9owWn2UsMaNI7ndyVk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 04:12 PM, Alexander Kanavin wrote:

>=20
> I'm still not convinced 'not installing unnecessary files' when amount
> of file is small and the files are tiny is a sufficient reason, and
> this sets a precedent for any recipe being subject to such
> micro-splitting, but maybe others in the patch review will disagree.
>=20
> What I wanted to point out is this line that isn't changed by the patch:
>=20
> RDEPENDS:${PN} =3D "udev util-linux-blkid
> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk',
> '', d)}"
>=20
> which prompts a couple questions:
>=20
> 1. How was this tested? If you install only the new packages, these
> dependencies will not be fulfilled.
>=20
> 2. Can you review what and where needs those things and adjust
> RDEPENDS accordingly?

Sure, will update the RDEPENDS, make necessary changes and share v4.

>=20
> Alex

Regards,
Vivek

--rO9owWn2UsMaNI7ndyVk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Nov 24, 2025 at 04:12 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>I'm still not convinced 'not installing unnecessary files' when=
 amount<br />of file is small and the files are tiny is a sufficient reason=
, and<br />this sets a precedent for any recipe being subject to such<br />=
micro-splitting, but maybe others in the patch review will disagree.<br /><=
br />What I wanted to point out is this line that isn't changed by the patc=
h:<br /><br />RDEPENDS:${PN} =3D "udev util-linux-blkid<br />${@bb.utils.co=
ntains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk',<br />'', d)}"<br /=
><br />which prompts a couple questions:<br /><br />1. How was this tested?=
 If you install only the new packages, these<br />dependencies will not be =
fulfilled.<br /><br />2. Can you review what and where needs those things a=
nd adjust<br />RDEPENDS accordingly?</blockquote>
Sure, will update the RDEPENDS, make necessary changes and share v4.<br />
<blockquote>Alex</blockquote>
</div>
<div>Regards,</div>
<div>Vivek</div>

--rO9owWn2UsMaNI7ndyVk--

