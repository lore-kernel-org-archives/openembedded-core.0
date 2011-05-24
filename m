Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOoyF-0003tv-Kr for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 12:36:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOovM-0002I3-Hm
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 12:33:16 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <91500a68e2d7ef841608db4ff6b3b9c179c49d87.1306105366.git.raj.khem@gmail.com>
References: <cover.1306105366.git.raj.khem@gmail.com>
	<91500a68e2d7ef841608db4ff6b3b9c179c49d87.1306105366.git.raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 11:33:14 +0100
Message-ID: <1306233194.2525.154.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Tue, 24 May 2011 10:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-05-22 at 16:04 -0700, Khem Raj wrote:
> Bring in the uclibc recipes from meta-oe they have been well
> tested by now.

This doesn't build for me on i586:

| ccache i586-oe-linux-uclibc-gcc -march=3Di586 --sysroot=3D/home/pb/oe/bui=
ld-meta-uclibc/tmp-uclibc-uclibc/sysroots/qemux86-tcbootstrap -c libc/sysde=
ps/linux/common/execve.c -o libc/sysdeps/linux/common/execve.o -include ./i=
nclude/libc-symbols.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wform=
at=3D2  -Wmissing-noreturn  -Wmissing-format-attribute  -Wmissing-prototype=
s  -Wmissing-declarations  -Wnested-externs  -Wnonnull  -Wold-style-declara=
tion  -Wold-style-definition  -Wshadow  -Wundef -funsigned-char -fno-builti=
n -fno-asm -std=3Dgnu99 -ffunction-sections -fdata-sections -m32 -march=3Dp=
entium4 -fno-stack-protector -nostdinc -I./include -I./include -I. -I./libc=
/sysdeps/linux -I./libc/sysdeps/linux/i386 -O2 -pipe -g -feliminate-unused-=
debug-types  -Os -funit-at-a-time -fmerge-all-constants -fstrict-aliasing -=
fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -fomit=
-frame-pointer -mpreferred-stack-boundary=3D4 -falign-functions=3D1 -falign=
-jumps=3D1 -falign-labels=3D1 -falign-loops=3D1 -DHAVE_FORCED_UNWIND -I./li=
bpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/lin=
ux/i386/i686 -I./libpthread/nptl/sysdeps/unix/sysv/linux/i386 -I./libpthrea=
d/nptl/sysdeps/i386 -I./libpthread/nptl/sysdeps/i386 -I./libpthread/nptl/sy=
sdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpt=
hread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./lib=
pthread/nptl/sysdeps/generic -I./ldso/ldso/i386 -I./ldso/include -I./libc/s=
ysdeps/linux/common -I/home/pb/oe/build-meta-uclibc/tmp-uclibc-uclibc/sysro=
ots/qemux86/include/ -isystem /home/pb/oe/build-meta-uclibc/tmp-uclibc-ucli=
bc/sysroots/x86_64-linux/lib/i586-oe-linux-uclibc.gcc-cross-intermediate/gc=
c/i586-oe-linux-uclibc/4.6.0/include-fixed -isystem /home/pb/oe/build-meta-=
uclibc/tmp-uclibc-uclibc/sysroots/x86_64-linux/lib/i586-oe-linux-uclibc.gcc=
-cross-intermediate/gcc/i586-oe-linux-uclibc/4.6.0/include -DNDEBUG -D__USE=
_STDIO_FUTEXES__      -MT libc/sysdeps/linux/common/execve.o -MD -MP -MF li=
bc/sysdeps/linux/common/.execve.o.dep
| libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
| libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not dir=
ectly addressable
| libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not dir=
ectly addressable
| make: *** [libc/sysdeps/linux/common/epoll.o] Error 1
| make: *** Waiting for unfinished jobs....

BTW, why does uclibc set PACKAGE_ARCH =3D ${MACHINE_ARCH}?  Is there
anything in it that's actually machine specific?

p.




