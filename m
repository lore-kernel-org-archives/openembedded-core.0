Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E354C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 17:11:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.429.1708708300326106871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 09:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gbO1SvG6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41NHBcAm129081;
	Fri, 23 Feb 2024 11:11:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708708298;
	bh=qF/yvZbnSMP9kpQdkOieMtOJnYK/rievvO5k04wLuqE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gbO1SvG6S1OkJNGiZPpbdHg94k73M10PfC2kOoh/cRhNSUEoQWSDrgPIWLAzzFVL2
	 toUeDUvGJz7gOWpnGmYYT8ikkNQemFVKVoRpZ84UZMD9l3rXwIWNE8zAKiRPTBAiL1
	 nBRUVmKzHUR9b68XajWSZgogE13EKPXV1Z9PD7D0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41NHBcn8003754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Feb 2024 11:11:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Feb 2024 11:11:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Feb 2024 11:11:38 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41NHBcJg045926;
	Fri, 23 Feb 2024 11:11:38 -0600
Message-ID: <913ae651-71cb-435e-9647-84dbb9f02f16@ti.com>
Date: Fri, 23 Feb 2024 11:11:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 3/3] kernel: make LOCALVERSION
 consistent between recipes
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Andreas Helbech Kleist <andreaskleist@gmail.com>,
        <openembedded-core@lists.openembedded.org>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
 <20240222103545.2970387-4-andreaskleist@gmail.com>
 <b0eff6e6-f931-4fff-bcf4-dcff40562fc8@ti.com>
 <CADkTA4NqBZafroO5qVQ9ATM1_xNidxkwmkVTPb9msDhGiooceA@mail.gmail.com>
 <17B650DBED7FC1F0.14827@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17B650DBED7FC1F0.14827@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41NHBcAm129081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 17:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196103



On 2/22/2024 4:46 PM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
>=20
> On 2/22/2024 3:56 PM, Bruce Ashfield wrote:
>> On Thu, Feb 22, 2024 at 4:51=E2=80=AFPM Ryan Eatmon via lists.openembe=
dded.org
>> <reatmon=3Dti.com@lists.openembedded.org> wrote:
>>>
>>>
>>>
>>> On 2/22/2024 4:35 AM, Andreas Helbech Kleist wrote:
>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>
>>>> The initial fix for localversion setting in 6.3+ broke older
>>>> recipes and also broke recipes setting localversion in a kernel
>>>> recipe, as make-mod-scripts (and other locations) can trigger
>>>> a regeneration of files and don't have access to the variable.
>>>>
>>>> Moving the setting of this variable to the global namespace
>>>> doesn't make sense, so we follow the example of the kernel-abiversio=
n
>>>> and save a kernel-localversion to the build artifacts.
>>>>
>>>> Recipes that may regenerate scripts/dynamic files, must
>>>> depend on the do_shared_workedir of the kernel and use the helper
>>>> function to read the file storing the localversion.
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>>
>>>> cherry-picked from master b378eec156998eea55ba61e59103cb34fab0d07c
>>>>
>>>> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>>>
>>> I'm not sure what is going on with our meta-ti testing.=C2=A0 This se=
t of
>>> changes causes the same issue we were seeing before.=C2=A0 Plus, now =
that I'm
>>> looking into it deeper, I'm seeing a breakage in master related to th=
ese
>>> same patches on there.=C2=A0 Not sure why the changes were not caught=
 in our
>>> testing on master back when the patches were accepted there...=C2=A0 =
Clearly
>>> I need some better checks on the images as part of our QC process...
>>>
>>> I need to figure out how to fix the issue on master and see if the sa=
me
>>> change can be applied to these patches on kirkstone.=C2=A0 I'll try a=
nd get
>>> all this done as quickly as I can.
>>
>> Please make sure to copy me directly, both as the maintainer of the
>> parts of core in question and the author of the patches.
>>
>> We've had no reports of issues since any of these went in, and they
>> aren't exactly a recent change. Which obviously means there's
>> potentially something different in the environment or the kernel
>> recipes.
>>
>> If you get a set of reproducing steps with linux-yocto and core, I
>> can lend a hand with any fixes.
>>
>> Bruce
>=20
> This may not be an issue with these patches per se.=C2=A0 It may be an =
issue=20
> with our kernel recipes in meta-ti.=C2=A0 But since kirkstone is our pr=
imary=20
> release vector right now, it is breaking us to accept these patches ont=
o=20
> kirkstone.=C2=A0 I fully acknowledge that this might solely a TI issue.=
=C2=A0 And=20
> now that we are aware of the issue we are going to work very very hard=20
> to find a solution as quickly as we can.
>=20
> As soon as we have an understanding of how to recreate the issue outsid=
e=20
> of our recipe we will definitely share with this thread.
>=20

Ok.  My initial thinking that there was a problem was incorrect.  I=20
looked at the file system and found our value for KERNEL_LOCALVERSION=20
was included in the modules directory name twice.

/lib/modules/6.1.69-gcb84067eaf83-gcb84067eaf83

That was the symptom that caused the issue with our request for the=20
revert last week.  However, with this full patch series the problem=20
caused by the double entry from the last series is not a problem because=20
the double entry is everywhere in the kernel, so it all works together.=20
It's just goofy.

So with that.  This bigger series can be accepted into Kirkstone.

Acked-by: Ryan Eatmon <reatmon@ti.com>



Now for the second issue, and maybe this was known that it would occur,=20
if we set KERNEL_LOCALVERSION it is placed into both the .scmversion=20
file AND the LOCALVERSION variable.  The setlocalversion script in the=20
6.1 kernel we are currently pointing at for our production includes both=20
in the version string, which causes the entire kernel to be named named=20
with a redundant string.

/lib/modules/6.1.69-gcb84067eaf83-gcb84067eaf83

I guess we can live with this.  It is unnecessary, but not incorrect.=20
It is cleaned up with the next LTS kernel 6.6.  This is just the hazard=20
of only having a single class to handle kernel issues that needs to span=20
multiple kernel versions that are changing things up in big ways.

The only way I can see to fix it would be to create some new control=20
variables that recipes can set to control the above behavior and then=20
set defaults for them.

But we can look into patches to add that if needed.

Apologies for taking so much time in testing this series.  We are just=20
about to make a release and things that break the kernel cause us a lot=20
anxiety.


>>>
>>>
>>>
>>>> ---
>>>> =C2=A0=C2=A0 meta/classes/kernel-arch.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 --------
>>>> =C2=A0=C2=A0 meta/classes/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=20
>>>> ++++++++++++++
>>>> =C2=A0=C2=A0 meta/classes/kernelsrc.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0=C2=A0 meta/classes/linux-kernel-base.bbclass=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>>> =C2=A0=C2=A0 meta/classes/module-base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0=C2=A0 .../make-mod-scripts/make-mod-scripts_1.0.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>>>> =C2=A0=C2=A0 6 files changed, 30 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel-arch.bbclass=20
>>>> b/meta/classes/kernel-arch.bbclass
>>>> index 0a79dea0af..62c8211621 100644
>>>> --- a/meta/classes/kernel-arch.bbclass
>>>> +++ b/meta/classes/kernel-arch.bbclass
>>>> @@ -65,11 +65,3 @@ KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc=20
>>>> ${HOST_CC_KERNEL_ARCH} -fuse-ld=3Dbfd ${DE
>>>> =C2=A0=C2=A0 KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_=
KERNEL_ARCH}"
>>>> =C2=A0=C2=A0 KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERN=
EL_ARCH}"
>>>> =C2=A0=C2=A0 TOOLCHAIN ?=3D "gcc"
>>>> -
>>>> -# 6.3+ requires the variable LOCALVERSION to be set to not get a=20
>>>> "+" in
>>>> -# the local version. Having it empty means nothing will be added,=20
>>>> and any
>>>> -# value will be appended to the local kernel version. This replaces=
=20
>>>> the
>>>> -# use of .scmversion file for setting a localversion without using
>>>> -# the CONFIG_LOCALVERSION option.
>>>> -KERNEL_LOCALVERSION ??=3D ""
>>>> -export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbcla=
ss
>>>> index 940f1a3cf4..96e41b5192 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -541,6 +541,7 @@ do_shared_workdir () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "${KERNEL_VERSION}" >=20
>>>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 echo "${KERNEL_LOCALVERSION}" >=20
>>>> $kerneldir/${KERNEL_PACKAGE_NAME}-localversion
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy files required for modul=
e builds
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp System.map $kerneldir/System=
.map-${KERNEL_VERSION}
>>>> @@ -630,6 +631,19 @@ python check_oldest_kernel() {
>>>> =C2=A0=C2=A0 check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL=
=20
>>>> KERNEL_VERSION"
>>>> =C2=A0=C2=A0 do_configure[prefuncs] +=3D "check_oldest_kernel"
>>>>
>>>> +KERNEL_LOCALVERSION ??=3D ""
>>>> +
>>>> +# 6.3+ requires the variable LOCALVERSION to be set to not get a=20
>>>> "+" in
>>>> +# the local version. Having it empty means nothing will be added,=20
>>>> and any
>>>> +# value will be appended to the local kernel version. This replaces=
=20
>>>> the
>>>> +# use of .scmversion file for setting a localversion without using
>>>> +# the CONFIG_LOCALVERSION option.
>>>> +#
>>>> +# Note: This class saves the value of localversion to a file
>>>> +# so other recipes like make-mod-scripts can restore it via the
>>>> +# helper function get_kernellocalversion_file
>>>> +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
>>>> +
>>>> =C2=A0=C2=A0 kernel_do_configure() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # fixes extra + in /lib/modules=
/2.6.37+
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # $ scripts/setlocalversion . =3D=
> +
>>>> diff --git a/meta/classes/kernelsrc.bbclass=20
>>>> b/meta/classes/kernelsrc.bbclass
>>>> index a951ba3325..a79bf18b09 100644
>>>> --- a/meta/classes/kernelsrc.bbclass
>>>> +++ b/meta/classes/kernelsrc.bbclass
>>>> @@ -5,6 +5,7 @@ do_patch[depends] +=3D "virtual/kernel:do_shared_wor=
kdir"
>>>> =C2=A0=C2=A0 do_patch[noexec] =3D "1"
>>>> =C2=A0=C2=A0 do_package[depends] +=3D "virtual/kernel:do_populate_sy=
sroot"
>>>> =C2=A0=C2=A0 KERNEL_VERSION =3D=20
>>>> "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>>>> +LOCAL_VERSION =3D=20
>>>> "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>>>>
>>>> =C2=A0=C2=A0 inherit linux-kernel-base
>>>>
>>>> diff --git a/meta/classes/linux-kernel-base.bbclass=20
>>>> b/meta/classes/linux-kernel-base.bbclass
>>>> index 73a6fe36d9..0e2a4a4abe 100644
>>>> --- a/meta/classes/linux-kernel-base.bbclass
>>>> +++ b/meta/classes/linux-kernel-base.bbclass
>>>> @@ -33,6 +33,17 @@ def get_kernelversion_file(p):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except IOError:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
None
>>>>
>>>> +def get_kernellocalversion_file(p):
>>>> +=C2=A0=C2=A0=C2=A0 fn =3D p + '/kernel-localversion'
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 try:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(fn, 'r') as f:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return f.readlines()[0].strip()
>>>> +=C2=A0=C2=A0=C2=A0 except IOError:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ""
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return ""
>>>> +
>>>> =C2=A0=C2=A0 def linux_module_packages(s, d):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suffix =3D ""
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return " ".join(map(lambda s: "=
kernel-module-%s%s" %=20
>>>> (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
>>>> diff --git a/meta/classes/module-base.bbclass=20
>>>> b/meta/classes/module-base.bbclass
>>>> index 27bd69ff33..5b2fde8144 100644
>>>> --- a/meta/classes/module-base.bbclass
>>>> +++ b/meta/classes/module-base.bbclass
>>>> @@ -14,6 +14,7 @@ export CROSS_COMPILE =3D "${TARGET_PREFIX}"
>>>> =C2=A0=C2=A0 export KBUILD_OUTPUT =3D "${STAGING_KERNEL_BUILDDIR}"
>>>>
>>>> =C2=A0=C2=A0 export KERNEL_VERSION =3D=20
>>>> "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion=
')}"
>>>> +export LOCALVERSION =3D=20
>>>> "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-localversi=
on')}"
>>>> =C2=A0=C2=A0 KERNEL_OBJECT_SUFFIX =3D ".ko"
>>>>
>>>> =C2=A0=C2=A0 # kernel modules are generally machine specific
>>>> diff --git=20
>>>> a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=20
>>>> b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>> index f6f47cfff5..8727d003f9 100644
>>>> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>> @@ -21,6 +21,9 @@ DEPENDS +=3D "gmp-native"
>>>> =C2=A0=C2=A0 EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS=
}=20
>>>> ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}""
>>>> =C2=A0=C2=A0 EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXX=
FLAGS}=20
>>>> ${BUILD_LDFLAGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
>>>>
>>>> +KERNEL_LOCALVERSION =3D=20
>>>> "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>>>> +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
>>>> +
>>>> =C2=A0=C2=A0 # Build some host tools under work-shared.=C2=A0 CC, LD=
, and AR are=20
>>>> probably
>>>> =C2=A0=C2=A0 # not used, but this is the historical way of invoking =
"make=20
>>>> scripts".
>>>> =C2=A0=C2=A0 #
>>>
>>> --=20
>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>> -----------------------------------------
>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>>>
>>>
>>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196045): https://lists.openembedded.org/g/openembed=
ded-core/message/196045
> Mute This Topic: https://lists.openembedded.org/mt/104505983/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

