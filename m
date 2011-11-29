Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RVP5F-0006WW-8u
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:54:57 +0100
Received: by eekc1 with SMTP id c1so1117862eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Bif9i2Yt2vNTIkh8Q3jYoLXu8kBRsxqBlHMg0VnEfYg=;
	b=F++Yh5oZWK1q3ngWQl924ceZ2FnpXCV/2vQCOOO3YvTKh0TR5HioZJyb4K4It60xdg
	O0dL10zztc4p+TonQXmCEwwFnfmyGBQ52h33Wn+WX+PVSdnNkNzyrn1ItLnvIDUAdm/4
	E2LyBMatOZCcSnYfGDGkp9NRcRMp1auu10ThE=
Received: by 10.216.176.14 with SMTP id a14mr36081wem.14.1322578098263; Tue,
	29 Nov 2011 06:48:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.167.79 with HTTP; Tue, 29 Nov 2011 06:47:56 -0800 (PST)
In-Reply-To: <4ED4E793.2080605@emagii.com>
References: <4ED4AFF4.8020506@emagii.com>
	<1322564887.26081.131.camel@phil-desktop>
	<4ED4E793.2080605@emagii.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 29 Nov 2011 07:47:56 -0700
X-Google-Sender-Auth: wGXgXoUxSx8QwKZTv8jVAyOzh7U
Message-ID: <CABcZANnktCoqMEQi0n3=GcdH07a9dV7Qg088pFaW0wjHkAgXWw@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Whitespace not allowed in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 29 Nov 2011 14:54:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 7:09 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
>
>>> Working:
>>> COMPATIBLE_MACHINE =3D "machine1"
>>> COMPATIBLE_MACHINE =3D "machine1|machine2"
>>> COMPATIBLE_MACHINE =3D "(machine1)"
>>> COMPATIBLE_MACHINE =3D "(machine1|machine2)"
>>>
>>> COMPATIBLE_MACHINE =3D "machine1"
>>> COMPATIBLE_MACHINE +=3D "|machine2"
>>
>> I'm slightly surprised that this last example would work. =C2=A0It ought=
 to
>> be equivalent to...
>>
>
> It seems to work for me.
>
> I have in my U-Boot recipe:
> COMPATIBLE_MACHINE =C2=A0 =C2=A0 =3D
> "at91sam9260ek|at91sam9xeek|at91sam9g20ek|at91sam9g20ek_2mmc"
> COMPATIBLE_MACHINE =C2=A0 =C2=A0+=3D "|at91sam9261ek|at91sam9g10ek"
> COMPATIBLE_MACHINE =C2=A0 =C2=A0+=3D "|at91sam9263ek"
> COMPATIBLE_MACHINE =C2=A0 =C2=A0+=3D
> "|at91sam9g45ek|at91sam9g45ekes|at91sam9m10ekes|at91sam9m10g45ek"
> COMPATIBLE_MACHINE =C2=A0 =C2=A0+=3D
> "|at91sam9g15ek|at91sam9g25ek|at91sam9g35ek|at91sam9x25ek|at91sam9x35ek"
> COMPATIBLE_MACHINE =C2=A0 =C2=A0+=3D "|at91sam9rlek"
>
> MACHINE =3D =C2=A0"at91sam9g35ek"
> If I add a space in the COMPATIBLE_MACHINE definition somewhere,
> then the recipe is not used.

As Phil points out, +=3D results in a space separator. If you want
direct concatenation without a separator, use .=3D.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


