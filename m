Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S24MN-0006Fj-M7
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 18:27:39 +0100
Received: by bkcjg15 with SMTP id jg15so1493615bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 09:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.23.100 as permitted sender) client-ip=10.112.23.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.23.100 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.23.100])
	by 10.112.23.100 with SMTP id l4mr6135391lbf.24.1330363153404 (num_hops
	= 1); Mon, 27 Feb 2012 09:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=/GztKDQidzrqYTh0TJ5T/uShT0HW7LJqeHEfgoFW+mA=;
	b=TZ4tYIiD6mT2exUn5iNYxsNGhww+mvPOhOFAfeFxXsctcVsVWqqiXFzxXvs95BC6Ot
	kAyOjcqyDl5Qembqa5RubVsFaXB3OrnPpe2FQCBqlzIsRDBMJ5LiKJnsjTr/bhoUloBA
	AlAgpeJ2j4P4J4pzy6v+u1n7d71uXcMvgDU2c=
Received: by 10.112.23.100 with SMTP id l4mr5158230lbf.24.1330363153311; Mon,
	27 Feb 2012 09:19:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 27 Feb 2012 09:18:43 -0800 (PST)
In-Reply-To: <4F4B886C.6030704@communistcode.co.uk>
References: <4F4B878A.6000802@communistcode.co.uk>
	<4F4B886C.6030704@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Feb 2012 09:18:43 -0800
Message-ID: <CAMKF1spcVOZcbDKuHyfEW3Q+whU7VP=zFyW3XenDZB_mu4EhWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 27 Feb 2012 17:27:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 5:43 AM, Jack Mitchell <ml@communistcode.co.uk> wro=
te:
> On 27/02/12 13:39, Jack Mitchell wrote:
>
> I receive the following error when compiling Angstrom related to udev 181=
.
>
> In file included from src/extras/mtd_probe/mtd_probe.c:19:0:
> src/extras/mtd_probe/mtd_probe.h:20:26: fatal error: mtd/mtd-user.h: No s=
uch
> file or directory
> compilation terminated.
> src/extras/mtd_probe/probe_smartmedia.c:22:26: fatal error: mtd/mtd-user.=
h:
> No such file or directory
> compilation terminated.

these headers come from linux-libc-headers which I suppose is staged
in your sysroot ?


> make[2]: ***
> [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-mtd_probe.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: ***
> [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-probe_smartmedia.o]
> Error 1
> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc
> -march=3Darmv7-a -fno-tree-vectorize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -mthum=
b-interwork -mfloat-abi=3Dsoftfp
> -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/beaglebone
> -shared=C2=A0 -fPIC -DPIC=C2=A0 src/.libs/libudev.o src/.libs/libudev-lis=
t.o
> src/.libs/libudev-util.o src/.libs/libudev-device.o
> src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
> src/.libs/libudev-queue.o=C2=A0=C2=A0 -lrt=C2=A0 -march=3Darmv7-a -mthumb=
-interwork
> -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/beaglebone
> -O2 -Wl,--gc-sections -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed=C2=A0=C2=A0 -Wl,-soname -Wl,libudev.so.0 -o
> src/.libs/libudev.so.0.13.1
> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc
> -march=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoft=
fp
> -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/beaglebone
> -Wall -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
> -Wpointer-arith -Wpointer-arith -Wsign-compare -Wchar-subscripts
> -Wstrict-prototypes -Wshadow -Wformat-security -Wtype-limits
> -fvisibility=3Dhidden -ffunction-sections -fdata-sections -O2 -pipe -g
> -feliminate-unused-debug-types -Wl,--gc-sections -Wl,--as-needed -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -o src/extras/keymap/keymap
> src/extras/keymap/src_extras_keymap_keymap-keymap.o=C2=A0 -lrt
> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar c=
ru
> src/.libs/libudev-private.a src/.libs/libudev.o src/.libs/libudev-list.o
> src/.libs/libudev-util.o src/.libs/libudev-device.o
> src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
> src/.libs/libudev-queue.o src/.libs/libudev-util-private.o
> src/.libs/libudev-device-private.o src/.libs/libudev-queue-private.o
> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranl=
ib
> src/.libs/libudev-private.a
> arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs" && rm -f
> "libudev-private.la" && ln -s "../libudev-private.la" "libudev-private.la=
" )
> arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs" && rm -f
> "libudev.so.0" && ln -s "libudev.so.0.13.1" "libudev.so.0")
> arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs" && rm -f
> "libudev.so" && ln -s "libudev.so.0.13.1" "libudev.so")
> arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs" && rm -f
> "libudev.la" && ln -s "../libudev.la" "libudev.la" )
> make[1]: *** [all-recursive] Error 1
> make: *** [all] Error 2
> + die 'oe_runmake failed'
> + bbfatal 'oe_runmake failed'
> + echo 'ERROR: oe_runmake failed'
> ERROR: oe_runmake failed
> + exit 1
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
>
>
> Ok it's building again, seems it was some sort of race issue. I had tried
> re-running it 5/6 times and it was consistently failing so I assumed it
> wasn't race related. I am compiling with -j12 so such a high concurrency =
may
> be the issue.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


