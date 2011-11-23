Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RT34m-0006ng-1u
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 04:00:44 +0100
Received: by iahk25 with SMTP id k25so1042999iah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 18:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=aer4+2Qks+MMaY36SjGXlmXaL4HpR7FPuicInEA4W5o=;
	b=P0gaWjMgpgJr2ql8KoTJJk1uh4T5W+uLbswCOWlyNSwL6pc8IwaRVmyq/p5I+vVCpL
	/ZHLi5C1aHlC1SrwF2iivhDXTg1v4P7TEHMHtATKdrKHuAaOcvIv4b5QkZU8zXgMWnDh
	xTVbBz7t2TWXRuRMQcONzzxfXdF6a6XxMPqbs=
Received: by 10.50.197.167 with SMTP id iv7mr25406768igc.46.1322016851098;
	Tue, 22 Nov 2011 18:54:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.32.69 with HTTP; Tue, 22 Nov 2011 18:53:40 -0800 (PST)
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F04246AAE@NAEMMAIL01.na.leapfrog.com>
References: <Acypfq/dic6blehRRZqDGFdgcP2TEw==>
	<E7A9054A5ACABE48B0E540E46E862B0F04246AAE@NAEMMAIL01.na.leapfrog.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2011 18:53:40 -0800
Message-ID: <CAMKF1srJv-_mbyJ-e5=00C1nY1uJUaeKExY0pb1S1A-Z3SrSgQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Overriding a variable only in our layer
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
X-List-Received-Date: Wed, 23 Nov 2011 03:00:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 5:24 PM, Daniel Lazzari <dlazzari@leapfrog.com> wro=
te:
> Hey everyone,
>
>
>
> I ran into an interesting problem today that I need some help with. I=E2=
=80=99m not
> sure if this is a bitbake issue or an oe-core one so I thought I=E2=80=99=
d try here
> first. We have our own layer that overlays on top of oe-core, meta-oe, an=
d
> meta-angstrom. Our layer has a bunch of recipes that pull projects from o=
ur
> local SVN, including a recipe for u-boot. We have a build configuration f=
ile
> that has lines like the following:
>
>
>
> SRCREV_pn-u-boot =3D =E2=80=9C563=E2=80=9D
>
>
>
> We pull in this conf at build time using bitbake=E2=80=99s =E2=80=93R arg=
ument. Just
> recently we switched u-boot=E2=80=99s SRCREV from ${AUTOREV} to an actual=
 revision
> number and bitbake started choking trying to parse recipes. It looks like=
 it
> chokes while trying to parse oe-core=E2=80=99s u-boot git recipe because =
the SRCREV
> is meant for SVN, not GIT (even though our PREFERRED_VERSION is set up on=
ly
> to build our u-boot). Is there a way to override this SRCREV variable onl=
y
> when parsing recipes in our layer? I know I can do it directly in the
> recipe, but that loses us the advantages of having all of the SRCREVs in =
one
> file (which makes specific full rebuilds very easy).

On the contrary, in OE we prefer to delegate SRCREVs to recipes and pin
the versions of recipes

>
>
>
> Thanks,
>
>
>
> Dan Lazzari Jr.
>
> Firmware Engineer
>
> dlazzari@leapfrog.com
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


