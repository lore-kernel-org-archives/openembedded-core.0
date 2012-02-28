Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S2JFI-00020l-U7
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 10:21:21 +0100
Received: from [192.168.0.87] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id ADB4A28C0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 08:11:23 +0000 (GMT)
Message-ID: <4F4C9AA0.8050505@communistcode.co.uk>
Date: Tue, 28 Feb 2012 09:13:04 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F4B878A.6000802@communistcode.co.uk>
	<4F4B886C.6030704@communistcode.co.uk>
	<CAMKF1spcVOZcbDKuHyfEW3Q+whU7VP=zFyW3XenDZB_mu4EhWg@mail.gmail.com>
In-Reply-To: <CAMKF1spcVOZcbDKuHyfEW3Q+whU7VP=zFyW3XenDZB_mu4EhWg@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Feb 2012 09:21:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/12 17:18, Khem Raj wrote:
> On Mon, Feb 27, 2012 at 5:43 AM, Jack Mitchell<ml@communistcode.co.uk>  wrote:
>> On 27/02/12 13:39, Jack Mitchell wrote:
>>
>> I receive the following error when compiling Angstrom related to udev 181.
>>
>> In file included from src/extras/mtd_probe/mtd_probe.c:19:0:
>> src/extras/mtd_probe/mtd_probe.h:20:26: fatal error: mtd/mtd-user.h: No such
>> file or directory
>> compilation terminated.
>> src/extras/mtd_probe/probe_smartmedia.c:22:26: fatal error: mtd/mtd-user.h:
>> No such file or directory
>> compilation terminated.
> these headers come from linux-libc-headers which I suppose is staged
> in your sysroot ?
>
>
>> make[2]: ***
>> [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-mtd_probe.o] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[2]: ***
>> [src/extras/mtd_probe/src_extras_mtd_probe_mtd_probe-probe_smartmedia.o]
>> Error 1
>> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc
>> -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
>> -mfpu=neon -mtune=cortex-a8
>> --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>> -shared  -fPIC -DPIC  src/.libs/libudev.o src/.libs/libudev-list.o
>> src/.libs/libudev-util.o src/.libs/libudev-device.o
>> src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
>> src/.libs/libudev-queue.o   -lrt  -march=armv7-a -mthumb-interwork
>> -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>> --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>> -O2 -Wl,--gc-sections -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu
>> -Wl,--as-needed   -Wl,-soname -Wl,libudev.so.0 -o
>> src/.libs/libudev.so.0.13.1
>> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc
>> -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp
>> -mfpu=neon -mtune=cortex-a8
>> --sysroot=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone
>> -Wall -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
>> -Wpointer-arith -Wpointer-arith -Wsign-compare -Wchar-subscripts
>> -Wstrict-prototypes -Wshadow -Wformat-security -Wtype-limits
>> -fvisibility=hidden -ffunction-sections -fdata-sections -O2 -pipe -g
>> -feliminate-unused-debug-types -Wl,--gc-sections -Wl,--as-needed -Wl,-O1
>> -Wl,--hash-style=gnu -Wl,--as-needed -o src/extras/keymap/keymap
>> src/extras/keymap/src_extras_keymap_keymap-keymap.o  -lrt
>> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar cru
>> src/.libs/libudev-private.a src/.libs/libudev.o src/.libs/libudev-list.o
>> src/.libs/libudev-util.o src/.libs/libudev-device.o
>> src/.libs/libudev-enumerate.o src/.libs/libudev-monitor.o
>> src/.libs/libudev-queue.o src/.libs/libudev-util-private.o
>> src/.libs/libudev-device-private.o src/.libs/libudev-queue-private.o
>> arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranlib
>> src/.libs/libudev-private.a
>> arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs"&&  rm -f
>> "libudev-private.la"&&  ln -s "../libudev-private.la" "libudev-private.la" )
>> arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs"&&  rm -f
>> "libudev.so.0"&&  ln -s "libudev.so.0.13.1" "libudev.so.0")
>> arm-angstrom-linux-gnueabi-libtool: link: (cd "src/.libs"&&  rm -f
>> "libudev.so"&&  ln -s "libudev.so.0.13.1" "libudev.so")
>> arm-angstrom-linux-gnueabi-libtool: link: ( cd "src/.libs"&&  rm -f
>> "libudev.la"&&  ln -s "../libudev.la" "libudev.la" )
>> make[1]: *** [all-recursive] Error 1
>> make: *** [all] Error 2
>> + die 'oe_runmake failed'
>> + bbfatal 'oe_runmake failed'
>> + echo 'ERROR: oe_runmake failed'
>> ERROR: oe_runmake failed
>> + exit 1
>>
>> Does anyone have any insight to this?
>>
>> Regards,
>> Jack.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> Ok it's building again, seems it was some sort of race issue. I had tried
>> re-running it 5/6 times and it was consistently failing so I assumed it
>> wasn't race related. I am compiling with -j12 so such a high concurrency may
>> be the issue.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Hi Khem,

Thanks for your reply but it turned out to be a race issue so it could 
very well be that the linux-libc-headers were staged/not-staged at that 
time.

Cheers,
Jack.


