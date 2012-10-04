Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TJhg2-0000Mw-AQ; Thu, 04 Oct 2012 11:25:06 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3227979wib.6
	for <multiple recipients>; Thu, 04 Oct 2012 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FIAdAhUWm5lT219ZuTowSgeAp8pjQkqpEGbr0nFLkPg=;
	b=CJnrwH+gc+0qMxAEGcyfNf22qet4qvp6g7JLpmW4iK1rChDBi0RdJwhmTxmPOrSygG
	ewr2RsN7fuWWEcNGl/lpL5PT0SVGXFphMlJtmqq704XKKaYWMPCmH6vlUu8SgyfliPf9
	tBsRf5E/7PUzDB4gNZ0oopmon9V6BCl2SJ5CjiI2fdZz0LLUPna86Db5K9/nIEL6mBJq
	Ok8OELSRvONn8klOPcBBhf6ZM5OXQcbJASQ+v6kqDXMABjg/nnPZIo5wyqTSizsAnQJp
	M6lsaHQ1vIe29OmgfzYF6DBj5ZKe5Vn1LbRXhLCAikNLrESejDCVKczxaJqJugVBGR6O
	jHlw==
Received: by 10.217.2.146 with SMTP id p18mr2946865wes.198.1349341925531;
	Thu, 04 Oct 2012 02:12:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm13535570wib.6.2012.10.04.02.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 02:12:04 -0700 (PDT)
Date: Thu, 4 Oct 2012 11:12:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121004091206.GC3005@jama.jama.net>
References: <20121002161853.6075610353@opal>
MIME-Version: 1.0
In-Reply-To: <20121002161853.6075610353@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
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
X-List-Received-Date: Thu, 04 Oct 2012 09:25:06 -0000
X-Groupsio-MsgNum: 30356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 04:18:50PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 97a3ea712003e8d48dc68c282e656591f39d2d1a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D97a3ea712003e8d48dc68c282e656591f39d2d1a
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue Oct  2 14:12:21 2012 +0100
>=20
> bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
>=20
> We assume chrpath is provided natively so it should be listed in ASSUME_P=
ROVIDED.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This breaks do_install in gpsd:

| arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/var/lib/jenkins/jobs=
/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900 -o gpsd --sysroot=
=3D/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/no=
kia900 -pthread -Wl,-rpath=3D/var/lib/jenkins/jobs/shr-core/workspace/shr-c=
ore/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/gpsd-3.7 -=
Wl,-rpath=3D/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/wo=
rk/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/lib gpsd.o ntpshm=
=2Eo shmexport.o dbusexport.o sd_socket.o -L. -L/var/lib/jenkins/jobs/shr-c=
ore/workspace/shr-core/tmp-eglibc/sysroots/nokia900/var/lib/jenkins/jobs/sh=
r-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/=
gpsd-3.7-r9/image/usr/lib -L/var/lib/jenkins/jobs/shr-core/workspace/shr-co=
re/tmp-eglibc/sysroots/nokia900/lib -lrt -lcap -lbluetooth -lgpsd -lusb-1.0=
 -lbluetooth -lgps -lm -lcap
| Install file: "gpsd" as "/var/lib/jenkins/jobs/shr-core/workspace/shr-cor=
e/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sb=
in/gpsd"
| chrpath -d "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd"
| `/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv7a=
-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd' probably isn't =
a 64-bit LSB-first ELF file.
| elf_open: Exec format error
| scons: *** [/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd] Erro=
r 1
| scons: building terminated because of errors.
| ERROR: scons install execution failed.
| ERROR: Function failed: do_install (see /var/lib/jenkins/jobs/shr-core/wo=
rkspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-=
r9/temp/log.do_install.8833 for further information)
NOTE: recipe gpsd-3.7-r9: task do_install: Failed

I guess I can add chrpath-replacement-native to DEPENDS, but do you have an=
y=20
idea why chrpath in Ubuntu 14.04.1 does not support arm binaries?
$ chrpath --version
chrpath version 0.13

Cheers,

>=20
> ---
>=20
>  meta/conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e168ef1..c049b29 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -161,6 +161,7 @@ DATETIME =3D "${DATE}${TIME}"
>  # its own in staging
>  ASSUME_PROVIDED =3D "\
>      bzip2-native \
> +    chrpath-native \
>      git-native \
>      grep-native \
>      diffstat-native \
> @@ -170,6 +171,7 @@ ASSUME_PROVIDED =3D "\
>      tar-native \
>      virtual/libintl-native \
>      "
> +# gzip-native should be listed above?
> =20
>  ##################################################################
>  # Package default variables.
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBtUuYACgkQN1Ujt2V2gBw4AwCfZEpsk3EiIT3bA8DvrcvKTTb0
Da4Anj5xAGb5LOscGsxeF3/o2e0LDaud
=ZIMn
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
