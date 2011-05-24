Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOvBK-0005SF-E5
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 19:14:11 +0200
Received: by pvc30 with SMTP id 30so3142222pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=r7gU9eyBDtkePf+92KZsSJd82QEiEpbXmaDhEckDE2U=;
	b=ZXMBachSXRurKJ48bJ5vLFuFM/PHZvq/6kXzXMj5vAzqtzMA2nw1HZe6Ueqo26VKdw
	AJtJ8d+4upPNvqgUly9Jkj+FiDGFvSe9JYgmLomj9+wkyS8B49M0fl48UOsoh/nnwnWA
	L973fe2MCAXeu8jMgwzSusz0wCtHqHMzOAEN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ta52I/bNydXCZtkJ+QKR0l9RaSpNFYRBFO5GU1a1dESRF/g53+XLTqYfyRw9Gy0/Up
	MQfacg89KcPOzsNQJRuiAHKsMg5NblVg2R/xGKrkMjfMz4yPyLR8xiaJ3J6TZoDdIJ6M
	xSRMJjAcqCO3C9+SNmew/v8Wy6NTo0umP0JTA=
Received: by 10.68.22.100 with SMTP id c4mr3045771pbf.270.1306257062629;
	Tue, 24 May 2011 10:11:02 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v6sm5110191pbe.18.2011.05.24.10.11.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 10:11:01 -0700 (PDT)
Date: Tue, 24 May 2011 10:09:42 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110524170942.GA18086@sakrah.homelinux.org>
References: <cover.1306105366.git.raj.khem@gmail.com>
	<91500a68e2d7ef841608db4ff6b3b9c179c49d87.1306105366.git.raj.khem@gmail.com>
	<1306233194.2525.154.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1306233194.2525.154.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] uclibc: Upgrade to 0.9.32-rc3
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
X-List-Received-Date: Tue, 24 May 2011 17:14:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (24/05/11 11:33), Phil Blundell wrote:
> On Sun, 2011-05-22 at 16:04 -0700, Khem Raj wrote:
> > Bring in the uclibc recipes from meta-oe they have been well
> > tested by now.
>=20
> This doesn't build for me on i586:
>=20
> | ccache i586-oe-linux-uclibc-gcc -march=3Di586 --sysroot=3D/home/pb/oe/b=
uild-meta-uclibc/tmp-uclibc-uclibc/sysroots/qemux86-tcbootstrap -c libc/sys=
deps/linux/common/execve.c -o libc/sysdeps/linux/common/execve.o -include .=
/include/libc-symbols.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wfo=
rmat=3D2  -Wmissing-noreturn  -Wmissing-format-attribute  -Wmissing-prototy=
pes  -Wmissing-declarations  -Wnested-externs  -Wnonnull  -Wold-style-decla=
ration  -Wold-style-definition  -Wshadow  -Wundef -funsigned-char -fno-buil=
tin -fno-asm -std=3Dgnu99 -ffunction-sections -fdata-sections -m32 -march=
=3Dpentium4 -fno-stack-protector -nostdinc -I./include -I./include -I. -I./=
libc/sysdeps/linux -I./libc/sysdeps/linux/i386 -O2 -pipe -g -feliminate-unu=
sed-debug-types  -Os -funit-at-a-time -fmerge-all-constants -fstrict-aliasi=
ng -fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -f=
omit-frame-pointer -mpreferred-stack-boundary=3D4 -falign-functions=3D1 -fa=
lign-jumps=3D1 -falign-labels=3D1 -falign-loops=3D1 -DHAVE_FORCED_UNWIND
>  -I./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix=
/sysv/linux/i386/i686 -I./libpthread/nptl/sysdeps/unix/sysv/linux/i386 -I./=
libpthread/nptl/sysdeps/i386 -I./libpthread/nptl/sysdeps/i386 -I./libpthrea=
d/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux =
-I./libpthread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bit=
s -I./libpthread/nptl/sysdeps/generic -I./ldso/ldso/i386 -I./ldso/include -=
I./libc/sysdeps/linux/common -I/home/pb/oe/build-meta-uclibc/tmp-uclibc-ucl=
ibc/sysroots/qemux86/include/ -isystem /home/pb/oe/build-meta-uclibc/tmp-uc=
libc-uclibc/sysroots/x86_64-linux/lib/i586-oe-linux-uclibc.gcc-cross-interm=
ediate/gcc/i586-oe-linux-uclibc/4.6.0/include-fixed -isystem /home/pb/oe/bu=
ild-meta-uclibc/tmp-uclibc-uclibc/sysroots/x86_64-linux/lib/i586-oe-linux-u=
clibc.gcc-cross-intermediate/gcc/i586-oe-linux-uclibc/4.6.0/include -DNDEBU=
G -D__USE_STDIO_FUTEXES__      -MT libc/sysdeps/linux/common/execve.o -MD -=
MP -MF libc/sysdeps/linux/common/.execve.o.dep
> | libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
> | libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not d=
irectly addressable
> | libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not d=
irectly addressable
> | make: *** [libc/sysdeps/linux/common/epoll.o] Error 1
> | make: *** Waiting for unfinished jobs....
>=20
> BTW, why does uclibc set PACKAGE_ARCH =3D ${MACHINE_ARCH}?  Is there
> anything in it that's actually machine specific?
>=20

It used to be that certain option were chosen based on machine when
compiling mainly -mtune and -march but there are patches to
rely upon compiler or use EXTRA_CFLAGS to convey that information.
and we have those patches applied in OE
So this should make it more machine independent. So I see no reason
to keep it machine specific now. uclibc kconfig only knows about architectu=
res
and not about machines specifically.

> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
-Khem


