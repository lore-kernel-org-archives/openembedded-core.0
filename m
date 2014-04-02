Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id EECDE6F23F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 17:20:15 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so598091wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LzaQR257kzOxPM2laITTq3XckqWSLg42KThj4gdNX5M=;
	b=CJjnI756JMw3wRUgLGlkQsuu30FusoSyEX8NpS6YWjPCwdeebRCmf/u/B+ifWL11ed
	E2Hcpj/arkGKUFelTZY87z/00m7uEOGM1N1kjCtMTsByIFcC330PuOcFwhYpaETBTFgA
	FsKpUqg9hlZ3+t56b+1HVHZTrUqcDIUCqcMMXdGsoOeJfwhfLTvzJ6tb8yKF93wddQid
	Scf8l9brQnOqRfJgbxiFvDQXS4Z2Zz/wF0tqPOvL8cSZzrhaG/3nRs6fP7HvwqwX0Zs2
	xrv5J8+pZHoFLZvgQVCDY9jDLnZQwN+LY3a57dC8stvFSIootb5eODDvHfUwOlu9Qtde
	b3zQ==
X-Received: by 10.194.157.41 with SMTP id wj9mr2742516wjb.34.1396459216059;
	Wed, 02 Apr 2014 10:20:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm5867289eef.20.2014.04.02.10.20.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 10:20:14 -0700 (PDT)
Date: Wed, 2 Apr 2014 19:20:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140402172015.GD2132@jama>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
	<1396441537-2911-3-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1srunWtK-tBOxD2P=-4+28ejgN+xwoitqs+ukMNiS77BZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srunWtK-tBOxD2P=-4+28ejgN+xwoitqs+ukMNiS77BZQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gcc-target: remove infodir
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
X-List-Received-Date: Wed, 02 Apr 2014 17:20:17 -0000
X-Groupsio-MsgNum: 52104
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline

--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2014 at 10:06:16AM -0700, Khem Raj wrote:
> On Wed, Apr 2, 2014 at 5:25 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > +       # Info dir listing isn't interesting at this point so remove it=
 if it exists.
> > +       if [ -e "${D}${infodir}/dir" ]; then
> > +               rm -f ${D}${infodir}/dir
> > +       fi
>=20
> why check if it exists when you are already using rm -f ?

Just because I was copying snippet from autotools.bbclass

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM8Rs8ACgkQN1Ujt2V2gBzDjgCfSiIVnF3k3Mkni/cnN+FK48Au
bJMAn3BUskvcSXmm8HXL7synlaUAR5ey
=lM9a
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--
