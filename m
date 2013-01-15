Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvDFM-00009Z-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:36:51 +0100
Received: by mail-pa0-f54.google.com with SMTP id bi5so320408pad.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0gNv9kqRFQikQI65fVoqRsBvM37zcDCyLcU0YrrS6OE=;
	b=DkgvK+jBiIgoqJWrjysXGkCRIfZCD9uhXWBO/hVcxaWaMO7PZk1xA7+aYsf1rOpR5U
	oHtBnhF/kojoyvCwfmD62pYLKNH1urhl1CEEJ6lOA8XLocB3BV4ie0KZl/73f+DcO5Mz
	+WUrMQfpjlaMFszkeb8c0AO9XLkEtbEFDw0CZdKQPWbU7hS/ouCq1M42J6Ts7KUgdAc7
	od2eIaq3T+cyagfpKVqtmQLKq6Oo2Zeb6YtEeH/25dWS/nrKHvtzyqYkAI6WCo0YPmP8
	i2wIUZtMWCpsJ6f8BXmY601zocyzuzR0emweziU1y6byu28CYY0IOz1iqnKONDK9JHcF
	P8WA==
X-Received: by 10.68.239.194 with SMTP id vu2mr40292551pbc.34.1358281275532;
	Tue, 15 Jan 2013 12:21:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ql9sm10770763pbc.61.2013.01.15.12.21.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:21:14 -0800 (PST)
Date: Tue, 15 Jan 2013 21:21:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130115202116.GB3002@jama>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
	<1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 2/3] connman-conf: configures connman in qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 20:36:54 -0000
X-Groupsio-MsgNum: 33841
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 10:08:46PM +0200, Cristian Iorga wrote:
> For qemu machines, connman should not configure
> virtual wired interfaces. Wired interfaces (eth0)
> are assigned static IP addresses by the virtual machine
> manager (qemu). This packages places the eth0 interface in
> a list of blacklisted interfaces, forbiding connman
> administering wired interfaces for qemu machines.

Again wrong order,

3/3 should be 1st
2/3 2nd
1/3 3rd

Cheers,

>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/conf/layer.conf                                 |    1 +
>  meta/recipes-connectivity/connman/connman-conf.bb    |   18 ++++++++++++=
++++++
>  .../connman/connman-conf/qemuall/main.conf           |    3 +++
>  3 files changed, 22 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
>  create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemual=
l/main.conf
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 78ceae9..3259e5c 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    shadow-securetty \
>    opkg-config-base \
>    netbase \
> +  connman-conf \
>    formfactor \
>    xserver-xf86-config \
>    pointercal \
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
> new file mode 100644
> index 0000000..7c7ef26
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -0,0 +1,18 @@
> +#connman config to ignore wired interfaces on qemu machines
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI_append_qemuall =3D " file://main.conf"
> +
> +PR =3D "r0"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +do_install() {
> +    #Blacklist ethn network interface in case of qemu* machines
> +    if test -e ${WORKDIR}/main.conf; then
> +        install -d ${D}${sysconfdir}/connman
> +        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
> +    fi
> +}
> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.=
conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> new file mode 100644
> index 0000000..01973e7
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> @@ -0,0 +1,3 @@
> +[General]
> +
> +NetworkInterfaceBlacklist =3D eth
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD1ujwACgkQN1Ujt2V2gBxhUwCeOYjiZcDBh2E+B1Q+NQN/IFpM
a3MAnR1YN+PuW4x12lwObBTkdcR6dDbo
=1whp
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
