Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.12223.1628097399474318552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B162240C1E;
	Wed,  4 Aug 2021 17:16:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUmVxlC4xwuE; Wed,  4 Aug 2021 17:16:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8945840BD6;
	Wed,  4 Aug 2021 17:16:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 430F117464F; Wed,  4 Aug 2021 13:16:36 -0400 (EDT)
Date: Wed, 4 Aug 2021 13:16:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
Message-ID: <20210804171636.GY1528@denix.org>
References: <1628040485-45946-1-git-send-email-denis@denix.org>
 <1628040485-45946-2-git-send-email-denis@denix.org>
 <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
 <CA+chaQfComiP6AtnyhFbcqbhxzjD8epMuxSbdDNYibDGjFtPOA@mail.gmail.com>
 <20210804160714.GW1528@denix.org>
 <f5b4b10b3e15b813bf5d360a3eebfb27d3dc4f1b.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f5b4b10b3e15b813bf5d360a3eebfb27d3dc4f1b.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 06:04:27PM +0100, Richard Purdie wrote:
> On Wed, 2021-08-04 at 12:07 -0400, Denys Dmytriyenko wrote:
> > On Wed, Aug 04, 2021 at 04:29:45PM +0200, Martin Jansa wrote:
> > > Yes, I see the same in meta-oe and meta-webosose.
> > >=20
> > > It's easy to spot false translations in incremental conversion wher=
e the
> > > diff is relatively small, but doing initial conversion on big layer=
 with
> > > this change already included might be more painful.
> > >=20
> > > On Wed, Aug 4, 2021 at 12:31 PM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > > On Tue, 2021-08-03 at 21:28 -0400, Denys Dmytriyenko wrote:
> > > > > Add task-configure and few more supported values of TARGET_OS o=
verride.
> > > > >=20
> > > > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > > > ---
> > > > > =A0scripts/contrib/convert-overrides.py | 5 +++--
> > > > > =A01 file changed, 3 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/scripts/contrib/convert-overrides.py
> > > > b/scripts/contrib/convert-overrides.py
> > > > > index 6505b18..23f63a2 100755
> > > > > --- a/scripts/contrib/convert-overrides.py
> > > > > +++ b/scripts/contrib/convert-overrides.py
> > > > > @@ -36,9 +36,10 @@ vars =3D vars + ["mipsarch", "x86-x32", "mip=
s16e",
> > > > "microblaze", "e5500-64b", "mip
> > > > > =A0vars =3D vars + ["class-native", "class-target", "class-cros=
s-canadian",
> > > > "class-cross", "class-devupstream"]
> > > > > =A0vars =3D vars + ["tune-",  "pn-", "forcevariable"]
> > > > > =A0vars =3D vars + ["libc-musl", "libc-glibc",
> > > > "libc-newlib","libc-baremetal"]
> > > > > -vars =3D vars + ["task-compile", "task-install", "task-clean",
> > > > "task-image-qa", "task-rm_work", "task-image-complete", "task-pop=
ulate-sdk"]
> > > > > +vars =3D vars + ["task-configure", "task-compile", "task-insta=
ll",
> > > > "task-clean", "task-image-qa", "task-rm_work", "task-image-comple=
te",
> > > > "task-populate-sdk"]
> > > > > =A0vars =3D vars + ["toolchain-clang", "mydistro", "nios2", "sd=
kmingw32",
> > > > "overrideone", "overridetwo"]
> > > > > =A0vars =3D vars + ["linux-gnux32", "linux-muslx32", "linux-gnu=
n32",
> > > > "mingw32", "poky", "darwin", "linuxstdbase"]
> > > > > +vars =3D vars + ["linux", "linux-gnueabi", "elf", "eabi"]
> > > >=20
> > > > I have reservations about linux and elf being here since this doe=
s lead to
> > > > a lot of false translations for OE-Core. Since OE-Core is now tra=
nslated I
> > > > guess that isn't the driving factor so I'll probably take this bu=
t it is
> > > > worth
> > > > being aware of.
> > > >=20
> > > > I did just have to retest a translation of core so I now need to =
filter all
> > > > these out the diff...
> >=20
> > Should I re-submit with 'linux' and 'elf' removed?
>=20
> I think given OE-Core isn't alone with the issue, that may be wise. I c=
an tweak=A0
> the patch if you want?

Richard,

Whichever is easier for you.

--=20
Denys
