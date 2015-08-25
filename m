Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3D5A734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 00:21:19 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so5061284pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LB4tHdq3zb7IdoNjumVNcQkkKnb4kzvoqxphZW9PKa4=;
	b=hatqH4rkwXQP7Tv3JfZsSEyPmEr0nTpFoZyFtBMgc1GZc+U5lqxvrUJTR2Mn0g2sFj
	iNYwsWxunouHexQZd3syoss7/aqdqvpOJH0mE1Nbr0ejvn25VBk4338Ys8+RDhSvogpp
	SFW6T50+Z8lNubOXmyQ076jqI2J1n4603iOBqKmuaesvTBviyVdCAmnqCwGVKaEZcizd
	tR9vdMkMQA+DUTY/B4ntlnR1s+63e5T+FC/DWT1201/w63/KcrwdOwg3yDv4F5LnHVBe
	RvweDbbN6+sGLFVETDnRUZuq23/Xgpa6P0sgHBqbTmtGqKNoNqPMnaCAE4ifGjYVbFpd
	t+WQ==
X-Received: by 10.66.253.201 with SMTP id ac9mr51346837pad.69.1440462079934;
	Mon, 24 Aug 2015 17:21:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	le8sm18699847pbc.24.2015.08.24.17.21.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 17:21:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440072348-31971-1-git-send-email-jussi.kukkonen@intel.com>
Date: Mon, 24 Aug 2015 17:21:13 -0700
Message-Id: <59A5C75C-9A4A-43C2-A481-976AFD7FDFBC@gmail.com>
References: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
	<1440072348-31971-1-git-send-email-jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] openssh: build regression test binaries
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
X-List-Received-Date: Tue, 25 Aug 2015 00:21:25 -0000
X-Groupsio-MsgNum: 69959
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B5D1414E-2BD8-4D8C-ACBD-2468F63A94BB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B5D1414E-2BD8-4D8C-ACBD-2468F63A94BB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 20, 2015, at 5:05 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> ptests were failing and many more were being silently skipped because
> required binaries were not being built.
>=20
> Build the binaries in regress/ and set SUDO environment variable in
> run-ptests: after this all tests in regress/ are now run. Continue to
> skip building binaries in regress/unittests/: unittest runtime is
> excessive.
>=20
> On a NUC running intel-corei7-64 core-image-sato, new results are:
> PASS: 55, SKIP: 3, FAIL: 0

btw. openssh 7.1 is already out.

>=20
> [YOCTO #8153]
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>=20
> Changes in v2:
> * ptest package RDEPENDS on sudo
>=20
>=20
> meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
> meta/recipes-connectivity/openssh/openssh_7.0p1.bb  | 8 +++++++-
> 2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest =
b/meta/recipes-connectivity/openssh/openssh/run-ptest
> index 3e725cf..564c0c8 100755
> --- a/meta/recipes-connectivity/openssh/openssh/run-ptest
> +++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
> @@ -3,5 +3,5 @@
> export TEST_SHELL=3Dsh
>=20
> cd regress
> -make -k .OBJDIR=3D`pwd` .CURDIR=3D`pwd` tests \
> +make -k .OBJDIR=3D`pwd` .CURDIR=3D`pwd` SUDO=3D"sudo" tests \
>         | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e =
's/^failed/FAIL: /g'
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb =
b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
> index 105875a..8519a4c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
> @@ -79,6 +79,12 @@ do_configure_prepend () {
> 	fi
> }
>=20
> +do_compile_ptest() {
> +        # skip regress/unittests/ binaries: this will silently skip
> +        # unittests in run-ptests which is good because they are so =
slow.
> +        oe_runmake regress/modpipe regress/setuid-allowed =
regress/netcat
> +}
> +
> do_install_append () {
> 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', =
d)}" =3D "pam" ]; then
> 		install -D -m 0755 ${WORKDIR}/sshd =
${D}${sysconfdir}/pam.d/sshd
> @@ -130,7 +136,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
>=20
> RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> RDEPENDS_${PN}-sshd +=3D "${PN}-keygen =
${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit =
pam-plugin-loginuid', '', d)}"
> -RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server =
make"
> +RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server =
make sudo"
>=20
> RPROVIDES_${PN}-ssh =3D "ssh"
> RPROVIDES_${PN}-sshd =3D "sshd"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B5D1414E-2BD8-4D8C-ACBD-2468F63A94BB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXbtQEACgkQuwUzVZGdMxTQVgCghEWLUkl5U3MuapgW6dy81+RF
NyMAnArxv34JPI1xqlLgYBuAO2954r3I
=kGBg
-----END PGP SIGNATURE-----

--Apple-Mail=_B5D1414E-2BD8-4D8C-ACBD-2468F63A94BB--
