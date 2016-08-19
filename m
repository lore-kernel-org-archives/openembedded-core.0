Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64FE9731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 17:07:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i6so1736479pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=1JqIlaiwapUTrI2Lv2/HL9roqofMoIuACiQwzd0ilMw=;
	b=MkFEmdm7RnVRcBvdI8rWJa0vODHJEpqOQjOoUeNIZgNpZyLKvwwEymGIeGUi3Sed1X
	0YDO+aXNg/4z1JXloEzm8I4t0pFt3AjCAGIzvgiwxmEeh54NkWgXEsI6FMZF6OLuYXWc
	b7f23h0/icdrCiJvKDh5KgcWvHIUVmKxBvK4F/Q3AinsBUAuC55WvyuumCdkgw+zfSMX
	EJG0QHa9iUVv5HPnvRl8Y6KXSEfHPhRtmdaTGce2buQOYqtTgwU9cb+JF0rQ/PBgiWJK
	vWJGdt5ygPmsEnmDjorY2A7U/6gT0wWvCPablg7q/7VDGnaeRTFKCoi3gENH2AbQy36W
	7ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1JqIlaiwapUTrI2Lv2/HL9roqofMoIuACiQwzd0ilMw=;
	b=CjQypttR7ytcakpqQpnqcYv0HPU18NdxywZiR/C1AZneG8UjziwSDVB0Fim4XC7kFH
	iboz/A3CAg5K3IbtTYX6mNK1CPtG0Lesi3Rn56t2+Y9WaLTySXQTKbx2IhDxfxZqX5CM
	YzaX6OCNHCD+/1G1tpeowtQbHmvRyl6lqh9onTPyBSN2qAFf6nmjruHGlETgr2shPKLc
	pq5Csmo9LXYQqe7pJDgvHCNkF93vPPGn7VwWE8d1Kn2P6n9Xqux4cbA2Dqz/96+Zsmvs
	jWfGhxfqyVccCvk3IE5mWz9JtiMtQwRRQKO5AT7JuVPDkorQCe0t4GzNYcYeUzGEcZKw
	mzkA==
X-Gm-Message-State: AEkoousMJ5m8Imfsu7vzpcsEFCDnsSw1v6hvREbYNRp9tmFHm+8CjbGcx7de+M2Lar/S6g==
X-Received: by 10.98.74.91 with SMTP id x88mr15933548pfa.79.1471626451890;
	Fri, 19 Aug 2016 10:07:31 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	q26sm7922316pfj.53.2016.08.19.10.07.31
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 10:07:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
Date: Fri, 19 Aug 2016 10:07:33 -0700
Message-Id: <9D776326-1F02-4F8E-B61C-DF3971141312@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] security_flags: pass ssp-buffer-size param to stack protector
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
X-List-Received-Date: Fri, 19 Aug 2016 17:07:31 -0000
X-Groupsio-MsgNum: 85991
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E008256B-6779-4E45-A0EC-0F9BA2F36663";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E008256B-6779-4E45-A0EC-0F9BA2F36663
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.com> =
wrote:
>=20
> This tells the compiler to use a canary to protect any function which
> declares a character array of 4 or more bytes on its stack, rather
> than the default of 8 or more bytes.

Thats fine, however, it slows down the code, strong option was a =
compromise
otherwise we could just use fstack-protector-all

>=20
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
> meta/conf/distro/include/security_flags.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 77fade6..691cea1 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -12,8 +12,8 @@ lcl_maybe_fortify =3D =
"${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
> # Error on use of format strings that represent possible security =
problems
> SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security =
-Werror=3Dformat-security"
>=20
> -SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> -SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> +SECURITY_CFLAGS ?=3D "-fstack-protector-strong --param =
ssp-buffer-size=3D4 -pie -fpie ${lcl_maybe_fortify} =
${SECURITY_STRINGFORMAT}"
> +SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong --param =
ssp-buffer-size=3D4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>=20
> SECURITY_LDFLAGS ?=3D "-Wl,-z,relro,-z,now"
> SECURITY_X_LDFLAGS ?=3D "-Wl,-z,relro"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E008256B-6779-4E45-A0EC-0F9BA2F36663
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3PNUACgkQuwUzVZGdMxSWRQCdFiZQkMz+wQ2zRNC6sVcJIcMe
Jw0An0XbfryymuKFttWsaRX62P860OyR
=JqEq
-----END PGP SIGNATURE-----

--Apple-Mail=_E008256B-6779-4E45-A0EC-0F9BA2F36663--
