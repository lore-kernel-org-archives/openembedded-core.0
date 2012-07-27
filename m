Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Surnc-0007ew-BN
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 23:10:16 +0200
Received: by weyr6 with SMTP id r6so2136303wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EVNgCEyHS6AxXy+dXV8w1h38HNHMV/oX7K/qaG/mkFk=;
	b=cPXr7qusZmgMl/xpp3qOqjVjZegfatcpkF8W+ejI3oy0gTi32YL8MAVhFEyr24VgyO
	jXHUvVORloA5YLeRF3g274kQ13u1jgTwG0w/jgtVazZRss/EzRAT20dBcN+EPVs07dQc
	YYg/zNbROSvaO++w2wZHiZCwmRcL96004USdRroh8ovaukJqjFFnbRhHLNBonidke1GQ
	8bBUXo//2xRWCZ1/GLP/5bAhTVKpKCn0Zn72R/cleccitlwxn7mYZun8/Q+nba7kM/g3
	aEqVRLOqhTtjHwRQ01zdbvBgFzkwqdwQouZIMmE4Ceww5BPjWFmf2udUX7dnjdhfjzyZ
	X3vA==
Received: by 10.180.97.106 with SMTP id dz10mr9037299wib.21.1343422724021;
	Fri, 27 Jul 2012 13:58:44 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id w7sm292283wiz.0.2012.07.27.13.58.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 13:58:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120727152454.GA5706@windriver.com>
Date: Fri, 27 Jul 2012 22:58:39 +0200
Message-Id: <1DC96FF0-0C01-4BA6-8354-A4CF12581E0A@dominion.thruhere.net>
References: <20120727152454.GA5706@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnPcosfnrsutVvurdE76AR+Av59gvry+Hsz6QurwofVL3SlIN+n4I0r941IoPse8IJ/epMD
Subject: Re: [PATCH] openssh: package testing
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
X-List-Received-Date: Fri, 27 Jul 2012 21:10:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2012, om 17:24 heeft Amy Fong <amy.fong@windriver.com> het =
volgende geschreven:

> openssh: package testing
>=20
> Package openssh's regression tests
>=20
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
> openssh-5.9p1/runtests.sh |   29 +++++++++++++++++++++++++++++
> openssh_5.9p1.bb          |    9 +++++++++
> 2 files changed, 38 insertions(+)
>=20
> diff --git =
a/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh =
b/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh
> new file mode 100755
> index 0000000..bb99a05
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +
> +cd regress
> +
> +make \
> +	.OBJDIR=3D`pwd` \
> +	.CURDIR=3D`pwd` \
> +	BUILDDIR=3D`pwd` \
> +	OBJ=3D`pwd` \
> +	PATH=3D$PATH:. \
> +	TEST_SHELL=3Dsh \
> +	TEST_SSH_SSH=3D`which ssh` \
> +	TEST_SSH_SSHD=3D`which sshd` \
> +	TEST_SSH_SSHAGENT=3D`which ssh-agent` \
> +	TEST_SSH_SSHADD=3D`which ssh-add` \
> +	TEST_SSH_SSHKEYGEN=3D`which ssh-keygen` \
> +	TEST_SSH_SSHPKCS11HELPER=3D"/usr/libexec/ssh-pkcs11-helper" \
> +	TEST_SSH_SSHKEYSCAN=3D`which ssh-keyscan` \
> +	TEST_SSH_SFTP=3D`which sftp` \
> +	TEST_SSH_SFTPSERVER=3D"/usr/libexec/sftp-server" \
> +	TEST_SSH_PLINK=3D"plink" \
> +	TEST_SSH_PUTTYGEN=3D"puttygen" \
> +	TEST_SSH_CONCH=3D"conch" \
> +	TEST_SSH_IPV6=3D"yes" \
> +	TEST_SSH_ECC=3D"yes" \
> +	TEST_SSH_SHA256=3D"yes" \
> +	EXEEXT=3D"" \
> +	tests
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb =
b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> index 749f89e..f0880c0 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D =
"ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>            file://sshd_config \
>            file://ssh_config \
>            file://init \
> +           file://runtests.sh \
>            ${@base_contains('DISTRO_FEATURES', 'pam', =
'${PAM_SRC_URI}', '', d)}"
>=20
> PAM_SRC_URI =3D "file://sshd"
> @@ -81,6 +82,9 @@ do_install_append () {
> 	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
> 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
> 	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
> +	if [ ! -d ${D}/opt/${PN}-tests/ ]; then mkdir -p =
${D}/opt/${PN}-tests/; fi
> +	install -m 755 ${WORKDIR}/runtests.sh ${D}/opt/${PN}-tests/
> +	cp -ra ${S}/regress ${D}/opt/${PN}-tests/

Don't use /opt, /opt is bad, bad, bad. Don't ever use it

> }
>=20
> ALLOW_EMPTY_${PN} =3D "1"
> @@ -95,6 +99,11 @@ FILES_${PN}-sftp-server =3D =
"${libexecdir}/sftp-server"
> FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ssh*"
> FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
>=20
> +PACKAGES +=3D "${PN}-testing"
> +DEPENDS_${PN}-testing +=3D "${PN}-keygen ${PN}-scp ${PN}-ssh =
${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
> +FILES_${PN}-testing +=3D "/opt/${PN}-tests/*"
> +FILES_${PN}-dbg +=3D "/opt/${PN}-tests/.debug/*"

And it's missing a PR bump=


