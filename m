Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id E24A660897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:31:45 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so882086pad.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jzubzNjRf8rMQjEbzoHOLYt60I9mWyGAdLsaIPAJ0Ew=;
	b=vfkVlLk6yVxo9TYhWHsJYJTtzVmVCdvuVGwkR3kwdZi8oaqQiFpEl8P6LRq8gtyPdG
	dVg+GguoBntHq/gaHqgigsN6FxO27gOPHM0X2/0BHdAuUxsNOSaJfmb7+4iq95C6H763
	492SWuZvmN+Zr12obC0nHzm6/Xl5euH4Y2Grv8++BedvqZU7qfjxd2iuSL/MgcRE0oqZ
	pUCGI77PlDplx6Gn38aEZ5HwwFhbtf7kcFsBI7dh5NAAEd3D8qWaK2lFrKZ5P/nr0JRO
	zVBz/xnNXD/+8rWGItLjWgtkIXy4Sr9YeESH+3MGmKD4+AODUzWCuc3n4DtPtvXIfA99
	4tHw==
X-Received: by 10.68.132.101 with SMTP id ot5mr3638061pbb.11.1369153906578;
	Tue, 21 May 2013 09:31:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vz8sm3943142pac.20.2013.05.21.09.31.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 09:31:45 -0700 (PDT)
Date: Tue, 21 May 2013 18:31:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20130521163140.GC32431@jama>
References: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369148923-20676-3-git-send-email-tf+lists.yocto@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <1369148923-20676-3-git-send-email-tf+lists.yocto@r-finger.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] cogl: further improvements
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
X-List-Received-Date: Tue, 21 May 2013 16:31:46 -0000
X-Groupsio-MsgNum: 39548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 04:08:41PM +0100, Tomas Frydrych wrote:
> From: Tomas Frydrych <tomas@sleepfive.com>
>=20
>  * Removed unnecessary gtk-doc related depends/configure options (handled=
 in
>    gtk-doc class)
> -	       	 ${@get_fpu_setting(bb, d)}	\

This should be applied before 1/4 or squash them.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGboWwACgkQN1Ujt2V2gBzHZwCfYDsTvSin+PzD0lFe8nGxQT/F
wqQAnicRE9AlW3v9fVzUzlG4PmVvieb0
=QdJn
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
