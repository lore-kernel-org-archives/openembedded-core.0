Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C31B76FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:23:08 +0000 (UTC)
Received: by pfbu66 with SMTP id u66so69740147pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 16:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ytOZNyNduk8G0dy9e80MVv+EBUtiW91CRyFJEMgQS8Q=;
	b=LyBc0bZN8ib3T3UGm+rpUgqTp+X/rD87HZH5f/OmxvgU9CLYZljzwYELY0OaP4wBvp
	GLZGycahqPgmR+isyG0qqDEjobtxIACm+VVmj6aoys7ZCmBdnjmtJK3hOw+xtoxcPvmf
	Lt13gOJJ6/3q3z2e8fCGjnPPtebrtEYuglvRJWEBh2/ZolvmRZoLBkwIhIey39TfiJvn
	et2HXISI1ZX3YxOd0V9qbFE5aIc1XoYyKt7dRbB2WnSqZtipcwGLpK+UN5wyudxz5fj7
	qBTCL0+hvhtXx3cCiiKVPO3P/lH6z/7XwxCjYs+/mKkfHEpxgSGvknawrSOWOoEeKzK7
	V62w==
X-Received: by 10.98.7.66 with SMTP id b63mr39860401pfd.19.1450138989705;
	Mon, 14 Dec 2015 16:23:09 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	81sm44718320pfk.56.2015.12.14.16.23.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 16:23:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450133829-17751-3-git-send-email-anibal.limon@linux.intel.com>
Date: Mon, 14 Dec 2015 16:23:03 -0800
Message-Id: <CD9AEE25-4D49-4DDF-82B2-93EBEA001BDF@gmail.com>
References: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
	<1450133829-17751-3-git-send-email-anibal.limon@linux.intel.com>
To: =?utf-8?Q?An=C3=ADbal_Lim=C3=B3n?= <anibal.limon@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: paul.eggleton@linux.intel.com, Nathan_Lynch@mentor.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 2/2] ptest-runner: Add a recipe for install ptest-runner 2.0.
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
X-List-Received-Date: Tue, 15 Dec 2015 00:23:09 -0000
X-Groupsio-MsgNum: 74763
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A91044AA-6DCD-4ED1-82BC-E38465FE953E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A91044AA-6DCD-4ED1-82BC-E38465FE953E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 14, 2015, at 2:57 PM, An=C3=ADbal Lim=C3=B3n =
<anibal.limon@linux.intel.com> wrote:
>=20
> [YOCTO #8021]
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
> .../ptest-runner/ptest-runner_2.0.bb               | 28 =
++++++++++++++++++++++
> 1 file changed, 28 insertions(+)
> create mode 100644 =
meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>=20
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb =
b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> new file mode 100644
> index 0000000..64fd0df
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "A python script to run all installed ptests"
> +
> +DESCRIPTION =3D "The ptest-runner package installs a ptest-runner \
> +python script which loops through all installed ptest test suites and =
\
> +runs them in sequence."
> +
> +HOMEPAGE =3D "https://wiki.yoctoproject.org/wiki/Ptest"
> +SRC_URI +=3D "file://ptest-runner_2.0.py"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690 \
> +                    =
file://${COREBASE}/meta/COPYING.GPLv2;md5=3D751419260aa954499f7abaabaa882b=
be"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +RDEPENDS_${PN} =3D "python python-fcntl python-argparse =
python-logging python-datetime \
> +                  python-subprocess"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install () {
> +    mkdir -p ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/ptest-runner_2.0.py =
${D}${bindir}/ptest-runner

both above can be replaced with single install

install -D -m 0755 ${WORKDIR}/ptest-runner_2.0.py =
${D}${bindir}/ptest-runner

> +}
> +
> +do_patch[noexec] =3D "1"
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_build[noexec] =3D =E2=80=9C1"

may they should be deleted instead of being nops

> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A91044AA-6DCD-4ED1-82BC-E38465FE953E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvXWwACgkQuwUzVZGdMxRb5ACfWdVSL7jvkg6tTmhnHbBvZP76
g/YAoIucbFpUGoCX6JB+ktVLVULdk245
=sH7a
-----END PGP SIGNATURE-----

--Apple-Mail=_A91044AA-6DCD-4ED1-82BC-E38465FE953E--
