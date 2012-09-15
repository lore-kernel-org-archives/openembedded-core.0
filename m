Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TCwML-0005B7-03; Sat, 15 Sep 2012 19:40:49 +0200
Received: by wgbdq11 with SMTP id dq11so1319227wgb.24
	for <multiple recipients>; Sat, 15 Sep 2012 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EDfEJcsJKQia5l1Hen42f9CQyqctgJp7rxW5nISi7N8=;
	b=Jih8zjJEnL4xXzQNUmba5j+34d/lXXjWWxsNQqsxT2gCpiPx1ODMCtPFOvdn047CYO
	0FU0xARmNMouwtXuoLxll/8p7QpOCVNQV0Mvok4SofEHr0hIGwzDDOdOEHuunxqgGsfm
	LsU0i0dfP3hUj7LYQCKnlo9baWLwiHyg0bCpT8DajARezo79wrZC+N3ZTWCCE4Q4r+Hj
	ULQQseN/pM+rrHk5TTYFCkxDcMnbRZZ2BnwczWxTjGTmfZwE4R4Fj6Jt2kTxInjC3zXY
	IXB3EMmDmXGmHxvQj10vHoEQl8H4cW6Zi5/XFRbtkv1ZZ+6PV8Af6JI7h0t2prkqFQK5
	vuuA==
Received: by 10.216.228.130 with SMTP id f2mr3400842weq.7.1347730092698;
	Sat, 15 Sep 2012 10:28:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm9154839wiz.7.2012.09.15.10.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 10:28:11 -0700 (PDT)
Date: Sat, 15 Sep 2012 19:28:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120915172816.GC11051@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<1347729817.4444.52.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347729817.4444.52.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
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
X-List-Received-Date: Sat, 15 Sep 2012 17:40:49 -0000
X-Groupsio-MsgNum: 29355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline

--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 06:23:37PM +0100, Phil Blundell wrote:
> On Sat, 2012-09-15 at 18:20 +0200, Martin Jansa wrote:
> > This changes .so name from libffi5 to libffi6, breaking every recipe
> > depending on libffi when someone is using debian.bbclass.
>=20
> How exactly do the recipes break?  The whole point of debian.bbclass is
> to avoid breakage when this happens by making libffi5 and libffi6
> parallel installable.  If that isn't working then there is clearly a bug
> somewhere and we should fix that.

libffi5 is no longer in feed, so if you try to install something from
feed which still has libffi5 in depends it will fail.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBUurAACgkQN1Ujt2V2gBw0oQCfefD7F5XXa3XKdenaPAXgEJVF
XuIAn2IMwOxyvg4bczeg8qxJc1aKw+2m
=xxQ+
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
