Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2976B07E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 22:04:49 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v11so15752036qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VLTpQFgnrcr1MnCfCHmuhTEOlwXKKmpcrYDe8GYd2DY=;
	b=I8rm254Hl/zPcsVCzwMaFJS7/LcBEswWV0puENoczKtksXE/im0y3im9PfQz8sSO5S
	MXastg4cACyuQhoL7ktPV3B9dfYnOiuoWsKDDthOIb8LrkJGLFkR5yEhItXPEV+KeJsD
	BdJfgo9Bx389ZO3vPo38frhf7Lz1hRIntvswdId78PnXK/BXJOkhpgHCZCJrAMHh0/Ot
	XXNo6erO+p8FxiT1R7LuzfW69sWN5H7j0vf2Jzd/DgU+/J6IRbfJA4zYFJYMrGskspif
	1qJFPVnXlcOzE0c2SDC3lRCKzpryZ7ZLzuB6mlAGEjRkFN1dK7TDNiG3OnaKcx1mY00l
	aO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VLTpQFgnrcr1MnCfCHmuhTEOlwXKKmpcrYDe8GYd2DY=;
	b=mtyIGlmsoQ1XNOlAJbwMPp0jyiAqXTJBUfwU3cdDe8GIXaBQ9AwleVkEJ0O3kOfvbw
	E/ZgWGcjVUL0ShDGR3MnBlk9pKWHb3MPlp+fUw75/vE7CMcUtcWPvDJj346TzeSqJ6+Y
	LnOYDL4xB8ZRh0XzVY1udCe1mZKcD99hiqNf5UyxSIU3D8is+bu8JOsK7J4cnY3vPpRe
	e6s2Fi5RYtTBaoK/RhWYRNOD852GINOXT/Hw1RkFjKt8ptp65vI8tATSCimXT+rV0O78
	qnPjA3UomVAYYOyF48Eq45ze9U7XiBXezVHDPTaKMSO+AcQiLrOB4vjnBv+Z/u0G3Lc1
	7Ykw==
X-Gm-Message-State: AA+aEWbSI08rknI28e2dVcvzW8dyVm4TyntTGAaEYiImsRz8+2qFyrcs
	mC2V4mUEcThdXiiBc9IRB9tKmctdNrG24aO/6y4=
X-Google-Smtp-Source: AFSGD/Wd9KBLoLpK+VX9qzamV2kMf4pJRoOrvQdeNPnGVioQfI/hsfjUU/7VFkh9TsD9lMiyQHx2hCjiYnfdfNbPkyU=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr17491299qvg.194.1543874690726;
	Mon, 03 Dec 2018 14:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
	<c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
	<CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
	<CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
In-Reply-To: <CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 14:04:24 -0800
Message-ID: <CAMKF1sqJCAkhWFt3N4cP-etGTxXjOe4-r_djgfsnN35Th41jAg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2018 22:04:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 1:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Mon, Dec 3, 2018 at 9:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Dec 1, 2018 at 4:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Hi Joshua
> > >
> > > There is a build failure for a2jmidid see
> > >
> > > http://errors.yoctoproject.org/Errors/Details/202833/
> > >
> > > Seem to be related can you validate
> > >
> > > On 11/30/18 7:01 PM, Joshua Watt wrote:
> > > > Waf requires that the current working directory be ${S} (the locati=
on of
> > > > the wscript) when building. Most of the time, this was true only be=
cause
> > > > B defaults to S. However, anything that changed that behavior (nota=
bly,
> > > > using externalsrc) would break the recipe. Remedy this by explicitl=
y
> > > > changing cwd to ${S} when running waf commands. As a happy side eff=
ect,
> > > > B can be set up for "out of tree" builds to keep the source directo=
ry
> > > > clean.
> >
> > I have sent a workaround for a2jmidid to ml which means we can go
> > ahead with this change in OE-Core
> >
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >   meta/classes/waf.bbclass | 8 +++++---
> > > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > > > index 19e93761b39..8e6d754c299 100644
> > > > --- a/meta/classes/waf.bbclass
> > > > +++ b/meta/classes/waf.bbclass
> > > > @@ -1,6 +1,8 @@
> > > >   # avoids build breaks when using no-static-libs.inc
> > > >   DISABLE_STATIC =3D ""
> > > >
> > > > +B =3D "${WORKDIR}/build"
> > > > +
> > > >   EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"
> > > >
> > > >   python waf_preconfigure() {
> > > > @@ -22,16 +24,16 @@ python waf_preconfigure() {
> > > >   do_configure[prefuncs] +=3D "waf_preconfigure"
> > > >
> > > >   waf_do_configure() {
> > > > -     ${S}/waf configure --prefix=3D${prefix} ${WAF_EXTRA_CONF} ${E=
XTRA_OECONF}
> > > > +     (cd ${S} && ./waf configure -o ${B} --prefix=3D${prefix} ${WA=
F_EXTRA_CONF} ${EXTRA_OECONF})
> > > >   }
> > > >
> > > >   do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
> > > >   waf_do_compile()  {
> > > > -     ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', =
limit=3D64)}
> > > > +     (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d,=
 '-j%d', limit=3D64)})
> > > >   }
> > > >
> > > >   waf_do_install() {
> > > > -     ${S}/waf install --destdir=3D${D}
> > > > +     (cd ${S} && ./waf install --destdir=3D${D})
> > > >   }
> > > >
> > > >   EXPORT_FUNCTIONS do_configure do_compile do_install
> > > >
> > --
> Hmm - the a2jmidid shows what's going to happen: All packets shipping
> older waf need workaround hacks. This should not be the way to go
> because then we can remove waf.bbclass entirely.
>

FWIW out of all meta-openembedded layers only 1 recipe was having
this issue, while the issue you mention is real, we might have to weigh
in if we should not do this just for a handful of recipes. My
suggestion would be to change the recipes if its not a cascade

> Andreas

