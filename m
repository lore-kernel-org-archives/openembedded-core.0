Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1SZJ6D-0005MA-LU
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 11:52:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4T9g2ls019695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 02:42:03 -0700 (PDT)
Received: from [128.224.171.127] (128.224.171.127) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 29 May 2012 02:42:02 -0700
Message-ID: <4FC499E9.6090108@windriver.com>
Date: Tue, 29 May 2012 12:42:01 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
	<1338212677.20169.75.camel@ted> <4FC488CF.2030803@intel.com>
	<4FC49590.6030601@intel.com>
	<CAK18fxFZ_rYXEeeaLwH1Npx=f6dUJw2LHiKxkBg=OKm6=yAhEQ@mail.gmail.com>
	<4FC499C4.8000904@intel.com>
In-Reply-To: <4FC499C4.8000904@intel.com>
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
X-List-Received-Date: Tue, 29 May 2012 09:52:22 -0000
Content-Type: multipart/alternative;
	boundary="------------090108020107010406020000"

--------------090108020107010406020000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2012 12:41 PM, Radu Moisan wrote:
>
> On 05/29/2012 12:28 PM, Andrei Gherzan wrote:
>> On Tue, May 29, 2012 at 12:23 PM, Radu Moisan <radu.moisan@intel.com 
>> <mailto:radu.moisan@intel.com>> wrote:
>>
>>
>>     How do I add something in the dependency chain? With
>>     --enable-test dbus fails at do_configure complaining about
>>>
>>>     | configure: Full test coverage was requested with
>>>     --enable-tests=yes
>>>     | configure: This has many dependencies (GLib, dbus-glib, Python)
>>>     | checking for i586-poky-linux-pkg-config... no
>>>     | checking for pkg-config...
>>>     /home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
>>>     | checking pkg-config is at least version 0.9.0... yes
>>>     | checking for GLIB... yes
>>>     | checking for DBUS_GLIB... yes
>>>     | configure: Full test coverage (--enable-tests=yes) requires
>>>     Python, dbus-python, pygobject
>>>     | checking for a Python interpreter with version >= 2.6... python
>>>     | checking for python...
>>>     /home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/python
>>>     | checking for python version... 2.7
>>>     | checking for python platform... linux2
>>>     | checking for python script directory...
>>>     ${libdir}/python2.7/site-packages
>>>     | checking for python extension module directory...
>>>     ${libdir}/python2.7/site-packages
>>>     | checking for Python modules for full test coverage...
>>>     Traceback (most recent call last):
>>>     |   File "<string>", line 1, in <module>
>>>     | ImportError: No module named dbus
>>>     | no
>>
>>
>> This says that the configure cannot find the dbus python module. This 
>> is created in the python-dbus package. So compile that first.
>>
>>>
>>>
>>>     Radu
>>>
>>     Leaving --enable-tests aside for a moment, I'm trying to build
>>     dbus with --enable-embedded-tests which is less but still good
>>     instead of nothing. However, the build fails at do_compile
>>     complaining about dbus/dbus-glib-lowlevel.h missing, although
>>     it's there. So I think some variable in Makefile is not pointing
>>     correctly, but I cannot find which.
>>
>>     | i586-poky-linux-libtool: link: i586-poky-linux-ar cru
>>     .libs/libdbus-testutils.a .libs/test-utils.o
>>     | i586-poky-linux-libtool: link: i586-poky-linux-ranlib
>>     .libs/libdbus-testutils.a
>>     | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f
>>     "libdbus-testutils.la <http://libdbus-testutils.la>" && ln -s
>>     "../libdbus-testutils.la <http://libdbus-testutils.la>"
>>     "libdbus-testutils.la <http://libdbus-testutils.la>" )
>>     | dbus-daemon.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h: No
>>     such file or directory
>>     | compilation terminated.
>>     | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
>>     -march=i586
>>     --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
>>     -Wall -Wchar-subscripts -Wmissing-declarations
>>     -Wmissing-prototypes -Wnested-externs -Wpointer-arith
>>     -Wcast-align -Wno-address -Wfloat-equal
>>     -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
>>     -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
>>     -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
>>     -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-segfault
>>     test-segfault.o
>>     | make[3]: *** [test_dbus_daemon-dbus-daemon.o] Error 1
>>     | make[3]: *** Waiting for unfinished jobs....
>>     | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
>>     -march=i586
>>     --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
>>     -Wall -Wchar-subsERROR: Function failed: do_compile (see
>>     /home/radu/Documents/Development/yocto/build/tmp/work/i586-poky-linux/dbus-1.4.20-r3.0/temp/log.do_compile.10606
>>     for further information)
>>     | cripts -Wmissing-declarations -Wmissing-prototypes
>>     -Wnested-externs -Wpointer-arith -Wcast-align -Wno-address
>>     -Wfloat-equal -Wdeclaration-after-statement -Wno-unused
>>     -Wno-sign-compare -Wno-pointer-sign -Wno-deprecated-declarations
>>     -fno-common -fno-strict-aliasing -O2 -pipe -g
>>     -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu
>>     -Wl,--as-needed -o test-exit test-exit.o
>>     | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
>>     -march=i586
>>     --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
>>     -Wall -Wchar-subscripts -Wmissing-declarations
>>     -Wmissing-prototypes -Wnested-externs -Wpointer-arith
>>     -Wcast-align -Wno-address -Wfloat-equal
>>     -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
>>     -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
>>     -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
>>     -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
>>     test-sleep-forever test-sleep-forever.o
>>     | loopback.c:32:37: fatal error: dbus/dbus-glib-lowlevel.h: No
>>     such file or directory
>>     | compilation terminated.
>>     | make[3]: *** [test_loopback-loopback.o] Error 1
>>     | i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -m32
>>     -march=i586
>>     --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86
>>     -Wall -Wchar-subscripts -Wmissing-declarations
>>     -Wmissing-prototypes -Wnested-externs -Wpointer-arith
>>     -Wcast-align -Wno-address -Wfloat-equal
>>     -Wdeclaration-after-statement -Wno-unused -Wno-sign-compare
>>     -Wno-pointer-sign -Wno-deprecated-declarations -fno-common
>>     -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
>>     -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o spawn-test
>>     spawn-test.o  ../dbus/.libs/libdbus-internal.a -lpthread -lrt
>>     | corrupt.c:33:37: fatal error: dbus/dbus-glib-lowlevel.h: No
>>     such file or directory
>>
>>
>> You will need dbus-glib. This is the package which provides this 
>> header. This will be a dependency for your case.
>>
>> Hope i gave to the right hints. If you need more detailed info just 
>> ping me.
>>
>> @g
>>
> tried to compile python-dbus already but ended up with the second 
> failure about missing dbus/dbus-glib-lowlevel.h (that's when I started 
> experimenting with --enable-embedded-tests and --enable-modular-tests).
>
that would be dbus-glib you need at this point as Andrei pointed out, 
not python-dbus
> Radu
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------090108020107010406020000
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 05/29/2012 12:41 PM, Radu Moisan wrote:
    <blockquote cite="mid:4FC499C4.8000904@intel.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <br>
      On 05/29/2012 12:28 PM, Andrei Gherzan wrote:
      <blockquote
cite="mid:CAK18fxFZ_rYXEeeaLwH1Npx=f6dUJw2LHiKxkBg=OKm6=yAhEQ@mail.gmail.com"
        type="cite">
        <div class="gmail_quote">On Tue, May 29, 2012 at 12:23 PM, Radu
          Moisan <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000">
              <div>
                <div class="h5"> <br>
                  How do I add something in the dependency chain? With
                  --enable-test dbus fails at do_configure complaining
                  about<br>
                  <blockquote type="cite"> <br>
                    <small><font face="Droid Sans Mono">| configure:
                        Full test coverage was requested with
                        --enable-tests=yes<br>
                        | configure: This has many dependencies (GLib,
                        dbus-glib, Python)<br>
                        | checking for i586-poky-linux-pkg-config... no<br>
                        | checking for pkg-config...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config<br>
                        | checking pkg-config is at least version
                        0.9.0... yes<br>
                        | checking for GLIB... yes<br>
                        | checking for DBUS_GLIB... yes<br>
                        | configure: Full test coverage
                        (--enable-tests=yes) requires Python,
                        dbus-python, pygobject<br>
                        | checking for a Python interpreter with version
                        &gt;= 2.6... python<br>
                        | checking for python...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/python<br>
                        | checking for python version... 2.7<br>
                        | checking for python platform... linux2<br>
                        | checking for python script directory...
                        ${libdir}/python2.7/site-packages<br>
                        | checking for python extension module
                        directory... ${libdir}/python2.7/site-packages<br>
                        | checking for Python modules for full test
                        coverage... Traceback (most recent call last):<br>
                        |&nbsp;&nbsp; File "&lt;string&gt;", line 1, in
                        &lt;module&gt;<br>
                        | ImportError: No module named dbus<br>
                        | no</font></small></blockquote>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>This says that the configure cannot find the dbus python
            module. This is created in the python-dbus package. So
            compile that first.</div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000">
              <div>
                <div class="h5">
                  <blockquote type="cite"><br>
                    <br>
                    Radu<br>
                    <br>
                  </blockquote>
                </div>
              </div>
              Leaving --enable-tests aside for a moment, I'm trying to
              build dbus with --enable-embedded-tests which is less but
              still good instead of nothing. However, the build fails at
              do_compile complaining about dbus/dbus-glib-lowlevel.h
              missing, although it's there. So I think some variable in
              Makefile is not pointing correctly, but I cannot find
              which.<br>
              <br>
              <small><font face="Droid Sans Mono">|
                  i586-poky-linux-libtool: link: i586-poky-linux-ar cru
                  .libs/libdbus-testutils.a .libs/test-utils.o<br>
                  | i586-poky-linux-libtool: link:
                  i586-poky-linux-ranlib .libs/libdbus-testutils.a<br>
                  | i586-poky-linux-libtool: link: ( cd ".libs"
                  &amp;&amp; rm -f "<a moz-do-not-send="true"
                    href="http://libdbus-testutils.la" target="_blank">libdbus-testutils.la</a>"
                  &amp;&amp; ln -s "../<a moz-do-not-send="true"
                    href="http://libdbus-testutils.la" target="_blank">libdbus-testutils.la</a>"
                  "<a moz-do-not-send="true"
                    href="http://libdbus-testutils.la" target="_blank">libdbus-testutils.la</a>"
                  )<br>
                  | dbus-daemon.c:32:37: fatal error:
                  dbus/dbus-glib-lowlevel.h: No such file or directory<br>
                  | compilation terminated.<br>
                  | i586-poky-linux-libtool: link: ccache
                  i586-poky-linux-gcc -m32 -march=i586
                  --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86


                  -Wall -Wchar-subscripts -Wmissing-declarations
                  -Wmissing-prototypes -Wnested-externs -Wpointer-arith
                  -Wcast-align -Wno-address -Wfloat-equal
                  -Wdeclaration-after-statement -Wno-unused
                  -Wno-sign-compare -Wno-pointer-sign
                  -Wno-deprecated-declarations -fno-common
                  -fno-strict-aliasing -O2 -pipe -g
                  -feliminate-unused-debug-types -Wl,-O1
                  -Wl,--hash-style=gnu -Wl,--as-needed -o test-segfault
                  test-segfault.o<br>
                  | make[3]: *** [test_dbus_daemon-dbus-daemon.o] Error
                  1<br>
                  | make[3]: *** Waiting for unfinished jobs....<br>
                  | i586-poky-linux-libtool: link: ccache
                  i586-poky-linux-gcc -m32 -march=i586
                  --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86


                  -Wall -Wchar-subsERROR: Function failed: do_compile
                  (see
                  /home/radu/Documents/Development/yocto/build/tmp/work/i586-poky-linux/dbus-1.4.20-r3.0/temp/log.do_compile.10606


                  for further information)<br>
                  | cripts -Wmissing-declarations -Wmissing-prototypes
                  -Wnested-externs -Wpointer-arith -Wcast-align
                  -Wno-address -Wfloat-equal
                  -Wdeclaration-after-statement -Wno-unused
                  -Wno-sign-compare -Wno-pointer-sign
                  -Wno-deprecated-declarations -fno-common
                  -fno-strict-aliasing -O2 -pipe -g
                  -feliminate-unused-debug-types -Wl,-O1
                  -Wl,--hash-style=gnu -Wl,--as-needed -o test-exit
                  test-exit.o<br>
                  | i586-poky-linux-libtool: link: ccache
                  i586-poky-linux-gcc -m32 -march=i586
                  --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86


                  -Wall -Wchar-subscripts -Wmissing-declarations
                  -Wmissing-prototypes -Wnested-externs -Wpointer-arith
                  -Wcast-align -Wno-address -Wfloat-equal
                  -Wdeclaration-after-statement -Wno-unused
                  -Wno-sign-compare -Wno-pointer-sign
                  -Wno-deprecated-declarations -fno-common
                  -fno-strict-aliasing -O2 -pipe -g
                  -feliminate-unused-debug-types -Wl,-O1
                  -Wl,--hash-style=gnu -Wl,--as-needed -o
                  test-sleep-forever test-sleep-forever.o<br>
                  | loopback.c:32:37: fatal error:
                  dbus/dbus-glib-lowlevel.h: No such file or directory<br>
                  | compilation terminated.<br>
                  | make[3]: *** [test_loopback-loopback.o] Error 1<br>
                  | i586-poky-linux-libtool: link: ccache
                  i586-poky-linux-gcc -m32 -march=i586
                  --sysroot=/home/radu/Documents/Development/yocto/build/tmp/sysroots/qemux86


                  -Wall -Wchar-subscripts -Wmissing-declarations
                  -Wmissing-prototypes -Wnested-externs -Wpointer-arith
                  -Wcast-align -Wno-address -Wfloat-equal
                  -Wdeclaration-after-statement -Wno-unused
                  -Wno-sign-compare -Wno-pointer-sign
                  -Wno-deprecated-declarations -fno-common
                  -fno-strict-aliasing -O2 -pipe -g
                  -feliminate-unused-debug-types -Wl,-O1
                  -Wl,--hash-style=gnu -Wl,--as-needed -o spawn-test
                  spawn-test.o&nbsp; ../dbus/.libs/libdbus-internal.a
                  -lpthread -lrt<br>
                  | corrupt.c:33:37: fatal error:
                  dbus/dbus-glib-lowlevel.h: No such file or directory<br>
                </font></small></div>
          </blockquote>
          <div><br>
          </div>
          <div>You will need dbus-glib. This is the package which
            provides this header. This will be a dependency for your
            case.</div>
          <div><br>
          </div>
          <div>Hope i gave to the right hints. If you need more detailed
            info just ping me.</div>
          <div><br>
          </div>
          <div>@g&nbsp;</div>
        </div>
        <br>
      </blockquote>
      tried to compile python-dbus already but ended up with the second
      failure about missing dbus/dbus-glib-lowlevel.h (that's when I
      started experimenting with --enable-embedded-tests and
      --enable-modular-tests).<br>
      <br>
    </blockquote>
    that would be dbus-glib you need at this point as Andrei pointed
    out, not python-dbus<br>
    <blockquote cite="mid:4FC499C4.8000904@intel.com" type="cite"> Radu
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090108020107010406020000--
