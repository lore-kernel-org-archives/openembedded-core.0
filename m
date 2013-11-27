Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id AA87E6D867
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:50:29 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so4799197ead.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 05:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8KxCf9i6Op+2CMk+lIERW4DZ/rgkmxWHboLQGm8wKEs=;
	b=II7a4vu2crb+KqZJ+QpAdT8pXI89ALEiJBElRqFjYzL04seaqZFsuqDRcV28f8QpZb
	lG1iN853pid0rrGif2IMovOs7LIXH6G+cerFadi6g+PTXhECi+gMBaO7eO1JzI/cHu6D
	JfLyQKOh/SfIQ5MhuUB1bdVLloxKTzCJ0sBIF57XbqhiEc4Bib0fIPdKWvblR5ggnXTL
	6KQsc4SRwbieZdPLtFTn1ZV7hGA7gDe0gbUS30OVvQuRWgPBrFzVxuCpdKi7Lp4inxoB
	VA5PaperG4us0R6NvMQMNzZd+s3a0jh/Ej/+6vksLAW5Smdq4ZNjYUn7b5AQuItkCSQn
	Hwrw==
X-Received: by 10.14.119.1 with SMTP id m1mr2082552eeh.39.1385560228944;
	Wed, 27 Nov 2013 05:50:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm19804637eem.15.2013.11.27.05.50.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2013 05:50:27 -0800 (PST)
Date: Wed, 27 Nov 2013 14:50:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yue Tao <Yue.Tao@windriver.com>
Message-ID: <20131127135030.GQ2870@jama>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
	<1385538944-8585-2-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1385538944-8585-2-git-send-email-Yue.Tao@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] eglibc: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Wed, 27 Nov 2013 13:50:30 -0000
X-Groupsio-MsgNum: 47680
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="magLDk5D4XGaUXcd"
Content-Disposition: inline

--magLDk5D4XGaUXcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 03:55:41PM +0800, Yue Tao wrote:
> From: Ming Liu <ming.liu@windriver.com>
>=20
> There are advantages in changing the contents of ld.so.conf to
> "include /etc/ld.so.conf.d/*.conf" instead of directly listing directories
> in it, just like most distributions are doing the same.
>=20
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-c=
ore/eglibc/eglibc-package.inc
> index 3adf1a9..b46cc3b 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -33,7 +33,7 @@ RPROVIDES_${PN}-pcprofile =3D "glibc-pcprofile"
>  RPROVIDES_${PN}-dbg =3D "glibc-dbg"
>  libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt=
-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm=
*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*=
=2Eso ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base=
_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt=
*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir=
}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${bas=
e_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir=
}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libn=
ss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${ba=
se_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.s=
o ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> =20
> -FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('U=
SE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '',=
 d)}"
> +FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('U=
SE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf ${sys=
confdir}/ld.so.conf.d', '', d)}"
>  FILES_ldd =3D "${bindir}/ldd"
>  FILES_libsegfault =3D "${base_libdir}/libSegFault*"
>  FILES_libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so=
=2E*"
> @@ -97,6 +97,11 @@ do_install_append () {
>  		if [ -d ${D}${sysconfdir} ]; then
>  			rmdir ${D}${sysconfdir}
>  		fi
> +	else
> +		if [ -f ${D}${sysconfdir}/ld.so.conf ]; then
> +		echo 'include ld.so.conf.d/*.conf' > ${D}${sysconfdir}/ld.so.conf
> +			mkdir -p ${D}${sysconfdir}/ld.so.conf.d
> +		fi

I think that to make this feature really useful this would need to be
executed in runtime (before ldconfig is executed).

I would like to different components to add their own conf files to
${D}${sysconfdir}/ld.so.conf.d and let ldconfig executed in do_rootfs to
find them, but they won't be there when eglibc.do_install is executed.

>  	fi
>  }
> =20
> --=20
> 1.7.5.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--magLDk5D4XGaUXcd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKV+KYACgkQN1Ujt2V2gBwxQgCfQUeTEnI3y2ntzpg8cKb0Mo/Z
VOEAniulHCj0xBCvLVUOXDtVVRNVNvKq
=C2ac
-----END PGP SIGNATURE-----

--magLDk5D4XGaUXcd--
