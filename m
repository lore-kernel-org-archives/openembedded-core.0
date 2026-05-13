Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22A4CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:20:52 +0000 (UTC)
Subject: Re: Wrong version of buildtools files uploaded for 5.0.16
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: Munich, Bavaria, DE (95.90.192.94)
X-Originating-Platform: Linux Firefox 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:20:43 -0700
References: <cIvm.1773510929949130964.FoKJ@lists.openembedded.org> <DH2QPDTPQT3Q.1TJYOVQ7PIU7B@smile.fr>
In-Reply-To: <DH2QPDTPQT3Q.1TJYOVQ7PIU7B@smile.fr>
Message-ID: <2115555.1778649643495207887@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4LUKbMaerud9KV9f4zzQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236918

--4LUKbMaerud9KV9f4zzQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 08:08 PM, Yoann Congal wrote:

>=20
> On Sat Mar 14, 2026 at 6:55 PM CET, Aleksandar Nikolic via
> lists.openembedded.org wrote:
>=20
>> Hi all,
>>=20
>> It appears that the files uploaded to [1] correspond to version 5.0.15
>> rather than 5.0.16.
>=20
> Nice catch! That is most likely linked to
> https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/RELEASENOT=
ES
> :
>=20
>> ---------------
>> Known Issues
>> ---------------
>> The poky DISTRO_VERSION was incorrectly left at 5.0.15. This is a minor
>> issue, if a workaround is needed please cherry-pick:
>> - poky commit 06210079b2e10d6d3fb943afe87864267e329821, or
>> - meta-yocto commit 03f93c769ec99e5086e492d8145eb308a718e8d3.
>=20
> We might have to skip 5.0.16 as the defaut buildtools version... What do
> you think?

Apologies for the late reply. I guess it doesn't matter anymore, but sure, =
we should skip 5.0.16.

Cheers,
Aleksandar
>=20
> Thanks!
>=20
>=20
>> Cheers,
>> Aleksandar
>>=20
>> [1] https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/build=
tools/
>>=20
>=20
>=20
> --
> Yoann Congal
> Smile ECS

--4LUKbMaerud9KV9f4zzQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat, Mar 14, 2026 at 08:08 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Sat Mar 14, 2026 at 6:55 PM CET, Aleksandar Nikolic via list=
s.openembedded.org wrote:<br />
<blockquote>Hi all,<br /><br />It appears that the files uploaded to [1] co=
rrespond to version 5.0.15 rather than 5.0.16.</blockquote>
Nice catch! That is most likely linked to <br /><a href=3D"https://download=
s.yoctoproject.org/releases/yocto/yocto-5.0.16/RELEASENOTES" target=3D"_bla=
nk" rel=3D"noopener">https://downloads.yoctoproject.org/releases/yocto/yoct=
o-5.0.16/RELEASENOTES</a>:<br />
<blockquote>---------------<br />Known Issues<br />---------------<br />The=
 poky DISTRO_VERSION was incorrectly left at 5.0.15. This is a minor issue,=
 if a workaround is needed please cherry-pick:<br />- poky commit 06210079b=
2e10d6d3fb943afe87864267e329821, or<br />- meta-yocto commit 03f93c769ec99e=
5086e492d8145eb308a718e8d3.</blockquote>
We might have to skip 5.0.16 as the defaut buildtools version... What do<br=
 />you think?</blockquote>
Apologies for the late reply. I guess it doesn't matter anymore, but sure, =
we should skip 5.0.16.</div>
<div>&nbsp;</div>
<div>Cheers,</div>
<div>Aleksandar&nbsp;&nbsp;
<blockquote>Thanks!<br /><br />
<blockquote>Cheers,<br />Aleksandar<br /><br />[1] <a href=3D"https://downl=
oads.yoctoproject.org/releases/yocto/yocto-5.0.16/buildtools/" target=3D"_b=
lank" rel=3D"noopener">https://downloads.yoctoproject.org/releases/yocto/yo=
cto-5.0.16/buildtools/</a></blockquote>
<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--4LUKbMaerud9KV9f4zzQ--

