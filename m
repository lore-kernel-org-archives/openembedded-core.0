Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qx4OK-0001Aw-Gk
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 23:56:44 +0200
Received: by vwe42 with SMTP id 42so3471671vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kQB/zc2klddbMA2ona+Bcz8dTNaXFRTfxD+hpYNsnQY=;
	b=xKM1pI/fUJ4VypJBhBWhvrjx1RQXNK3ojxZeJDJkqzfXq4S9Rc2QG4t8rrINVeuxej
	sXOoEMKMzP8fy28RsJl9994rDQXhiqueAC92F7RlCGcm+VKjkZ45KBXzBolkWPeBKq1P
	8vE2HdATI62KqgJP1HNgadOAvFOPPx1fDdrVs=
Received: by 10.52.21.36 with SMTP id s4mr1888555vde.77.1314395515087; Fri, 26
	Aug 2011 14:51:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.184.35 with HTTP; Fri, 26 Aug 2011 14:51:35 -0700 (PDT)
In-Reply-To: <1314394806.5939.264.camel@rex>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
	<1314394806.5939.264.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 26 Aug 2011 14:51:35 -0700
X-Google-Sender-Auth: _0vNOf_mvmY_kb2euFy2UxagMkU
Message-ID: <CABcZAN=3yHNDF2b-t_08TAQgtL4DCg4t+M0Z4bto5PuNt1=0wA@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Aug 2011 21:56:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2011 at 2:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-08-26 at 18:06 -0300, Otavio Salvador wrote:
>> We have two recipes that use a common static library and every time we
>> change something on this library we need to bump PR of those recipes.
>> We want to avoid that specially for daily builds that will =C2=A0be usin=
g
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

He has multiple git repositories involved here, and wants to ensure it
gets rebuilt if either change.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


