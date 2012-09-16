Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDIHg-0001dq-Pj
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 19:05:28 +0200
Received: by wgbdq11 with SMTP id dq11so1776079wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2012 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W/yp+0xaHXuTCS48TgThuaAfMMXRMYdaMfOAW7DNwP4=;
	b=OrJ/n9CHXsSiEMGldKiP3PB8RhgCkinij07xGw+EHH29qvmjWYbA+XmlvDx0llQRqy
	yqg8PvpR5XogAxsIvH1dSSU55ZCDIFL7ZcGOgu1TPJhzX10VgYvj424tCFaKFfQcEKJO
	HZRjgzo4xYz0Wy0TBGIeKpGZYFQsLFYgE63ffk8hOFM0aYeiUXCJWoay89OmLjpj9DUQ
	9NmUIfbBLFigi84GIzLitR0cyI9BrSGiGW+5kPGHFv3brtn8X8y1iovdKawxrMVTo5Pb
	f407Ec7zIYtPqSDVeOBGoVtLsA25A/nnap6gncHxxODfcfia/Q/Ieeh4HOdx1nBvHPd2
	uPXg==
Received: by 10.180.86.133 with SMTP id p5mr10691286wiz.17.1347814371244;
	Sun, 16 Sep 2012 09:52:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm18563306wib.10.2012.09.16.09.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Sep 2012 09:52:49 -0700 (PDT)
Date: Sun, 16 Sep 2012 18:52:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20120916165255.GC3628@jama.jama.net>
References: <50560305.6060502@balister.org>
MIME-Version: 1.0
In-Reply-To: <50560305.6060502@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gtk+ build failure fixed vy reverting libffi update
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
X-List-Received-Date: Sun, 16 Sep 2012 17:05:28 -0000
X-Groupsio-MsgNum: 29361
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 16, 2012 at 09:49:09AM -0700, Philip Balister wrote:
> With 3e40136e8bd13b17b6d88b6acfb5ed162bb8d96aBBB, gtk+ fails to build=20
> for me. Reverting it solved the problem.
>=20
> I supposed this is related to the libffi thread I was ignoring :)

Yes, I'll send couple of PR bumps today to fix at least this one.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBWA+cACgkQN1Ujt2V2gBydRACdHB6ctbfy1mDL2Unrg2x5NZPY
vysAn31+0KeKJrwPD1youoxG6MJM0nod
=TsYC
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
