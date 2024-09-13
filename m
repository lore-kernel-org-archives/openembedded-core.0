Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F19FA372E
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 08:16:19 +0000 (UTC)
Subject: Re: [PATCH] go-mod.bbclass: Set GO_MOD_CACHE_DIR
To: openembedded-core@lists.openembedded.org
From: "Christian Lindeberg" <christian.lindeberg@axis.com>
X-Originating-Location: =?UTF-8?B?THVuZCwgU2vDpW5lIENvdW50eSwgU0U=?= (195.60.68.152)
X-Originating-Platform: Linux Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 01:16:15 -0700
References: <dbf01538-aab4-47a7-b167-3cf3c4eea94f@ti.com>
In-Reply-To: <dbf01538-aab4-47a7-b167-3cf3c4eea94f@ti.com>
Message-ID: <14967.1726215375082607012@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="r5e5sZNO8fAmjbG4TXVI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 08:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204474

--r5e5sZNO8fAmjbG4TXVI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 10:14 PM, Ryan Eatmon wrote:

>=20
> On 9/12/2024 9:29 AM, Christian Lindeberg wrote:
>=20
>> From: Christian Lindeberg <christian.lindeberg@axis.com>
>>=20
>> Set the GO_MOD_CACHE_DIR variable and move the location of the module
>> cache to enable the use of the go module fetchers for module
>> dependencies.
>> Also, clean out the module cache before unpacking.
>>=20
>> Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
>> ---
>> meta/classes-recipe/go-mod.bbclass | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/classes-recipe/go-mod.bbclass
>> b/meta/classes-recipe/go-mod.bbclass
>> index ca3a690d05..71a6712c47 100644
>> --- a/meta/classes-recipe/go-mod.bbclass
>> +++ b/meta/classes-recipe/go-mod.bbclass
>> @@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D " -modcacherw"
>>=20
>> inherit go
>>=20
>> +GO_MOD_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')),
>> 'pkg/mod')}"
>> +export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.getVar('S')),
>> d.getVar('GO_MOD_CACHE_DIR'))}"
>> +do_unpack[cleandirs] +=3D "${GOMODCACHE}"
>> +
>> GO_WORKDIR ?=3D "${GO_IMPORT}"
>> do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>> -
>> -export GOMODCACHE =3D "${B}/.mod"
>> -
>> -do_compile[cleandirs] +=3D "${B}/.mod"
>=20
>=20
> What is the reasoning behind moving the cache dir out of the build dir
> ${B} and into the bitbake managed sources dir ${S} ? There might be a
> good reason for doing it, but it was not explained in the commit message.

In the review of the gomod and gomodgit fetchers concerns were raised about
letting the fetchers unpack under ${GOMODCACHE} instead of relative to the
unpack root directory.

With the fetchers there is now a way to have the module cache part of the
bitbake managed sources instead of having to resort to
do_compile[network] =3D "1".

Thanks,
Christian

>=20
>=20
>=20
>=20
> --
> Ryan Eatmon reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc. - LCPD - MGTS

--r5e5sZNO8fAmjbG4TXVI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Sep 12, 2024 at 10:14 PM, Ryan Eatmon wrote:</div>
<div>
<blockquote>On 9/12/2024 9:29 AM, Christian Lindeberg wrote:<br />
<blockquote>From: Christian Lindeberg &lt;christian.lindeberg@axis.com&gt;<=
br /><br />Set the GO_MOD_CACHE_DIR variable and move the location of the m=
odule<br />cache to enable the use of the go module fetchers for module<br =
/>dependencies.<br />Also, clean out the module cache before unpacking.<br =
/><br />Signed-off-by: Christian Lindeberg &lt;christian.lindeberg@axis.com=
&gt;<br />---<br />meta/classes-recipe/go-mod.bbclass | 8 ++++----<br />1 f=
ile changed, 4 insertions(+), 4 deletions(-)<br /><br />diff --git a/meta/c=
lasses-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass<br />inde=
x ca3a690d05..71a6712c47 100644<br />--- a/meta/classes-recipe/go-mod.bbcla=
ss<br />+++ b/meta/classes-recipe/go-mod.bbclass<br />@@ -22,9 +22,9 @@ GOB=
UILDFLAGS:append =3D " -modcacherw"<br /><br />inherit go<br /><br />+GO_MO=
D_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')), 'pkg/mod=
')}"<br />+export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.getVar(=
'S')), d.getVar('GO_MOD_CACHE_DIR'))}"<br />+do_unpack[cleandirs] +=3D "${G=
OMODCACHE}"<br />+<br />GO_WORKDIR ?=3D "${GO_IMPORT}"<br />do_compile[dirs=
] +=3D "${B}/src/${GO_WORKDIR}"<br />-<br />-export GOMODCACHE =3D "${B}/.m=
od"<br />-<br />-do_compile[cleandirs] +=3D "${B}/.mod"</blockquote>
<br />What is the reasoning behind moving the cache dir out of the build di=
r <br />${B} and into the bitbake managed sources dir ${S} ? There might be=
 a <br />good reason for doing it, but it was not explained in the commit m=
essage.</blockquote>
In the review of the gomod and gomodgit fetchers concerns were raised about=
</div>
<div>letting the fetchers unpack under ${GOMODCACHE} instead of relative to=
 the</div>
<div>unpack root directory.</div>
<div>&nbsp;</div>
<div>With the fetchers there is now a way to have the module cache part of =
the</div>
<div>bitbake managed sources instead of having to resort to</div>
<div>do_compile[network] =3D "1".</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Christian</div>
<div><br />
<blockquote><br /><br /><br />-- <br />Ryan Eatmon reatmon@ti.com<br />----=
-------------------------------------<br />Texas Instruments, Inc. - LCPD -=
 MGTS</blockquote>
</div>

--r5e5sZNO8fAmjbG4TXVI--

