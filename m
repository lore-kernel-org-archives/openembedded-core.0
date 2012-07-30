Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvuQW-0006bs-Cq
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 20:10:44 +0200
Received: by wgbdr1 with SMTP id dr1so4506920wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zQA/js/+X/6+RVb1A9gKcRMZ0LrpkfHQ65Fm1dpkwXc=;
	b=Eo7xxIXzvn/cFkzLcFI1xB0aH4FZ9xGP+t+y/Z2h1rzjr+1ZMBevi0sekenkORXr2J
	+CTO4iaZ6crlF+C6FghkaQY0YYWNGBfWKfvBGc3rmnspkXHjv8++6/HT8SDOuXvNw3WO
	cKVgEqNS2MKg+IJu2r9DntEDi75nSPgbrzSv69zse4Gp40BL8I9whUVdzs1mnxzVsuR0
	7yzGZpJr+dnEXIZVm3WciJOAu7A8FaiCeH/SrSfdBZL90h7+wA0Hz+wmvs2HB54JYh/N
	MwInvO5Z2/K+Wc4NqE/y5ty5AHmtnl2IQic09lm+wNCQrHb2nGVs7obJVbsaWgL1Qgsf
	bWKQ==
Received: by 10.216.240.8 with SMTP id d8mr6283849wer.157.1343671148465;
	Mon, 30 Jul 2012 10:59:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm25861040wib.2.2012.07.30.10.59.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 10:59:07 -0700 (PDT)
Date: Mon, 30 Jul 2012 19:59:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120730175903.GN3261@jama.jama.net>
References: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
	<49266E69-88A0-4DF7-AAC0-7D8B22EF169A@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <49266E69-88A0-4DF7-AAC0-7D8B22EF169A@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] udev-extraconf: merge with udev-extra-rules from meta-oe
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
X-List-Received-Date: Mon, 30 Jul 2012 18:10:44 -0000
X-Groupsio-MsgNum: 26502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yAzUYvkKIfeS0jQX"
Content-Disposition: inline

--yAzUYvkKIfeS0jQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2012 at 07:42:28PM +0200, Koen Kooi wrote:
>=20
> Op 30 jul. 2012, om 17:03 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > * license in meta-oe was MIT, in oe-core it was GPLv2, everyone fine wi=
th this?
>=20
> Hmm, MIT to GPL is a big regression, anyway to keep MIT?

If it's fine with oe-core people I'll send v2.

I was thinking the same, but didn't want to introduce another change to
original oe-core recipe.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yAzUYvkKIfeS0jQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAWy2cACgkQN1Ujt2V2gBwh6wCgjWibkdMMKHhAlg6jXoYYGX03
KW4AoKc2meWqA92kfr2MT8flejfBGQ2e
=XNaC
-----END PGP SIGNATURE-----

--yAzUYvkKIfeS0jQX--
