Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9gj2-0007LD-0b
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:18:16 +0200
Received: by fxi1 with SMTP id 1so3301056fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XTrlM42Op9qan61rD2PlvnXpgJ22VelpMGP4LImpTQM=;
	b=WldcNf9Yssll9+kZ8e7vGeFCWzmPCLJyBYOxBC/+AmEHCuGCVsP7YaMXCX1m4q8/qo
	CTAxKLRCHVuNtTsTGwGar3KhhyIkjy9ZJ+b6mYIEpsRVwBMvPt/hIVAU1ImD1vHU+U1g
	hKjsz4V4y6Skox/hUCz8xMfKZdDzoFM19RICA=
Received: by 10.223.59.137 with SMTP id l9mr26383fah.15.1317402766729;
	Fri, 30 Sep 2011 10:12:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm7502830faf.3.2011.09.30.10.12.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 10:12:45 -0700 (PDT)
Date: Fri, 30 Sep 2011 19:12:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110930171239.GD7364@jama.jama.net>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317402578.12332.218.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Fri, 30 Sep 2011 17:18:16 -0000
X-Groupsio-MsgNum: 10329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline

--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 06:09:31PM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 18:46 +0200, Martin Jansa wrote:
> > On Fri, Sep 30, 2011 at 03:15:15PM +0100, Richard Purdie wrote:
> > > I'd not forgotten about this patch, just been distracted by other
> > > things. I've run some further tests on the changes here and have
> > > comments below. Summary is I think some pieces can merge, other pieces
> > > need more work. Lets try and get the pieces that are ready merged, th=
en
> > > worry about the remainder.
> > >=20
> > > Could we clean out the problematic pieces and resubmit please so we c=
an
> > > at least get those pieces in? :)
> >=20
> > pushed as 6 patches to=20
> > oe-core-contrib jansa/allarch
> >=20
> > 1st patch contains changes you've marked as fine
> > 2nd is hal-info, which is imho not worth debugging it as nobody likes
> >   hal nowadays (I've tried to patch configure.in, but recipe doesn't
> >   call reautoconf IIRC..)
> > the rest is kept as reminder which recipes needs to be taken care of.
>=20
> Thanks. I've taken the two patches. I'd love to get rid of hal, in fact
> its on my list of things that need to migrate out of OE-Core...
>=20
> I'm left wondering what (if anything) uses hal in our images?

ie xserver-xf86 before my changes..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F+IcACgkQN1Ujt2V2gBx1rgCfS/ulAs6t6OERi84hyMp0u5GY
AzUAn0AOja5JGH3rhCxVah742NivicBR
=0Ikq
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
