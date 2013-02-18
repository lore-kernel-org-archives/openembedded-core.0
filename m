Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7Ul8-00079E-Go
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:44:10 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so1775938pbc.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=O53mo81ggAuuFVuEPwS6WfnPfPeV3v1Dm3AaoGoxLjo=;
	b=a1D9QFaICIjPc/tcdAH15XBTmSN853I6Y5t8GOOpq2S94Oxebdbl2amZuITOCstKBy
	UMF8je05W+qOYMGGusfdpLobdqruRZEWUppw+5mBNZIdqfAdeJTLl9TNaPDrwVOjgnfp
	xxz8pNcsXQfS6MBXBiLsTTQlzLswzHs4G/6/jWkeMSf5apK9MLdfu3M7vYzlI/8GDqXu
	R/txuvMZCnZsn9WRXTgSeN7wCfw8Bxg8MS6hulmcU3X9rNQLXHsOP3uMH0vzPtveXi+X
	eI25Og97Ymf4/BQkjk9ecAlKeu0dZISaiUzp2hVDV/gasgXARnwgLhQ1rIDyUw0XyXvR
	v/9A==
X-Received: by 10.66.192.98 with SMTP id hf2mr10953791pac.20.1361208481699;
	Mon, 18 Feb 2013 09:28:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ab1sm15044349pbd.37.2013.02.18.09.27.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 09:28:00 -0800 (PST)
Date: Mon, 18 Feb 2013 18:28:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130218172800.GG3300@jama>
References: <510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
	<20130210195919.GA3300@jama> <51220AAC.8080201@topic.nl>
	<CAJTo0LbTZWh7-S3i+GmcPHDoRaRTN6BUniBcoX5_=eE6j21AuQ@mail.gmail.com>
	<51222923.8040104@topic.nl>
MIME-Version: 1.0
In-Reply-To: <51222923.8040104@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-core] How do I find out why are packages being rebuilt?
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
X-List-Received-Date: Mon, 18 Feb 2013 17:44:11 -0000
X-Groupsio-MsgNum: 35606
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wXC5D88JtmMokAwr"
Content-Disposition: inline

--wXC5D88JtmMokAwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 02:14:11PM +0100, Mike Looijmans wrote:
> On 02/18/2013 12:11 PM, Burton, Ross wrote:
> > On 18 February 2013 11:04, Mike Looijmans <mike.looijmans@topic.nl> wro=
te:
> >> I'm still having trouble with packages being needlessly rebuilt over a=
nd
> >> over. The worst of all it qt4-embedded, it takes about an hour to buil=
d.
> >> This is wasting a LOT of time.
> >>
> >> The classic OE never rebuilt a package until its version changed.
> >
> > oe-core uses checksums of dependencies to determine what to rebuild -
> > so if a class you inherit changes it's populate_packages_prepend()
> > then the package task will re-execute, or if a dependeny package
> > rebuilds then your package will rebuild too.  If you're tracking
> > oe-core master then this often means large rebuilds as there may have
> > been changes to the base.bbclass or package.bbclass which obviously
> > impacts everything, and the usual churn in the packages.
> >
> > bitbake-diffsigs will let you follow the signature differences that
> > cause a rebuild up the tree to identify what has changed.
>=20
> Change in oe-core I can live with. Things that puzzle me are that when I=
=20
> change the location of a bootloader data file in my local.conf, it=20
> suddenly decides to rebuild qt4-embedded. I also have two almost=20
> identical machines (same cpu, same kernel, just a few different plugs),=
=20
> and I cannot figure out why it builds two separate qt4 binaries.
>=20
> So I want to diagnose that. I have no idea where to start.

openembedded-core/scripts/sstate-diff-machines.sh

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wXC5D88JtmMokAwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEiZKAACgkQN1Ujt2V2gByvGwCdGRIq7fKEkeyCzjh/UPJ0HpYU
t+EAnRo3jzcvkil4yX7YFus5RNyMaZN+
=o0Lr
-----END PGP SIGNATURE-----

--wXC5D88JtmMokAwr--
