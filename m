Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F04CFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 06:52:56 +0000 (UTC)
Subject: Re: [PATCH v2] udev-extraconf: Split automount and autonet into seperate packages
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.62)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 22:52:55 -0800
References: <20251122160554.283274-1-vpuar@qti.qualcomm.com> <CANNYZj-4W4Ujymomy-fqTgaAR8ZZ2uS_b7NwMHiAyff+UxvvEw@mail.gmail.com> <686098.1763961685702080770@lists.openembedded.org> <CANNYZj_ZBzvmadA9hgJe-KcGKYk14EfopqmnGF-+ksVYFOTWLQ@mail.gmail.com>
In-Reply-To: <CANNYZj_ZBzvmadA9hgJe-KcGKYk14EfopqmnGF-+ksVYFOTWLQ@mail.gmail.com>
Message-ID: <686098.1763967175716196226@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="blXSuVDHaqqd4cl6P9ZU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 06:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226738

--blXSuVDHaqqd4cl6P9ZU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 12:08 PM, Alexander Kanavin wrote:

>=20
> This leaves the last question: what are the actual savings achieved?
> How much disk space is saved? Does this avoid pulling in other
> dependencies? The patch doesn't adjust runtime dependencies (e.g.
> util-linux items), so the savings must be very minimal. Is it only
> about avoiding files which are not needed?
>=20
> There's a trade-off between not having unnecessary files and increased
> complexity of packaging, which carries a maintenance burden. This
> patch is probably okay, as it's for a self-contained, rarely changed
> recipe that only installs local files, it just needs to be justified a
> bit better.
>=20
> Alex

This does not save much space but just avoids installation of rules that ar=
e unrelated.
Will send a v3 with updated commit message.

Regards,
Vivek

--blXSuVDHaqqd4cl6P9ZU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Nov 24, 2025 at 12:08 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>This leaves the last question: what are the actual savings achi=
eved?<br />How much disk space is saved? Does this avoid pulling in other<b=
r />dependencies? The patch doesn't adjust runtime dependencies (e.g.<br />=
util-linux items), so the savings must be very minimal. Is it only<br />abo=
ut avoiding files which are not needed?<br /><br />There's a trade-off betw=
een not having unnecessary files and increased<br />complexity of packaging=
, which carries a maintenance burden. This<br />patch is probably okay, as =
it's for a self-contained, rarely changed<br />recipe that only installs lo=
cal files, it just needs to be justified a<br />bit better.<br /><br />Alex=
</blockquote>
This does not save much space <span data-teams=3D"true">but just avoids ins=
tallation of rules that are unrelated.</span><span data-teams=3D"true"></sp=
an></div>
<div><span data-teams=3D"true">Will send a v3 with updated commit message.<=
/span></div>
<div>&nbsp;</div>
<div><span data-teams=3D"true">Regards,</span></div>
<div><span data-teams=3D"true">Vivek</span></div>

--blXSuVDHaqqd4cl6P9ZU--

