Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UUvFh-0006fI-HO; Wed, 24 Apr 2013 10:40:34 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz1so1045612pad.30
	for <multiple recipients>; Wed, 24 Apr 2013 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=U8s8nfzg4A8rVkTVsyee3wCFFH5lUGxE5t1K/AxHpC0=;
	b=lj/KboK29ukI6EBlrB2p97ap7at/u0WzWNGK0aQQdMzOCNjdlgWLJskWP/oSo4MK9M
	U7XcAqiO24rERQujYp9J70NEsywJnQh8PkC8HHIRqXdggkvSUexe4LbBjWCKShjpZoxD
	rUeni7L9fU5A/U8ShSqnz0v2y4Yc/6/4I8JVX0aJilyWGFlK+Her+8RcQJgG0YIP9EVo
	wHmv60LaPVOcrqCiMZj4Q2wbQTtmjDqYawiNrIgk3/Dd7XW1+ILjjhMP44OvFt5fxDCh
	HiB+Rv+lqnjblnGs5EG7LGx60teqvx3Eu9ydautmDw3XV2cu1WCxWlLR+ighAU74Pf2n
	HvQA==
X-Received: by 10.66.245.75 with SMTP id xm11mr17827464pac.40.1366791770992;
	Wed, 24 Apr 2013 01:22:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wz9sm2157008pbc.5.2013.04.24.01.22.48 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 01:22:50 -0700 (PDT)
Date: Wed, 24 Apr 2013 10:22:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130424082259.GF3217@jama>
References: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
	<20130424064319.GD3217@jama> <1366790466.23738.86.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1366790466.23738.86.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Wed, 24 Apr 2013 08:40:52 -0000
X-Groupsio-MsgNum: 38281
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline

--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 09:01:06AM +0100, Richard Purdie wrote:
> On Wed, 2013-04-24 at 08:43 +0200, Martin Jansa wrote:
> > On Tue, Apr 23, 2013 at 02:47:56PM -0700, Jeff Osier-Mixon wrote:
> > > OpenEmbedded Technical Steering Committee
> > > 8 April 2013
> > >=20
> > > b. document whitespace changes to the shell
> > > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > > http://www.openembedded.org/wiki/Styleguide
> > > https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
> > > =3D> still need to de-dup these, need a volunteer
> > > ask for volunteers after 1.4 (jefro)
> >=20
> > Someone probably noticed, but all meta-openembedded layers are now using
> > consistent indentation:
> > http://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a39bb4=
7a9eab27980d52966226c9504ea4
> >=20
> > Can we reevaluate decision to keep styleguide promoting different
> > indentation for python and shell tasks? Otherwise we should mention
> > different rules for oe-core and other layers.
>=20
> The TSC talked about it and agreed a particular direction. Its clear
> that some people don't like the direction so they just ignored it and do
> their own thing anyway.
>=20
> This is the wrong way to go about making decisions and I'm extremely
> disappointed people are doing this.
>=20
> There were specific technical reasons I suggested we not do this. One of
> the asks of the Yocto members is some kind of stability, whatever that
> is. Whitespace changes like this are *extremely* disruptive to patch
> flow. I think its clear there are people out there using older versions
> of the codebase yet they pick patches off master and backport them for a
> variety of reasons. As soon as you get changes like this involved, it
> breaks their ability to do that. With the python change, there was a
> good technical reason we did it. Despite that I was personally literally
> backed into a corner and shouted at by some rather upset people last
> time this happened with the python change. I can see their point too.
> For changing shell, we don't have any good technical reason other than
> cosmetics. I've made this argument before.

Hi,

I'm sorry you feel that way about it, I'll try to make it a bit better:

1) it was discussed and acked by major meta-openembedded contributors
and maintainers:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/044989.h=
tml

2) it was done just before we'll branch dylan, so that backporting issue
is only for people backporting over 2 releases (from after-dylan-master
to danny). And even if someone gets whitespace wrong in backport, then
there is no real harm, because as you say, it's only cosmetic now and
meta-openembedded layers were very inconsistent about it (tabs were used
only in minority of recipes).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF3lmMACgkQN1Ujt2V2gBxELwCfcKMlvQLIbU57euXBy5m7vhxt
chwAnjrOVHXOd2jEWewmDwjGmJuYrAVv
=dLe0
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
