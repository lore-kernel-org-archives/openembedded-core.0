Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9ROp-00084K-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:00:56 +0200
Received: from mail76-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE011.bigfish.com (10.9.40.31) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 01:33:27 +0000
Received: from mail76-tx2 (localhost [127.0.0.1])	by mail76-tx2-R.bigfish.com
	(Postfix) with ESMTP id 50ED42E0295;
	Thu,  6 Sep 2012 01:33:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275ch8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail76-tx2 (localhost.localdomain [127.0.0.1]) by mail76-tx2
	(MessageSwitch) id 1346895203289552_29637;
	Thu,  6 Sep 2012 01:33:23 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.239])	by
	mail76-tx2.bigfish.com (Postfix) with ESMTP id 960BF26004A;
	Thu,  6 Sep 2012 01:33:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 01:33:21 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.57]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Wed, 5 Sep 2012 20:33:21 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [for-denzil][meta-oe][PATCH 09/11] kernel: Add
	kernel headers to kernel-dev package
Thread-Index: AQHNi69g16iWHsp3Yk2zmlOC8q56rpd8z2AAgAAMKIA=
Date: Thu, 6 Sep 2012 01:33:19 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A64EE40@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
	<5047F316.8030808@linux.intel.com>
In-Reply-To: <5047F316.8030808@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 02:00:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <92A8989BCB5A9C4C970B2719AE4740C0@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 5, 2012 at 7:49 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 09/05/2012 02:42 PM, McClintock Matthew-B29882 wrote:
>> On Tue, Aug 28, 2012 at 1:41 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> From: Darren Hart <dvhart@linux.intel.com>
>>>
>>> [YOCTO #1614]
>>>
>>> Add the kernel headers to the kernel-dev package. This packages what wa=
s
>>> already built and kept in sysroots for building modules with bitbake.
>>> Making this available on the target requires removing some additional
>>> host binaries.
>>>
>>> Move the location to /usr/src/kernel
>>>
>>> Before use on the target, the user will need to:
>>>
>>>     # cd /usr/src/kernel
>>>     # make scripts
>>>
>>> This renders the kernel-misc recipe empty, so remove it.
>>>
>>> As we use /usr/src/kernel in several places (and I missed one in the
>>> previous version), add a KERNEL_SRC_DIR variable and use that throughou=
t
>>> the class to avoid update errors in the future.
>>>
>>> Now that we package the kernel headers, drop the
>>> kernel_package_preprocess function which removed them from PKGD.
>>>
>>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package wil=
l
>>> be installed by default on all such images.
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> CC: Tom Zanussi <tom.zanussi@intel.com>
>>> CC: Khem Raj <raj.khem@gmail.com>
>>>
>>> ---
>>>  meta/classes/kernel.bbclass |   25 +++++++++++--------------
>>>  meta/conf/bitbake.conf      |    2 +-
>>>  2 files changed, 12 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 3ccd753..d79ba9f 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -77,6 +77,10 @@ EXTRA_OEMAKE =3D ""
>>>
>>>  KERNEL_ALT_IMAGETYPE ??=3D ""
>>>
>>> +# Define where the kernel headers are installed on the target as well =
as where
>>> +# they are staged.
>>> +KERNEL_SRC_PATH =3D "/usr/src/kernel"
>>> +
>>>  KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D "=
.gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>>
>>>  kernel_do_compile() {
>>> @@ -130,7 +134,7 @@ kernel_do_install() {
>>>         # Support for external module building - create a minimal copy =
of the
>>>         # kernel source tree.
>>>         #
>>> -       kerneldir=3D${D}/kernel
>>> +       kerneldir=3D${D}${KERNEL_SRC_PATH}
>>>         install -d $kerneldir
>>>
>>>         #
>>> @@ -191,20 +195,15 @@ kernel_do_install() {
>>>         # Remove the following binaries which cause strip errors
>>>         # during do_package for cross-compiled platforms
>>>         bin_files=3D"arch/powerpc/boot/addnote arch/powerpc/boot/hack-c=
off \
>>> -                  arch/powerpc/boot/mktree"
>>> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o=
 \
>>> +                  scripts/kconfig/conf.o"
>>>         for entry in $bin_files; do
>>>                 rm -f $kerneldir/$entry
>>>         done
>>>  }
>>>
>>> -PACKAGE_PREPROCESS_FUNCS +=3D "kernel_package_preprocess"
>>> -
>>> -kernel_package_preprocess () {
>>> -       rm -rf ${PKGD}/kernel
>>> -}
>>> -
>>>  sysroot_stage_all_append() {
>>> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
>>> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KE=
RNEL_SRC_PATH}
>>>  }
>>>
>>>  kernel_do_configure() {
>>> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configu=
re
>>>
>>>  # kernel-base becomes kernel-${KERNEL_VERSION}
>>>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>> -PACKAGES =3D "kernel kernel-base kernel-image kernel-dev kernel-vmlinu=
x kernel-misc"
>>> +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-de=
v"
>>>  FILES =3D ""
>>>  FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>>> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/co=
nfig*"
>>> +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/co=
nfig* ${KERNEL_SRC_PATH}"
>>
>> This patch is causing the following on denzil (which Scott applied to
>> his denzil-next branch)
>>
>> ERROR: QA Issue: non debug package contains .debug directory:
>> kernel-dev path
>> /work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/packages-split/ke=
rnel-dev/usr/src/kernel/tools/perf/.debug/perf
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in:
>> /local/home/mattsm/git/poky/build-denzil/tmp/work/p5020ds_64b-poky-linux=
/linux-qoriq-sdk-3.0.34-r4/temp/log.do_package.26851
>> NOTE: package linux-qoriq-sdk-3.0.34-r4: task do_package: Failed
>> ERROR: Task 13 (/local/home/mattsm/git/poky/build-denzil/../meta-fsl-ppc=
/recipes-kernel/linux/linux-qoriq-sdk.bb,
>> do_package) failed with exit code '1'
>>
>> At first glance, it looks like we should:
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 7ae2a53..511b22b 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -546,4 +546,5 @@ EXPORT_FUNCTIONS do_deploy
>>  PACKAGES =3D+ "perf-dbg perf"
>>  FILES_perf =3D "${bindir}/* \
>>                ${libexecdir}"
>> -FILES_perf-dbg =3D "${FILES_${PN}-dbg}"
>> +FILES_perf-dbg =3D "${FILES_${PN}-dbg} \
>> +                 ${KERNEL_SRC_PATH}/tools/perf/.debug"
>>
>> Thoughts?
>
> I suppose that or pull in the patches to separate perf into a separate
> recipe, although that's 13+ patches. I prefer your solution for the
> stable tree.
>
> Tom may have another suggestion.

Keeping in mind I'm building a non-Yocto kernel with this...

-M=



