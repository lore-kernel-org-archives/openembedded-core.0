Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA17CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 07:57:22 +0000 (UTC)
Subject: Re: [PATCH 4/4] scripts/install-buildtools: Update to 4.0.21
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: DE (147.161.169.88)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Sep 2024 00:57:20 -0700
References: <CANPvuRktR9NbXAzFOJsusgctrXcmeHxoHpXO5882+tNsgyJvwQ@mail.gmail.com>
In-Reply-To: <CANPvuRktR9NbXAzFOJsusgctrXcmeHxoHpXO5882+tNsgyJvwQ@mail.gmail.com>
Message-ID: <15848.1727164640820287502@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nM2bfrZolAFKBuZgLH1N"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204838

--nM2bfrZolAFKBuZgLH1N
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Jose,

On Mon, Sep 23, 2024 at 11:06 AM, Jose Quaresma wrote:

>=20
> Hi Aleksandar,
>=20
> Aleksandar Nikolic via lists.openembedded.org (
> http://lists.openembedded.org ) <aleksandar.nikolic010=3D gmail.com@lists=
.openembedded.org
> > escreveu (segunda, 23/09/2024 =C3=A0(s) 10:00):
>=20
>> From: Aleksandar Nikolic < aleksandar.nikolic@zeiss.com >
>>=20
>> Update to the 4.0.21 release of the 4.0 series for buildtools.
>>=20
>> Signed-off-by: Aleksandar Nikolic < aleksandar.nikolic@zeiss.com >
>> ---
>> scripts/install-buildtools | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
>> index 4f85fe87d4..9054eb5f36 100755
>> --- a/scripts/install-buildtools
>> +++ b/scripts/install-buildtools
>> @@ -56,9 +56,9 @@ PROGNAME =3D 'install-buildtools'
>> logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)
>>=20
>> DEFAULT_INSTALL_DIR =3D
>> os.path.join(os.path.split(scripts_path)[0],'buildtools')
>> -DEFAULT_BASE_URL =3D ' http://downloads.yoctoproject.org/releases/yocto=
 '
>> -DEFAULT_RELEASE =3D 'yocto-4.1'
>> -DEFAULT_INSTALLER_VERSION =3D '4.1'
>> +DEFAULT_BASE_URL =3D ' https://downloads.yoctoproject.org/releases/yoct=
o '
>> +DEFAULT_RELEASE =3D 'yocto-4.0.21'
>> +DEFAULT_INSTALLER_VERSION =3D '4.0.21'
>=20
>=20
> This first patch in the series=C2=A0updates this version to 4.1.
> What is the reason to downgrade=C2=A0this now on the last patch?
>=20
>=20

I was thinking since 4.1 (and higher versions) are EOL and since this is th=
e kirkstone branch, the buildtools should also reflect the latest available=
 release on the kirkstone branch, which is 4.0.21. But I am not really sure=
 what's the right solution here, if someone else could chime in, I'd be tha=
nkful.

Aleksandar

>=20
>=20
> Jose
>=20
>=20
>> DEFAULT_BUILDDATE =3D '202110XX'
>>=20
>> # Python version sanity check
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>>=20
>=20
>=20
>=20
>=20
> --
> Best regards,
>=20
> Jos=C3=A9 Quaresma
>

--nM2bfrZolAFKBuZgLH1N
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jose,</div>
<div>&nbsp;</div>
<div>On Mon, Sep 23, 2024 at 11:06 AM, Jose Quaresma wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Aleksandar,</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">Aleksandar Nikolic via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;aleksandar.nikol=
ic010=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; escreveu (segunda, 23/09/2024 &agrave;(s) 10:00):=
</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">From: Aleksandar Nikolic &lt=
;<a href=3D"mailto:aleksandar.nikolic@zeiss.com" target=3D"_blank" rel=3D"n=
oopener">aleksandar.nikolic@zeiss.com</a>&gt;<br /><br />Update to the 4.0.=
21 release of the 4.0 series for buildtools.<br /><br />Signed-off-by: Alek=
sandar Nikolic &lt;<a href=3D"mailto:aleksandar.nikolic@zeiss.com" target=
=3D"_blank" rel=3D"noopener">aleksandar.nikolic@zeiss.com</a>&gt;<br />---<=
br />&nbsp;scripts/install-buildtools | 6 +++---<br />&nbsp;1 file changed,=
 3 insertions(+), 3 deletions(-)<br /><br />diff --git a/scripts/install-bu=
ildtools b/scripts/install-buildtools<br />index 4f85fe87d4..9054eb5f36 100=
755<br />--- a/scripts/install-buildtools<br />+++ b/scripts/install-buildt=
ools<br />@@ -56,9 +56,9 @@ PROGNAME =3D 'install-buildtools'<br />&nbsp;lo=
gger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)<br /><br =
/>&nbsp;DEFAULT_INSTALL_DIR =3D os.path.join(os.path.split(scripts_path)[0]=
,'buildtools')<br />-DEFAULT_BASE_URL =3D '<a href=3D"http://downloads.yoct=
oproject.org/releases/yocto" target=3D"_blank" rel=3D"noopener noreferrer">=
http://downloads.yoctoproject.org/releases/yocto</a>'<br />-DEFAULT_RELEASE=
 =3D 'yocto-4.1'<br />-DEFAULT_INSTALLER_VERSION =3D '4.1'<br />+DEFAULT_BA=
SE_URL =3D '<a href=3D"https://downloads.yoctoproject.org/releases/yocto" t=
arget=3D"_blank" rel=3D"noopener noreferrer">https://downloads.yoctoproject=
.org/releases/yocto</a>'<br />+DEFAULT_RELEASE =3D 'yocto-4.0.21'<br />+DEF=
AULT_INSTALLER_VERSION =3D '4.0.21'</blockquote>
<div>&nbsp;</div>
<div>This first patch in the series&nbsp;updates this version to 4.1.</div>
<div>What is the reason to downgrade&nbsp;this now on the last patch?</div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
</div>
<div>I was thinking since 4.1 (and higher versions) are EOL and since this =
is the kirkstone branch, the buildtools should also reflect the latest avai=
lable release on the kirkstone branch, which is 4.0.21. But I am not really=
 sure what's the right solution here, if someone else could chime in, I'd b=
e thankful.</div>
<div>&nbsp;</div>
<div>Aleksandar&nbsp;</div>
<div><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<div>Jose</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">&nbsp;DEFAULT_BUILDDATE =3D =
'202110XX'<br /><br />&nbsp;# Python version sanity check<br />-- <br />2.2=
5.1<br /><br /><br /><br /></blockquote>
</div>
<br clear=3D"all" />
<div>&nbsp;</div>
<span class=3D"gmail_signature_prefix">-- </span><br />
<div class=3D"gmail_signature" dir=3D"ltr">
<div dir=3D"ltr">Best regards,
<div><br />Jos&eacute; Quaresma</div>
</div>
</div>
</div>
</blockquote>
</div>

--nM2bfrZolAFKBuZgLH1N--

