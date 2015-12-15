Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 33B28601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:23:36 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n186so30994967wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kb9iyT9n1nUoJl3m6++op83YNus9PjsHxwoQFgVBSa8=;
	b=aiZKuGyyONYIP/qB+qWPXL0N6A+Bmf9FqpkKKEqDk+3YaE6Ft9I67ZLKkIUnoXMAid
	Ca4FJAXykADfQ2s27FRoobCrWHxgUOLnoCTfl+Ev3jjtixT7X4iIOBe3Zk0tbO2NXstj
	rQFMFIVLelg2GUOyAyEHJXbQpJQdbiPuDDEBD3kHX2OdenZeAijss90ltPoKKml93oai
	kr0mCfRK0dprtWPqhF9tW5m+vRRaLaCL95WnoG873Op2dWSRQmHOJMPkpw5XLtAzMWf/
	hyvbK7QKF7wJa5sw+6UWPYYHQXa6CmwcfvjEtnVUq0eW3g4eOFvotQY0/LHQNq70DdKU
	qpMQ==
X-Received: by 10.28.215.211 with SMTP id o202mr5208733wmg.85.1450193016583;
	Tue, 15 Dec 2015 07:23:36 -0800 (PST)
Received: from localhost ([86.49.34.37]) by smtp.gmail.com with ESMTPSA id
	l184sm3266247wmf.6.2015.12.15.07.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 07:23:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Dec 2015 16:25:42 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151215152541.GA2556@jama>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 15:23:39 -0000
X-Groupsio-MsgNum: 74779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 05:02:33PM +0200, Alexander Kanavin wrote:
> LICENSE checksums are changed due to a change in FSF address, or copyright
> years update.
>=20
> Rebased patches:
> sepbuildfix.patch rebased to 0004-Fix-out-of-tree-builds.patch
> add-ptest.patch rebased to 0005-Modify-vg_test-wrapper-to-support-PTEST-f=
ormats.patch
>=20
> Removed patches:
> force-nostabs.patch removed because it's patching lines that have been re=
moved upstream
> remove-ppc-tests-failing-build.patch removed because it no longer applies=
, and rebasing it
> requires building with special ppc32 machine configurations; qemuppc buil=
d is fine without it.
> enable.building.on.4.x.kernel.patch removed because the problem is fixed =
upstream
> glibc.patch removed for the same reason
>=20
> Removed backports:
> pass-maltivec-only-if-it-supported.patch
> 0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
>=20
> There is a known warning issued during build:
> WARNING: QA Issue: /usr/lib/valgrind/ptest/none/tests/scripts/shell@under=
score@badinterp_valgrind-ptest
> contained in package valgrind-ptest requires /this/is/a/bogus/interpreter=
/name,
> but no providers found in its RDEPENDS [file-rdeps]
>=20
> If you know how to fix it, let me know.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> +COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'

Can you add armv7ve as well?

> +
> +inherit autotools ptest
> +
> +EXTRA_OECONF =3D "--enable-tls --without-mpicc"
> +EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi -=
-without-mpicc"

Can you add armv7ve as well?

> +EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.getV=
ar('SITEINFO_BITS', True) !=3D '32']}"
> +EXTRA_OEMAKE =3D "-w"
> +

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZwMPQACgkQN1Ujt2V2gBwIWQCePJ1a2dS5u9osb/LwbbwGecSx
928An1JJzvxwCMqr2JWjXp7FFRC7Y7z3
=oEZu
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
