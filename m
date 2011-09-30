Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9gUO-00073N-VG
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:03:09 +0200
Received: by eya25 with SMTP id 25so1350657eya.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5Kf8BcsK+sudGVw6T9eJPfobJGI/NDM5kCDZ1LzJgDM=;
	b=ZO2H2JNFYk6udV5VvWTbuQYeLEk3rXPbo8UMOXgDCN1pyfnDD28prpmGv0HYU1v3qd
	17MNs3Eat/96kxt5vN7bA5T3s5QNRnNCWbOG7NFW3I4eyBAtRLNpF8Mm+1bKh9KgI6PD
	7HVyY4I3gnwaVaWzeqVO874va+wNnLioCR0gw=
Received: by 10.223.10.22 with SMTP id n22mr537046fan.144.1317401398494;
	Fri, 30 Sep 2011 09:49:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm7405554fac.14.2011.09.30.09.49.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 09:49:57 -0700 (PDT)
Date: Fri, 30 Sep 2011 18:49:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930164951.GC7364@jama.jama.net>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
	<1317401191.12332.213.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317401191.12332.213.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 0/9] Glib related upgrades
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
X-List-Received-Date: Fri, 30 Sep 2011 17:03:09 -0000
X-Groupsio-MsgNum: 10324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 05:46:24PM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 17:43 +0200, Martin Jansa wrote:
> > We were using 2.29.3+git% from meta-oe and after upgrade to 2.30.0 I wa=
s hit=20
> > by few G_CONST_RETURN and other issues due to newer glib. Here is what =
I have
> > now to build shr images OK again, but probably there is more recipes wh=
ich need
> > upgrade/fix to cope with glib-2.30.0.
> >=20
> > Someone who cares about gnome should continue from this, but IMHO this =
is good start :).
>=20
> These are marked as WIP. Does this mean they are ready to be taken or is
> there a reason to hold off these patches?

Marked as WIP as I've tested them only on images I care about.. and
fixed stuff which was failing for me.

Someone building full gnome desktop (I guess koen) should send patches=20
for remaining gnome stuff if needed, before taking this in.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F8y8ACgkQN1Ujt2V2gByC+QCdGmLKY+X+EjiT2wwiwcWllSOM
LrQAnRPUBN05PCBfhCrCcfO1Zh7bD50h
=f9ZO
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
