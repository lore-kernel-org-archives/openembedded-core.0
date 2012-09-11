Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBULD-0003Lh-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:33:39 +0200
Received: by eekb57 with SMTP id b57so590124eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bpovWl7P/HonCOn+8DfBOPnBReIGWYqy9iLOHAiapWY=;
	b=AYrgFMvXO3yjbHXfc8OvWXU248IfCKxPAkX78vqdO3wtwR7XRd6ohZnFVTLvYSvYBy
	t0Qp+RB2LPPe97EQnXqzjgzu2FCOMJIOqxSnNLTsSq4Q5wWT1Oza+4Jr7Y//O7GQK9Kc
	pr4KHuu8NgIy0r8xOzqBtPT8mCyR65vVZsP1R6aBa+RqgMLCJftPRYrA3nWmLmkvyUDy
	d7A37YSrrN7pqtCDWa3hnkw3bQ1s3MWGiL9jCM3vlD9Jlgu2K+31Ae9j3w80f4hKoR8o
	5JxByxbz/BziDRDoa2WmpLos0oaiTRzxp6Df7pkgqsG9ICsVcVFL2yq+CfQG39fz450A
	cXBw==
Received: by 10.204.156.11 with SMTP id u11mr5000030bkw.69.1347384068426;
	Tue, 11 Sep 2012 10:21:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm10304204bkw.15.2012.09.11.10.21.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 10:21:07 -0700 (PDT)
Date: Tue, 11 Sep 2012 19:21:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120911172107.GK14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
	<20120911165323.GJ14077@jama.jama.net>
	<1347383662.29443.21.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347383662.29443.21.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 17:33:39 -0000
X-Groupsio-MsgNum: 29076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Content-Disposition: inline

--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 06:14:22PM +0100, Phil Blundell wrote:
> On Tue, 2012-09-11 at 18:53 +0200, Martin Jansa wrote:
> > If we drop DEFAULTTUNE from tune-xscale and tune-arm926ejs then
> > PACKAGE_ARCH=3Darmv5te would be the same and the same feed will be built
> > only once.
>=20
> Well, that would also make those two tune files rather useless.  It
> seems like it would be better to just refrain from including them if you
> don't want the corresponding tunings.

But that does not allow me to still use it for few packages if my DISTRO
decides it's worth it.

I'll test tomorrow, something like top 3 patches here:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPcwMACgkQN1Ujt2V2gBwobACfQlV5RiBK3GYFc/Sv8MdlJz6c
SDQAoKJ/0SIY2RfVPzS0PDz7tQm5/NLO
=Es8X
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
