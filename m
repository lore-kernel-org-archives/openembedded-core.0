Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UXxUI-0003Xh-Bp; Thu, 02 May 2013 19:40:31 +0200
Received: by mail-pb0-f47.google.com with SMTP id uo1so457993pbc.20
	for <multiple recipients>; Thu, 02 May 2013 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=f/8k8ErvlkfWoEe5JaiHh+LlCwS3SXAQTPo1YCLkteo=;
	b=FXmQd6HWFiDYQse9npnH6kxraW2RBic27hQtTGwwPFDXm6RDWEt2/HW5Rl3hrSTaAd
	hCoZwD0na1yplSB5/KefziaRs7706TmAr2/hFlTxBb0C0Iw6MFvNqRyufJvYX0pSYIOG
	maIn2S51qa9w6crKTGESfog9EFEEkn7UTreVfoZ5yy6Al+oU6aiKX1umlQj9BqW6zi5u
	IGtmp4aE0oRsVbDG/pHEJAtL/V6I5ZuC9QA27ogLIEDjJ6pRmNyB8mvvFtJoPP1XNrrd
	T3LqHbYHwfeJ4v/lPVF6q7Njh9HORN5NHe+LwnLFx3bDlZ68x0D8jAGhdGfoAYp3I/no
	pZ2A==
X-Received: by 10.66.159.195 with SMTP id xe3mr10902531pab.49.1367515335656;
	Thu, 02 May 2013 10:22:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ts3sm8079070pbc.12.2013.05.02.10.22.12 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 02 May 2013 10:22:14 -0700 (PDT)
Date: Thu, 2 May 2013 19:22:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20130502172231.GF3206@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
	<CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 17:41:16 -0000
X-Groupsio-MsgNum: 38670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline

--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2013 at 12:30:59PM -0400, Trevor Woerner wrote:
> On Thu, May 2, 2013 at 11:57 AM, Paul Barker <paul@paulbarker.me.uk> wrot=
e:
> > The recipe also has dependencies
> > outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
> > separate issue.
>=20
> I've noticed that too. Shouldn't dependencies be contained within the
> same layer? Is it normal from these dependencies to be spread out over
> various layers?

Yes, fluidsynth needs to be explicitly disabled in vlc and removed from
DEPENDS or vlc moved to meta-multimedia

See:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/045090.h=
tml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGCoNcACgkQN1Ujt2V2gBzh9ACePgob+pq4Jqgy+PwTdM7AOCXE
gTwAn0QOG3ZO6xj/pbZYy39dq7AMKNbW
=XNBf
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
