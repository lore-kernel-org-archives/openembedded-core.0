Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEB3C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 07:34:35 +0000 (UTC)
Subject: Re: [PATCH] glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe
To: openembedded-core@lists.openembedded.org
From: "rajmohan r" <semc.2042@gmail.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (167.103.7.18)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 00:34:28 -0700
References: <CANNYZj9ArEu9aVutHmDgeF48LzmCq=333GwS0x-GFz1c14e3=g@mail.gmail.com>
In-Reply-To: <CANNYZj9ArEu9aVutHmDgeF48LzmCq=333GwS0x-GFz1c14e3=g@mail.gmail.com>
Message-ID: <18025.1745912068282863297@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EoMNogh4aG4m6BwFOboY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 07:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215652

--EoMNogh4aG4m6BwFOboY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 07:53 AM, Alexander Kanavin wrote:

>=20
> On Thu, 24 Apr 2025 at 16:48, rajmohan r via lists.openembedded.org
> <semc.2042=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> Upstream-Status: Pending
>=20
> This is not needed here; upstream-status only applies to patches added
> to a recipe that directly modify upstream components.
>=20
>> .../glibc/glibc-y2038-tests_2.41.bb | 107 ------------------
>> meta/recipes-core/glibc/glibc/run-ptest | 37 ------
>=20
> There's a few more files that refer to this recipes and need to be fixed:
>=20
> meta/conf/distro/include/ptest-packagelists.inc
> meta/conf/distro/include/time64.inc
> meta/conf/distro/include/maintainers.inc

Updated the changes here https://lists.openembedded.org/g/openembedded-core=
/message/215651 please review.

>=20
> Alex

--EoMNogh4aG4m6BwFOboY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Apr 25, 2025 at 07:53 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>On Thu, 24 Apr 2025 at 16:48, rajmohan r via lists.openembedded=
.org<br />&lt;semc.2042=3Dgmail.com@lists.openembedded.org&gt; wrote:<br />
<blockquote>Upstream-Status: Pending</blockquote>
This is not needed here; upstream-status only applies to patches added<br /=
>to a recipe that directly modify upstream components.<br />
<blockquote>.../glibc/glibc-y2038-tests_2.41.bb | 107 ------------------<br=
 />meta/recipes-core/glibc/glibc/run-ptest | 37 ------</blockquote>
There's a few more files that refer to this recipes and need to be fixed:<b=
r /><br />meta/conf/distro/include/ptest-packagelists.inc<br />meta/conf/di=
stro/include/time64.inc<br />meta/conf/distro/include/maintainers.inc</bloc=
kquote>
Updated the changes here <a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/message/215651" target=3D"_blank" rel=3D"noopener">https://list=
s.openembedded.org/g/openembedded-core/message/215651</a> please review.<br=
 />
<blockquote>Alex</blockquote>
</div>

--EoMNogh4aG4m6BwFOboY--

