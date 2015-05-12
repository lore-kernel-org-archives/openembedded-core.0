Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B679773FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:07:27 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so17988050pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JgTO8oym6S6PRdF6Lt2H9IGnmpwcvmiO569YBtwVQmc=;
	b=XgquBb2f898xU4los9Z0agHD6+IcNBFKrmeA3Y1LIaYlEAXZIPP8Dzj/T1MxtcGOio
	oh007P+VNOvsBCY+mgHQf6yTOGRNoFoio6GWr/GQnfV94gbbfKsl3fAOjnN2KKb3iGPf
	n5MYjb6aiVLgWSE0pvPk0ycQMfhpM4GkVwHGjcO4yd8dZEiDVRH+YAoeWeG7aYnwqfT/
	D7gxve5jZK/ioORyjq620hgS62fVZ7ANyA2wzel7de4WUfe22Bx0+gRB/ikVALLwdRIv
	HCwv8x7PKLswmpYt3y2aVIOTZji4Rrcv57y/V9bVQrS30WeNMLP+hCFSUaEY7ryhPxhd
	dhJA==
X-Received: by 10.70.128.110 with SMTP id nn14mr29680181pdb.135.1431446848764; 
	Tue, 12 May 2015 09:07:28 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	nv13sm16687748pdb.15.2015.05.12.09.07.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:07:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431432209.30971.127.camel@linuxfoundation.org>
Date: Tue, 12 May 2015 09:07:26 -0700
Message-Id: <3394B77A-AD53-4EB6-8147-0D9D2F9753BC@gmail.com>
References: <1431432209.30971.127.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix packaging for gcc v5
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
X-List-Received-Date: Tue, 12 May 2015 16:07:27 -0000
X-Groupsio-MsgNum: 65459
Content-Type: multipart/signed;
	boundary="Apple-Mail=_609EF77A-B919-4BEA-8786-58D027FEB6A2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_609EF77A-B919-4BEA-8786-58D027FEB6A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 12, 2015, at 5:03 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Fixes:
>=20
> ERROR: QA Issue: gcc: Files/directories were installed but not shipped =
in any package:
>  /usr/bin/i586-poky-linux-gcov-tool
>=20
> with gcc v5.x
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc =
b/meta/recipes-devtools/gcc/gcc-target.inc
> index e348517..47fe1b6 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -83,7 +83,7 @@ FILES_cpp =3D "\
>     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
> FILES_cpp-symlinks =3D "${bindir}/cpp"
>=20
> -FILES_gcov =3D "${bindir}/${TARGET_PREFIX}gcov"
> +FILES_gcov =3D "${bindir}/${TARGET_PREFIX}gcov*=E2=80=9D

this is ok but I think its better if we were explicit here since I would =
like to know
when a new file is added into gcc. this will implicitly add it.

> FILES_gcov-symlinks =3D "${bindir}/gcov"
>=20
> FILES_g++ =3D "\
>=20
>=20


--Apple-Mail=_609EF77A-B919-4BEA-8786-58D027FEB6A2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJT4ACgkQuwUzVZGdMxTkuACeO2e12GEHU445/eTuaR1PO3vy
bSUAn2ai+EEfMLUtwSxPB11R6oahV/uM
=OUlc
-----END PGP SIGNATURE-----

--Apple-Mail=_609EF77A-B919-4BEA-8786-58D027FEB6A2--
