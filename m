Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A717CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 22:12:16 +0000 (UTC)
Subject: Re: [meta][PATCH] go-vendor.bbclass: Unpack into BP for destsuffix
To: openembedded-core@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.194)
X-Originating-Platform: Windows Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Jun 2026 15:12:15 -0700
References: <20260618213119.2495463-1-john.ripple@keysight.com> <CADkTA4MYBKZuuJ5iNHvq+SErx=mB3fz1UZq3VC1rofMemoUivw@mail.gmail.com> <211612.1781819802325628623@lists.openembedded.org> <b5ab82818c3fff23ad4a91c7269d82f341e808fc.camel@linuxfoundation.org>
In-Reply-To: <b5ab82818c3fff23ad4a91c7269d82f341e808fc.camel@linuxfoundation.org>
Message-ID: <211612.1781820735551062775@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RukoINmRdcRhseyGKnPH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 22:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239113

--RukoINmRdcRhseyGKnPH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> It does sound a lot like we're missing some test cases as if I
> understand it correctly, that class can't have worked for a while?
>=20

I've used the go-vendor class on Scarthgap and have only started to
look at it on Wrynose with the recent release. It would have thrown
an error since whenever the insane.bbclass explicitly denied setting
S =3D "${UNPACKDIR}/git". It's probably slipped under the radar
because nothing uses it in the core layers.

John

--RukoINmRdcRhseyGKnPH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div>It does sound a lot like we're missing some test cases as if I<br />un=
derstand it correctly, that class can't have worked for a while?</div>
</blockquote>
<div>I've used the go-vendor class on Scarthgap and have only started to</d=
iv>
<div>look at it on Wrynose with the recent release. It would have thrown</d=
iv>
<div>an error since whenever the insane.bbclass explicitly denied setting</=
div>
<div>S =3D "${UNPACKDIR}/git". It's probably slipped under the radar</div>
<div>because nothing uses it in the core layers.</div>
<div>&nbsp;</div>
<div>John</div>

--RukoINmRdcRhseyGKnPH--

