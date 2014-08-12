Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9B01760EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:47:49 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so7192793wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6qYZ0iLnimzF264jH8w+C5GPQrOjiRlnSH+b1pyrqS0=;
	b=spe7bzEqcW12zO2zURj5iHp1LCiGgyU0ebQq39NM2WwtN7sI5qAFprXXCWdqVm/8X4
	xVwLoc8StE9rZbKn+sJ+uXSuyGJOy2c9UWWoBNpLd3wQZRR6bofhjnB2lDZj+p5ptLLB
	y04DytmTr/B5PJ8AD59Z2DIEixTpldwPgmXw6L1oALx8gobAS222qiJmILCQGt6wzDqn
	+NzEBd6JMt785vKSlSX2s/YK97mjfk4oZzXD2T2tXHjBL8jhTd7TLEgqpTgTXxrYGX6j
	4o6n65kVQaDtsZZMGW4guK1iUNS5i/VWh67QCE7k9lp7jyX8XZsJTIvFabYxkGQ41SgD
	DXmQ==
X-Received: by 10.194.89.106 with SMTP id bn10mr6072077wjb.121.1407858469983; 
	Tue, 12 Aug 2014 08:47:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi5sm10048087wjd.33.2014.08.12.08.47.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 08:47:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 17:48:25 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140812154825.GQ14848@jama>
References: <8971389.fH3VELLT3O@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8971389.fH3VELLT3O@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] Automatic upgrade helper
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
X-List-Received-Date: Tue, 12 Aug 2014 15:47:56 -0000
X-Groupsio-MsgNum: 56362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pwryyPyu+zbGuqhB"
Content-Disposition: inline

--pwryyPyu+zbGuqhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 04:19:41PM +0100, Paul Eggleton wrote:
> Hi folks,
>=20
> I'd like to announce the immediate availability of the Automatic Upgrade=
=20
> Helper, a tool for automating the task of upgrading recipes when a new=20
> upstream release occurs. It utilises the build system to check if a new=
=20
> version of the software built by a particular recipe is available, and if=
 it=20
> is, it will attempt to upgrade the recipe to build that new version. The=
=20
> outcome of the process is emailed to the maintainer of the recipe along w=
ith a=20
> patch to do the upgrade, so that they can send the patch to be merged (if=
 the=20
> build succeeded with no warnings) or develop the patch further if problem=
s=20
> occurred.

Does it also check buildhistory output for unexpected changes in
packaging?

If it doesn't it should ask maintainer to do so manually before
submitting the patch.

> The tool is available in the following repository:
>=20
>   http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/
>=20
> Currently it builds upon distrodata.bbclass in order to do the upstream=
=20
> version checking, but in future we'd like to make better use of BitBake's=
=20
> fetcher to do this and also move some of the additional metadata out of i=
nc=20
> files and into recipes as appropriate. There's probably other things we c=
ould=20
> do to make the tool more flexible in future as well. Feedback / contribut=
ions=20
> welcome.
>=20
> (Thanks to Laurentiu Palcu & Marius Avram who did all of the work on this=
=20
> tool.)
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pwryyPyu+zbGuqhB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqN0kACgkQN1Ujt2V2gBxW9gCfff6ngtLHeCjlNrIqnqvEUphr
kDUAoJTHZe9wBv5+XZy5pIPMa4tyn4Kw
=7tNd
-----END PGP SIGNATURE-----

--pwryyPyu+zbGuqhB--
