Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0009574561
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:02:20 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id r37-v6so8592099qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LmX4XuMeGzXYnzp2N5gY5DJdFKNawE3/lG4aSwHMl/k=;
	b=KwfN4qaeA3Mn9WUsxjcNd0rsSERyZRjZvrTYMDc2ghB2P+mqA3JLpdpZQ6anp1zMTu
	Dujt9I5VYYSGVwpijF3wdiEF7aP3r8eKONmO0muSOAyKsgWWTj4UhQSXLzc7IH+ICsnX
	SUVgibo46qkQSe3VMmzWGqSfLYXmAsYATybOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LmX4XuMeGzXYnzp2N5gY5DJdFKNawE3/lG4aSwHMl/k=;
	b=EjsyU0CbcndO3W9mUbi5zvZYjQKAHqFA6Kg0MJ4Re0fsgeqqIPgC+wNqFEGlWhlUMB
	GRnLvoj1ZqFCsSVJyqqMMkE1pZBUkLYMr+7ghR2fAiqalmEg9C2Ajd8FcCOoMumDqHBy
	Xuqp9V6h/M60Bn2qSwiwgtqik4vLwlId3uRuppNvbjLYPmUZ/TZT4EHIu9LCrsO/+UJW
	l6FUqU4TW2tVFy7x0ggdakRhmodrtuVXFgtVa7KDtDd7JH0BHxByKCx2OG2ZqpHQpXRF
	tKPDcuv0D06T97g9XwCF6khyyLFzREbwAnGpllLgqkBQWkpAd5CXuV/lKdWyr+5EjcGh
	xS7w==
X-Gm-Message-State: AOUpUlHMQNSz4kjdqOuhUj2qoCIsseXROLjvQx8OSfjPE9hXbRCoRG4y
	bgETXNCKVTRQzfimLeEf9mj1Rg==
X-Google-Smtp-Source: AA+uWPwgmtpc8MBvD9015PtqB8cYpINyQGG0uwIboMlMe6O/Pz4yLggPy3BL69PWFA4fuTfEh/Yong==
X-Received: by 2002:a0c:8a6f:: with SMTP id
	44-v6mr40151519qvu.120.1534766541777; 
	Mon, 20 Aug 2018 05:02:21 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	c184-v6sm5008109qkd.43.2018.08.20.05.02.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 05:02:20 -0700 (PDT)
Date: Mon, 20 Aug 2018 08:02:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Kevin Hao <kexin.hao@windriver.com>
Message-ID: <20180820120218.GN11769@bill-the-cat>
References: <20180820104225.90976-1-kexin.hao@windriver.com>
	<20180820104225.90976-2-kexin.hao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20180820104225.90976-2-kexin.hao@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wic: bootimg-partition: Select a preferred type if multi kernel images are installed
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
X-List-Received-Date: Mon, 20 Aug 2018 12:02:21 -0000
X-Groupsio-MsgNum: 114965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JLiXfqD9/Kt1b+Pq"
Content-Disposition: inline

--JLiXfqD9/Kt1b+Pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2018 at 06:42:25PM +0800, Kevin Hao wrote:

> Automatically select one kernel type image based on a predefined
> precedence list if there are multi kernel images installed.
>=20
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--JLiXfqD9/Kt1b+Pq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbeq3KAAoJEIf59jXTHXZSCikP/3MBZPTYL+vJ91mS5GM++7W7
LxjYnY914/8dAIqQDBMR1fhA/8/MOGv8doOAQx5s/ldxYOcI92qt50GGvi7DBGo5
TzFWEeAldGC9CwdDAJYRloNOvKNln1YnldE107go4CVtU7SMYsOscyiOjlkQFGv8
mefqn7JZwaN0iAMW7kZ/Kym/RDGrQFGDc70uyCx7VPKRzOcJKNWKuJUir7Pe6KSk
J0Dfjgya/ufJRFmUBo6oOHoUbn3L5PsvnQwf+wK42fTlIDNgGzoL+HwbGwhBEqKe
1/4OsOEk6QybyklNyOFTGe0z50m1HQVvMsKN2ORAefWqfrwXU/K7rxV4VACesmvX
mgIUdhf7bkYF66g2G09lDVvxWbLFIAhbNXJDerBte8iMHCd/IW36ItWkDYt3jP40
hJZLY+zMJoGtoXPdoYmTtR0b2mwDA4J3zhxg43pk1zmcpzUPIQPQkgDCZoJlhdA9
9EPFA8PWbChAsc3WWTXI8zVloGnV6OpcEK22WPQ6BFAtJH6qeh5T+mH4EjXQuX/o
7Pt3VfBF+0l0fL9ihKCzW1D0Dz1JVPwqBQ2yc3uLyWbcLv64YRIF6jzKQzDXSmlV
TsEl2yZiavQ7JIiSAcHHytJNhfWGZsBTS6ZnkBGiNw9wSKf9d8wDd4YoDPNVUOal
U2izU04OchxJ0DBDqL6Y
=RV+Z
-----END PGP SIGNATURE-----

--JLiXfqD9/Kt1b+Pq--
