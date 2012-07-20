Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsEyE-0000wr-Fb
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:18:22 +0200
Received: by wgbdr1 with SMTP id dr1so3539390wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fouQu8qapfhR82Hfa+FpGABauDrcqhkb9M0kG6AWSdA=;
	b=OuAK3QuMVkVWX27EOHe+kvAb5aEERGBnVEPMpzYMLDWmYE3UC1UI88gAP084X+NSJk
	sO0pY4n7nRhpcJOH6PCxH/76NFEFHpTJBcPS+AvUgrKxXzDE3WHAwb96SMXBNcsnBQFf
	Niag0yK6EFd2JkpMcKVPqjhFL1kJwSB14IfCEHhW3kfa2gD0Ja2sZdHNw4cZut/HTtl/
	9nMz/f8GaipyA87LpMdNUR4UYZggD4KsBjzQJbaFhdhOm/XeIhp84y+JiKkedZfewIke
	AuvuFsdAxLIi2+wtxLVYTBSxy8lt48TD2iiSqp6Ej0FxzIuYcUEss/zFqlG/QRmr9DxG
	6cdg==
Received: by 10.180.78.99 with SMTP id a3mr26829970wix.15.1342796819216;
	Fri, 20 Jul 2012 08:06:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm15692382wix.6.2012.07.20.08.06.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 08:06:57 -0700 (PDT)
Date: Fri, 20 Jul 2012 17:07:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120720150709.GG3534@jama.jama.net>
References: <20120720093208.GD3534@jama.jama.net>
	<1342793560.21788.27.camel@ted>
	<CABcZANm_becV-qGHud3=kbyoBMuG9xqcTTLNdT5RCu-MZMGn1g@mail.gmail.com>
	<4851908.FI1zozqsjq@helios>
MIME-Version: 1.0
In-Reply-To: <4851908.FI1zozqsjq@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 15:18:22 -0000
X-Groupsio-MsgNum: 25865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline

--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2012 at 03:31:04PM +0100, Paul Eggleton wrote:
> On Friday 20 July 2012 07:15:28 Chris Larson wrote:
> > If you don't see two different types of indentation in one file as
> > inconsistent, I think you need to look up consistency in a dictionary.
>=20
> You're not wrong - but that's not the point. Personally I'd really prefer=
 we=20
> had four spaces everywhere; I'm not entirely sure why we chose this conve=
ntion=20
> in the first place. However, it's the convention we have now and changing=
 it=20
> has serious implications - almost every recipe will have to be changed;=
=20

It doesn't need to be changed now everywhere, recipe maintainers can
change it if they want e.g. when upgrading recipe (preferably in
separate commit). Tabs highlight will help with that..

> backporting changes to stable releases will be made more difficult; submi=
tted=20
> patches crossing the switch will be difficult to apply, history will be=
=20
> polluted, etc.
>=20
> Changing this is not a small undertaking.

meta-efl + meta-smartphone size is about 1/2 of oe-core (counting .bb +
=2Einc) and it took only about 1 hour to replace all tabs with 8 spaces=20
(when it was used to indent e.g. SRC_URI) or 4 spaces (when it was used=20
in shell functions).

In many cases I had to replace 8 spaces with 4 when those shell
functions were indented with spaces already or with tabs/spaces mix.

Yes it's only aesthetics, but that's what "style guide" usually does.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJdB0ACgkQN1Ujt2V2gBzBPACgn0fXt0X5PWugmo+bON26svTb
LNUAoIsMEM78hZb7WDm6nZi8B/V95j8S
=J71i
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
