Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UJAHG-0003Oy-Qb; Fri, 22 Mar 2013 23:17:49 +0100
Received: by mail-pd0-f182.google.com with SMTP id y10so1801193pdj.13
	for <multiple recipients>; Fri, 22 Mar 2013 15:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4RTEuUqxyGNnTYrQPCxiMdD7TGZzGple2AD7iGSkN8g=;
	b=m+DnMA/jVNW1Z2mgBdhWtRg3sMVj6Fac1zezSuSpawOqD5wCfyz8Vpu6NEXGOzFeOS
	0gKuzrXZRU9YNKtaruLoG5CpxgKloK5y377Hl4t0CUUX+mdR/It3ti0/hJqPitSp/rI+
	WNafQ0YZAzpsplNFhtfYOydWKh87X1mUf6U8dfFmPS6g1df2Kqlg+RJzjaf0x96JNZaP
	jbIXeDhW/nlo6lYu79q5Vzdl6yS8g9d5NLhrzSwlwPmHzRqvsKHhjbMc11egUenuW56z
	IvhxA828LnL5327nJdzOAedCMhgFLFMhOC/elHUDi2sfQgLO0z+0Mm6y+tab7pHEMyuh
	Q7qQ==
X-Received: by 10.68.135.234 with SMTP id pv10mr5055842pbb.168.1363989639613; 
	Fri, 22 Mar 2013 15:00:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ef3sm4383773pad.20.2013.03.22.15.00.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 15:00:38 -0700 (PDT)
Date: Fri, 22 Mar 2013 23:00:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322220037.GW3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH 00/22] hybrid systemd/sysvinit, and systemd fixes
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
X-List-Received-Date: Fri, 22 Mar 2013 22:17:53 -0000
X-Groupsio-MsgNum: 36949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="csgZZokDzjk698W/"
Content-Disposition: inline

--csgZZokDzjk698W/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 05:38:20PM +0000, Ross Burton wrote:
> Hi,
>=20
> The following changes since commit 6211a2bdd32f7b2c8de7a5d75353c0522c8d42=
30:
>=20
>   scripts/qemu-testlib: Add more debugging information (2013-03-21 17:05:=
15 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib ross/systemd
>=20
> for you to fetch changes up to 0e1da1e227c8e52087f7a52f8501a81cd28e76c7:
>=20
>   systemd: recommend systemd-compat-units (2013-03-22 17:24:21 +0000)

Do you have one for oe-core?

--csgZZokDzjk698W/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFM1IUACgkQN1Ujt2V2gBwfnQCgi5R5tf+Gf0SttVL+foxfXYDg
ruYAn2YqZOErw/9EjXWVB+BuRjSTh46P
=BFFQ
-----END PGP SIGNATURE-----

--csgZZokDzjk698W/--
