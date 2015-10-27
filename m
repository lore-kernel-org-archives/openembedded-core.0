Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D444D755F4;
	Tue, 27 Oct 2015 12:42:04 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so157721182wic.0;
	Tue, 27 Oct 2015 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KjXd8FsWWUKrgSydN6BRFUFU/lIcgxy6i+XYactBmHQ=;
	b=VHjzPuQnKJKNcnY6hhMAqent1hT8wQk2+BZWczHzN0Nx9jJdudLljbdo4Qm8YFvRCy
	PwvryiN2DAE44DnmNmNih7/uq2l9qhjNq7Iop13Z8tbBS4H+LB4Kjpe+mQMNWoLWD1Tr
	/DcEsN0s3vr6eqxuZQyUPAmYh+QUXh/F5NdhbnKIUV1kRM/ORTbR+mGLJwrwCHlJJFLR
	D9AYfZxIl8M1/vGuEmojygBKKU68HucREKKAIoz60kjFxGUnnCbg4n2pRNyeLAnAfT3t
	dM+3rif9IS40tiOQNheSdaycBpc95QX8bjKnrZ4Kj8/5Lyyxeog7BNNVL9va0X7pdPj+
	Inzg==
X-Received: by 10.180.86.71 with SMTP id n7mr27739379wiz.91.1445949724402;
	Tue, 27 Oct 2015 05:42:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lo4sm17634875wic.5.2015.10.27.05.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 05:42:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 13:42:20 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151027124220.GE2577@jama>
References: <20151026204716.GJ2554@jama>
MIME-Version: 1.0
In-Reply-To: <20151026204716.GJ2554@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, Failed tasks 2015-10-26
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
X-List-Received-Date: Tue, 27 Oct 2015 12:42:05 -0000
X-Groupsio-MsgNum: 72672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2015 at 09:47:16PM +0100, Martin Jansa wrote:
> === qemuarm (1) ===
>     * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, do_compile

I was checking this one today

../arm-oe-linux-gnueabi-libtool  --tag=CC   --mode=link arm-oe-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -DAO_USE_PTHREAD_DEFS=1 -fexceptions -Wall -Wsign-compare  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fuse-ld=gold -o test-coredump-unwind test-coredump-unwind.o ../src/libunwind-coredump.la ../src/libunwind-arm.la
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=armv5e -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -DAO_USE_PTHREAD_DEFS=1 -fexceptions -Wall -Wsign-compare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fuse-ld=gold -o .libs/Lperf-simple Lperf-simple.o  ../src/.libs/libunwind.so -lc -lgcc_s
../src/.libs/libunwind.so: error: undefined reference to 'AO_pt_lock'
collect2: error: ld returned 1 exit status
make[1]: *** [Lperf-simple] Error 1

arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=armv5e -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -DAO_USE_PTHREAD_DEFS=1 -fexceptions -Wall -Wsign-compare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fuse-ld=gold -o .libs/Gperf-simple Gperf-simple.o  ../src/.libs/libunwind-arm.so /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/libunwind/1.1-r0/build/src/.libs/libunwind.so ../src/.libs/libunwind.so -lc -lgcc_s
../src/.libs/libunwind-arm.so: error: undefined reference to 'AO_pt_lock'
collect2: error: ld returned 1 exit status

...

Adding -latomic_ops works, but

* News for v0.98.3:

** Dont link against libatomic_ops for now.  Due to a packaging bug on
   Debian, linking against this library causes libunwind.so to get
   a dependency on libatomic_ops.so, which is not at all what we want.
   Fortunately, we don't have to link against that library on x86 or
   ia64 since the library is strictly needed only for platforms with
   poor atomic operation support.  Once the libatomic_ops package is fixed,
   we can re-enable linking against libatomic_ops.

and
#  AC_CHECK_LIB(atomic_ops, main)
is commented out in configure for all builds.

https://raw.githubusercontent.com/rdnetto/teapot-buildroot/master/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
fixes the issue in my builds, I'll send patch shortly, I wonder why YP autobuilder didn't catch this issue.

Regards,

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvcSsACgkQN1Ujt2V2gByqbACgr9DFMeZWIRURJsDcgOcU4/oF
zHEAn16aWmlFrlv7MxtvGCtZxJq929nr
=kbL/
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
