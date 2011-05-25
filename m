Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPHMU-0007FT-Dy for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 18:55:10 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPHJZ-0004ko-QE
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 18:52:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306233194.2525.154.camel@phil-desktop>
References: <cover.1306105366.git.raj.khem@gmail.com>
	<91500a68e2d7ef841608db4ff6b3b9c179c49d87.1306105366.git.raj.khem@gmail.com>
	<1306233194.2525.154.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 25 May 2011 17:52:08 +0100
Message-ID: <1306342328.2525.249.camel@phil-desktop>
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
X-List-Received-Date: Wed, 25 May 2011 16:55:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-05-24 at 11:33 +0100, Phil Blundell wrote:
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
lign-jumps=3D1 -falign-labels=3D1 -falign-loops=3D1 -DHAVE_FORCED_UNWIND -I=
./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv=
/linux/i386/i686 -I./libpthread/nptl/sysdeps/unix/sysv/linux/i386 -I./libpt=
hread/nptl/sysdeps/i386 -I./libpthread/nptl/sysdeps/i386 -I./libpthread/npt=
l/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./l=
ibpthread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I.=
/libpthread/nptl/sysdeps/generic -I./ldso/ldso/i386 -I./ldso/include -I./li=
bc/sysdeps/linux/common -I/home/pb/oe/build-meta-uclibc/tmp-uclibc-uclibc/s=
ysroots/qemux86/include/ -isystem /home/pb/oe/build-meta-uclibc/tmp-uclibc-=
uclibc/sysroots/x86_64-linux/lib/i586-oe-linux-uclibc.gcc-cross-intermediat=
e/gcc/i586-oe-linux-uclibc/4.6.0/include-fixed -isystem /home/pb/oe/build-m=
eta-uclibc/tmp-uclibc-uclibc/sysroots/x86_64-linux/lib/i586-oe-linux-uclibc=
.gcc-cross-intermediate/gcc/i586-oe-linux-uclibc/4.6.0/include -DNDEBUG -D_=
_USE_STDIO_FUTEXES__      -MT libc/sysdeps/linux/common/execve.o -MD -MP -M=
F libc/sysdeps/linux/common/.execve.o.dep
> | libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
> | libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not d=
irectly addressable
> | libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not d=
irectly addressable
> | make: *** [libc/sysdeps/linux/common/epoll.o] Error 1
> | make: *** Waiting for unfinished jobs....

This patch seems to fix it.

diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/=
epoll.c
index 85b0cfd..c034b2c 100644
--- a/libc/sysdeps/linux/common/epoll.c
+++ b/libc/sysdeps/linux/common/epoll.c
@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
 int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents=
,
                                                int timeout, const sigset_t=
 *set)
 {
+       int nsig =3D _NSIG / 8;
        if (SINGLE_THREAD_P)
-               return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxeven=
ts, timeout, set, _NSIG / 8);
+               return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxeven=
ts, timeout, set, nsig);
 # ifdef __UCLIBC_HAS_THREADS_NATIVE__
        else {
                int oldtype =3D LIBC_CANCEL_ASYNC ();
-               int result =3D INLINE_SYSCALL(epoll_pwait, 6, epfd, events,=
 maxevents, timeout, set, _NSIG / 8);
+               int result =3D INLINE_SYSCALL(epoll_pwait, 6, epfd, events,=
 maxevents, timeout, set, nsig);
                LIBC_CANCEL_RESET (oldtype);
                return result;
        }

p.




