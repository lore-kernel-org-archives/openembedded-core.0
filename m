Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9D0361A45
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 00:51:47 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id f4so5306890iea.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 17:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ouK5XG7JMkyDG5d8iATroi2485FKXyjjw0ywNOWbMKs=;
	b=gUPF3QEEWfeB/yeWo+VHdgYbzD3Xskq2W7BeTwPGtCutP9qYJYnRy4hPbOa1VJfPaU
	4RVnylbeEwjRJjGxrBNVpQQUC4MH6Ac/z7tfMNCbUrzdMu54vVAvTKruzO8la6H2Tr4Y
	aQoGyX4GlgkZZ/cjd50IjlQXaupyp25oW0YpG1EtSDpAd64Z1GkZwAtCjb6EL9AK16/0
	0myFyw4s5yx1XOzgwX5TpmBMOXV6SnAeCtgsa85AYSDsqt96V9dsJty4YDJbORj7MBvz
	YbxmEa8xHiIt2YL03qmnx6PxaPEp2Y6XdgIWXiBSaVeRp0agBNS0v3PHJn+IaGshYk/e
	DQLg==
MIME-Version: 1.0
X-Received: by 10.50.82.98 with SMTP id h2mr6291154igy.33.1372467107894; Fri,
	28 Jun 2013 17:51:47 -0700 (PDT)
Received: by 10.50.4.168 with HTTP; Fri, 28 Jun 2013 17:51:47 -0700 (PDT)
In-Reply-To: <51CE2096.1080309@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
	<51CE2096.1080309@gmail.com>
Date: Fri, 28 Jun 2013 17:51:47 -0700
Message-ID: <CAMKF1soiMqUKsy59saa=YjbB5+oiba9E1MSPAW-T01jfOO4xvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Upgrade to 4.8.1
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
X-List-Received-Date: Sat, 29 Jun 2013 00:51:47 -0000
Content-Type: multipart/alternative; boundary=089e0111b2c66e9c8604e040668c

--089e0111b2c66e9c8604e040668c
Content-Type: text/plain; charset=UTF-8

On Friday, June 28, 2013, Jonathan Liu <net147@gmail.com> wrote:
> Hi Khem,
>
> I get the following error building gcc package for atom-pc on x86_64 host:

Open a bug in up bugzilla and add your build configuration info to it


> libtool: link:  i586-poky-linux-g++  -m32 -march=core2 -msse3
-mtune=generic -mfpmath=sse
--sysroot=/home/build/git/poky/build/tmp/sysroots/poky -  m32 -march=core2
-msse3 -mtune=generic -mfpmath=sse
-isystem/home/build/git/poky/build/tmp/sysroots/poky/usr/include
-I/home/build/git/poky/build/tmp/
work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/gcc/include/
--sysroot=/home/build/git/poky/build/tmp/      sysroots/poky -shared
-nostdlib /home/build/git/poky/build/tmp/sysroots/poky/usr/lib/crti.o
/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1/crtbeginS.o
.libs/asan_allocator.o .libs/asan_allocator2.o .libs/asan_interceptors.o
.libs/asan_mac.o .libs/asan_malloc_mac.  o .libs/asan_new_delete.o
.libs/asan_posix.o .libs/asan_rtl.o .libs/asan_stats.o
.libs/asan_thread_registry.o .libs/asan_fake_stack.o .libs/asan_globals.o .
libs/asan_linux.o .libs/asan_malloc_linux.o .libs/asan_malloc_win.o
.libs/asan_poisoning.o .libs/asan_report.o .libs/asan_stack.o
.libs/asan_thread.o .libs/ asan_win.o  -Wl,--whole-archive
../sanitizer_common/.libs/libsanitizer_common.a
../interception/.libs/libinterception.a -Wl,--no-whole-archive -Wl,-rpath -
Wl,/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/
libstdc++-v3/src/.libs -lpthread -ldl
../../libstdc++-v3/src/.libs/libstdc++.so
-L/home/build/git/poky/build/tmp/sysroots/x86_64-linux/usr/lib/core2-
poky-linux/gcc/i586-poky-linux/4.8.1
-L/home/build/git/poky/build/tmp/sysroots/poky/lib
-L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1
-L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib
/usr/lib/libstdc++.so -lm -lc -lgcc_s /home/build/git/poky/build/
tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1/crtendS.o
/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/crtn.o  -m32
-march=core2 -      msse3 -mtune=generic -mfpmath=sse -m32 -march=core2
-msse3 -mtune=generic -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed   -Wl,-soname -Wl, libasan.so.0 -o .libs/libasan.so.0.0.0
> /usr/lib/libstdc++.so: could not read symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> make[3]: *** [libasan.la] Error 1
> make[3]: Leaving directory
`/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/
i586-poky-linux/libsanitizer/asan'
>
> Regards,
> Jonathan
>

--089e0111b2c66e9c8604e040668c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 28, 2013, Jonathan Liu &lt;<a href=3D"mailto:net147=
@gmail.com">net147@gmail.com</a>&gt; wrote:<br>&gt; Hi Khem,<br>&gt;<br>&gt=
; I get the following error building gcc package for atom-pc on x86_64 host=
:<br>
<br>Open a bug in up bugzilla and add your build configuration info to it<b=
r><br><br>&gt; libtool: link: =C2=A0i586-poky-linux-g++ =C2=A0-m32 -march=
=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=3Dsse --sysroot=3D/home/build/git=
/poky/build/tmp/sysroots/poky - =C2=A0m32 -march=3Dcore2 -msse3 -mtune=3Dge=
neric -mfpmath=3Dsse -isystem/home/build/git/poky/build/tmp/sysroots/poky/u=
sr/include -I/home/build/git/poky/build/tmp/ work/core2-poky-linux/gcc/4.8.=
1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/gcc/include/ --sysroot=
=3D/home/build/git/poky/build/tmp/ =C2=A0 =C2=A0 =C2=A0sysroots/poky -share=
d -nostdlib /home/build/git/poky/build/tmp/sysroots/poky/usr/lib/crti.o /ho=
me/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1/crt=
beginS.o .libs/asan_allocator.o .libs/asan_allocator2.o .libs/asan_intercep=
tors.o .libs/asan_mac.o .libs/asan_malloc_mac. =C2=A0o .libs/asan_new_delet=
e.o .libs/asan_posix.o .libs/asan_rtl.o .libs/asan_stats.o .libs/asan_threa=
d_registry.o .libs/asan_fake_stack.o .libs/asan_globals.o . libs/asan_linux=
.o .libs/asan_malloc_linux.o .libs/asan_malloc_win.o .libs/asan_poisoning.o=
 .libs/asan_report.o .libs/asan_stack.o .libs/asan_thread.o .libs/ asan_win=
.o =C2=A0-Wl,--whole-archive ../sanitizer_common/.libs/libsanitizer_common.=
a ../interception/.libs/libinterception.a -Wl,--no-whole-archive -Wl,-rpath=
 - Wl,/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r0/gcc=
-4.8.1/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/ libstdc++-v3/=
src/.libs -lpthread -ldl ../../libstdc++-v3/src/.libs/libstdc++.so -L/home/=
build/git/poky/build/tmp/sysroots/x86_64-linux/usr/lib/core2- poky-linux/gc=
c/i586-poky-linux/4.8.1 -L/home/build/git/poky/build/tmp/sysroots/poky/lib =
-L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.=
1 -L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib /usr/lib/libstdc++=
.so -lm -lc -lgcc_s /home/build/git/poky/build/ tmp/sysroots/poky/usr/lib/i=
586-poky-linux/4.8.1/crtendS.o /home/build/git/poky/build/tmp/sysroots/poky=
/usr/lib/crtn.o =C2=A0-m32 -march=3Dcore2 - =C2=A0 =C2=A0 =C2=A0msse3 -mtun=
e=3Dgeneric -mfpmath=3Dsse -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfp=
math=3Dsse -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =C2=A0 -Wl,-sonam=
e -Wl, libasan.so.0 -o .libs/libasan.so.0.0.0<br>
&gt; /usr/lib/libstdc++.so: could not read symbols: File in wrong format<br=
>&gt; collect2: error: ld returned 1 exit status<br>&gt; make[3]: *** [<a h=
ref=3D"http://libasan.la">libasan.la</a>] Error 1<br>&gt; make[3]: Leaving =
directory `/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r=
0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/ i586-poky-linux/libsanit=
izer/asan&#39;<br>
&gt;<br>&gt; Regards,<br>&gt; Jonathan<br>&gt;

--089e0111b2c66e9c8604e040668c--
