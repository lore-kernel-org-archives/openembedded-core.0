Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 90C6065D56;
	Mon, 18 Aug 2014 19:54:13 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id l4so4692679lbv.15
	for <multiple recipients>; Mon, 18 Aug 2014 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AtZopuneLlRf0zhIUvfvEIDqmxtavoM2lEHmmkCS+HE=;
	b=FLJiKwfJ9Z+Yz70Hvh9atLL74bkWOfghcIFREG6+HkddshE/DVcHONZbS3tnoIBt2y
	w0rMK8Q5/7m3XzcHzjSM0TMcsUORghSYJx23gEmehNrAM3M6JkbRgqdi9w8CB8AV+AiJ
	3gwKSwfOKcDv41ecoZvN92xHi5US/Wmv8UJl6vIkvzMCdUwAfB8kIIfBfnMSeBPL1fmG
	cwT9T00tOe8WaC57cADYP0M276lExMFJiX4PIRY6iBTVyjxKXBSTtchRe5fxHQoecldT
	q9ZA/c3/eFIP1XIjGqOfv6ewQ3c80bHaRMMI8v52nR+AsBS50iD8j8DhZtqctl/K5rpu
	Lxvg==
X-Received: by 10.153.4.6 with SMTP id ca6mr31892298lad.32.1408391654599;
	Mon, 18 Aug 2014 12:54:14 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id g8sm11113683lam.23.2014.08.18.12.54.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 12:54:11 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 18 Aug 2014 19:54:08 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140818195408.GD7174@gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
	<20140818181424.GG12992@gmail.com>
	<CAMKF1srjVfmfAWZ0mx+AfE_nR4erYtAEYt2OVhEsU+q++XKVrg@mail.gmail.com>
	<20140818185009.GA7174@gmail.com>
	<CAMKF1spkQkfbZMkL2Gg41hF9bm=+HS8sU8LME3pV6yMzDLLs-Q@mail.gmail.com>
	<20140818190814.GB7174@gmail.com>
	<CAMKF1sq+qbSPSOaU4iyi1Vr8=Xvzuyd2gHx2QN5PPNtUo0JLAQ@mail.gmail.com>
	<20140818193102.GC7174@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140818193102.GC7174@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Mon, 18 Aug 2014 19:54:16 -0000
X-Groupsio-MsgNum: 56707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline

--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 07:31:02PM +0000, Paul Barker wrote:
> On Mon, Aug 18, 2014 at 12:14:08PM -0700, Khem Raj wrote:
> > On Mon, Aug 18, 2014 at 12:08 PM, Paul Barker <paul@paulbarker.me.uk> w=
rote:
> > >> That would be handy too. But I wanted was to keep this info in proje=
ct
> > >> for folks to try it out.
> > >>
> > >
> > > I'll just post one ticket for now.
> > >
> >=20
> > Thats fine too.
> >=20
> > > I think I've got a fix for e2fsprogs as well.
> >=20
> > Great. when we write patches that arise out of musl systems we should
> > make sure that
> >=20
> > 1. If patch fixes a genuine issue surfaced with musl, fight it out ar
> > respective package upstream and in OE universe add it to the original
> > layer where recipe primarily resides
> > but we can keep the patches in meta-musl as a last resort.
> >=20
> > 2. If its something musl specific then lets keep it in meta-musl and
> > see how musl can be changed to fix it.
> >=20
> > Thanks
> > -Khem
>=20
> That makes sense. I'd suggest adding that to the README file in meta-musl=
 so
> other would-be-contributors notice it.
>=20
> In this case, it's ensuring that 'uint64_t' is used instead of '__uint64_=
t' and
> that <limits.h> is included where needed for 'PATH_MAX'. So I'd say those=
 fixes
> belong in oe-core and are candidates for submitting upstream.
>=20

Actually, both of these are fixed upstream already, but not as isolated com=
mits
I can backport. There is a newer upstream release (v1.42.11) but it doesn't
contain the necessary fixes. It appears that the missing <limits.h> inclusi=
on is
in a file added by patches in openembedded-core.

I shan't attempt the upgrade as there are a lot of patches in openembedded-=
core
to consider. I will try to make an isolated fix for the build issues with m=
usl
though.

Cheers,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT8lngAAoJEBwoJlo7UPQD+BcIAI3vj7PFLa/rhNfIVocW9BTM
GH34AZXemAVc2XVY8GR+zmQPqugPUy2/9rU4IVmyJLmYmgbQPfDlYL0kdkI9U4nw
iFE4opRQIeTb8qtDOERoiyLy6XRFNzLuqLxfxp/I+BgJ70B9B2YrJ7texyXFLMg7
3nrEDvsRLs80xjvvF/VpPLYWDhqhTqeqtZ9Hjzsc+xtpKur+Evj5T5YZeWG0JA02
kJW0opeF5EZGNjoylethp3oSuLhds/eU7ScNPYG0vgDGHXAWV43NDBGRKnkrcr/7
b+PcMJR7ccdbOslaKan1D/qnJnREwbVt7Mie2lMznzn6TM3faW+CFX1ApkHGb6g=
=8oaa
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
