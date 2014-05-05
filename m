Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id EC1A365F81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 17:10:13 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id e53so5599275eek.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vcrKAvr3j1xgiwO24hqLpgErx2JysP7NczWYbsjipik=;
	b=uRy8X7QjoAMapm3KfGc5m4/+EN/rzmwiKmYCde7XN+3wjaD0vTSE0ZWG+gO/8sql9i
	+WvyHSxJ5KcrUgF29JVjZF7LUv1zEzhHfM+1b5Shaq5jA4rVUXzsNyI/WlEQfmP0vIcw
	CbjdM2JpS1EA8n6FmUQyyIm+sVqqn9C1moIICu1Yo96HRYLx9sz0++isZFtPFr36muLp
	cBkzBnB9MnwO6Tb6ZuTbK1AJZSjehhXmIReL1vCf1sho7bu3mGZiYJtJjgw6iY7bZswh
	MuecYmLneEFeGnGbbMIn5zCE5DXtFadfXIXsewYYvjci3Z3C+nVblFOYxl5PDiRVwHA8
	dK/Q==
X-Received: by 10.15.34.197 with SMTP id e45mr3582844eev.112.1399309813864;
	Mon, 05 May 2014 10:10:13 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	t50sm31143757eev.28.2014.05.05.10.10.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 10:10:12 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 5 May 2014 17:10:10 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140505171010.GA12987@gmail.com>
References: <535F3FFD.1080403@hostmobility.com>
	<535F4513.20407@hostmobility.com> <1398873268.16672.529.camel@ted>
	<CANyK_8c_-UdtF6ZqHLvQcs_JJ9PGjP+wP0dJGH_3imkn4n4h4w@mail.gmail.com>
	<CALmOhgm4=Gw=yE2SRc7YS5ZvH+oyrP=g3fSiDPyT50X5CZQxLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALmOhgm4=Gw=yE2SRc7YS5ZvH+oyrP=g3fSiDPyT50X5CZQxLQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: quilt-native fails on tar version 1.27.1
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
X-List-Received-Date: Mon, 05 May 2014 17:10:17 -0000
X-Groupsio-MsgNum: 52837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2014 at 11:23:40PM -0400, Trevor Woerner wrote:
> On 30 April 2014 13:57, Paul Barker <paul@paulbarker.me.uk> wrote:
> > If you can't find
> > a good guide online on how to set this up, let me know and I'll write
> > up a blog post of how I did it.
>=20
> I'd be interested in reading this, if you wrote it up. Which container
> technology did you use?

I just used standard Linux Containers, didn't bother with Docker or anything
else like that.

I've wrote up how I did things at:
    http://www.paulbarker.me.uk/articles/ubuntu-1404-lxc-oe.html

It's not perfect as I haven't had much time to dedicate to writing it up, b=
ut it
should be enough to help people out.

Cheers,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTZ8XyAAoJEBwoJlo7UPQDdtUH/jvMtS7qZyaXN+7qdIY4BRik
EzVBErAgHvr68jMoh6iMa1FV4994aGUuKFSZWw6ogQDiKwaP/chtst26s565OulN
/++EpGot9uxCRVyRJb8d9txmh+ZQdwA9yN7QW6qN9LCUUTczwmuucZ81QOoyyW7I
WQesfkvweZrIp6a78hbTChnG8NOzt7rNqjWqay/iO0KtihjrKkYBF8kRdF6eGNaO
GrDaJNlS8nGVJPNdZYGB8RREm+ZD6RuwuC/VR3eiVhItZpUxGvMIXf8bh6o26iwE
8GknG18k7sVnZ+I17imU4dwEgnCv2thCX1cIAsT/gcAK7mFfLo4hCgIMvn8eWks=
=gr4s
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
