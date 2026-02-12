Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C85EB48EB
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:06:23 +0000 (UTC)
Subject: Re: [PATCH 1/2] devtool: avoid recursion into nested git repos with submodules
To: openembedded-core@lists.openembedded.org
From: "Clement Faure" <clement.faure@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Edge 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 02:06:21 -0800
References: <20260204143732.94832-1-clement.faure@arm.com> <20260204143732.94832-2-clement.faure@arm.com> <CF2BD347-8BC8-4985-862A-2CD3BCCB716E@arm.com>
In-Reply-To: <CF2BD347-8BC8-4985-862A-2CD3BCCB716E@arm.com>
Message-ID: <1270865.1770890781039994422@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231017

On Tue, Feb 10, 2026 at 12:59 PM, Ross Burton wrote:

>
> Hi Clement,
>=20
> On 4 Feb 2026, at 14:37, Clement Faure via lists.openembedded.org
> <clement.faure=3Darm.com@lists.openembedded.org> wrote:
> > +                    if ".gitmodules" in dirs + files:
>=20
> I=E2=80=99m guessing this was to mirror the code above, but as far as I=
=E2=80=99m aware
> .gitmodules is always a file and not a directory, so this can just look i=
n
> files, right?
Yes, you're right. I will fix that in v2
>=20
> Cheers,
> Ross
>=20
>

