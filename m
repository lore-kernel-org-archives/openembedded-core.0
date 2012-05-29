Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SZItc-00055n-QM
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 11:39:21 +0200
Received: by ggnp4 with SMTP id p4so2418278ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 02:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=MIZ/TkBIDv4RvnkX7RdLEdMbVUMfpHX0W0asX71Hl8g=;
	b=AOhl/flOwVXPqS20wa/XA4d/+pLyd+geZBHyuXTXQp6wGLlrUYZn7JaBO3snmUsZ3W
	Tj4DF6BC9L2PmGVT6TDI+UKohlnzD6VsF2s7MFdG98qDNPjLB8dlvcj8fIO54x292KkU
	ATxe/WEc9cClKc2kbOzsYuyWIAlTgDFric4rcDrzG13JVmG6jujj+b+0TeDjAu1/gxnW
	YfOVXdjE+RV+HcfL89iYUbEe3zjS6e9RQQC43jJ+DZhnjj3lBT2Q0FViv9aLctCxyFaW
	RuSkECYhn98hrKlAKOFraBq3V1bZaOhQ24YotTT3tXNMoOj+ZGFScjLs2KSTrR5V8/hx
	L+Vw==
Received: by 10.50.158.129 with SMTP id wu1mr6457986igb.33.1338283742950; Tue,
	29 May 2012 02:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Tue, 29 May 2012 02:28:42 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FC49590.6030601@intel.com>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
	<1338212677.20169.75.camel@ted> <4FC488CF.2030803@intel.com>
	<4FC49590.6030601@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 29 May 2012 12:28:42 +0300
Message-ID: <CAK18fxFZ_rYXEeeaLwH1Npx=f6dUJw2LHiKxkBg=OKm6=yAhEQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmEaV6ZF2w37TgBNvK6tRviLw09DeEN4//fId5y7ILNrG9uXYWvqQ6vLmt7Rb4hszlPsKC5
Subject: Re: dbus test suite
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
X-List-Received-Date: Tue, 29 May 2012 09:39:21 -0000
Content-Type: multipart/alternative; boundary=14dae93403951b76bd04c1297762

--14dae93403951b76bd04c1297762
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 29, 2012 at 12:23 PM, Radu Moisan <radu.moisan@intel.com> wrote:

>
> How do I add something in the dependency chain? With --enable-test dbus
> fails at do_configure complaining about
>
>
> | configure: Full test coverage was requested with --enable-tests=yes
> | configure: This has many dependencies (GLib, dbus-glib, Python)
> | checking for i586-poky-linux-pkg-config... no
> | checking for pkg-config...
> /home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
> | checking pkg-config is at least version 0.9.0... yes
> | checking for GLIB... yes
> | checking for DBUS_GLIB... yes
> | configure: Full test coverage (--enable-tests=yes) requires Python,
> dbus-python, pygobject
> | checking for a Python interpreter with version >= 2.6... python
> | checking for python...
> /home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/python
> | checking for python version... 2.7
> | checking for python platform... linux2
> | checking for python script directory... ${libdir}/python2.7/site-packages
> | checking for python extension module directory...
> ${libdir}/python2.7/site-packages
> | checking for Python modules for full test coverage... Traceback (most
> recent call last):
> |   File "<string>", line 1, in <module>
> | ImportError: No module named dbus
> | no
>
>
This says that the configure cannot find the dbus python module. This is
created in the python-dbus package. So compile that first.

>
>
> Radu
>
>  Leaving --enable-tests aside for a moment, I'm trying to build dbus with
> --enable-embedded-tests which is less but still good instead of nothing.
> However, the build fails at do_compile complaining about
> dbus/dbus-glib-lowlevel.h missing, although it's there. So I think some
> variable in Makefile is not pointing correctly, but I cannot find which.
>
> | i586-poky-linux-libtool: link: i586-poky-linux-ar cru
> .libs/libdbus-testutils.a .libs/test-utils.o
> | i586-poky-linux-libtool: link: i586-poky-linux-ranlib
> .libs/libdbus-testutils.a
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "
> libdbus-testutils.la" && ln -s "../libdbus-testutils.la" "
> libdbus-testutils.la" )
> | dbus-daemon.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h: No such
> file or directory
> | compilation terminated.
> | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
> -march=i586
> --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
> -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
> -Wnested-externs -Wpointer-arith -Wcast-align -Wno-address -Wfloat-equal
> -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
> -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
> -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o test-segfault test-segfault.o
> | make[3]: *** [test_dbus_daemon-dbus-daemon.o] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
> -march=i586
> --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
> -Wall -Wchar-subsERROR: Function failed: do_compile (see
> /home/radu/Documents/Development/yocto/build/tmp/work/i586-poky-linux/dbus-1.4.20-r3.0/temp/log.do_compile.10606
> for further information)
> | cripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
> -Wpointer-arith -Wcast-align -Wno-address -Wfloat-equal
> -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
> -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
> -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o test-exit test-exit.o
> | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
> -march=i586
> --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
> -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
> -Wnested-externs -Wpointer-arith -Wcast-align -Wno-address -Wfloat-equal
> -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
> -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
> -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o test-sleep-forever
> test-sleep-forever.o
> | loopback.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h: No such file
> or directory
> | compilation terminated.
> | make[3]: *** [test_loopback-loopback.o] Error 1
> | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
> -march=i586
> --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
> -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
> -Wnested-externs -Wpointer-arith -Wcast-align -Wno-address -Wfloat-equal
> -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
> -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
> -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -o spawn-test spawn-test.o
> ../dbus/.libs/libdbus-internal.a -lpthread -lrt
> | corrupt.c:33:37: fatal error: dbus/dbus-glib-lowlevel.h: No such file or
> directory
>

You will need dbus-glib. This is the package which provides this header.
This will be a dependency for your case.

Hope i gave to the right hints. If you need more detailed info just ping me.

@g

--14dae93403951b76bd04c1297762
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, May 29, 2012 at 12:23 PM, Radu Moisan <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_bla=
nk">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">


 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <br>How do I add something in the dependency chain? With --enable-test
      dbus fails at do_configure complaining about<br><blockquote type=3D"c=
ite">
      <br>
      <small><font face=3D"Droid Sans Mono">| configure: Full test
          coverage was requested with --enable-tests=3Dyes<br>
          | configure: This has many dependencies (GLib, dbus-glib,
          Python)<br>
          | checking for i586-poky-linux-pkg-config... no<br>
          | checking for pkg-config...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/=
bin/pkg-config<br>
          | checking pkg-config is at least version 0.9.0... yes<br>
          | checking for GLIB... yes<br>
          | checking for DBUS_GLIB... yes<br>
          | configure: Full test coverage (--enable-tests=3Dyes) requires
          Python, dbus-python, pygobject<br>
          | checking for a Python interpreter with version &gt;=3D 2.6...
          python<br>
          | checking for python...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/=
bin/python<br>
          | checking for python version... 2.7<br>
          | checking for python platform... linux2<br>
          | checking for python script directory...
          ${libdir}/python2.7/site-packages<br>
          | checking for python extension module directory...
          ${libdir}/python2.7/site-packages<br>
          | checking for Python modules for full test coverage...
          Traceback (most recent call last):<br>
          |=A0=A0 File &quot;&lt;string&gt;&quot;, line 1, in &lt;module&gt=
;<br>
          | ImportError: No module named dbus<br>
          | no</font></small></blockquote></div></div></div></blockquote><d=
iv><br></div><div>This says that the configure cannot find the dbus python =
module. This is created in the python-dbus package. So compile that first.<=
/div>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000"><d=
iv><div class=3D"h5"><blockquote type=3D"cite"><br>
      <br>
      Radu<br>
      <br>
    </blockquote></div></div>
    Leaving --enable-tests aside for a moment, I&#39;m trying to build dbus
    with --enable-embedded-tests which is less but still good instead of
    nothing. However, the build fails at do_compile complaining about
    dbus/dbus-glib-lowlevel.h missing, although it&#39;s there. So I think
    some variable in Makefile is not pointing correctly, but I cannot
    find which.<br>
    <br>
    <small><font face=3D"Droid Sans Mono">| i586-poky-linux-libtool: link:
        i586-poky-linux-ar cru .libs/libdbus-testutils.a
        .libs/test-utils.o<br>
        | i586-poky-linux-libtool: link: i586-poky-linux-ranlib
        .libs/libdbus-testutils.a<br>
        | i586-poky-linux-libtool: link: ( cd &quot;.libs&quot; &amp;&amp; =
rm -f
        &quot;<a href=3D"http://libdbus-testutils.la" target=3D"_blank">lib=
dbus-testutils.la</a>&quot; &amp;&amp; ln -s
        &quot;../<a href=3D"http://libdbus-testutils.la" target=3D"_blank">=
libdbus-testutils.la</a>&quot; &quot;<a href=3D"http://libdbus-testutils.la=
" target=3D"_blank">libdbus-testutils.la</a>&quot; )<br>
        | dbus-daemon.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h:
        No such file or directory<br>
        | compilation terminated.<br>
        | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
        -march=3Di586
        --sysroot=3D/home/radu/Documents/Development/yocto/build/tmp/sysroo=
ts/qemux86
        -Wall -Wchar-subscripts -Wmissing-declarations
        -Wmissing-prototypes -Wnested-externs -Wpointer-arith
        -Wcast-align -Wno-address -Wfloat-equal
        -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
        -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
        -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
        -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o test-segfault
        test-segfault.o<br>
        | make[3]: *** [test_dbus_daemon-dbus-daemon.o] Error 1<br>
        | make[3]: *** Waiting for unfinished jobs....<br>
        | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
        -march=3Di586
        --sysroot=3D/home/radu/Documents/Development/yocto/build/tmp/sysroo=
ts/qemux86
        -Wall -Wchar-subsERROR: Function failed: do_compile (see
        /home/radu/Documents/Development/yocto/build/tmp/work/i586-poky-lin=
ux/dbus-1.4.20-r3.0/temp/log.do_compile.10606
        for further information)<br>
        | cripts -Wmissing-declarations -Wmissing-prototypes
        -Wnested-externs -Wpointer-arith -Wcast-align -Wno-address
        -Wfloat-equal -Wdeclaration-after-statement -Wno-unused
        -Wno-sign-compare -Wno-pointer-sign -Wno-deprecated-declarations
        -fno-common -fno-strict-aliasing -O2 -pipe -g
        -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu
        -Wl,--as-needed -o test-exit test-exit.o<br>
        | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
        -march=3Di586
        --sysroot=3D/home/radu/Documents/Development/yocto/build/tmp/sysroo=
ts/qemux86
        -Wall -Wchar-subscripts -Wmissing-declarations
        -Wmissing-prototypes -Wnested-externs -Wpointer-arith
        -Wcast-align -Wno-address -Wfloat-equal
        -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
        -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
        -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
        -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o
        test-sleep-forever test-sleep-forever.o<br>
        | loopback.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h: No
        such file or directory<br>
        | compilation terminated.<br>
        | make[3]: *** [test_loopback-loopback.o] Error 1<br>
        | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
        -march=3Di586
        --sysroot=3D/home/radu/Documents/Development/yocto/build/tmp/sysroo=
ts/qemux86
        -Wall -Wchar-subscripts -Wmissing-declarations
        -Wmissing-prototypes -Wnested-externs -Wpointer-arith
        -Wcast-align -Wno-address -Wfloat-equal
        -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
        -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
        -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
        -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o spawn-test
        spawn-test.o=A0 ../dbus/.libs/libdbus-internal.a -lpthread -lrt<br>
        | corrupt.c:33:37: fatal error: dbus/dbus-glib-lowlevel.h: No
        such file or directory<br></font></small></div></blockquote><div><b=
r></div><div>You will need dbus-glib. This is the package which provides th=
is header. This will be a dependency for your case.</div><div><br></div>

<div>Hope i gave to the right hints. If you need more detailed info just pi=
ng me.</div><div><br></div><div>@g=A0</div></div>

--14dae93403951b76bd04c1297762--
