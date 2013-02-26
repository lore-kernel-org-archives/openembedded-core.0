Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UANxi-0000KL-KV
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:05:10 +0100
Received: by mail-we0-f180.google.com with SMTP id k14so3647009wer.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 08:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=jTCUWLam5ShOvKAdv5bU32TJOqh0mWIhqzCv0j26y1w=;
	b=vUR1znT9Yjdyp9mQJpRh6RfyYoAlWWA5NppdKoo2HLBcQ4anXcUDzj2wNIyuRAItHt
	FVd6Hvr+mLWHvjeKFa2T5Oo0zccDSiKc5vXVzlHABq1cd+AmfrGs66rwYydYXpI7qd0c
	bmhY6tRHHLjkklY+GKQxJvviXMFEFOpdLGZMC6WWF6VDdu1CCCy1B+GQUG9DRi8yssQY
	brfVzppXGAoipeVowATsHM3BMHHi6KV+mySIZq1rLZSBzeuvH7POvXTJnjryPVanpD8V
	pqsWDYzhC7SUVRr2WXgAZq7xAT05o3LjmePUMtH5cprQ66kE41CeMi7glITOMqvGCVNW
	Cfwg==
MIME-Version: 1.0
X-Received: by 10.180.75.177 with SMTP id d17mr20854444wiw.16.1361897326903;
	Tue, 26 Feb 2013 08:48:46 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Tue, 26 Feb 2013 08:48:46 -0800 (PST)
In-Reply-To: <512C69A6.6040707@linux.intel.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
	<CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
	<512BE70F.4050707@linux.intel.com>
	<CAF6bG8fPGOjUB_nvNML1SAckQngEOSijzDH43dtSSQ7FmCmquw@mail.gmail.com>
	<512C69A6.6040707@linux.intel.com>
Date: Tue, 26 Feb 2013 11:48:46 -0500
Message-ID: <CAHUNapR_t5Yj9NgdjnDLcTLmH4FsV8u3M-a6r7Z2fpRAE4VsUw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Tue, 26 Feb 2013 17:05:11 -0000
Content-Type: multipart/alternative; boundary=f46d043c811e640c3404d6a36eef

--f46d043c811e640c3404d6a36eef
Content-Type: text/plain; charset=ISO-8859-1

FYI

On Tue, Feb 26, 2013 at 2:52 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>> Just curious, what's your build host arch?  and what does gcc
>>> -print-multi-os-directory return on your host?

on openSUSE 12.2

$ uname -a
Linux codei7 3.4.28-2.20-desktop #1 SMP PREEMPT Tue Jan 29 16:51:37 UTC
2013 (143156b) x86_64 x86_64 x86_64 GNU/Linux

$ gcc -print-multi-os-directory
../lib64

$ gcc -v
   Using built-in specs.
   COLLECT_GCC=gcc
   COLLECT_LTO_WRAPPER=/usr/lib64/gcc/x86_64-suse-linux/4.7/lto-wrapper
   Target: x86_64-suse-linux
   Configured with: ../configure
      --prefix=/usr
      --infodir=/usr/share/info
      --mandir=/usr/share/man
      --libdir=/usr/lib64
      --libexecdir=/usr/lib64
      --enable-languages=c,c++,objc,fortran,obj-c++,java,ada
      --enable-checking=release
      --with-gxx-include-dir=/usr/include/c++/4.7
      --enable-ssp
      --disable-libssp
      --disable-libitm
      --disable-plugin
      --with-bugurl=http://bugs.opensuse.org/
      --with-pkgversion='SUSE Linux'
      --disable-libgcj
      --disable-libmudflap
      --with-slibdir=/lib64
      --with-system-zlib
      --enable-__cxa_atexit
      --enable-libstdcxx-allocator=new
      --disable-libstdcxx-pch
      --enable-version-specific-runtime-libs
      --enable-linker-build-id
      --program-suffix=-4.7
      --enable-linux-futex
      --without-system-libunwind
      --with-arch-32=i586
      --with-tune=generic
      --build=x86_64-suse-linux
   Thread model: posix
   gcc version 4.7.1 20120723 [gcc-4_7-branch revision 189773] (SUSE Linux)

--f46d043c811e640c3404d6a36eef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI<br><br>On Tue, Feb 26, 2013 at 2:52 AM, Saul Wold &lt;=
<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<b=
r>&gt;&gt;&gt; Just curious, what&#39;s your build host arch? =A0and what d=
oes gcc<br>
&gt;&gt;&gt; -print-multi-os-directory return on your host?<br><br>on openS=
USE 12.2<br><br>$ uname -a<br>Linux codei7 3.4.28-2.20-desktop #1 SMP PREEM=
PT Tue Jan 29 16:51:37 UTC 2013 (143156b) x86_64 x86_64 x86_64 GNU/Linux<br=
>
<br>$ gcc -print-multi-os-directory<br>../lib64<br><br>$ gcc -v<br>=A0 =A0U=
sing built-in specs.<br>=A0 =A0COLLECT_GCC=3Dgcc<br>=A0 =A0COLLECT_LTO_WRAP=
PER=3D/usr/lib64/gcc/x86_64-suse-linux/4.7/lto-wrapper<br>=A0 =A0Target: x8=
6_64-suse-linux<br>
=A0 =A0Configured with: ../configure<div>=A0 =A0 =A0 --prefix=3D/usr</div><=
div>=A0 =A0 =A0 --infodir=3D/usr/share/info</div><div>=A0 =A0 =A0 --mandir=
=3D/usr/share/man</div><div>=A0 =A0=A0=A0=A0--libdir=3D/usr/lib64</div><div=
>=A0 =A0=A0=A0=A0--libexecdir=3D/usr/lib64</div><div>
=A0 =A0=A0=A0=A0--enable-languages=3Dc,c++,objc,fortran,obj-c++,java,ada</d=
iv><div>=A0 =A0=A0=A0=A0--enable-checking=3Drelease</div><div>=A0 =A0=A0=A0=
=A0--with-gxx-include-dir=3D/usr/include/c++/4.7</div><div>=A0 =A0=A0=A0=A0=
--enable-ssp</div><div>=A0 =A0=A0=A0=A0--disable-libssp</div>
<div>=A0 =A0=A0=A0=A0--disable-libitm</div><div>=A0 =A0=A0=A0=A0--disable-p=
lugin</div><div>=A0 =A0=A0=A0=A0--with-bugurl=3D<a href=3D"http://bugs.open=
suse.org/">http://bugs.opensuse.org/</a></div><div>=A0 =A0=A0=A0=A0--with-p=
kgversion=3D&#39;SUSE Linux&#39;</div><div>
=A0 =A0=A0=A0=A0--disable-libgcj</div><div>=A0 =A0=A0=A0=A0--disable-libmud=
flap</div><div>=A0 =A0=A0=A0=A0--with-slibdir=3D/lib64</div><div>=A0 =A0=A0=
=A0=A0--with-system-zlib</div><div>=A0 =A0=A0=A0=A0--enable-__cxa_atexit</d=
iv><div>=A0 =A0=A0=A0=A0--enable-libstdcxx-allocator=3Dnew</div>
<div>=A0 =A0=A0=A0=A0--disable-libstdcxx-pch</div><div>=A0 =A0=A0=A0=A0--en=
able-version-specific-runtime-libs</div><div>=A0 =A0=A0=A0=A0--enable-linke=
r-build-id</div><div>=A0 =A0=A0=A0=A0--program-suffix=3D-4.7</div><div>=A0 =
=A0=A0=A0=A0--enable-linux-futex</div><div>=A0 =A0=A0=A0=A0--without-system=
-libunwind</div>
<div>=A0 =A0=A0=A0=A0--with-arch-32=3Di586</div><div>=A0 =A0=A0=A0=A0--with=
-tune=3Dgeneric</div><div>=A0 =A0=A0=A0=A0--build=3Dx86_64-suse-linux<br>=
=A0 =A0Thread model: posix<br>=A0 =A0gcc version 4.7.1 20120723 [gcc-4_7-br=
anch revision 189773] (SUSE Linux)</div></div>

--f46d043c811e640c3404d6a36eef--
