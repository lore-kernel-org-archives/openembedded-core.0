Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPjfL-0004kS-GW
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 02:13:03 +0200
Received: by lbol5 with SMTP id l5so719048lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 17:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bLGn9bqA4sL2nCDn2FYGG07qyaBWMxtvlu5BDzbOlWQ=;
	b=blwfFOmT3zEx7EBMuiNhCofR4Oeo0ris6MK/P1M/teAkFaLz5wW1eHQp1qL+yYyvkw
	5QZb2uBPbNwowtOP9eJb8zjMrnCOg0CYOsgCb/GeKkfBuLkgM221ZD146IWqHtRdN5C5
	jtDdBtmbfaWVAoj2cW7CVMfyi5jRqmVm86jPITEwokeJpk7ksyyhYztxRPQzupONjymT
	4Dflinp017l/2xSmABaMj/p4MgT5NUWcQ6QCyOFwRE3wYyE3pf2gT6nQbr3Aav9UVYGa
	QJFCRmdw1THEarBFhR+02OShXY9IErkeRLiLg0F7RED82ZyH//imCE85nL+HWQma7wLO
	Dt+Q==
Received: by 10.152.145.228 with SMTP id sx4mr52981lab.45.1336003398321; Wed,
	02 May 2012 17:03:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 2 May 2012 17:02:48 -0700 (PDT)
In-Reply-To: <1336000145.30113.41.camel@ted>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<1336000145.30113.41.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 May 2012 17:02:48 -0700
Message-ID: <CAMKF1spDPH-biUGMXnKaP3_+PgdcjAPVf3tfT0=5cAhPZFxPAg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] unfs-server: Do not use DESTDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 00:13:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2012 at 4:09 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-05-02 at 13:53 -0700, Khem Raj wrote:
>> DESTDIR is makefile variable not available in
>> bitbake environment
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../unfs-server/unfs-server_2.1+2.2beta47.bb =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47=
.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
>> index d03c153..682891d 100644
>> --- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
>> +++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
>> @@ -7,7 +7,7 @@ RDEPENDS_${PN} =3D "pseudo"
>> =C2=A0RDEPENDS_${PN}_virtclass-native =3D "pseudo-native"
>> =C2=A0RDEPENDS_${PN}_virtclass-nativesdk =3D "pseudo-nativesdk"
>> =C2=A0BASEPV =3D "2.2beta47"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0SRC_URI =3D "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/olds=
tuff/people/okir/nfs-server-${BASEPV}.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://001-2.2b47-2.2b51.patch=
 \
>> @@ -53,7 +53,7 @@ EXTRA_OECONF =3D "--enable-ugid-dynamic \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-exp=
orts-uid=3D0 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-exp=
orts-gid=3D0 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-m=
ount-logging \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-devtab=
=3D${DESTDIR}${base_prefix}/var/lib/nfs/devtab \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-devtab=
=3D${base_prefix}/var/lib/nfs/devtab \
>
> This is not correct, you want ${D} there I think. It is rather odd
> though and we might be better patching the makefile for this.

hmmm ok. Drop that one. It sort of seemed wrong to have ${D} in there


