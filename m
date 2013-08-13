Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 77A236B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 16:17:52 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so11816109oag.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=tcJJ6UL3Gm/G7jvCOuJnk/eSbqm5Wqm8TwrRC1KtNr4=;
	b=jLN95gDzkxXfv97CkchEbBaJFakLdqevzHljdEOCqWDWhIcophnGTwkWtgIB5UE4ht
	IvQnPm1ZnEoRihmRN2eqr5UhZaMMKCjwsVAvoQvTXI6pyueSCnKJMxKwCpq0Q7Dbnd6u
	hriwGVbCbJmbGj29lpw43L7SB2bylgTk7EIE6v13mRNvtrIhBGP5Cj50vlw9NVdSB8Qt
	GXjlw3sXkLP5HQ1cl7HzfYsax3cAv2xCvQhFJYkwm0VsMkhmr5ahU/ST4NnJAiXHE4IT
	W0zt+AxlDAK0FB88LNzFvwsCU9UptSxXbTnnCC7FGXOl58c2WCKcn2nWJDjGC4A8Wq+9
	rBKw==
X-Received: by 10.182.61.19 with SMTP id l19mr2640497obr.55.1376410672725;
	Tue, 13 Aug 2013 09:17:52 -0700 (PDT)
Received: from [172.23.7.190] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id r4sm40225345oem.3.2013.08.13.09.17.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 09:17:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
Date: Tue, 13 Aug 2013 09:17:52 -0700
Message-Id: <8B119486-AEBF-46F6-9EB1-BC31C81A80D3@gmail.com>
References: <6741EAAB26B57F4995668065CB62D86B33933627@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKhTFiKC8BwPhtULqmtkuzgYV3MVPOCLn64ibgGYjuaGA@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33933DFC@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKiRwXD8gJhG+7XDSHSGEvZY3YBR5MxBZieVMYPd_sL1g@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
To: Francois Retief <fgretief@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Yocto toolchain for Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 16:17:52 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2DE008D9-A3D9-4752-9571-1C455EEF3C98"

--Apple-Mail=_2DE008D9-A3D9-4752-9571-1C455EEF3C98
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Aug 12, 2013, at 6:34 AM, Francois Retief <fgretief@gmail.com> wrote:

> Hi Krzysztof,
>=20
> My understanding is that MinGW is the libc library for Win32 =
environments. So we need to "replace" eglibc with mingw for all code =
that execute on the Win32 platform.  In the case of OpenEmbedded, it is =
all packages that start with "nativesdk-" when is =
SDKMACHINE=3D"x86_64-mingw32".
>=20
> Over the weekend I worked on this by disabling the eglibc recipes and =
seeing what packages are missing.  The eglibc recipe provides the =
"virtual/nativesdk-libc" package. My understanding is that this virtual =
package must be implemented by MingGW.  In the process I also found that =
pthreads-win32 was needed and added a recipe for this.

Not really but if you stub eglibc from nativesdk out then make sure the =
host libc is plugged in correctly at all places where its expected. Its =
safer to let it
build its own nativesdk eglibc. Since we also modify the shared library =
load paths in dynamic linker to use own nativesdk libraries first if =
available

>=20
> I ended up at a point where nativesdk-zlib is actually looking for =
libc and not finding it.  Currently I am trying to understand exactly =
what is required by "nativesdk-*" packages, and what mingw provides, in =
the hope of understanding where the mismatch is or where my =
understanding of the system breaks down.  ;-)=20
>=20
> Will keep you posted.
>=20
> Cheers,
>   Francois
>=20
> $ SDKMACHINE=3Dx86_64-mingw32 bitbake nativesdk-zlib
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j2 -e MAKEFLAGS=3D
> | x86_64-oesdk-mingw32-gcc  =
--sysroot=3D/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32 =
-shared -Wl,-soname,libz.so.1,--version-script,zlib.map =
-isystem/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/=
oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include -O2 -pipe  -fPIC =
-D_LARGEFILE64_SOURCE=3D1 -o libz.so.1.2.8 adler32.lo crc32.lo =
deflate.lo infback.lo inffast.lo inflate.lo inftrees.lo trees.lo =
zutil.lo compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo =
 -lc =
-L/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore=
-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-rpath-link,/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/us=
r/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-O1 =
-L/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore=
-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-rpath-link,/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/us=
r/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-O1
> | x86_64-oesdk-mingw32-gcc  =
--sysroot=3D/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32 =
-isystem/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/=
oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include -O2 -pipe -o =
minigzip64 minigzip64.o -L. libz.a
> | =
/opt/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oesdk-mingw32/gcc=
/x86_64-oesdk-mingw32/4.8.1/ld: cannot find -lc
> | collect2: error: ld returned 1 exit status
> | make: *** [libz.so.1.2.8] Error 1
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
> ...
>=20
>=20
> On 12 August 2013 12:13, Sywula, Krzysztof M =
<krzysztof.m.sywula@intel.com> wrote:
> Francois,
>=20
> I tried compiling the same eglibc version as Yocto uses under =
mingw32/Cygwin. Apparently there is no port for these.
>=20
> =20
>=20
> Mingw32:
>=20
> $ ../eglibc-2.17/libc/configure
>=20
> checking build system type... i686-pc-mingw32
>=20
> checking host system type... i686-pc-mingw32
>=20
> checking for gcc... gcc
>=20
> checking for suffix of object files... o
>=20
> checking whether we are using the GNU C compiler... yes
>=20
> checking whether gcc accepts -g... yes
>=20
> checking for gcc option to accept ISO C89... none needed
>=20
> checking how to run the C preprocessor... gcc -E
>=20
> checking for g++... g++
>=20
> checking whether we are using the GNU C++ compiler... yes
>=20
> checking whether g++ accepts -g... yes
>=20
> checking for readelf... readelf
>=20
> checking for sysdeps preconfigure fragments... x86_64
>=20
> configure: running configure fragment for add-on libidn
>=20
> configure: running configure fragment for add-on nptl
>=20
> checking add-on ports for preconfigure fragments... aarch64 alpha am33 =
arm hppa
>=20
> ia64 m68k mips powerpc tile
>=20
> *** The GNU C library is currently not available for this platform.
>=20
> *** So far nobody cared to port it and if there is no volunteer it
>=20
> *** might never happen.  So, if you have interest to see glibc on
>=20
> *** this platform visit
>=20
> ***     http://www.gnu.org/software/libc/porting.html
>=20
> *** and join the group of porters
>=20
> =20
>=20
> Cygwin:
>=20
> $ ../eglibc-2.17/libc/configure
>=20
> checking build system type... i686-pc-cygwin
>=20
> checking host system type... i686-pc-cygwin
>=20
> checking for gcc... gcc
>=20
> checking for suffix of object files... o
>=20
> checking whether we are using the GNU C compiler... yes
>=20
> checking whether gcc accepts -g... yes
>=20
> checking for gcc option to accept ISO C89... none needed
>=20
> checking how to run the C preprocessor... gcc -E
>=20
> checking for g++... g++
>=20
> checking whether we are using the GNU C++ compiler... yes
>=20
> checking whether g++ accepts -g... yes
>=20
> checking for readelf... readelf
>=20
> checking for sysdeps preconfigure fragments... x86_64
>=20
> configure: running configure fragment for add-on libidn
>=20
> configure: running configure fragment for add-on nptl
>=20
> checking add-on ports for preconfigure fragments... aarch64 alpha am33 =
arm hppa ia64 m68k mips powerpc tile
>=20
> *** The GNU C library is currently not available for this platform.
>=20
> *** So far nobody cared to port it and if there is no volunteer it
>=20
> *** might never happen.  So, if you have interest to see glibc on
>=20
> *** this platform visit
>=20
> ***     http://www.gnu.org/software/libc/porting.html
>=20
> *** and join the group of porters
>=20
> =20
>=20
> =20
>=20
> To see why is eglibc needed do:
>=20
> bitbake <recipe> -c populate_sdk =96g
>=20
> and:
>=20
> less package-depends.dot
>=20
> =20
>=20
> That=92s what it gives:
>=20
> "nativesdk-eglibc-initial" [label=3D"nativesdk-eglibc-initial =
:2.17-r3\nvirtual:nativesdk:/build/kmsywula
>=20
> 3/poky/meta/recipes-core/eglibc/eglibc-initial_2.17.bb"]
>=20
> "nativesdk-eglibc-initial" -> =
"virtual/x86_64-pokysdk-mingw32-gcc-initial-crosssdk"
>=20
> "nativesdk-eglibc-initial" -> "nativesdk-linux-libc-headers"
>=20
> "nativesdk-eglibc-initial" -> "chrpath-replacement-native"
>=20
> "nativesdk-eglibc-initial" -> "autoconf-native"
>=20
> "nativesdk-eglibc-initial" -> "automake-native"
>=20
> "nativesdk-eglibc-initial" -> "libtool-native"
>=20
> "nativesdk-eglibc-initial" -> "kconfig-frontends-native"
>=20
> "nativesdk-eglibc-initial" -> "gnu-config-native"
>=20
> =20
>=20
> =20
>=20
> So as long as there is no port for mingw32/Cygwin we are blocked. Any =
ideas?
>=20
> =20
>=20
> Thanks,
>=20
> Krzysztof
>=20
> =20
>=20
> From: Francois Retief [mailto:fgretief@gmail.com]=20
> Sent: Friday, August 09, 2013 6:33 PM
>=20
>=20
> To: Sywula, Krzysztof M
> Subject: Re: Yocto toolchain for Windows
>=20
> =20
>=20
> Hi Krzysztof,
>=20
> Yup, that is the same point where I am stuck at the moment. I sent an =
email to oe-core mailing list about this issue.
>=20
> =
http://lists.openembedded.org/pipermail/openembedded-core/2013-August/0825=
09.html
>=20
> Hoping for a response from the OE community soon.
>=20
> Cheers,
>=20
>   Francois
>=20
> =20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2DE008D9-A3D9-4752-9571-1C455EEF3C98
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Aug 12, 2013, at 6:34 AM, Francois Retief &lt;<a =
href=3D"mailto:fgretief@gmail.com">fgretief@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr"><div><div>Hi Krzysztof,<br><br></div><div =
class=3D"gmail_extra">My understanding is that MinGW is the libc library =
for Win32 environments. So we need to "replace" eglibc with mingw for =
all code that execute on the Win32 platform.&nbsp; In the case of =
OpenEmbedded, it is all packages that start with "nativesdk-" when is =
SDKMACHINE=3D"x86_64-mingw32".<br>
<br></div><div class=3D"gmail_extra">Over the weekend I worked on this =
by disabling the eglibc recipes and seeing what packages are =
missing.&nbsp; The eglibc recipe provides the "virtual/nativesdk-libc" =
package. My understanding is that this virtual package must be =
implemented by MingGW.&nbsp; In the process I also found that =
pthreads-win32 was needed and added a recipe for =
this.<br></div></div></div></blockquote><div><br></div><div>Not really =
but if you stub eglibc from nativesdk out then make sure the host libc =
is plugged in correctly at all places where its expected. Its safer to =
let it</div><div>build its own nativesdk eglibc. Since we also modify =
the shared library load paths in dynamic linker to use own nativesdk =
libraries first if available</div><br><blockquote type=3D"cite"><div =
dir=3D"ltr"><div><div class=3D"gmail_extra">
<br>I ended up at a point where nativesdk-zlib is actually looking for =
libc and not finding it.&nbsp; Currently I am trying to understand =
exactly what is required by "nativesdk-*" packages, and what mingw =
provides, in the hope of understanding where the mismatch is or where my =
understanding of the system breaks down.&nbsp; ;-) <br>
<br></div><div class=3D"gmail_extra">Will keep you posted.<br></div><div =
class=3D"gmail_extra"><br></div>Cheers,<br></div>&nbsp; =
Francois<br><br><span style=3D"font-family:courier new,monospace">$ =
SDKMACHINE=3Dx86_64-mingw32 bitbake nativesdk-zlib<br>
...</span><br><span style=3D"font-family:courier new,monospace">Log data =
follows:<br>| DEBUG: Executing shell function do_compile<br>| NOTE: make =
-j2 -e MAKEFLAGS=3D<br>| x86_64-oesdk-mingw32-gcc&nbsp; =
--sysroot=3D/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32 =
-shared -Wl,-soname,libz.so.1,--version-script,zlib.map =
-isystem</span><span style=3D"font-family:courier new,monospace"><span =
style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include =
-O2 -pipe&nbsp; -fPIC -D_LARGEFILE64_SOURCE=3D1 -o libz.so.1.2.8 =
adler32.lo crc32.lo deflate.lo infback.lo inffast.lo inflate.lo =
inftrees.lo trees.lo zutil.lo compress.lo uncompr.lo gzclose.lo gzlib.lo =
gzread.lo gzwrite.lo&nbsp; -lc -L</span><span style=3D"font-family:courier=
 new,monospace"><span style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-rpath-link,</span><span style=3D"font-family:courier =
new,monospace"><span style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-O1 -L</span><span style=3D"font-family:courier new,monospace"><span =
style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-rpath-link,</span><span style=3D"font-family:courier =
new,monospace"><span style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib =
-Wl,-O1<br>
| x86_64-oesdk-mingw32-gcc&nbsp; --sysroot=3D</span><span =
style=3D"font-family:courier new,monospace"><span =
style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32 -isystem</span><span style=3D"font-family:courier =
new,monospace"><span style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-ming=
w32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include =
-O2 -pipe -o minigzip64 minigzip64.o -L. libz.a<br>
| </span><span style=3D"font-family:courier new,monospace"><span =
style=3D"font-family:courier =
new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x8=
6_64-oesdk-mingw32/gcc/x86_64-oesdk-mingw32/4.8.1/ld: cannot find =
-lc<br>
| collect2: error: ld returned 1 exit status<br>| make: *** =
[libz.so.1.2.8] Error 1<br>| make: *** Waiting for unfinished =
jobs....<br>| ERROR: oe_runmake failed</span><br><span =
style=3D"font-family:courier new,monospace">...</span><br>
<br><div><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 12 =
August 2013 12:13, Sywula, Krzysztof M <span dir=3D"ltr">&lt;<a =
href=3D"mailto:krzysztof.m.sywula@intel.com" =
target=3D"_blank">krzysztof.m.sywula@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"EN-IE">
<div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">Francois,<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">I tried compiling the same eglibc version as =
Yocto uses under mingw32/Cygwin. Apparently there is no port for =
these.<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">Mingw32:<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">$ =
../eglibc-2.17/libc/configure<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking build system type... =
i686-pc-mingw32<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking host system type... =
i686-pc-mingw32<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for gcc... =
gcc<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for suffix of object files... =
o<u></u><u></u></span></p><div class=3D"im"><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether we are using the GNU C =
compiler... yes<u></u><u></u></span></p>
</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether gcc accepts -g... =
yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for gcc option to accept ISO C89... =
none needed<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking how to run the C preprocessor... gcc =
-E<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for g++... =
g++<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether we are using the GNU C++ =
compiler... yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether g++ accepts -g... =
yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for readelf... =
readelf<u></u><u></u></span></p><div class=3D"im"><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for sysdeps preconfigure =
fragments... x86_64<u></u><u></u></span></p>
</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">configure: running configure fragment for =
add-on libidn<u></u><u></u></span></p><div class=3D"im"><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">configure: running configure fragment for =
add-on nptl<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking add-on ports for preconfigure =
fragments... aarch64 alpha am33 arm hppa<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">ia64 m68k mips powerpc =
tile<u></u><u></u></span></p>
</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** The GNU C library is currently not =
available for this platform.<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** So far nobody cared to port it and if =
there is no volunteer it<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** might never happen.&nbsp; So, if you have =
interest to see glibc on<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** this platform =
visit<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">***&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"http://www.gnu.org/software/libc/porting.html" =
target=3D"_blank">http://www.gnu.org/software/libc/porting.html</a><u></u>=
<u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** and join the group of =
porters<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">Cygwin:<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">$ =
../eglibc-2.17/libc/configure<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking build system type... =
i686-pc-cygwin<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking host system type... =
i686-pc-cygwin<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for gcc... =
gcc<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for suffix of object files... =
o<u></u><u></u></span></p><div class=3D"im"><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether we are using the GNU C =
compiler... yes<u></u><u></u></span></p>
</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether gcc accepts -g... =
yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for gcc option to accept ISO C89... =
none needed<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking how to run the C preprocessor... gcc =
-E<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for g++... =
g++<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether we are using the GNU C++ =
compiler... yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking whether g++ accepts -g... =
yes<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for readelf... =
readelf<u></u><u></u></span></p><div class=3D"im"><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking for sysdeps preconfigure =
fragments... x86_64<u></u><u></u></span></p>
</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">configure: running configure fragment for =
add-on libidn<u></u><u></u></span></p><div class=3D"im"><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">configure: running configure fragment for =
add-on nptl<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">checking add-on ports for preconfigure =
fragments... aarch64 alpha am33 arm hppa ia64 m68k mips powerpc =
tile<u></u><u></u></span></p>

</div><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** The GNU C library is currently not =
available for this platform.<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** So far nobody cared to port it and if =
there is no volunteer it<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** might never happen.&nbsp; So, if you have =
interest to see glibc on<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** this platform =
visit<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">***&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"http://www.gnu.org/software/libc/porting.html" =
target=3D"_blank">http://www.gnu.org/software/libc/porting.html</a><u></u>=
<u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">*** and join the group of =
porters<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">To see why is eglibc needed =
do:<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">bitbake &lt;recipe&gt; -c populate_sdk =
=96g<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">and:<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">less =
package-depends.dot<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">That=92s what it =
gives:<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" =
[label=3D"nativesdk-eglibc-initial =
:2.17-r3\nvirtual:nativesdk:/build/kmsywula<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">3/poky/meta/recipes-core/eglibc/<a =
href=3D"http://eglibc-initial_2.17.bb/" =
target=3D"_blank">eglibc-initial_2.17.bb</a>"]<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"virtual/x86_64-pokysdk-mingw32-gcc-initial-crosssdk"<u></u><u></u></span>=
</p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"nativesdk-linux-libc-headers"<u></u><u></u></span></p><p class=3D""><span=
 =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"chrpath-replacement-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"autoconf-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"automake-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"libtool-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"kconfig-frontends-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">"nativesdk-eglibc-initial" -&gt; =
"gnu-config-native"<u></u><u></u></span></p><p class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">So as long as there is no port for =
mingw32/Cygwin we are blocked. Any ideas?<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">Thanks,<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)">Krzysztof<u></u><u></u></span></p><p =
class=3D""><span =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:rgb(31,73,125)"><u></u>&nbsp;<u></u></span></p><p =
class=3D""><b><span =
style=3D"font-size:10pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&qu=
ot;" lang=3D"EN-US">From:</span></b><span =
style=3D"font-size:10pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&qu=
ot;" lang=3D"EN-US"> Francois Retief [mailto:<a =
href=3D"mailto:fgretief@gmail.com" =
target=3D"_blank">fgretief@gmail.com</a>]
<br>
<b>Sent:</b> Friday, August 09, 2013 6:33 PM</span></p><div><div =
class=3D"h5"><br>
<b>To:</b> Sywula, Krzysztof M<br>
<b>Subject:</b> Re: Yocto toolchain for =
Windows<u></u><u></u></div></div><div><br =
class=3D"webkit-block-placeholder"></div><div><div class=3D"h5"><p =
class=3D""><u></u>&nbsp;<u></u></p>
<div>
<div>
<div>
<div>
<div><p class=3D"" style=3D"margin-bottom:12pt">Hi =
Krzysztof,<u></u><u></u></p>
</div><p class=3D"" style=3D"margin-bottom:12pt">Yup, that is the same =
point where I am stuck at the moment. I sent an email to oe-core mailing =
list about this issue.<br>
<br>
<a =
href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-Aug=
ust/082509.html" =
target=3D"_blank">http://lists.openembedded.org/pipermail/openembedded-cor=
e/2013-August/082509.html</a><u></u><u></u></p>
</div><p class=3D"" style=3D"margin-bottom:12pt">Hoping for a response =
from the OE community soon.<u></u><u></u></p>
</div><p class=3D"">Cheers,<u></u><u></u></p>
</div><p class=3D"">&nbsp; Francois<u></u><u></u></p>
<div>
<div>
<div><p class=3D""><u></u>&nbsp;<u></u></p>
</div>
</div>
</div>
</div>
</div></div></div></div>

</blockquote></div></div></div></div>
_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core<br></blockquote></div><br></body></html>=

--Apple-Mail=_2DE008D9-A3D9-4752-9571-1C455EEF3C98--
