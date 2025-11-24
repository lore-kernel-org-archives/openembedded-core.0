Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C92CFD318
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 05:21:25 +0000 (UTC)
Subject: Re: [PATCH v2] udev-extraconf: Split automount and autonet into seperate packages
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.62)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 21:21:25 -0800
References: <20251122160554.283274-1-vpuar@qti.qualcomm.com> <CANNYZj-4W4Ujymomy-fqTgaAR8ZZ2uS_b7NwMHiAyff+UxvvEw@mail.gmail.com>
In-Reply-To: <CANNYZj-4W4Ujymomy-fqTgaAR8ZZ2uS_b7NwMHiAyff+UxvvEw@mail.gmail.com>
Message-ID: <686098.1763961685702080770@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PNRWwTosLatpWvvaU9VX"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 05:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226733

--PNRWwTosLatpWvvaU9VX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 09:36 PM, Alexander Kanavin wrote:

>=20
> The same reasoning applies to any other recipe: we could micro-split
> everything. It would help to go into a bit more details on this: what
> do these features do, and why one would want one but not the other,
> and what are the actual savings achieved.
>=20
> Alex

If one needs only storage devices to be auto-mounted and does not require
network hotplug handling, splitting allows selecting just the automount pac=
kage
without having to care about other rules. This also avoids installing unnec=
essary
scripts and rules.

Regards,
Vivek

--PNRWwTosLatpWvvaU9VX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Nov 23, 2025 at 09:36 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>The same reasoning applies to any other recipe: we could micro-=
split<br />everything. It would help to go into a bit more details on this:=
 what<br />do these features do, and why one would want one but not the oth=
er,<br />and what are the actual savings achieved.<br /><br />Alex</blockqu=
ote>
If one needs only storage devices to be auto-mounted and does not require</=
div>
<div>network hotplug handling, splitting allows selecting just the automoun=
t package</div>
<div>without <span data-teams=3D"true">having to care about other rules</sp=
an>. This also avoids installing unnecessary</div>
<div>scripts and rules.</div>
<div>&nbsp;</div>
<div><span data-teams=3D"true">Regards,</span></div>
<div><span data-teams=3D"true">Vivek</span></div>

--PNRWwTosLatpWvvaU9VX--

