Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 919447E743
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:32:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x4so5676274wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SKphr7TrGI5ceWcsW80gg8PS53H1jOTz1eq10khbWgI=;
	b=UDHdqQ9ExyDzz7Cz43mJH5C5gMfQejhOlQsjNhHuzKoi/yLsCxuF/hYxiG3wG99rqW
	vOGNRUUYTlBOJ57vLcgMrxIITJMsmreRAaslYFrOkBXSIXdTFkuE8DJjqvB2hWZPM1S2
	QI1pZNHIJJZ4t0qvNgyIvURefu02xTdSpx3nvYkSWGCUwxg+f8ri/KgfJDqFZRhXttHl
	fL/vjtx+3qe/jPZYpFyX6dNa4iFxJDimbkvvgmj/a50RQqSjgcUgnZXjKO/MJP8T2yE4
	XFsjusgctHBWQYREJU1p2Yri/p1pozcYQ/Ml2flCTYnRHTaHdI8mVDazlrvKtFPzSaUy
	AxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SKphr7TrGI5ceWcsW80gg8PS53H1jOTz1eq10khbWgI=;
	b=ix4ITIq8j7/HKgWlkGVKg8RaGtVpB5bpEPRk64ZKJeBSuscoD+1dds3xShR+C2jK5D
	LCxgkpNj1xF/Hp2rxQOYm28K+vkmIeVDanb/KHjeKrCN0gSiaH5KknkuSF80bWzsmC9d
	nJBJnQ/SdR8t/Z7SSjzQmrr0fmkOeBvpJczthCZ7R+pw40bvXaQ2i5e9gawjqrL+7RSg
	E7ihiMU8XH/ilD5FygFe61jjrHMNHj8yOyfenEJ/OIJi1XYXWwq9PZSv20zT8E63xZnD
	cl5Hxeaugzl/5FDH2Zqk+LYhLccphnEYRRV1c2NIWMj+6TQuXyUpicbJISNAtoPn5vn2
	UW5A==
X-Gm-Message-State: APjAAAUHQRnM0NYFkke+K9whwPydNb4va3qy3meRBP+mRUZNe7RLQ6QQ
	38zePjw6Ii7gt8oU2PykPTCTO+Q/
X-Google-Smtp-Source: APXvYqwkSoqVvUzLsWhxySJcI7M68D1Gv4JUwo6Q62HI9XT0uw4B03nQwxPR3hXkIf6gXUDsWjmzQA==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr4711764wrn.331.1561105940243; 
	Fri, 21 Jun 2019 01:32:20 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 18sm1547206wmg.43.2019.06.21.01.32.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 01:32:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Jun 2019 10:32:30 +0200
To: changqing.li@windriver.com
Message-ID: <20190621083230.GA1512@jama>
References: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<1560844016-105234-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1560844016-105234-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Fri, 21 Jun 2019 08:32:19 -0000
X-Groupsio-MsgNum: 126070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 03:46:56PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> The SDK was unable to find the C++ header pieces correctly since it's
> using a generic compiler, not one specifically targeting the multilib
> vendor prefix and default tune.  This adds the right mapping to ensure
> SDKs work as expected. And fix problem in below configurations:
>=20
> multilib configuration 1:
> MACHINE=3D"qemumips64"
> MULTILIBS ?=3D "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?=3D "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?=3D "mips64-n32"
> MULTILIB_GLOBAL_VARIANTS_append =3D " libn32"
> require conf/multilib.conf
>=20
> ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/inc=
lude/c++/8.2.0/mips64-poky-linux/32
>=20
> multilib configuration 2:
> MACHINE=3D"qemumips64"
> MULTILIBS =3D 'multilib:lib64 multilib:lib32'
> DEFAULTTUNE =3D 'mips64-n32'
> DEFAULTTUNE_virtclass-multilib-lib64 =3D 'mips64'
> DEFAULTTUNE_virtclass-multilib-lib32 =3D 'mips32r2'
> require conf/multilib.conf
>=20
> For this configuration:
> for target gcc-runtime, need to create symlink like mips64-poly-linux -->=
 mips64-poky-linux-gnu32
> for target lib64-gcc-runtime, need to create symlink like mips64-poly-lin=
ux/32 --> mips64-pokymllib64-linux
> in order to avoid conflict during populate_sdk, create symlink for subfol=
er bits/ext for target gcc-runtime,
> this is ugly, but seems no better way to cover all kinds of configuration.
>=20
> single lib configuration:
> MACHINE=3D"qemumips64"
> DEFAULTTUNE =3D "mips64-n32"

This seems to be causing:

ln: failed to create symbolic link 'work/aarch64-oemllib32-linux-gnueabi/li=
b32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-gnueabi/b=
its': No such file or directory
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_install (log file is located at work/aarch64-oem=
llib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31049)

There is only empty directory without the -gnueabi suffix:
work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/i=
nclude/c++/9.1.0/arm-oe-linux/

and

work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/i=
nclude/c++/9.1.0/arm-oemllib32-linux-gnueabi/
bits  ext

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++--------=
----
>  1 file changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index 3d03d8e..ba767e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -86,10 +86,6 @@ do_install () {
>  	if [ -d ${D}${infodir} ]; then
>  		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>  	fi
> -	if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" !=3D "" -a "${TARGET_VENDOR}"=
 !=3D "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> -		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARG=
ET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
> -	fi
> -
>  }
> =20
>  do_install_append_class-target () {
> @@ -98,20 +94,29 @@ do_install_append_class-target () {
>  	fi
> =20
>  	if [ "${TARGET_OS}" =3D "linux-gnun32" ]; then
> -		if [ "${MULTILIBS}" !=3D "" ]; then
> -			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> -			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-p=
okymllib64-linux/32
> +		if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" !=3D "" -a "${TARGET_VENDOR}=
" !=3D "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MUL=
TILIB_ORIGINAL}-linux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${=
TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
> +		elif [ "${MULTILIB_VARIANTS}" !=3D "" ]; then
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-li=
nux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${=
TARGET_VENDOR}-linux/32
>  		else
>  			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TAR=
GET_VENDOR}-linux
>  		fi
> -	fi
> -	if [ "${TARGET_OS}" =3D "linux-gnux32" ]; then
> -		if [ "${MULTILIBS}" !=3D "" ]; then
> -			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
> -			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-p=
oky-linux/x32
> +	elif [ "${TARGET_OS}" =3D "linux-gnux32" ]; then
> +		if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" !=3D "" -a "${TARGET_VENDOR}=
" !=3D "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MUL=
TILIB_ORIGINAL}-linux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${=
TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
> +		elif [ "${MULTILIB_VARIANTS}" !=3D "" ]; then
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-li=
nux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${=
TARGET_VENDOR}-linux/32
>  		else
>  			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TAR=
GET_VENDOR}-linux
>  		fi
> +	elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" !=3D "" -a "${TARGET_VENDOR=
}" !=3D "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +		mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULT=
ILIB_ORIGINAL}-linux
> +		ln -s ../${TARGET_SYS}/bits ${D}${includedir}/c++/${BINV}/${TARGET_ARC=
H}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
> +		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH=
}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
>  	fi
> =20
>  	if [ "${TCLIBC}" !=3D "glibc" ]; then
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXQyWHQAKCRA3VSO3ZXaA
HDYyAJ9gTBNmpd8M7qrCEYVDUhJcvk/H3ACfUc+FdbNXDBPOdrf++37ZM3PCNcg=
=bXWj
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
