Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muriani@gmail.com>) id 1RjJ6k-0000nK-4e
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:21:58 +0100
Received: by vbbfc21 with SMTP id fc21so1582487vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SoIdrzb+gtJNkdDDbXmuXG8K4+DyAZN4Hnnw6uc3EM8=;
	b=vWo6TDK1rX5i37frs2HV1lrGlEJssQeNE1Y2ANdm5DTEoB/A+I1bfQJdLLsNrk2uCZ
	lrRw/3E2gPYDrNvJn/+M0gnbz6IyT4l2AiqcDFE446qRwAYmuy407GL3vKQaPD3CtCQP
	CuiNNY75GtFmWtm9bjVU/HC6A0JNzK8KiQRLk=
MIME-Version: 1.0
Received: by 10.52.22.193 with SMTP id g1mr3969797vdf.77.1325891670210; Fri,
	06 Jan 2012 15:14:30 -0800 (PST)
Received: by 10.52.37.98 with HTTP; Fri, 6 Jan 2012 15:14:30 -0800 (PST)
Date: Fri, 6 Jan 2012 17:14:30 -0600
Message-ID: <CAFu+fZeD2p2jTAtFQRWatF=PG=50NKR9EpG+a2PydZL-q8EFng@mail.gmail.com>
From: James Baker <muriani@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: libiconv_1.14.bb do_install failure
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
X-List-Received-Date: Fri, 06 Jan 2012 23:21:58 -0000
Content-Type: multipart/alternative; boundary=20cf307ac3fd0377fb04b5e436ae

--20cf307ac3fd0377fb04b5e436ae
Content-Type: text/plain; charset=ISO-8859-1

Greetings folks,

I'm trying to build an OE system and the process stops at the do_install
phase of building libiconv_1.14

Build system is Ubuntu 10.04 x86_64, plenty of HDD and ram to spare.
Possibly pertinent log:
| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
-march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp
-mfpu=neon -mtune=cortex-a8
--sysroot=/home/james/stuff/beagle/tmp-eglibc/sysroots/beagleboard -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
-feliminate-unused-debug-types -Wl,-rpath -Wl,\$ORIGIN/../lib iconv.o -o
iconv  ../srclib/libicrt.a
/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/image/usr/lib/libiconv.so
-Wl,-rpath
-Wl,/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/image/usr/lib
| iconv.o: In function `main':
|
/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/libiconv-1.14/src/./iconv.c:861:
undefined reference to `relocate'
| ../srclib/libicrt.a(progreloc.o): In function `prepare_relocate':
|
/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:297:
undefined reference to `compute_curr_prefix'
|
/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:302:
undefined reference to `set_relocation_prefix'
| collect2: ld returned 1 exit status
| make[1]: *** [install] Error 1
| make[1]: Leaving directory
`/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/libiconv-1.14/src'


This problem is present regardless of the target I've chosen, and has been
tried with qemuarm (armv5) and beagleboard targets, as well as a netbookpro
target I'm trying to build (gotta get some use out of the darned thing)

According to git, my local repository is up to date. Any ideas?


Thanks,
-James

--20cf307ac3fd0377fb04b5e436ae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Greetings folks,</div><div><br></div><div>I&#39;m trying to build an O=
E system and the process stops at the do_install phase of building libiconv=
_1.14</div><div><br></div><div>Build system is Ubuntu 10.04 x86_64, plenty =
of HDD and ram to spare.</div>
<div>Possibly pertinent log:</div><div>| arm-oe-linux-gnueabi-libtool: link=
: arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -fno-tree-vectorize -mthumb-int=
erwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/ho=
me/james/stuff/beagle/tmp-eglibc/sysroots/beagleboard -Wl,-O1 -Wl,--hash-st=
yle=3Dgnu -Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types -Wl,-=
rpath -Wl,\$ORIGIN/../lib iconv.o -o iconv =A0../srclib/libicrt.a /home/jam=
es/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1=
.14-r0/image/usr/lib/libiconv.so -Wl,-rpath -Wl,/home/james/stuff/beagle/tm=
p-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/image/usr/l=
ib</div>
<div>| iconv.o: In function `main&#39;:</div><div>| /home/james/stuff/beagl=
e/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libiconv-1.14-r0/libicon=
v-1.14/src/./iconv.c:861: undefined reference to `relocate&#39;</div><div>
| ../srclib/libicrt.a(progreloc.o): In function `prepare_relocate&#39;:</di=
v><div>| /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-=
gnueabi/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:297: undefined re=
ference to `compute_curr_prefix&#39;</div>
<div>| /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gn=
ueabi/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:302: undefined refe=
rence to `set_relocation_prefix&#39;</div><div>| collect2: ld returned 1 ex=
it status</div>
<div>| make[1]: *** [install] Error 1</div><div>| make[1]: Leaving director=
y `/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueab=
i/libiconv-1.14-r0/libiconv-1.14/src&#39;</div><div><br></div><div><br>
</div><div>This problem is present regardless of the target I&#39;ve chosen=
, and has been tried with qemuarm (armv5) and beagleboard targets, as well =
as a netbookpro target I&#39;m trying to build (gotta get some use out of t=
he darned thing)</div>
<div><br></div><div>According to git, my local repository is up to date. An=
y ideas?</div><div><br></div><div><br></div><div>Thanks,</div><div>-James</=
div>

--20cf307ac3fd0377fb04b5e436ae--
