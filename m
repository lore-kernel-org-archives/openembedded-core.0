Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPctr-0007Ip-5N
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:04:11 +0200
Received: by mail-we0-f170.google.com with SMTP id z2so5706554wey.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=a4+KLekWQHCGg10OpvZoVqCRaov6FTW+4FnedYdvF1w=;
	b=hHxYGk7kzm16IrL0wx6mMXBOJN0tLmK45B+fpkY3ou0QCLZVrQQEyIAwlOayvZAU0n
	VJZQXJ0p5Tj2QrHs9tJ1IEXqreUrH847jCz6MfsknbUydioLhohbpx30xjoXfRqtufft
	zYVdvFnp1SbBc2bPymrFQtghHfpZ7jkDuK+ewg0Qom+XTw5DdSorl8/KkZwGNJ6fi7+b
	u4DQK9xEC56HQYYm5pNClH0Nl82OtLaxcpe7A9YLszWFCORTXFROddNe4amF10RDj2ob
	xD/Y62RRkMCpm1b13w4iFsgh3R2itBs4rjPeQ1/pOrklVe2Di1l2uMy5dYkRAUV7zMTd
	14nQ==
X-Received: by 10.180.185.176 with SMTP id fd16mr21265528wic.31.1365529607067; 
	Tue, 09 Apr 2013 10:46:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dp5sm27222363wib.1.2013.04.09.10.46.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 10:46:46 -0700 (PDT)
Date: Tue, 9 Apr 2013 19:46:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130409174646.GD2474@jama>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	Marco Cavallini <m.cavallini@koansoftware.com>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
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
X-List-Received-Date: Tue, 09 Apr 2013 18:04:17 -0000
X-Groupsio-MsgNum: 37690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2013 at 03:26:58PM +0100, Burton, Ross wrote:
> On 9 April 2013 15:21, Marco Cavallini <koansoftware@gmail.com> wrote:
> >  * Recipe taken from oe-classic
> >  * Required by xinput-calibrator
>=20
> oe-core already ships not one but two terminal emulators, let's not
> add another one.  Can we make this configurable in the recipe somehow
> and default to use matchbox-terminal (which is in the Sato images)?
>=20
> Long-term, alternatives along the lines of Debian's
> x-terminal-emulator is probably something we want.  Then again I'm
> still not entirely sure why this is even spawning a terminal in the
> first place.

u-a is not enough, we also need VIRTUAL-RUNTIME-x-terminal-emulator for
other recipes to RDEPENDS/RSUGGESTS/RRECOMMENDS on if they need some
terminal (and don't care which one will be used).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFkVAYACgkQN1Ujt2V2gByC5QCgox1xYX8VPCws3NNLCl0wBAwE
wdcAmwZj0VyberHGIf2V2ze4ydxx3XJz
=vz6D
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
