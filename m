Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1709EC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:39:27 +0000 (UTC)
Subject: Re: [PATCH] scripts/install-buildtools: Update to 5.0.6
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: CH (147.161.250.207)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 23:39:22 -0800
References: <D72H1DJGYUS9.1MNU1HLIWJ4DA@bootlin.com>
In-Reply-To: <D72H1DJGYUS9.1MNU1HLIWJ4DA@bootlin.com>
Message-ID: <1047.1736926762466250153@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tpX9G2AgY8Yn8RjD2zkg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 07:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209817

--tpX9G2AgY8Yn8RjD2zkg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 08:34 AM, Mathieu Dubois-Briand wrote:

>=20
> On Tue Jan 14, 2025 at 12:12 PM CET, Aleksandar Nikolic via
> lists.openembedded.org wrote:
>=20
>> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>>=20
>> Update to the 5.0.6 release of the 5.0 series for buildtools.
>>=20
>> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>> ---
>> scripts/install-buildtools | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
>> index ee6bfb89eb..972671d50f 100755
>> --- a/scripts/install-buildtools
>> +++ b/scripts/install-buildtools
>> @@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME,
>> stream=3Dsys.stdout)
>>=20
>> DEFAULT_INSTALL_DIR =3D
>> os.path.join(os.path.split(scripts_path)[0],'buildtools')
>> DEFAULT_BASE_URL =3D ' https://downloads.yoctoproject.org/releases/yocto=
'
>> -DEFAULT_RELEASE =3D 'yocto-5.0.5'
>> -DEFAULT_INSTALLER_VERSION =3D '5.0.5'
>> +DEFAULT_RELEASE =3D 'yocto-5.0.6'
>> +DEFAULT_INSTALLER_VERSION =3D '5.0.6'
>> DEFAULT_BUILDDATE =3D '202110XX'
>>=20
>> # Python version sanity check
>=20
> Hi,
>=20
> I believe these patches are both for kirkstone and scarthgap. Adding
> Steve in copy to be sure he see them.

Hi,

yes, I forgot to add the branch name. I'll resend the patches, so it's clea=
r the patches are for kirkstone and scarthgap and not for master. Thanks!

Aleksandar

>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--tpX9G2AgY8Yn8RjD2zkg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jan 15, 2025 at 08:34 AM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>On Tue Jan 14, 2025 at 12:12 PM CET, Aleksandar Nikolic via lis=
ts.openembedded.org wrote:<br />
<blockquote>From: Aleksandar Nikolic &lt;aleksandar.nikolic@zeiss.com&gt;<b=
r /><br />Update to the 5.0.6 release of the 5.0 series for buildtools.<br =
/><br />Signed-off-by: Aleksandar Nikolic &lt;aleksandar.nikolic@zeiss.com&=
gt;<br />---<br />scripts/install-buildtools | 4 ++--<br />1 file changed, =
2 insertions(+), 2 deletions(-)<br /><br />diff --git a/scripts/install-bui=
ldtools b/scripts/install-buildtools<br />index ee6bfb89eb..972671d50f 1007=
55<br />--- a/scripts/install-buildtools<br />+++ b/scripts/install-buildto=
ols<br />@@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME, s=
tream=3Dsys.stdout)<br /><br />DEFAULT_INSTALL_DIR =3D os.path.join(os.path=
.split(scripts_path)[0],'buildtools')<br />DEFAULT_BASE_URL =3D '<a href=3D=
"https://downloads.yoctoproject.org/releases/yocto'" target=3D"_blank" rel=
=3D"noopener">https://downloads.yoctoproject.org/releases/yocto'</a><br />-=
DEFAULT_RELEASE =3D 'yocto-5.0.5'<br />-DEFAULT_INSTALLER_VERSION =3D '5.0.=
5'<br />+DEFAULT_RELEASE =3D 'yocto-5.0.6'<br />+DEFAULT_INSTALLER_VERSION =
=3D '5.0.6'<br />DEFAULT_BUILDDATE =3D '202110XX'<br /><br /># Python versi=
on sanity check</blockquote>
Hi,<br /><br />I believe these patches are both for kirkstone and scarthgap=
. Adding<br />Steve in copy to be sure he see them.</blockquote>
Hi,</div>
<div>&nbsp;</div>
<div>yes, I forgot to add the branch name. I'll resend the patches, so it's=
 clear the patches are for kirkstone and scarthgap and not for master. Than=
ks!</div>
<div>&nbsp;</div>
<div>Aleksandar<br />
<blockquote>-- <br />Mathieu Dubois-Briand, Bootlin<br />Embedded Linux and=
 Kernel engineering<br /><a href=3D"https://bootlin.com" target=3D"_blank" =
rel=3D"noopener">https://bootlin.com</a></blockquote>
</div>

--tpX9G2AgY8Yn8RjD2zkg--

