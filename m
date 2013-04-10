Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQ15S-0001yl-Ok
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 21:53:50 +0200
Received: by mail-pd0-f182.google.com with SMTP id 3so439097pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PSlezdleNM9yr/YDZbFeGw8P3fFRlRizrsRNGc+13CQ=;
	b=d93WRdMFYPQN4dxiKcoxmqBtskz8A5KhARrfryOopZ/8oDFzb9pMjndufNCCjibQGi
	E9KqmTgDxipuugLnV2SdDPtpfIsYU7dxXggm9lV77BxucKOQagllgUcq6xDme+wjclEj
	QcvDLLBReQ3rEf4NNYRtLN3xa7QZxn51XkpuOPndSfUXroJkcTTIvZP9aRF+laMamyi9
	x4ZtmdsMqLHLue2vy7YjtedhzZ5HoxvpOiSr+fPjjYzvJ5CBluWt45JSeiXbZjbPr2Um
	g2Y63lFOMLLv47Nj9ePCMlOPNIo067CC4sofRg8DEm1Ateq59ejqp7YT6ueJgCNWEhah
	9OBg==
X-Received: by 10.66.7.138 with SMTP id j10mr5291230paa.221.1365622580051;
	Wed, 10 Apr 2013 12:36:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fb7sm1584380pab.16.2013.04.10.12.36.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 12:36:18 -0700 (PDT)
Date: Wed, 10 Apr 2013 21:36:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marco <koansoftware@gmail.com>
Message-ID: <20130410193611.GF2471@jama>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
	<5165AB03.8020404@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5165AB03.8020404@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 10 Apr 2013 19:53:51 -0000
X-Groupsio-MsgNum: 37742
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 08:10:11PM +0200, Marco wrote:
> Il 10/04/2013 18:56, Trevor Woerner ha scritto:
> > This whole thread has me thoroughly confused. Isn't xterm_277.bb
> > <http://xterm_277.bb> already part of meta-openembedded?
> >
> > $ find . -name "*xterm*" -print
> > ./meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
> > <http://xterm_277.bb>
> >
> > And from what I can tell, it was added over a year ago by Koen:
> >
> > $ git log meta-oe/recipes-graphics/xorg-app/xterm_277.bb
> > <http://xterm_277.bb>
> > commit a38efd953c0bfef80fd6819c8339c1d1e79364b3
> > Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
> > <mailto:marcin.juszkiewicz@linaro.org>>
> > Date:   Thu Dec 13 10:35:26 2012 +0000
> >
> >      xterm: added gnu-configize for AArch64 support
> >      Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
> > <mailto:marcin.juszkiewicz@linaro.org>>
> >      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
> > <mailto:Martin.Jansa@gmail.com>>
> >
> > commit 253b1d7bc35c5a2a12dd6a7f2f0c034a34bfae18
> > Author: Koen Kooi <koen@dominion.thruhere.net
> > <mailto:koen@dominion.thruhere.net>>
> > Date:   Fri Jan 13 09:41:51 2012 +0100
> >
> >      xterm: update to 277
> >      License checksum changed due to date changes
> >      Signed-off-by: Koen Kooi <koen@dominion.thruhere.net
> > <mailto:koen@dominion.thruhere.net>>
> >
> >
>=20
> Yes, it is copied from meta-openembedded into oe-core

Then you should fix commit message too

 * Recipe taken from oe-classic                                            =
                                                                           =
       =20

In all recipes you sent to oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFlvysACgkQN1Ujt2V2gBy3KACggHblnruZzJVhAXD2g5N7deP8
VVgAn1TgL0KJVz9wASbdK+8+j22h7Frg
=tqwr
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
