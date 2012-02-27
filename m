Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S20z7-0001fP-0b
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 14:51:25 +0100
Received: from [192.168.0.59] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 42E23275BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:42:39 +0000 (GMT)
Message-ID: <4F4B886C.6030704@communistcode.co.uk>
Date: Mon, 27 Feb 2012 13:43:08 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F4B878A.6000802@communistcode.co.uk>
In-Reply-To: <4F4B878A.6000802@communistcode.co.uk>
Subject: Re: udev 181 compilation error
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
X-List-Received-Date: Mon, 27 Feb 2012 13:51:25 -0000
Content-Type: multipart/alternative;
	boundary="------------010905080004070801070404"

--------------010905080004070801070404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/12 13:39, Jack Mitchell wrote:
> I receive the following error when compiling Angstrom related to udev 181.
>
>     In file included from src/extras/mtd_probe/mtd_probe.c:19:0:
>     *src/extras/mtd_probe/mtd_probe.h:20:26: fatal error:
>     mtd/mtd-user.h: No such file or directory
>     compilation terminated.
>     src/extras/mtd_probe/probe_smartmedia.c:22:26: fatal error:
>     mtd/mtd-user.h: No such file or directory
>     compilation terminated.*
>     make[2]: ***
>     [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-mtd_probe.o]
>     Error 1
>     make[2]: *** Waiting for unfinished jobs....
>     make[2]: ***
>     [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-probe_smartmedia.o]
>     Error 1
>     arm-angstrom-linux-gnueabi-libtool: link:
>     arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
>     -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
>     -mfpu=neon -mtune=cortex-a8
>     --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>     -shared  -fPIC -DPIC  src/.libs/libudev.o src/.libs/libudev-list.o
>     src/.libs/libudev-util.o src/.libs/libudev-device.o
>     src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
>     src/.libs/libudev-queue.o   -lrt  -march=armv7-a -mthumb-interwork
>     -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>     --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>     -O2 -Wl,--gc-sections -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu
>     -Wl,--as-needed   -Wl,-soname -Wl,libudev.so.0 -o
>     src/.libs/libudev.so.0.13.1
>     arm-angstrom-linux-gnueabi-libtool: link:
>     arm-angstrom-linux-gnueabi-gcc -march=armv7-a -fno-tree-vectorize
>     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>     --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>     -Wall -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
>     -Wpointer-arith -Wpointer-arith -Wsign-compare -Wchar-subscripts
>     -Wstrict-prototypes -Wshadow -Wformat-security -Wtype-limits
>     -fvisibility=hidden -ffunction-sections -fdata-sections -O2 -pipe
>     -g -feliminate-unused-debug-types -Wl,--gc-sections
>     -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
>     src/extras/keymap/keymap
>     src/extras/keymap/src_extras_keymap_keymap-keymap.o  -lrt
>     arm-angstrom-linux-gnueabi-libtool: link:
>     arm-angstrom-linux-gnueabi-ar cru src/.libs/libudev-private.a
>     src/.libs/libudev.o src/.libs/libudev-list.o
>     src/.libs/libudev-util.o src/.libs/libudev-device.o
>     src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
>     src/.libs/libudev-queue.o src/.libs/libudev-util-private.o
>     src/.libs/libudev-device-private.o src/.libs/libudev-queue-private.o
>     arm-angstrom-linux-gnueabi-libtool: link:
>     arm-angstrom-linux-gnueabi-ranlib src/.libs/libudev-private.a
>     arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs" && rm
>     -f "libudev-private.la" && ln -s "../libudev-private.la"
>     "libudev-private.la" )
>     arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs" && rm -f
>     "libudev.so.0" && ln -s "libudev.so.0.13.1" "libudev.so.0")
>     arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs" && rm -f
>     "libudev.so" && ln -s "libudev.so.0.13.1" "libudev.so")
>     arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs" && rm
>     -f "libudev.la" && ln -s "../libudev.la" "libudev.la" )
>     make[1]: *** [all-recursive] Error 1
>     make: *** [all] Error 2
>     + die 'oe_runmake failed'
>     + bbfatal 'oe_runmake failed'
>     + echo 'ERROR: oe_runmake failed'
>     ERROR: oe_runmake failed
>     + exit 1
>
> Does anyone have any insight to this?
>
> Regards,
> Jack.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Ok it's building again, seems it was some sort of race issue. I had 
tried re-running it 5/6 times and it was consistently failing so I 
assumed it wasn't race related. I am compiling with -j12 so such a high 
concurrency may be the issue.


--------------010905080004070801070404
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 27/02/12 13:39, Jack Mitchell wrote:
    <blockquote cite="mid:4F4B878A.6000802@communistcode.co.uk"
      type="cite">
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      <tt>I receive the following error when compiling Angstrom related
        to udev 181.<br>
        <br>
      </tt>
      <blockquote><tt>In file included from
          src/extras/mtd_probe/mtd_probe.c:19:0:<br>
          <b>src/extras/mtd_probe/mtd_probe.h:20:26: fatal error:
            mtd/mtd-user.h: No such file or directory<br>
            compilation terminated.<br>
            src/extras/mtd_probe/probe_smartmedia.c:22:26: fatal error:
            mtd/mtd-user.h: No such file or directory<br>
            compilation terminated.</b><br>
          make[2]: ***
          [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-mtd_probe.o]
          Error 1<br>
          make[2]: *** Waiting for unfinished jobs....<br>
          make[2]: ***
          [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-probe_smartmedia.o]
          Error 1<br>
          arm-angstrom-linux-gnueabi-libtool: link:
          arm-angstrom-linux-gnueabi-gcc&nbsp; -march=armv7-a
          -fno-tree-vectorize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -mthumb-interwork -mfloat-abi=softfp
          -mfpu=neon -mtune=cortex-a8
          --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone

          -shared&nbsp; -fPIC -DPIC&nbsp; src/.libs/libudev.o
          src/.libs/libudev-list.o src/.libs/libudev-util.o
          src/.libs/libudev-device.o src/.libs/libudev-enumerate.o
          src/.libs/libudev-monitor.o src/.libs/libudev-queue.o&nbsp;&nbsp; -lrt&nbsp;
          -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
          -mtune=cortex-a8
          --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone

          -O2 -Wl,--gc-sections -Wl,--as-needed -Wl,-O1
          -Wl,--hash-style=gnu -Wl,--as-needed&nbsp;&nbsp; -Wl,-soname
          -Wl,libudev.so.0 -o src/.libs/libudev.so.0.13.1<br>
          arm-angstrom-linux-gnueabi-libtool: link:
          arm-angstrom-linux-gnueabi-gcc -march=armv7-a
          -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp
          -mfpu=neon -mtune=cortex-a8
          --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone

          -Wall -Wmissing-declarations -Wmissing-prototypes
          -Wnested-externs -Wpointer-arith -Wpointer-arith
          -Wsign-compare -Wchar-subscripts -Wstrict-prototypes -Wshadow
          -Wformat-security -Wtype-limits -fvisibility=hidden
          -ffunction-sections -fdata-sections -O2 -pipe -g
          -feliminate-unused-debug-types -Wl,--gc-sections
          -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
          -o src/extras/keymap/keymap
          src/extras/keymap/src_extras_keymap_keymap-keymap.o&nbsp; -lrt<br>
          arm-angstrom-linux-gnueabi-libtool: link:
          arm-angstrom-linux-gnueabi-ar cru src/.libs/libudev-private.a
          src/.libs/libudev.o src/.libs/libudev-list.o
          src/.libs/libudev-util.o src/.libs/libudev-device.o
          src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
          src/.libs/libudev-queue.o src/.libs/libudev-util-private.o
          src/.libs/libudev-device-private.o
          src/.libs/libudev-queue-private.o<br>
          arm-angstrom-linux-gnueabi-libtool: link:
          arm-angstrom-linux-gnueabi-ranlib src/.libs/libudev-private.a<br>
          arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs"
          &amp;&amp; rm -f "libudev-private.la" &amp;&amp; ln -s
          "../libudev-private.la" "libudev-private.la" )<br>
          arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs"
          &amp;&amp; rm -f "libudev.so.0" &amp;&amp; ln -s
          "libudev.so.0.13.1" "libudev.so.0")<br>
          arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs"
          &amp;&amp; rm -f "libudev.so" &amp;&amp; ln -s
          "libudev.so.0.13.1" "libudev.so")<br>
          arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs"
          &amp;&amp; rm -f "libudev.la" &amp;&amp; ln -s "../libudev.la"
          "libudev.la" )<br>
          make[1]: *** [all-recursive] Error 1<br>
          make: *** [all] Error 2<br>
          + die 'oe_runmake failed'<br>
          + bbfatal 'oe_runmake failed'<br>
          + echo 'ERROR: oe_runmake failed'<br>
          ERROR: oe_runmake failed<br>
          + exit 1<br>
          <br>
        </tt></blockquote>
      <tt>Does anyone have any insight to this?<br>
        <br>
        Regards,<br>
        Jack.<br>
      </tt> <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <tt><br>
      Ok it's building again, seems it was some sort of race issue. I
      had tried re-running it 5/6 times and it was consistently failing
      so I assumed it wasn't race related. I am compiling with -j12 so
      such a high concurrency may be the issue.<br>
      <br>
    </tt>
  </body>
</html>

--------------010905080004070801070404--
