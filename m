Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TTH6j-0002V2-TV
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 20:04:14 +0100
Received: from mail203-va3-R.bigfish.com (10.7.14.237) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 30 Oct 2012 18:50:36 +0000
Received: from mail203-va3 (localhost [127.0.0.1])	by
	mail203-va3-R.bigfish.com (Postfix) with ESMTP id 6C99E7C02CA;
	Tue, 30 Oct 2012 18:50:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i1155h)
Received: from mail203-va3 (localhost.localdomain [127.0.0.1]) by mail203-va3
	(MessageSwitch) id 1351623034153360_19136;
	Tue, 30 Oct 2012 18:50:34 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.242])	by
	mail203-va3.bigfish.com (Postfix) with ESMTP id 236286200A2;
	Tue, 30 Oct 2012 18:50:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 30 Oct 2012 18:50:33 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.121]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Tue, 30 Oct 2012 18:50:33 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNts9wc2/Ph/iHv0quNrquEzw2Eg==
Date: Tue, 30 Oct 2012 18:50:32 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A73724E@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<CADkTA4MzmofTtk7qvhU_2fsfKgmGRPmxf-zUzcj4FkzBDAP_rQ@mail.gmail.com>
In-Reply-To: <CADkTA4MzmofTtk7qvhU_2fsfKgmGRPmxf-zUzcj4FkzBDAP_rQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Oct 2012 19:04:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2DEABD8FC1B56242B56FB102DE567347@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 8:33 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, Oct 18, 2012 at 5:57 AM, Yashpal Dutta
> <yashpal.dutta@freescale.com> wrote:
>> This is a /dev/crypto device driver, equivalent to those in OpenBSD or F=
reeBSD.
>> The main idea is to access of existing ciphers in kernel space from user=
space,
>> thus enabling re-use of a hardware implementation of a cipher.
>
> I always use OCF for an overlapping set of functionality. To make this ex=
ternal
> module gracefully deal with a situation such as this, maybe a check for O=
CF
> in the kernel config ?
>
> The same thing could be said about having a kernel with this functionalit=
y
> already integrated (I have several of those as well).
>
> That's a more general question about what's the best way to gracefully de=
al
> with out of tree modules detecting that they are being built against a ke=
rnel
> that already has the functionality merged. The easy answer is that
> it's something
> the distro maintainer needs to know, and manage, and maybe that's the
> final answer. But I'm more wondering about this with respect to
> inter-operability
> of layers, if something in a layer depends/rdepends on this module, it wi=
ll be
> pulled in, and won't that limit the mix/match/stacking of the various lay=
ers ?
>
> I added Richard for comment on the above.
>
> But that of course raises the question, why should this be in oe-core ver=
sus
> something like OCF ? This is definitely simpler, but OCF has it's use cas=
es and
> advantages as well, that are an overlapping set of functionality.
>
> I don't have all the answers, just plenty of questions :)

I'm not overly familiar with OCF. Does this just RCONFLICT with ocf-linux?

-M

>
> Cheers,
>
> Bruce
>
>
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
>> +
>> +inherit module
>> +
>> +SRCREV =3D "1c24a0aa996630518d47826a2e3fea129ea094c7"
>> +
>> +SRC_URI =3D "git://repo.or.cz/cryptodev-linux.git;protocol=3Dgit \
>> +         file://makefile_fixup.patch"
>> +
>> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
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
>> +       @echo "#define VERSION \"$(VERSION)\"" > version.h
>> +
>> +-install:
>> ++modules_install:
>> +       make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
>> +-      @echo "Installing cryptodev.h in /usr/include/crypto ..."
>> +-      @install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
>> ++      @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..=
."
>> ++      @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryp=
todev.h
>> +
>> + clean:
>> +       make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` clean
>> --
>> 1.7.0.4
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



