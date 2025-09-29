Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EE6CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 14:26:46 +0000 (UTC)
Subject: Re: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
To: openembedded-core@lists.openembedded.org
From: kavinaya@qti.qualcomm.com
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.105)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 07:26:45 -0700
References: <CANNYZj9RXcePZWt4VfMqxdyARDLyoEkmdhnmF0vueTskcJgE5Q@mail.gmail.com>
In-Reply-To: <CANNYZj9RXcePZWt4VfMqxdyARDLyoEkmdhnmF0vueTskcJgE5Q@mail.gmail.com>
Message-ID: <18494.1759156005270288938@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224143

On Fri, Sep 26, 2025 at 01:01 PM, Alexander Kanavin wrote:

>
> Using custom files with unclear, unspecified ways to produce them also
> fragments the ecosystem and inserts vendor magic and
> non-reproducibility into the build process. That is a negative impact
> on the project, and goes against its principles.
>=20
> Fixing the ITS generator is still the preferred solution, even if it
> requires more work on your part, possibly including writing tests.
>
Hi Alexander,

Thanks for the feedback. I=E2=80=99ll address these concerns by extending t=
he ITS generator instead of using custom ITS files, ensuring the=20
solution remains reproducible and aligned with project principles. I=E2=80=
=99ll also add tests as needed.

Thanks,
Kavinaya

