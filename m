Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TnovB-00024S-Q7
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 12:13:19 +0100
Received: by mail-ee0-f51.google.com with SMTP id d4so4098061eek.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Wy8zusp7xNg1jfIMyMk87jVMsY25qGb/C1JrxxYIzD0=;
	b=TWrfXZVuRp8yrzXFAvoUYnW5XRpYD70w9YZf2wfHQ9lgI1judBs6WrqYB63Ia6WNuR
	vbrjfchh5D0Y4dCkRPwRMVM7QTNh/XaXcetFCwRIHNXD65o+glUT2gG0PINBtTQb6tAG
	nOeG821vjE02iq0gW7s4VQKlgHVu7cEjW2rxPDNxh27g1DV+64nsiL441BMJeNNEW6Hs
	VR/xvSkUdL6GNeDFL9PEn1irunKCq9pV27IOXBW2GhrXW764vYxYjJPRdv7By3H1L/8N
	OFEDazJ+JYXvgx5ACxyUcLRtIDTpLHVRtOKls8uSSGdKMj8qtl4ZD25eBsAEuf5bsHnk
	zybg==
X-Received: by 10.14.173.65 with SMTP id u41mr68957230eel.13.1356519501281;
	Wed, 26 Dec 2012 02:58:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm52508054eep.15.2012.12.26.02.58.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 02:58:20 -0800 (PST)
Date: Wed, 26 Dec 2012 11:58:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20121226105821.GY8988@jama.palm1.palmone.com>
References: <50D1F76D.4070000@intel.com>
MIME-Version: 1.0
In-Reply-To: <50D1F76D.4070000@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Wed, 26 Dec 2012 11:13:19 -0000
X-Groupsio-MsgNum: 33095
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j+D14l8Ki1YJdzYp"
Content-Disposition: inline

--j+D14l8Ki1YJdzYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 07:20:45PM +0200, Radu Moisan wrote:
> Hi guys,
>      I have prepared a branch on poky-contrib (rmoisan/systemd) where I=
=20
> pulled systemd from meta-openembedded. The goal is to merge this into=20
> oe-core, so please take a look and give me your feedback on stuff that=20
> needs work or things that I might have done wrong, so that I can prepare=
=20
> it for merge.
>      At this point core-image-minimal and core-image-sato both boot fine=
=20
> with systemd. There still are a few warnings but not critical(at=20
> runtime), at least in my opinion, you may want to take a look at those to=
o.
>      You can activate systemd by *DISTRO_FEATURES_INITMAN =3D "systemd"*

Is this correct?

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/recipes-=
extended/pam/libpam_1.1.6.bb?h=3Drmoisan/systemd&id=3Dd31d804ad76829de039f3=
b41d7b45ffcc25e69b5

Shouldn't it be added to common-session only when systemd is enabled?

Is '|-' some special syntax for palm config?

"session required|-pam_systemd.so"=20

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j+D14l8Ki1YJdzYp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDa2E0ACgkQN1Ujt2V2gByOEgCfcbV/hmj6Ow66eiLnch3789VX
6RIAn1YjcpiUxwD23VgXGHzDb33IeBc8
=Y6tl
-----END PGP SIGNATURE-----

--j+D14l8Ki1YJdzYp--
