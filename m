Return-Path: <mr.name@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968BC87FDB
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 20:36:57 +0000 (UTC)
Subject: Re: [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: openembedded-core@lists.openembedded.org
From: "Sven Reschke" <mr.name@web.de>
X-Originating-Location: Leichlingen, North Rhine-Westphalia, DE (93.244.214.241)
X-Originating-Platform: Linux Firefox 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 29 Aug 2024 13:36:49 -0700
References: <CAMKF1srySLdab0SR9map64pZ9nvGVzsE=K13hqUs_J-RqTi62g@mail.gmail.com>
In-Reply-To: <CAMKF1srySLdab0SR9map64pZ9nvGVzsE=K13hqUs_J-RqTi62g@mail.gmail.com>
Message-ID: <18822.1724963809858109674@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lRv26WhIs8FlqRrUkSck"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 20:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203946

--lRv26WhIs8FlqRrUkSck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@...> wrote:
>=20
>> On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
>> lists.openembedded.org wrote:
>>=20
>>> Hi Alex and Alexandre,
>>>=20
>>> sorry for the delay.
>>> I've created a PR on Github on top of your latest changes:
>>> https://github.com/Nanowires/oe-core-clone/pull/1
>>=20
>> I did try this on our automated testing and there were some issues:
>>=20
>> musl build failures:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9440/s=
teps/11/logs/stdio
>>=20
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9456/s=
teps/11/logs/stdio
>>=20
>=20
> This can be fixed by using realpath(path, NULL) API instead of
> canonicalize_file_name(path), we have done such changes
> in few packages e.g. elfutils
>=20
> https://sourceware.org/git/?p=3Delfutils.git ;a=3Dcommitdiff;h=3D06263dda=
990be6778a4beb33481cfd39ce60c623;hp=3Dfd0cee63fb02455a5021ca298da8dadb4df63=
a9a
>=20
>=20
> there is a meta-oe patch for ssiapi
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
>=20
>=20
>=20

first of all: Thanks for the automated testing :-)
Yes, I broke the realpath.patch with my update. I've pushed a fix, which sh=
ould solve this issue.

>=20
> systemd+sysvinit build failure:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/st=
eps/25/logs/stdio
>=20
>=20
> Cheers,
>=20
> Richard

For this I fixed the install.patch (which I removed in the first place). Co=
uld you re-run the tests with my latest commits? ;-)

Best regards,
Sven

--lRv26WhIs8FlqRrUkSck
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div>On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via<br />lists.=
openembedded.org<br />&lt;richard.purdie=3Dlinuxfoundation.org@...&gt; wrot=
e:<br />
<blockquote>On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via<br />lists.=
openembedded.org wrote:<br />
<blockquote>Hi Alex and Alexandre,<br /><br />sorry for the delay.<br />I'v=
e created a PR on Github on top of your latest changes:<br /><a href=3D"htt=
ps://github.com/Nanowires/oe-core-clone/pull/1" target=3D"_blank" rel=3D"no=
opener">https://github.com/Nanowires/oe-core-clone/pull/1</a></blockquote>
I did try this on our automated testing and there were some issues:<br /><b=
r />musl build failures:<br /><a href=3D"https://autobuilder.yoctoproject.o=
rg/typhoon/#/builders/64/builds/9440/steps/11/logs/stdio" target=3D"_blank"=
 rel=3D"noopener">https://autobuilder.yoctoproject.org/typhoon/#/builders/6=
4/builds/9440/steps/11/logs/stdio</a><br /><a href=3D"https://autobuilder.y=
octoproject.org/typhoon/#/builders/45/builds/9456/steps/11/logs/stdio" targ=
et=3D"_blank" rel=3D"noopener">https://autobuilder.yoctoproject.org/typhoon=
/#/builders/45/builds/9456/steps/11/logs/stdio</a></blockquote>
This can be fixed by using realpath(path, NULL) API instead of<br />canonic=
alize_file_name(path), we have done such changes<br />in few packages e.g. =
elfutils<br /><br /><a href=3D"https://sourceware.org/git/?p=3Delfutils.git=
" target=3D"_blank" rel=3D"noopener">https://sourceware.org/git/?p=3Delfuti=
ls.git</a>;a=3Dcommitdiff;h=3D06263dda990be6778a4beb33481cfd39ce60c623;hp=
=3Dfd0cee63fb02455a5021ca298da8dadb4df63a9a<br /><br />there is a meta-oe p=
atch for ssiapi<br /><a href=3D"https://git.openembedded.org/meta-openembed=
ded/tree/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_fi=
le_name-with-realpath.patch" target=3D"_blank" rel=3D"noopener">https://git=
.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/ssiapi/ssi=
api/0003-replace-canonicalize_file_name-with-realpath.patch</a></div>
<div>&nbsp;</div>
</blockquote>
<div>first of all: Thanks for the automated testing :-)</div>
<div>Yes, I broke the realpath.patch with my update. I've pushed a fix, whi=
ch should solve this issue.</div>
<div><br /><br />
<blockquote>systemd+sysvinit build failure:<br /><br /><a href=3D"https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/steps/25/logs=
/stdio" target=3D"_blank" rel=3D"noopener">https://autobuilder.yoctoproject=
.org/typhoon/#/builders/72/builds/9431/steps/25/logs/stdio</a><br /><br />C=
heers,<br /><br />Richard</blockquote>
For this I fixed the install.patch (which I removed in the first place). Co=
uld you re-run the tests with my latest commits? ;-)</div>
<div>&nbsp;</div>
<div>Best regards,</div>
<div>Sven</div>

--lRv26WhIs8FlqRrUkSck--

