Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QxHud-0002EV-Rc
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 14:22:59 +0200
Received: by bkbzu17 with SMTP id zu17so3214508bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 05:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K7eN0tPwWFpI5xIGFCihAJAYa6V7mOBHst1K+PniSf0=;
	b=ntPzFrDVOJbJUPMg0aTCGW8S0yyAM0GmU4u7CirVRgIveN4teKCD6qMw4feN0weq9S
	8UgAauejcb09H92TEsQ28kBV2OG5h/763iXdVP3GnMblxM4oNDjJKkDe5mR3mXOXfefY
	ZwGKwN2w6iKkYpsgGBe5bOfnPUYDL6enAh/YQ=
MIME-Version: 1.0
Received: by 10.204.3.28 with SMTP id 28mr1227610bkl.175.1314447489824; Sat,
	27 Aug 2011 05:18:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Sat, 27 Aug 2011 05:18:09 -0700 (PDT)
In-Reply-To: <1314394806.5939.264.camel@rex>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
	<1314394806.5939.264.camel@rex>
Date: Sat, 27 Aug 2011 09:18:09 -0300
X-Google-Sender-Auth: FDl7Q5AsdM413D5uYsw5dxPApqc
Message-ID: <CAP9ODKp6igGGDY2AQL+VqhYZm-GmFrKKcLg=5gRMaq5jwp+2MQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Sat, 27 Aug 2011 12:23:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2011 at 18:40, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-08-26 at 18:06 -0300, Otavio Salvador wrote:
>> We have two recipes that use a common static library and every time we
>> change something on this library we need to bump PR of those recipes.
>> We want to avoid that specially for daily builds that will =A0be using
>> GIT AUTOREV support.
>>
>> For it to work, we need to have a way to put two SRCREV in PV and then
>> it will be rebuit every time the library changes.
>>
>> Any clue how to do that?
>
> Set the PV as usual in the recipe:
>
> PV =3D "0.0+gitr${SRCPV}"
>
> and then set:
>
> SRCREV =3D "${AUTOREV}"
>
> ?

As spoted by Chris we have multiple repositories and we want that
either change to raise a build of the recipe.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


