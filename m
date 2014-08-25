Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC6546FE3B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 20:40:40 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so13950940lab.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9k8KUciUW2NsovsTMySTmh6nyCuhzB3rOI9WGL9p2FU=;
	b=PppL9k7ccyuHEuD0Y/9qqNDjhooR3vg8Az22JgkaN9l3WTAN8SnIb/Jglu3wlqFV1K
	9X2PAgzB/uC4hArASEca7d87t6MRnFOSllN9PEQEL6OtFrp16xrf+IGTOSCPLPF2s5KT
	w9f40LwpfJsRbiqEnQm+DqR9H43mb/TOnYuZljTGuXYDDVR/o4BkO2l2FWE1ckM221g9
	qRqEes7aA1w8SSbg0gIkF+km63g9tvb65I17nZ8xaCKT+YmKtr+8lSuWprl4fuLGwUpO
	NGUpyh0xhwhk4MW8kylbVMazS3wz4IMxVKSgRWG/sUVaqXGba1ueUaAyMFdeVpbEoh0n
	gr8w==
X-Received: by 10.112.25.102 with SMTP id b6mr22160915lbg.17.1408999241105;
	Mon, 25 Aug 2014 13:40:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bw3sm1452761lbd.14.2014.08.25.13.40.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 13:40:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 25 Aug 2014 22:40:46 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140825204046.GU20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama> <20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama> <20140822170626.13280b11@e6410-2>
	<20140822222642.GG20524@jama> <53FB8A87.1010202@windriver.com>
	<20140825193523.GB23339@haswell>
MIME-Version: 1.0
In-Reply-To: <20140825193523.GB23339@haswell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Mon, 25 Aug 2014 20:40:45 -0000
X-Groupsio-MsgNum: 56924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huLXOlJ1ghGp/P5+"
Content-Disposition: inline

--huLXOlJ1ghGp/P5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 12:35:23PM -0700, Khem Raj wrote:
> On 14-08-25 14:12:07, Mark Hatle wrote:
> > On 8/22/14, 5:26 PM, Martin Jansa wrote:
> > >On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
> > >>On Fri, 22 Aug 2014 23:46:26 +0200
> > >>Martin Jansa <martin.jansa@gmail.com> wrote:
> > >>
> > >>>changing
> > >>>default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
> > >>>still building with -marm doesn't make much sense to me and is only
> > >>>confusing.
> > >>
> > >>I think the distinction is that if you use armv7at-neon, you *can* bu=
ild
> > >>specific packages with thumb. Mostly, I guess, I don't think it makes=
 sense
> > >>to use a tuning that specifically states that it can't run thumb code=
 for
> > >>processors which can. Although... May not be an important distinction=
, really,
> > >>as you note.
> > >
> > >>I don't think it makes sense to use a tuning that specifically states
> > >>that it can't run thumb code
>=20
> yes. We should not have such case in armv7+=20
>=20
> >=20
> > The defaulttune is supposed to supply what the processor and ABI are ca=
pable of.
> >=20
> > So in the case of armv7a, it's saying no thumb support at all, this inc=
luded
> > thumb interwork.
>=20
> if thats what we do then we are wrong. Since thumb interwork is
> mandatory when we claim EABI compatibility and I think we have stopped
> supporting Old ABI hence EABI is default which means interworking is
> inherent.
>=20
> >=20
> > armv7at says that the processor supports thumb, and interwork -should- =
be
> > enabled.  (It can of course be manually disabled, but that's another is=
sue
> > to be dealt with...)
>=20
> FWIW adding 't' in there should just be done when the resulting binary
> is compiled using thumb ISA, using 't' to qualify interworking
> capablility is not required.

That's what
http://patchwork.openembedded.org/patch/70985/
was trying to fix.

Now we add t (or t2) for every DEFAULTTUNE which adds thumb to
TUNE_FEATURES (for packages with both thumb and arm ISA).

> > armv7at doesn't say it actually includes thumb combines binaries.  (I a=
rgued
> > originally it should, but was overruled for a variety of reasons... not=
 the
> > least of which is the interwork enabled, and multilib issues with 'same=
 abi'
> > configurations.)
> >=20
> > So I agree the default should be armv7at or armv7at-neon, unless there =
is a
> > compelling reason to leave it as a default with interwork disabled.
>=20
> I dont believe thats the case we simply should not be able to disable
> interworking.
>=20
> >=20
> > As for the hard float question.  I'm torn on this.. for compatibility a=
 lot
> > of the industry is still soft-float based, and frankly I've not exactly
> > encouraged it with my customers.. (I'm not seeing general performance
> > improvements, only improvements in select artificial benchmarks, or spe=
cific
> > pieces of code.)
> >=20
> > But if changing the default to hard float were generally agreed upon (f=
or
> > architectures where VFP are available) then I wouldn't object.
> >=20
>=20
> I would leave that choice to distributions for now
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huLXOlJ1ghGp/P5+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP7n04ACgkQN1Ujt2V2gBwR8QCfYihMiIY+9n64k7ToE8+buT0+
yvoAoKhi6uR5M4UVQi9bfOTH9xC21vr6
=hf29
-----END PGP SIGNATURE-----

--huLXOlJ1ghGp/P5+--
