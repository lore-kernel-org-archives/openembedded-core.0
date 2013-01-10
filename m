Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtJrR-0001y0-2h
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 16:16:14 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so344854pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DLACrghdoFoquv7j581cOW4slwrYZhk3qO0wLAw3ues=;
	b=jfRgMPm5jwfl+kCkVp0FgGchaiXp5U+zUZsfH5ewTFIKUAvoLcfUMxR4zHwt84lDQN
	EHA6C+i2PbhPIBwF4kWUNBweEDdvVeQq6rf249euPu5sQLaphXGrxR9mMFP0utq1xvuX
	8Ll21AnETb9U/xtP0D1605pzfslzrPxdbP/tDbcCibFYqtcArCygZmekyqxLqNei62zM
	UhkUUmip4f+T9kUF8Fm8m+tEJMqu9TkRzb6E8bd1Lpzdv27+k/qQHp/SBNKNlCpdHqIA
	GA/mUGuNZHhPlElnSZ65ARWa5AcqESnEPmUQzufsjl1al3z7LTyJkbf8hR9y+GBRCWYF
	JamQ==
X-Received: by 10.68.135.99 with SMTP id pr3mr221617352pbb.151.1357830050912; 
	Thu, 10 Jan 2013 07:00:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j1sm1181820pax.10.2013.01.10.07.00.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 07:00:49 -0800 (PST)
Date: Thu, 10 Jan 2013 16:00:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130110150054.GG3722@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1301100825400.10271@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301100825400.10271@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: defining a new image: inherit "image" vs "image_types"?
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
X-List-Received-Date: Thu, 10 Jan 2013 15:16:16 -0000
X-Groupsio-MsgNum: 33672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jHP/eq8oeUshSv2p"
Content-Disposition: inline

--jHP/eq8oeUshSv2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 08:31:52AM -0500, Robert P. J. Day wrote:
>=20
>   possibly a distinction with no distinction but i wanted to throw
> together a page on how one defines a new "image type" -- most
> commonly, an SD card image -- and i started with what comes with the
> meta-raspberrypi layer, which seems to work just fine.
>=20
>   what i noticed is that that layer introduces the new
> "sdcard_image-rpi.bbclass" class file, which opens with:
>=20
> inherit image_types
>=20
>   but then i remembered that the meta-ti layer does the same thing,
> providing the new class file "sdcard_image.bbclass" which opens
> instead with:
>=20
> inherit image
>=20
>   i realize that the oe-core image.bbclass contains this snippet:
>=20
> IMAGE_CLASSES ?=3D "image_types"
> inherit ${IMAGE_CLASSES}
>=20
> so it's clear that inheriting "image" is sufficient, but the
> alternative *isn't* clear.
>=20
>   what's the preferred construction here?  before digging further to
> see if there's something subtle or equivalent happening, should it be
> sufficient for new image definitions to simply:
>=20
> inherit image_types
>=20
> ??  have i just not RTFS far enough to see that there's no difference?

did you read image_types.bbclass?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jHP/eq8oeUshSv2p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDu16YACgkQN1Ujt2V2gBwzgACdHItmjzdnl4UoDRQI7bvd1JFw
Ns0AoIvInnIVIZi856zuc60Z4TDNrk/7
=wQoN
-----END PGP SIGNATURE-----

--jHP/eq8oeUshSv2p--
