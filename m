Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E631ECD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:22:12 +0000 (UTC)
Subject: Re: [whinlatter][PATCH] scripts/install-buildtools: Update to 5.3.2
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: Munich, Bavaria, DE (95.90.192.94)
X-Originating-Platform: Linux Firefox 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:22:07 -0700
References: <20260314180151.43501-1-aleksandar.nikolic22@pm.me> <20260314180151.43501-3-aleksandar.nikolic22@pm.me> <DH2RVWI85JHY.9VXXCUXB22I3@smile.fr>
In-Reply-To: <DH2RVWI85JHY.9VXXCUXB22I3@smile.fr>
Message-ID: <2115555.1778649727366269581@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jhXN7OQMTBO7CsgRqCoh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236919

--jhXN7OQMTBO7CsgRqCoh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 09:03 PM, Yoann Congal wrote:

>=20
> On Sat Mar 14, 2026 at 7:01 PM CET, Aleksandar Nikolic via
> lists.openembedded.org wrote:
>=20
>> Update to the 5.3.2 release of the 5.3 series for buildtools
>>=20
>> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
>> ---
>> scripts/install-buildtools | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
>> index c3f257ff93..b9c008a2ec 100755
>> --- a/scripts/install-buildtools
>> +++ b/scripts/install-buildtools
>> @@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME,
>> stream=3Dsys.stdout)
>>=20
>> DEFAULT_INSTALL_DIR =3D
>> os.path.join(os.path.split(scripts_path)[0],'buildtools')
>> DEFAULT_BASE_URL =3D ' https://downloads.yoctoproject.org/releases/yocto=
'
>> -DEFAULT_RELEASE =3D 'yocto-5.3.1'
>> -DEFAULT_INSTALLER_VERSION =3D '5.3.1'
>> +DEFAULT_RELEASE =3D 'yocto-5.3.2'
>> +DEFAULT_INSTALLER_VERSION =3D '5.3.2'
>> DEFAULT_BUILDDATE =3D '202110XX'
>>=20
>> # Python version sanity check
>=20
> Hello,
>=20
> I already sent it: [whinlatter][PATCH] scripts/install-buildtools: Update
> to 5.3.2
> https://lore.kernel.org/openembedded-core/20260312231730.751467-1-yoann.c=
ongal@smile.fr/
>=20
> It should be merged soon.
>=20
> FYI, I've noted to do this upgrade in the next review cycle after each
> release. Feel free to remind me if I forget.

Just to be on the same page, will you do this for all actively maintained b=
ranches?

Cheers,
Aleksandar
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--jhXN7OQMTBO7CsgRqCoh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat, Mar 14, 2026 at 09:03 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Sat Mar 14, 2026 at 7:01 PM CET, Aleksandar Nikolic via list=
s.openembedded.org wrote:<br />
<blockquote>Update to the 5.3.2 release of the 5.3 series for buildtools<br=
 /><br />Signed-off-by: Aleksandar Nikolic &lt;aleksandar.nikolic22@pm.me&g=
t;<br />---<br />scripts/install-buildtools | 4 ++--<br />1 file changed, 2=
 insertions(+), 2 deletions(-)<br /><br />diff --git a/scripts/install-buil=
dtools b/scripts/install-buildtools<br />index c3f257ff93..b9c008a2ec 10075=
5<br />--- a/scripts/install-buildtools<br />+++ b/scripts/install-buildtoo=
ls<br />@@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME, st=
ream=3Dsys.stdout)<br /><br />DEFAULT_INSTALL_DIR =3D os.path.join(os.path.=
split(scripts_path)[0],'buildtools')<br />DEFAULT_BASE_URL =3D '<a href=3D"=
https://downloads.yoctoproject.org/releases/yocto'" target=3D"_blank" rel=
=3D"noopener">https://downloads.yoctoproject.org/releases/yocto'</a><br />-=
DEFAULT_RELEASE =3D 'yocto-5.3.1'<br />-DEFAULT_INSTALLER_VERSION =3D '5.3.=
1'<br />+DEFAULT_RELEASE =3D 'yocto-5.3.2'<br />+DEFAULT_INSTALLER_VERSION =
=3D '5.3.2'<br />DEFAULT_BUILDDATE =3D '202110XX'<br /><br /># Python versi=
on sanity check</blockquote>
Hello,<br /><br />I already sent it: [whinlatter][PATCH] scripts/install-bu=
ildtools: Update to 5.3.2<br /><a href=3D"https://lore.kernel.org/openembed=
ded-core/20260312231730.751467-1-yoann.congal@smile.fr/" target=3D"_blank" =
rel=3D"noopener">https://lore.kernel.org/openembedded-core/20260312231730.7=
51467-1-yoann.congal@smile.fr/</a><br />It should be merged soon.<br /><br =
/>FYI, I've noted to do this upgrade in the next review cycle after each<br=
 />release. Feel free to remind me if I forget.</blockquote>
Just to be on the same page, will you do this for all actively maintained b=
ranches?</div>
<div>&nbsp;</div>
<div>Cheers,</div>
<div>Aleksandar
<blockquote>Regards,<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--jhXN7OQMTBO7CsgRqCoh--

