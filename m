Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 414C7700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FEUsas011474; Mon, 15 Feb 2016 14:30:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WYcUiETK8aEh; Mon, 15 Feb 2016 14:30:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FEUnBL011471
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Feb 2016 14:30:50 GMT
Message-ID: <1455546649.16142.419.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 14:30:49 +0000
In-Reply-To: <1455483171-66851-5-git-send-email-raj.khem@gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
	<1455483171-66851-5-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/5] binutils: Use tip of 2.26 branch
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
X-List-Received-Date: Mon, 15 Feb 2016 14:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-02-14 at 20:52 +0000, Khem Raj wrote:
> Until 2.26.1 is released there are few fixes which are needed
> especially
> when using -fpie, here are changes that are part of this version bump
> 
> H.J. Lu (7):
>       Add a testcase for PR ld/18591
>       Store estimated distances in compressed_size
>       Remove duplicated marker for 2.26 in gas/NEWS
>       Add -mrelax-relocations= to x86 assembler
>       Mask off the least significant bit in GOT offset
>       Enable -Bsymbolic and -Bsymbolic-functions to PIE
>       Fix a typo in objcopy manual
> 
> John David Anglin (1):
>       Fix /usr/bin/ld: final link failed: File truncated error on
> hppa

I think this is resulting in:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
ds/625/steps/BuildImages_1/logs/stdio

and

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/
builds/638/steps/BuildImages_1/logs/stdio

where config.log in one case says:

configure:4407: checking for C compiler default output file name
configure:4429: arm-poky-linux-gnueabi-gcc  -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/home/pokybuild/yoc
to-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/beaglebone  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_S
OURCE=2  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now conftest.c  >&5
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld: 
error: a.out uses VFP register arguments, /tmp/ccbzGaSi.o does not
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld: failed to merge target specific data of file /tmp/ccbzGaSi.o
collect2: error: ld returned 1 exit status

Cheers,

Richard

