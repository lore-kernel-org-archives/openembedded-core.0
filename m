Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1S2MUn-0007If-Tn; Tue, 28 Feb 2012 13:49:33 +0100
Received: by eekc1 with SMTP id c1so737015eek.6
	for <multiple recipients>; Tue, 28 Feb 2012 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h9IFR+o+Wye6wxL5q7W31YTywrtRmMNDgcRbXKVLJao=;
	b=K69MMuh2HPceRa9ZpxulnPPK18Lp+ubMV2SOn392c1B+lI1S7NmBgGgoOEtpVGfwZb
	HeQH6SxNh/iPDyioyCp7iyvHTwv/ohdQ0DQE7UoGr5XX1942G5MtWaYwk/rHkvCOFf2l
	dZH85+OzeftoMRakN27I4wP8ucNsoycdQUoto=
Received: by 10.14.186.12 with SMTP id v12mr8248979eem.31.1330432865915;
	Tue, 28 Feb 2012 04:41:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm69991883eei.3.2012.02.28.04.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 04:41:05 -0800 (PST)
Date: Tue, 28 Feb 2012 13:41:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120228124103.GC3910@jama.jama.net>
References: <20120228122416.D2CF210332@opal>
MIME-Version: 1.0
In-Reply-To: <20120228122416.D2CF210332@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Yi Zhao : lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 28 Feb 2012 12:49:34 -0000
X-Groupsio-MsgNum: 18142
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 12:24:16PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b9ef6b8022a40bab83e8eb29e5fcde0886cf2988
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db9ef6b8022a40bab83e8eb29e5fcde0886cf2988
>=20
> Author: Yi Zhao <yi.zhao@windriver.com>
> Date:   Fri Feb 24 14:51:28 2012 +0800
>=20
> lsbtest: Add recipe for LSB tests and automate test
>=20
> The recipe is used for LSB tests. The script LSB_Test.sh does the followi=
ng things:
> - setup LSB testing environment
> - download LSB rpm packages with list file packages_list from remote
> - install the packages
> - execute LSB testing with profile file session
> - collect the results
>=20
> Install packages_list and session files into ${D}/opt/lsb-test.
>=20
> [YOCTO #1567]
>=20
> ---
>=20
>  meta/recipes-extended/lsb/lsbtest/LSB_Test.sh   |  510 +++++++++++++++++=
++++++
>  meta/recipes-extended/lsb/lsbtest/packages_list |   50 +++
>  meta/recipes-extended/lsb/lsbtest/session       |  194 +++++++++
>  meta/recipes-extended/lsb/lsbtest_1.0.bb        |   37 ++

S=3D${WORKDIR}

This breaks parsing with new strict quoting, will send patch for that,
but be more carefull next time :).

Cheers,


>  4 files changed, 791 insertions(+), 0 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3Db9ef6b8022a40bab83e8eb29e5fcde0886cf2988
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEUEARECAAYFAk9My18ACgkQN1Ujt2V2gBxaXwCY/uMgN/qVEIuFIyDaM8tgrCr+
QACfZeKWyPOdiE8p8/kff5XtOaBh5NM=
=KcXp
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
