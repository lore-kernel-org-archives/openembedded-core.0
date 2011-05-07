Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QIWbp-000584-69
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 03:47:05 +0200
Received: by yxn22 with SMTP id 22so1506103yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 18:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XZM0halaBOyrPGQCbIrkkXEEoM09WG7P9Cb5wZ9aA8Q=;
	b=xXSadwr7U3Xu4WWPCnarKF+4abGubCJg84dkxjjMsONubd5AhEppyJ0FyaM2Gf/Q1p
	GAJOlK4X8S8vWoCgeqdZsxgdUAeuEZmtnFPGo4JtFN4ARIDvL3GXURYvV0M+CaFp6G4V
	o+6qSR/zpTFpx/CviJ6KkQb0U8Mh3vXEaj7Ok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=RIHw1mHB4LyiF/Lx2+LTUeOXcHctFnLwbCk+OfV/OqpiZ18rOdXkS+WyqncXiqft41
	AEpWJvE6PLiyyFHuPh8zt5tYKtr0lLEAg84jBnx2X76u0W+N75X94jAED5xHspC/g4j2
	aSXoypNAkkWVeU/Vrl+LoR+C2iuEG60+uqvdg=
MIME-Version: 1.0
Received: by 10.91.201.18 with SMTP id d18mr4038818agq.31.1304732662156; Fri,
	06 May 2011 18:44:22 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Fri, 6 May 2011 18:44:22 -0700 (PDT)
In-Reply-To: <4DC4758E.4070209@linux.intel.com>
References: <cover.1304707341.git.bruce.ashfield@windriver.com>
	<a258388e5b8d134009bb37cfc9f6b1c1dd8ba94e.1304707341.git.bruce.ashfield@windriver.com>
	<4DC4758E.4070209@linux.intel.com>
Date: Fri, 6 May 2011 21:44:22 -0400
Message-ID: <BANLkTinMT6T_YL8sC7Puf2OCAYPrar4yoQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com
Subject: Re: [yocto] [PATCH 1/1] linux-yocto: move non-core machines to meta-yocto
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
X-List-Received-Date: Sat, 07 May 2011 01:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 6:26 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/06/2011 11:44 AM, Bruce Ashfield wrote:
>>
>> The machine configuration of the non-core (non-qemu) machines
>> has moved to meta-yocto. Moving the branch mappings, compatibility
>> and SRCREVs of these machines to meta-yocto should also be
>> done.
>>
>> Anyone using meta-yocto to build these machines will see no impact
>> from this change.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>> =A0meta-yocto/conf/layer.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A03 ++-
>> =A0.../linux/linux-yocto-stable_git.bbappend =A0 =A0 =A0 =A0 =A0| =A0 12=
 ++++++++++++
>> =A0.../recipes-kernel/linux/linux-yocto_git.bbappend =A0| =A0 12 +++++++=
+++++
>> =A0.../recipes-kernel/linux/linux-yocto-stable_git.bb | =A0 10 +--------=
-
>> =A0meta/recipes-kernel/linux/linux-yocto_git.bb =A0 =A0 =A0 | =A0 11 +--=
--------
>
> Bruce,
>
> This need to be 2 pull requests, since the first 4 files are actually in
> meta-yotco, part of poky.git and the linux-yocto_git.bb is in OE-core

My clone for meta-yocto is a bit old then, I checked this
explicitly and it isn't a separate repo for me at all, hence
why it's a single patch .. but wait. When I clone again from
poky.git, it's still one repo for me.

So here's the thing. I clone from yocto/poky for this patch, not
from oe-core + some other repos. So asking for splits like this
doesn't make sense (to me), since the repository divisions aren't
clear.

Before I do this, can someone enlighten me about what exactly
I should be cloning to construct the build environment that you
are using (I can guess/figure it out, but that's not the point), since
I work by .git separated repos, so if you want it split, I need that
same split here.

>
> Please split this into 2 requests, one for oe-core, just the
> linux-yocto_git.bb file
>
> and a second one to poky with the reset.
>
> I also noted that you list the emenlow in one of the .bbappend files, but
> only as SRCREV_machine_emenlow, should that be there with Paul's moving
> emenlow to meta-intel?

Nope. That's on purpose, I can't have SRCREVs in 13 different
locations and actually maintain them. meta-intel can have it's
own SRCREV, but for any BSP in the main tree, I'll have a copy
in meta-yocto as well.

Bruuce

>
> Sau!
>
>> =A05 files changed, 28 insertions(+), 20 deletions(-)
>> =A0create mode 100644
>> meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>> =A0create mode 100644
>> meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>>
>> diff --git a/meta-yocto/conf/layer.conf b/meta-yocto/conf/layer.conf
>> index f11d8ed..68786b2 100644
>> --- a/meta-yocto/conf/layer.conf
>> +++ b/meta-yocto/conf/layer.conf
>> @@ -2,7 +2,8 @@
>> =A0BBPATH :=3D "${BBPATH}:${LAYERDIR}"
>>
>> =A0# We have a packages directory, add to BBFILES
>> -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
>> +BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
>> + =A0 =A0 =A0 =A0 =A0 =A0${LAYERDIR}/recipes-*/*/*.bbappend"
>>
>> =A0BBFILE_COLLECTIONS +=3D "yocto"
>> =A0BBFILE_PATTERN_yocto :=3D "^${LAYERDIR}/"
>> diff --git
>> a/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>> b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>> new file mode 100644
>> index 0000000..ea0287d
>> --- /dev/null
>> +++ b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>> @@ -0,0 +1,12 @@
>> +KMACHINE_atom-pc =A0=3D "atom-pc"
>> +KMACHINE_routerstationpro =3D "routerstationpro"
>> +KMACHINE_mpc8315e-rdb =3D "fsl-mpc8315e-rdb"
>> +KMACHINE_beagleboard =3D "beagleboard"
>> +
>> +SRCREV_machine_atom-pc =3D "72ca49ab08b8eb475cec82a10049503602325791"
>> +SRCREV_machine_routerstationpro =3D
>> "49745cd45c92a89e70c6e2334caa80818c134562"
>> +SRCREV_machine_mpc8315e-rdb =3D "a1c0ed6bf4060c10874b2a8547d81b3169dcf1=
6a"
>> +SRCREV_machine_beagleboard =3D "ef7f944e773950d4016b7643f9ecf052bbe250c=
d"
>> +
>> +COMPATIBLE_MACHINE +=3D
>> "(atom-pc|routerstationpro|mpc8315e-rdb|beagleboard)"
>> +
>> diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>> b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>> new file mode 100644
>> index 0000000..e4aa7fd
>> --- /dev/null
>> +++ b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>> @@ -0,0 +1,12 @@
>> +KMACHINE_atom-pc =A0=3D "yocto/standard/common-pc/atom-pc"
>> +KMACHINE_routerstationpro =3D "yocto/standard/routerstationpro"
>> +KMACHINE_mpc8315e-rdb =3D "yocto/standard/fsl-mpc8315e-rdb"
>> +KMACHINE_beagleboard =3D "yocto/standard/beagleboard"
>> +
>> +SRCREV_machine_emenlow =3D "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
>> +SRCREV_machine_atom-pc =3D "b906f358fd404a1e74a961f25079274e0d933ee1"
>> +SRCREV_machine_routerstationpro =3D
>> "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
>> +SRCREV_machine_mpc8315e-rdb =3D "53c800c244e73d81d2832f6da306eeae3b09e5=
dc"
>> +SRCREV_machine_beagleboard =3D "b906f358fd404a1e74a961f25079274e0d933ee=
1"
>> +
>> +COMPATIBLE_MACHINE =3D "(mpc8315e-rdb|routerstationpro|beagleboard)"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
>> b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
>> index 93b06fd..66991ae 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
>> @@ -7,10 +7,6 @@ KMACHINE_qemux86-64 =A0=3D "common_pc_64"
>> =A0KMACHINE_qemuppc =A0=3D "qemu_ppc32"
>> =A0KMACHINE_qemumips =3D "mti_malta32_be"
>> =A0KMACHINE_qemuarm =A0=3D "arm_versatile_926ejs"
>> -KMACHINE_atom-pc =A0=3D "atom-pc"
>> -KMACHINE_routerstationpro =3D "routerstationpro"
>> -KMACHINE_mpc8315e-rdb =3D "fsl-mpc8315e-rdb"
>> -KMACHINE_beagleboard =3D "beagleboard"
>>
>> =A0LINUX_VERSION ?=3D "2.6.34"
>> =A0LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
>> @@ -23,10 +19,6 @@ SRCREV_machine_qemumips =3D
>> "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
>> =A0SRCREV_machine_qemuppc =3D "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
>> =A0SRCREV_machine_qemux86 =3D "72ca49ab08b8eb475cec82a10049503602325791"
>> =A0SRCREV_machine_qemux86-64 =3D "72ca49ab08b8eb475cec82a100495036023257=
91"
>> -SRCREV_machine_atom-pc =3D "72ca49ab08b8eb475cec82a10049503602325791"
>> -SRCREV_machine_routerstationpro =3D
>> "49745cd45c92a89e70c6e2334caa80818c134562"
>> -SRCREV_machine_mpc8315e-rdb =3D "a1c0ed6bf4060c10874b2a8547d81b3169dcf1=
6a"
>> -SRCREV_machine_beagleboard =3D "ef7f944e773950d4016b7643f9ecf052bbe250c=
d"
>> =A0SRCREV_machine =3D "72ca49ab08b8eb475cec82a10049503602325791"
>> =A0SRCREV_meta =3D "ec26387cb168e9e0976999b528b5a9dd62e3157a"
>>
>> @@ -34,7 +26,7 @@ PR =3D "r1"
>> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> =A0SRCREV_FORMAT =3D "meta_machine"
>>
>> -COMPATIBLE_MACHINE =3D
>> "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|atom-pc|routerstationpro|m=
pc8315e-rdb|beagleboard)"
>> +COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>>
>> =A0# this performs a fixup on historical kernel types with embedded _'s
>> =A0python __anonymous () {
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb
>> b/meta/recipes-kernel/linux/linux-yocto_git.bb
>> index 3b4e77e..d4f2ece 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_git.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
>> @@ -7,10 +7,6 @@ KMACHINE_qemux86-64 =A0=3D "yocto/standard/common-pc-64=
/base"
>> =A0KMACHINE_qemuppc =A0=3D "yocto/standard/qemu-ppc32"
>> =A0KMACHINE_qemumips =3D "yocto/standard/mti-malta32-be"
>> =A0KMACHINE_qemuarm =A0=3D "yocto/standard/arm-versatile-926ejs"
>> -KMACHINE_atom-pc =A0=3D "yocto/standard/common-pc/atom-pc"
>> -KMACHINE_routerstationpro =3D "yocto/standard/routerstationpro"
>> -KMACHINE_mpc8315e-rdb =3D "yocto/standard/fsl-mpc8315e-rdb"
>> -KMACHINE_beagleboard =3D "yocto/standard/beagleboard"
>>
>> =A0KBRANCH =3D ${KMACHINE}
>> =A0KMETA =3D meta
>> @@ -23,11 +19,6 @@ SRCREV_machine_qemumips =3D
>> "f5d26f2eda2be8b942172cda8f27de33ebf38ec3"
>> =A0SRCREV_machine_qemuppc =3D "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
>> =A0SRCREV_machine_qemux86 =3D "ad62d1aab734513cd96c8f4517f816420a218e77"
>> =A0SRCREV_machine_qemux86-64 =3D "b906f358fd404a1e74a961f25079274e0d933e=
e1"
>> -SRCREV_machine_emenlow =3D "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
>> -SRCREV_machine_atom-pc =3D "b906f358fd404a1e74a961f25079274e0d933ee1"
>> -SRCREV_machine_routerstationpro =3D
>> "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
>> -SRCREV_machine_mpc8315e-rdb =3D "53c800c244e73d81d2832f6da306eeae3b09e5=
dc"
>> -SRCREV_machine_beagleboard =3D "b906f358fd404a1e74a961f25079274e0d933ee=
1"
>> =A0SRCREV_machine =3D "b906f358fd404a1e74a961f25079274e0d933ee1"
>> =A0SRCREV_meta =3D "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
>>
>> @@ -37,7 +28,7 @@ SRCREV_FORMAT =3D "meta_machine"
>>
>> =A0SRC_URI =3D
>> "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dgit;nocheckout=
=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>>
>> -COMPATIBLE_MACHINE =3D
>> "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|mpc8315e-rdb|routerstation=
pro|beagleboard)"
>> +COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>>
>> =A0# Functionality flags
>> =A0KERNEL_REVISION_CHECKING ?=3D "t"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


