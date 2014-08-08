Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EA5646AC6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 11:26:55 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so5435427wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mVR5/MhKeW14//OGU3Tx0vJoDIlfRVZav2pI8x8+rAo=;
	b=kVI3g766ba4eL4q06axWfMHhlBfZMkQMKnQSJC1oR4WEbYPtaptbUDPXLO+Kmx69qt
	txG350pZGyXuTU7myooFWgtgxiKgzrh78IUKLq0/Rlu7HfHz8Iz7lkbRdOkD/eQBIhDC
	Idwf6UpfA6sbZ06ewJGAeu30SSihsbxEnJEhi9rQdw41jvtIP7AwcUHiMMfaGrJzonRb
	PkXaOdBLkRXYF2WDdUKI05YG/oHuLCaZcaZkrqrKKEFl2ODxMfpl7nQerJ/Wbs3DFAV9
	PPTKzhyyQBNkoQBVWSiEY4ycUDIyvVuSUDJNDCAo4Y982YdvRriv24NG0mTlV+Htjhi/
	IW2Q==
X-Received: by 10.194.158.101 with SMTP id wt5mr2224294wjb.136.1407497216603; 
	Fri, 08 Aug 2014 04:26:56 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id j5sm16698475wjf.35.2014.08.08.04.26.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 04:26:55 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Fri, 8 Aug 2014 11:26:53 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140808112653.GG32767@gmail.com>
References: <20140723135123.GA32767@gmail.com>
 <20140723144952.GG22875@jama>
MIME-Version: 1.0
In-Reply-To: <20140723144952.GG22875@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: gpgme-config
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
X-List-Received-Date: Fri, 08 Aug 2014 11:26:58 -0000
X-Groupsio-MsgNum: 56145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Content-Disposition: inline

--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 04:49:52PM +0200, Martin Jansa wrote:
> On Wed, Jul 23, 2014 at 01:51:23PM +0000, Paul Barker wrote:
> > Hi all,
> >=20
> > I'm trying to build opkg with 'gpg' added to PACKAGECONFIG on the maste=
r branch
> > of OE. The gpg support for opkg is provided by gpgme, which uses 'gpgme=
-config'
> > to determine CFLAGS and LIBS when building. After recent changes, the
> > gpgme-config script is now just a dummy and doesn't do anything.
> >=20
> > Upstream gpgme do not provide a pkg-config file and an upstream issue a=
bout this
> > raised in 2012 was resolved WONTFIX (https://bugs.g10code.com/gnupg/iss=
ue1414).
> >=20
> > Our options are:
> >=20
> > 1) Add a .pc file to gpgme and maintain it within OE as it is very unli=
kely to
> >    be accepted upstream. Then I need to modify configure.ac in opkg to =
support
> >    both this pkg-config file (for OE) and the gpgme-config utility (for=
 all
> >    other users of opkg).
>=20
> This comment in original issue:
> The gpgme-config scripts goes along with the gpgme.m4 code.  A .pc file
> won't be able to do what we can do with this combination.
>=20
> Makes me think that if we implement .pc.in which generates correct .pc
> from gpgme.m4 he won't be against accepting such patch upstream.
>=20
> I think that biggest reason against -config scripts was that they aren't
> cross-compile friendly (not sysroot-aware) so you either have whole path
> to sysroot hardcoded in -config file and then have to mangle it for
> target -dev package or vice versa and you need to prefix returned values
> (like -I -L flags with sysroot).
> =20
> > 2) Make an exception to the policy on -config scripts for gpgme.
> >=20
> > I haven't really followed the discussion on why -config scripts needed =
to be
> > removed so I'll put this question to other OE developers. Would option =
(2) cause
> > more problems in the long run? If so, is it worth the extra effort to f=
ollow
> > option (1)?
> >=20
> > I'll probably need someone to bounce a few autoconf and pkg-config ques=
tions off
> > if I implement option (1) as I'm not very familiar with either system.
>=20
> I'm no expert in this as well, but there are some examples we can copy.
>=20

I think I've got this now. I've created a 'gpgme.pc' file by adapting 'lua.=
pc'
=66rom meta-openembedded. The Libs and Cflags were found by running 'gpgme-=
config'
on my development machine and they seem fairly sensible. I've then used
PKG_CHECK_MODULES() in 'configure.ac' within opkg to find gpgme using that
pkg-config file.

I'll send in a couple of patches but I'll delay the changes to 'configure.a=
c' in
opkg. I should be releasing opkg-0.2.3 in the next few weeks and that will
include the necessary changes.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT5LP9AAoJEBwoJlo7UPQD2HwH/RyMs06/JUK9N+3Upail5Cem
7UeuDYMfsTWjTwO/dZiknyrzKpYSBNy9Pj7koEv5QzKnEOocal2lzO6HxOd0W/O5
W2MYAL0RS7oSYzvJ8FjrkRYEyL1YDrS9vG9pNNidd7Wxg4wZOML3bPzS4w/LLomy
r9VT2djGBJy4V9+Wi3uR1LB/V7bRf4kKMDbarSS9CCDwXncdv/PaxowBpABDYFy4
r1YQm0tNaoFOMua32FVQnEt61UuGcexK0IZGWIkeWvZuuyE84MgUvjhY48GIL3jy
pciNmGaXlgPAV+acuf/i+7EQ6rrxDbmWoY5dEwEzUT1CORN2s8W/fQX3BTh7kck=
=4LAp
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
