Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPe8x-0007T8-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 21:23:48 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so3928323pab.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fNsIA3GiUHTCh7soZJCvXxAVAB0sYx0IGYfW0lv4aGw=;
	b=opbCcArvVt4dl4MeS5JJiiWvBKZ2mmf573XLEN9HhT2wAT7GtFZiwse4dq0VoXiqHu
	Ku4f9S5w+VRAWxwL/cuUZuiy77TjoUpfIL/fBTH5rm6phHmQRCszemayJW3cfeU4gxrj
	HNFMG+QTJ+UMFNoG5WlAqvsu0MW/B9N7LOvAnj1MapCcWBPTd9Zn3UQucWEL9XrmQe5S
	2svL2jPrdY1V9L3C3hIW0jkRYYlJe1VIK/nZTJpUUTMWqPC0MMaT09TaeuyXfbgpaz2Y
	L6HYMXOUrhp/BUS61L2jVxD9mvCVSS6XaBwqNFLi12d07ey3JxoTg7EvmjStPpndVFy8
	W7OQ==
X-Received: by 10.66.121.202 with SMTP id lm10mr45801619pab.138.1365534386832; 
	Tue, 09 Apr 2013 12:06:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fq1sm3210718pbb.33.2013.04.09.12.06.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 12:06:25 -0700 (PDT)
Date: Tue, 9 Apr 2013 21:06:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130409190616.GE2474@jama>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 Apr 2013 19:23:48 -0000
X-Groupsio-MsgNum: 37697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2013 at 08:01:21PM +0200, Koen Kooi wrote:
>=20
> Op 9 apr. 2013, om 19:46 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:
>=20
> > On Tue, Apr 09, 2013 at 03:26:58PM +0100, Burton, Ross wrote:
> >> On 9 April 2013 15:21, Marco Cavallini <koansoftware@gmail.com> wrote:
> >>> * Recipe taken from oe-classic
> >>> * Required by xinput-calibrator
> >>=20
> >> oe-core already ships not one but two terminal emulators, let's not
> >> add another one.  Can we make this configurable in the recipe somehow
> >> and default to use matchbox-terminal (which is in the Sato images)?
> >>=20
> >> Long-term, alternatives along the lines of Debian's
> >> x-terminal-emulator is probably something we want.  Then again I'm
> >> still not entirely sure why this is even spawning a terminal in the
> >> first place.
> >=20
> > u-a is not enough, we also need VIRTUAL-RUNTIME-x-terminal-emulator for
> > other recipes to RDEPENDS/RSUGGESTS/RRECOMMENDS on if they need some
> > terminal (and don't care which one will be used).
>=20
> Isn't this what xdg-utils are for?

Maybe I'm missing something, but I don't see how xdg-utils will help
bitbake to find suitable runtime provider for "any-x-terminal-emulator".

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFkZqgACgkQN1Ujt2V2gBzkVwCgoAIt4F7noUYbJ4ClPcZCxm+F
aW8AoLCE7acfXyWKbUQlNT/xq6Ir5JOD
=uys8
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
