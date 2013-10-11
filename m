Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id ABDC96CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:58:24 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id l12so1024419wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 07:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=bn/gYd+RcZK8GSrTncxz4gQcP23kUlsYTL8L1GQYjBI=;
	b=YBUhPh/jmkQoRXaf0ZWgdDKNGjo0ugYySKo1hGOBheuo00ZwIzI7nzxuH1A65zqtHt
	rI+51PgpSGiIEedR+NH9rwFYlxtgqMErFGpXqJqkUftDzie0IEj5+O34ASsPz3KHnrFi
	Ue8oypSGbsUV1R4icqKszX6gARYJC9d/SnA554rGK/OZyPcQ9qn5+XX50dnHN/iOqRbY
	QOJoSZifI1JmRtAM0sEzl8E6n9ea1RQgivlPc1KQuIuR9SWUylXQiWSfhYU+mq798Af+
	Gmw+lJDGuD4BItstWipNF5insG3IgB01UxII5aFDsjxXQHlbMNBUtTKmaHzn2f5yOjUW
	2ZDw==
X-Gm-Message-State: ALoCoQkEt6v58Y/kH4XC93EvXdBdujdRgKXAoY5k6xt3CAYiiC2oOllJrrepKs+tig9mVhSlGNXH
X-Received: by 10.194.94.137 with SMTP id dc9mr18183119wjb.38.1381503505540;
	Fri, 11 Oct 2013 07:58:25 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d04:70cd:6d6d:11d0?
	([2001:610:612:0:d04:70cd:6d6d:11d0])
	by mx.google.com with ESMTPSA id i8sm6440642wiy.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 07:58:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52580C02.2070507@emagii.com>
Date: Fri, 11 Oct 2013 16:58:24 +0200
Message-Id: <BB75BD69-4EA8-475A-91A6-7C16557A0765@dominion.thruhere.net>
References: <52580C02.2070507@emagii.com>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
X-Mailer: Apple Mail (2.1508)
Cc: Angstrom-distro-devel@linuxtogo.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems when building Angstrom master & 1.3 & 1.4 for Beagleboard Black
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
X-List-Received-Date: Fri, 11 Oct 2013 14:58:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2013, om 16:32 heeft Ulf Samuelsson <angstrom-dev@emagii.com> =
het volgende geschreven:

> Have tried out building Angstrom for Beaglebone Black on a Quad-Core =
i7/Ubuntu 12.04 i386 with:

I strongly recommend ditching ubuntu and installing linux instead. I =
don't know what causes it, but switching to debian, arch, gentoo, =
fedora, opensuse or anything else not ubuntu based gets rid off all =
problems with builds not working, not booting, etc.

>=20
> PARALLEL_MAKE     =3D "-j8"
> BB_NUMBER_THREADS =3D "8"
>=20
> I bitbake "cloud9-gnome-image"
>=20
> RESULTS:
> * remotes/origin/angstrom-v2013.06-yocto1.4    commit =
246357a1cc4977683ada564d38218e837ac615e3
>=20
>    image builds but does not boot.
>=20
> * remotes/origin/angstrom-v2012.12-yocto1.3    commit =
01984cc460acfe5e7d5bab4feeb0888d5c6fe77f
>=20
>    image builds but does not boot.
>=20
> * origin/master commit 7a3b004f7bfa24ea54b0da78bd80e4dd7839321d
>=20
>    Build fails on two issues.
>=20
>    1.    libxklavier compile fails.
>            | xklavier.c: In function 'xkl_engine_class_init':
>            | xklavier.c:846:8: error: 'XKL_TYPE_ENGINE_FEATURES' =
undeclared (first use in this function)
>            ...
>            Summary: 1 task failed:
> =
/home/ulf/projects/ICU/Angstrom/setup-scripts/sources/meta-openembedded/me=
ta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb,=20
>            do_compile
>=20
>            Did "bitbake -c cleansstate libxklavier" and restarted, and =
then it continued without problem,
>            so there seem to be a dependency problem.
>=20
>    2.    nodejs compiles fails with error:
>           |   arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 =
--sysroot=3D/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstr=
om_v2012_12-eglibc/sysroots/beaglebone '-D_LARGEFILE_SOURCE' =
'-D_FILE_OFFSET_BITS=3D64' '-DL_ENDIAN' '-DOPENSSL_THREADS' '-DPURIFY' =
'-D_REENTRANT' '-DOPENSSL_NO_DTLS1' '-DOPENSSL_NO_SOCK' =
'-DOPENSSL_NO_DGRAM' '-DOPENSSL_NO_GOST' '-DOPENSSL_NO_HW_PADLOCK' =
'-DOPENSSL_NO_ASM' '-DENGINESDIR=3D"/dev/null"' =
'-DOPENSSLDIR=3D"/etc/ssl"' '-DTERMIOS' -I../deps/openssl =
-I../deps/openssl/openssl -I../deps/openssl/openssl/crypto =
-I../deps/openssl/openssl/crypto/asn1 =
-I../deps/openssl/openssl/crypto/evp =
-I../deps/openssl/openssl/crypto/store -I../deps/openssl/openssl/include =
-I../deps/openssl/config/android -Wall -pthread -O2 -fno-strict-aliasing =
-fno-tree-vrp  -MMD -MF =
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-=
eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v=
0.8.22/out/Release/.deps//home/ulf/projects/ICU/Angstrom/setup-scripts/bui=
ld/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueab=
i/nodejs-0.8.22-r0/node-v0.8.22/out/Release/obj.target/openssl/deps/openss=
l/openssl/crypto/whrlpool/wp_block.o.d.raw -O2 -pipe -g =
-feliminate-unused-debug-types -c -o =
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-=
eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v=
0.8.22/out/Release/obj.target/openssl/deps/openssl/openssl/crypto/whrlpool=
/wp_block.o ../deps/openssl/openssl/crypto/whrlpool/wp_block.c
> | make[1]: execvp: printf: Argument list too long
>=20
>    I get the second problem when I run from: =
"/home/ulf/projects/ICU/Angstrom/setup-scripts/"
>    When I install Angstrom in "/home/icu/v2012.12" I do not see the =
problem.
>=20
> ---------------------------
>    Have tried recompiling my kernel changing include/linux/binfmts.h
>=20
> <# define MAX_ARG_PAGES    32
> ># define MAX_ARG_PAGES    64
>=20
>    based on something I found on Internet, to no avail.
>=20
> Checking a little bit more, I see it looks like:
> #ifdef CONFIG_MMU
>    ...
> #else
> # define MAX_ARG_PAGES    64
>    struct page *page[MAX_ARG_PAGES];
> #endif
>    CONFIG_MMU is set,  so the change is in part of the code which is =
not used
>=20
>    Maybe there should be some kind of warning about how deep in the =
directory structure Angstrom can be.
>=20
> ---------------------------
>    The resulting kernel/filesystem will run on the Beagleboard Black.
>=20
>    Anyone knows what to change to increase the argument area on =
linux-3.2.x?
>=20
> BR
> Ulf Samuelsson
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


