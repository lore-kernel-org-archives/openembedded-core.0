Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmVDX-0001Py-AU
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 20:21:55 +0200
Received: by fxg11 with SMTP id 11so1661331fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X9n9zcUSg5L+R3v2G6I+R/k6240Bee6xrSY3aCejHcY=;
	b=DnS05bdC8RUTSQNpbAhUz3SsJNLQAdZVM5lCXQA9mDOAXgG9Bobp5mvLKlVxlxjOKm
	RHv/M5L0RcST/AEhZUZwRIH9x+VHvbXaBp/rK0Odznsdq89r8qzAJ/9TnBO6PS8yPtqX
	ow2qVx+yqQOD/u3lRcAPZv+QRDlCPct7/+Usw=
Received: by 10.204.24.5 with SMTP id t5mr119418bkb.122.1311877059470;
	Thu, 28 Jul 2011 11:17:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm2267355faa.1.2011.07.28.11.17.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 11:17:37 -0700 (PDT)
Date: Thu, 28 Jul 2011 20:17:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110728181730.GJ15286@jama.jama.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop>
	<4E30489A.100@windriver.com> <20110728072450.GE15286@jama.jama.net>
	<1311843248.30326.403.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1311843248.30326.403.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Thu, 28 Jul 2011 18:21:55 -0000
X-Groupsio-MsgNum: 7012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xssso5lpTBgMxDfe"
Content-Disposition: inline

--Xssso5lpTBgMxDfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2011 at 09:54:06AM +0100, Phil Blundell wrote:
> On Thu, 2011-07-28 at 09:24 +0200, Martin Jansa wrote:
> > Mark is right that if we have PACKAGE_ARCH =3D "armv4t" and we force
> > no-thumb with ARM_INSTRUCTION_SET =3D "arm" then PACKAGE_ARCH should be
> > switched to "armv4" only to indicate that.
>=20
> No, this is wrong.  Even with ARM_INSTRUCTION_SET =3D "arm" you might have
> BX instructions in the output, in which case "armv4t" is the correct
> PACKAGE_ARCH.  You can only set PACKAGE_ARCH =3D "armv4" if all the BXs
> have been suppressed, which means that you lose the ability to do
> interworking.

Ah right, we cannot allow this to be in ie collie feed. So old behavior
was correct in this aspect too.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xssso5lpTBgMxDfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4xp7oACgkQN1Ujt2V2gBzY2wCdG5MOUxldlInGGUpydTJItcGl
OcgAoJ96tP/gdt92yQ61/Xbs3oylrFig
=/hgD
-----END PGP SIGNATURE-----

--Xssso5lpTBgMxDfe--
