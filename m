Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 835C4734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:50:01 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so9159652pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2NqZpFtwT6Zq1otTLequjaKnIyYQVAIracc39HU7CDk=;
	b=b+WzP1uE6QG31AUwbr2ddcVmdIDqVz05DSYl6vZSIlIv7s7r0/sonNLc/VrepSV1rK
	7OIZvxQNUvo7+l7qfM+zd0NQKCa8NSFE3uj1unw+ZtE/ffbL6admYGdnE54A0UVpR/A8
	vtH0XmTBb6HYt60z95ntxRRiC2//xDg3XsstjsNOO56gd5mxH4PQRmDxuBghpA8XzwhO
	XJ9zMo3/gtKA1XsjsFs1a5prxS2be+40jMIwkJbwM2eG3LWfosKQmtwuvGnFf6VRF56H
	B9J4YtkjFfT8TWNcStO2CmJrQ8oncGsTMZmkb54C+4v8g+MiAZAVUAkhno623HfT2zFk
	/Tpw==
X-Received: by 10.66.197.202 with SMTP id iw10mr64602000pac.77.1439365801596; 
	Wed, 12 Aug 2015 00:50:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:b9e7:cb72:7ff1:d60c?
	([2601:646:8601:4580:b9e7:cb72:7ff1:d60c])
	by smtp.gmail.com with ESMTPSA id pk8sm964118pdb.54.2015.08.12.00.50.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Aug 2015 00:50:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1437500350-549-1-git-send-email-jslater@windriver.com>
Date: Wed, 12 Aug 2015 00:49:51 -0700
Message-Id: <AB5F0F40-684B-4A79-B48B-B06D4F32B598@gmail.com>
References: <1437500350-549-1-git-send-email-jslater@windriver.com>
To: Joe Slater <jslater@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] common-glibc: define bash_cv_getcwd_malloc
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
X-List-Received-Date: Wed, 12 Aug 2015 07:50:01 -0000
X-Groupsio-MsgNum: 69333
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5903D5E3-69F5-4C40-B4F9-562263DF4AC9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5903D5E3-69F5-4C40-B4F9-562263DF4AC9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 21, 2015, at 10:39 AM, Joe Slater <jslater@windriver.com> =
wrote:
>=20
> We do not want bash to use internal code for getcwd() because
> it can fail in certain filesystem types.  Trust that the function
> in glibc is not "broken=E2=80=9D.

I would suggest to move this to bash recipe as

CACHED_CONFIGUREVARS +=3D =E2=80=9Cbash_cv_getcwd_malloc=3Dyes=E2=80=9D

so other libcs can also benefit.

>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
> meta/site/common-glibc |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/site/common-glibc b/meta/site/common-glibc
> index 8329bb3..1443f8e 100644
> --- a/meta/site/common-glibc
> +++ b/meta/site/common-glibc
> @@ -18,6 +18,7 @@ ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dye=
s}
> # bash
> bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
> bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
> +bash_cv_getcwd_malloc=3D${bash_cv_getcwd_malloc=3Dyes}
>=20
> # clamav
> =
clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_l=
ong=3Dyes}
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5903D5E3-69F5-4C40-B4F9-562263DF4AC9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXK+qcACgkQuwUzVZGdMxQDjQCfYb7rFyHmU/LrCmqnKX3OJM5/
kdoAn28QIw6pK+qVRS/AxrTJ3tNC26SD
=sSNP
-----END PGP SIGNATURE-----

--Apple-Mail=_5903D5E3-69F5-4C40-B4F9-562263DF4AC9--
