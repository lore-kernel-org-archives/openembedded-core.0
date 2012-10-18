Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TOx00-0005M7-77
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:47:24 +0200
Received: from mail133-co1-R.bigfish.com (10.243.78.231) by
	CO1EHSOBE007.bigfish.com (10.243.66.70) with Microsoft SMTP Server id
	14.1.225.23; Thu, 18 Oct 2012 20:34:03 +0000
Received: from mail133-co1 (localhost [127.0.0.1])	by
	mail133-co1-R.bigfish.com (Postfix) with ESMTP id 4AF54400E2;
	Thu, 18 Oct 2012 20:34:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail133-co1 (localhost.localdomain [127.0.0.1]) by mail133-co1
	(MessageSwitch) id 1350592440493173_28756;
	Thu, 18 Oct 2012 20:34:00 +0000 (UTC)
Received: from CO1EHSMHS025.bigfish.com (unknown [10.243.78.246])	by
	mail133-co1.bigfish.com (Postfix) with ESMTP id 760C0A60044;
	Thu, 18 Oct 2012 20:34:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS025.bigfish.com
	(10.243.66.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 18 Oct 2012 20:33:53 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 18 Oct 2012 20:33:52 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNrW/ikWSgpKAgu0+LKa1V8BZDiA==
Date: Thu, 18 Oct 2012 20:33:52 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
In-Reply-To: <508063AF.9030400@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 20:47:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <90790692C273A54D85DF7D2D5D97211F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 3:16 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 10/18/2012 05:57 AM, Yashpal Dutta wrote:
>> This is a /dev/crypto device driver, equivalent to those in OpenBSD or F=
reeBSD.
>> The main idea is to access of existing ciphers in kernel space from user=
space,
>> thus enabling re-use of a hardware implementation of a cipher.
>>
>> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
>> ---
>>  meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   18 +++++++++++++
>>  .../cryptodev/files/makefile_fixup.patch           |   26 +++++++++++++=
+++++++
>>  2 files changed, 44 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>>  create mode 100644 meta/recipes-kernel/cryptodev/files/makefile_fixup.p=
atch
>>
>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb b/meta/recip=
es-kernel/cryptodev/cryptodev_1.5.bb
>> new file mode 100644
>> index 0000000..5125710
>> --- /dev/null
>> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>> @@ -0,0 +1,18 @@
>> +SECTION =3D "devel"
>> +SUMMARY =3D "Linux Cryptodev KERNEL MODULE"
>> +DESCRIPTION =3D "The Cryptodev package contains the kernel /dev/crypto =
module"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>> +
>> +DEPENDS =3D "virtual/kernel"
>
> This DEPENDS in inherited from the module.bbclass, no need to duplicate
>
>> +
>> +inherit module
>> +
>> +SRCREV =3D "1c24a0aa996630518d47826a2e3fea129ea094c7"
>> +
>> +SRC_URI =3D "git://repo.or.cz/cryptodev-linux.git;protocol=3Dgit \
>> +       file://makefile_fixup.patch"
>
> Tabs to indent, spaces to align. Spaces here please.
>
>> +
>> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
>
> modules.bbclass already sets KERNEL_PATH and KERNEL_SRC, perhaps you
> could use one of those?

cryptodev Makefile does not use these it uses KERNEL_DIR in it's
Makefile for whatever reason. Getting an upstream project to change is
more difficult.

> If you just use ${includedir} in your install I believe you can skip
> PREFIX here and get the /usr part right there.

This is more changes to the upstream Makefile....

>> +
>> +S =3D "${WORKDIR}/git"
>> diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch b/=
meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
>> new file mode 100644
>> index 0000000..323aacd
>> --- /dev/null
>> +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
>> @@ -0,0 +1,26 @@
>> +diff --git a/Makefile b/Makefile
>> +index 2be8825..b36d68c 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -1,6 +1,7 @@
>> + KBUILD_CFLAGS +=3D -I$(src)
>> + KERNEL_DIR =3D /lib/modules/$(shell uname -r)/build
>> + VERSION =3D 1.5
>> ++PREFIX =3D
>> +
>> + cryptodev-objs =3D ioctl.o main.o cryptlib.o authenc.o zc.o util.o
>> +
>> +@@ -12,10 +13,10 @@ build: version.h
>> + version.h: Makefile
>> +     @echo "#define VERSION \"$(VERSION)\"" > version.h
>> +
>> +-install:
>> ++modules_install:
>> +     make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
>
> Current kernels recommend using M=3D instead of SUBDIRS=3D:
>
> SRC :=3D $(shell pwd)
> make -C $(KERNEL_SRC) M=3D$(SRC) modules_install
>
> See the hello-mod example in meta-skeleton/recipes-kernel/hello-mod for
> a minimal example.
>
>> +-    @echo "Installing cryptodev.h in /usr/include/crypto ..."
>> +-    @install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
>> ++    @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
>> ++    @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/crypto=
dev.h
>
> Use ${includedir} here

You can't use this bitbake variable in a Makefile... or am I missing
something? We are making small changes the Makefile for things like
prefix so we can install to locations other than the hosts
/usr/include which is hard coded.

-M

>
>> +
>> + clean:
>> +     make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` clean
>>
>
> M=3D

Is changing upstream cryptodev is one thing (e.g. SUBDIR=3D vs. M=3D), how
far do you want a patch to a Makefile to change the way a project
builds?

-M

>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



