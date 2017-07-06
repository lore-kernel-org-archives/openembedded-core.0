Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFF160190
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 06:33:31 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id t186so6442303pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=gz4kW4TFI6DZpDY23rOUtuNTp7tRGuwxXvuSZVWCT/E=;
	b=OTuMqZ/MR3JgY0mC8B1uEh6l1PTp9PKIS5cDe4aPHZXmG6QyO5WNQuEOd5Xzdyc2Y1
	OWn4xm/Yum5LHj9v5NsloVaQ5RsupfnYIkB+4qab0jgMHdqw6m3kCsAY7WgLriuWDqsl
	OQJ+x9YDiV9yvOiMveIqhzatIMdlW0XNWigpjKJwCDQ+ev+WkxDilymhN4BLdoiKtQor
	4z2MLnvrtLmiMoVi8ev0Uu+GIApVBCXtjbKZkZq5nlJv3SIUrsVURfdVAiXHsbWhbS5a
	y08yC590hk3ZGfoeW/mdoUzjuvggv1H00+aZLbs0hH2x4EstduuT8BnVZFRP5VMKBGr1
	y1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=gz4kW4TFI6DZpDY23rOUtuNTp7tRGuwxXvuSZVWCT/E=;
	b=iIjyFwwAwF4ZWeQJP78aXyMeylOP/AsBl6LM1wqGtpLrzQi+WuGRHM4HaxgSRktnbq
	h5rrYmSqZaYMAHa9DSkrMs1I2jFXsp5oIlKIMXvUW+IJ2iNoPpPkIemcpw5BVi2hgYow
	wE3MRYfpdWT2RCZOKvq6P/d+PMAt+cyL4Os2Slfd3dhOAYOLRFuZ52a4htl72OrdpdEM
	3ZBc9XIjTby78xyf/m1mGr+bQmNZ+SBc5OyePFWXNfsNeqrR2BhkpqppHNPoGET6y+YZ
	XRc8YKpxaF+n31FKYtQgzv3TtDXGr+G6HyEUfMsiq3fFwfOm04s7LxXhMbNyPZY1Ydi0
	c2BQ==
X-Gm-Message-State: AIVw1105nFar4sADQXusduPLTAgTYNUPoOgtmqGU+Sf1kTMj/2zMrTsd
	Mwcy3SRdy5vFlbXSJKY=
X-Received: by 10.99.4.6 with SMTP id 6mr25061942pge.126.1499322812428;
	Wed, 05 Jul 2017 23:33:32 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:ccf3:b8e4:2104:e4ef])
	by smtp.gmail.com with ESMTPSA id 75sm2078731pfk.84.2017.07.05.23.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 23:33:31 -0700 (PDT)
To: jose.perez.carranza@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com^C--confirm=always>
	<20170703200415.8736-1-jose.perez.carranza@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a9968903-cd7e-0372-6f18-50abb2b9b54d@gmail.com>
Date: Wed, 5 Jul 2017 23:33:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170703200415.8736-1-jose.perez.carranza@linux.intel.com>
Subject: Re: [PATCH v2] oeqa/sdk: Replace buildiptables for buildlzip tests
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
X-List-Received-Date: Thu, 06 Jul 2017 06:33:33 -0000
X-Groupsio-MsgNum: 99740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="w6QKJDrv5jgpe5BkTK4mKsrkelVHpE7sC"

--w6QKJDrv5jgpe5BkTK4mKsrkelVHpE7sC
Content-Type: multipart/mixed; boundary="EwvVqMrbpW6ErwmrTCuR4ARJPqXCBpLJE";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: jose.perez.carranza@linux.intel.com,
 openembedded-core@lists.openembedded.org
Message-ID: <a9968903-cd7e-0372-6f18-50abb2b9b54d@gmail.com>
Subject: Re: [PATCH v2] oeqa/sdk: Replace buildiptables for buildlzip tests
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com^C--confirm=always>
 <20170703200415.8736-1-jose.perez.carranza@linux.intel.com>
In-Reply-To: <20170703200415.8736-1-jose.perez.carranza@linux.intel.com>

--EwvVqMrbpW6ErwmrTCuR4ARJPqXCBpLJE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/3/17 1:04 PM, jose.perez.carranza@linux.intel.com wrote:
> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
>=20
> Buildiptables test cases are conflicting with images built with =E2=80=9C=
musl=E2=80=9D
> as standard C library, in order to avoid those issues lzip package was
> selected to be used on the tests as this does not have any "musl"
> dependency.
>=20
> [YOCTO #11713]

On top of this patch we also needs to change meta/class/testimage.bbclass=

to replace buildiptables with buildlzip

>=20
> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com=
>
> ---
>  meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildlzip.py} | 8 ++++-=
---
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildlzip.py} (8=
4%)
>=20
> diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/s=
dk/cases/buildlzip.py
> similarity index 84%
> rename from meta/lib/oeqa/sdk/cases/buildiptables.py
> rename to meta/lib/oeqa/sdk/cases/buildlzip.py
> index 419c7ebd09b..3a89ce86276 100644
> --- a/meta/lib/oeqa/sdk/cases/buildiptables.py
> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
> @@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
>  from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
> =20
> =20
> -class BuildIptablesTest(OESDKTestCase):
> +class BuildLzipTest(OESDKTestCase):
>      td_vars =3D ['DATETIME']
> =20
>      @classmethod
>      def setUpClass(self):
>          dl_dir =3D self.td.get('DL_DIR', None)
> =20
> -        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/iptables/=
", self.tc.sdk_env,=20
> -                        "http://downloads.yoctoproject.org/mirror/sour=
ces/iptables-1.4.13.tar.bz2",
> +        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/lzip/", s=
elf.tc.sdk_env,
> +                        "http://downloads.yoctoproject.org/mirror/sour=
ces/lzip-1.19.tar.gz",
>                          self.tc.sdk_dir, self.td['DATETIME'], dl_dir=3D=
dl_dir)
>          self.project.download_archive()
> =20
> @@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
>                  self.tc.hasTargetPackage("gcc")):
>              raise unittest.SkipTest("SDK doesn't contain a cross-canad=
ian toolchain")
> =20
> -    def test_iptables(self):
> +    def test_lzip(self):
>          self.assertEqual(self.project.run_configure(), 0,
>                          msg=3D"Running configure failed")
> =20
>=20


--EwvVqMrbpW6ErwmrTCuR4ARJPqXCBpLJE--

--w6QKJDrv5jgpe5BkTK4mKsrkelVHpE7sC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlld2boACgkQuwUzVZGdMxQUPQCgkz+UFIyTAdfubhFWBEV9tcLx
60UAn1qkgjhI6fyrqzeyAIlgdU82WEb4
=DhHQ
-----END PGP SIGNATURE-----

--w6QKJDrv5jgpe5BkTK4mKsrkelVHpE7sC--
