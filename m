Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW6Yn-00076n-Qs
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:20:24 +0100
Received: by faaa19 with SMTP id a19so1081358faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=acTYx1EdkMRvutS8CDqVUjfPC5NhAGPblRzU4Oddt8I=;
	b=hFGW54LGiItB0ljl4EjhRfYx9+blcnyg55hYtfv7bNU96PNzEK16kTAUTNtgMRACW+
	34mbQPx2P11R1YRMARaQeX3TraYJyk708g59PEhjyGHjyA5kkAs6PYwrm8BPF1sahF9M
	2L5XhTkcFrQFehlnAs8qmrOHLmQ/3+HgbjnKI=
Received: by 10.204.136.214 with SMTP id s22mr7381680bkt.136.1322745220429;
	Thu, 01 Dec 2011 05:13:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p13sm11284883bkd.4.2011.12.01.05.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 05:13:39 -0800 (PST)
Date: Thu, 1 Dec 2011 14:13:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201131337.GG19917@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322744558.17484.126.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 13:20:24 -0000
X-Groupsio-MsgNum: 13442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline

--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 01:02:38PM +0000, Richard Purdie wrote:
> On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
> > On Thu, Dec 1, 2011 at 10:37, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> >         > A while back I've proposed to make .bbappend without
> >         corresponding .bb
> >         > only big fat warning, but not fatal to parse. Now you cannot
> >         even build
> >         > eglibc if there is libdrm bbappend you don't care at all
> >         about..
> >        =20
> >        =20
> >         You can do this by setting:
> >        =20
> >         BB_DANGLINGAPPENDS_WARNONLY

Good to know, thanks.

> > This is even worse; you end up with a package without the changes done
> > on the bbappend and as most bbappend files do not change PR, adding it
> > later won't force a package update.
>=20
> Which is why its off by default. My point is you can do with Martin is
> suggesting, its just not without its drawbacks.

I think the main advantage of this is that you're allowed to build stuff
which doesn't use those dangling appends. Ie start build of eglibc if
you know that nothing is bbappending to eglibc and to its dependency
tree. And when .bbaappends are fixed you can disable
BB_DANGLINGAPPENDS_WARNONLY and build the rest.

But waiting for _all_ recipes in _all_ layers to get their .bbappends
right can sometimes a bit long..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XfYEACgkQN1Ujt2V2gBwXJACcDuS73tDXqsDXBcjrh5hmDcu5
38QAnixirbEH1kefQXEXDKzgnI8HoBor
=PZoL
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--
