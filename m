Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T3nbr-0004Ia-2Z; Tue, 21 Aug 2012 14:31:03 +0200
Received: by wgbds1 with SMTP id ds1so3835303wgb.0
	for <multiple recipients>; Tue, 21 Aug 2012 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KvLdf2MMaueYdjFfH4mQ9gd65huGNziMcpjwocqn4aU=;
	b=kjJZ4OjgW/b60dX6xO6beHGekbEp3ZKmOwrA/TYCzMWuJZAx+AI/Rotws6qUeKXExi
	NaieYvUYcW2CuXBwrPscsYYWCPdZX1VbXlL/A2eZWtFkyplz6ZZftlUfThF6d1sB/wUe
	OavaxpnvXx4bAasGM4VkodKnf1kLzmbw3FMWv/Q6ZexF3DtB67ZiQCOXfFUSgTyu7bs/
	P5vX5g5tP1Ij9hwtpA+LSa9fSOWrh3OK6dj1I16EunUzFXrnJnBL1CalnOrHu9J6iGIj
	5y4B4t3BT39Io0cSF7QcId1zhvZQ84FOiGR2TlWYBcRpwv8Srbwpj3uaZpgYJMkj7RI7
	uUnA==
Received: by 10.180.83.66 with SMTP id o2mr37557541wiy.14.1345551539291;
	Tue, 21 Aug 2012 05:18:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm33368718wiz.0.2012.08.21.05.18.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 05:18:57 -0700 (PDT)
Date: Tue, 21 Aug 2012 14:18:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120821121850.GD3029@jama.jama.net>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 12:31:03 -0000
X-Groupsio-MsgNum: 27977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 09:47:37PM -0700, Khem Raj wrote:
> Hi All
>=20
> Recently glibc build has been simplified upstream. It has dropped the
> dependency on libgcc_s and libgcc_eh for building glibc itself.
> This means that we can simplify our toolchain bootstrap a bit by
> dropping 1 of the 3 cross gcc build stages. We do not need
> gcc-cross-intermediate
> anymore. This should bring some build time reduction and simplify the
> bootstrap. I have a series of patches which I have tested
> by building core-image-minimal and meta-toolchain for all supported
> qemu architectures and also uclibc/eglibc both
> but it needs a lot more testing therefore I am calling out wider
> audience for help in testing it out.
>=20
> The branch is
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/toolc=
hain-rework

eglibc fails to build in incremental build

| arm-oe-linux-gnueabi-gcc  -march=3Darmv4t -marm -mthumb-interwork -mtune=
=3Darm920t --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstra=
p   -nostdlib -nostartfiles -r -o /OE/shr-core/tmp-eglibc/work/armv4t-oe-li=
nux-gnueabi/eglibc-2.16-r6+svnr19922/build-arm-oe-linux-gnueabi/libc_pic.os=
 \
|  -Wl,-d -Wl,--whole-archive /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-=
gnueabi/eglibc-2.16-r6+svnr19922/build-arm-oe-linux-gnueabi/libc_pic.a -o /=
OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/eglibc-2.16-r6+svnr1992=
2/build-arm-oe-linux-gnueabi/libc_pic.os
| arm-oe-linux-gnueabi-gcc  -march=3Darmv4t -marm -mthumb-interwork -mtune=
=3Darm920t --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstra=
p   -nostdlib -nostartfiles -r -o /OE/shr-core/tmp-eglibc/work/armv4t-oe-li=
nux-gnueabi/eglibc-2.16-r6+svnr19922/build-arm-oe-linux-gnueabi/elf/librtld=
=2Emap.o '-Wl,-(' /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/egli=
bc-2.16-r6+svnr19922/build-arm-oe-linux-gnueabi/elf/dl-allobjs.os /OE/shr-c=
ore/tmp-eglibc/work/armv4t-oe-linux-gnueabi/eglibc-2.16-r6+svnr19922/build-=
arm-oe-linux-gnueabi/libc_pic.a -lgcc '-Wl,-)' -Wl,-Map,/OE/shr-core/tmp-eg=
libc/work/armv4t-oe-linux-gnueabi/eglibc-2.16-r6+svnr19922/build-arm-oe-lin=
ux-gnueabi/elf/librtld.mapT
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux=
-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.7.2/ld: cannot find -=
lgcc
| collect2: error: ld returned 1 exit status
| make[2]: *** [/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/eglibc=
-2.16-r6+svnr19922/build-arm-oe-linux-gnueabi/elf/librtld.map] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-=
gnueabi/eglibc-2.16-r6+svnr19922/eglibc-2_16/libc/elf'
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-=
gnueabi/eglibc-2.16-r6+svnr19922/eglibc-2_16/libc'

Maybe it's because=20
http://git.openembedded.org/openembedded-core/commit/?id=3D30617bde61a3b0a0=
944b49a0c9fb7159dacbb19f
is missing PR bump and gcc wasn't rebuilt before eglibc upgrade (OEBasic no=
t OEBasicHash here).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAzfKoACgkQN1Ujt2V2gBy7rgCfebGuwBtEy+P3c8r6lGv9OYw/
Fl0Anj/SCIIYEOOuXTR3jbHdTOTL5kVs
=BZfg
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
