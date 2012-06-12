Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SeZzP-000089-D6
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 00:55:07 +0200
Received: by pbbrq2 with SMTP id rq2so1405706pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 15:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8Cm0NBtVCwJ6U76vkSo8QPNSqZk1n/cgFjjlmRDsC7U=;
	b=U3k4sw4gDi0arobqcRefvXSML6yHCOAOIS3yibT+ImTf9D3op6zzthMkoYRjwsB8T1
	JhqVuU5R+ojHzgo8lh7QGbqphFGQckKPsasVKxWjg1rBqnoLz1XrRSjjfmJ+yRGGAeyp
	s5squKKQoy+BQlTFOXmbfZ+7t5bb8oHXeqcG0Ejogt6lQafhg+5C+0+NJaHNAAXdpB3h
	e5FPyV9Zrv48s6hJIScUVYT6y0aOuKQu+X5oxZ7lpxLI4gKI1YmzQlNyCbjWAv6Xfdc4
	B9bNRPUe7B6y+uBlc9r8vTjUEPmf9nUoXj9cJqp1ks5pbuCNRFnJPh70302GX80HoX6Z
	LBaA==
MIME-Version: 1.0
Received: by 10.68.204.129 with SMTP id ky1mr44270645pbc.32.1339541071283;
	Tue, 12 Jun 2012 15:44:31 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Tue, 12 Jun 2012 15:44:31 -0700 (PDT)
In-Reply-To: <4FD7C088.1030600@intel.com>
References: <cover.1339521554.git.bruce.ashfield@windriver.com>
	<2b7bc8dbfeae528417e737ca139b749f24c11351.1339521554.git.bruce.ashfield@windriver.com>
	<4FD7C088.1030600@intel.com>
Date: Tue, 12 Jun 2012 18:44:31 -0400
Message-ID: <CADkTA4OnQPFJrJzBjCKEP9J-j1s4PEQS4X+FrVvAxcpKuP9RDA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 1/2] linux-yocto/3.4: create linux-yocto-rt recipe
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
X-List-Received-Date: Tue, 12 Jun 2012 22:55:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 6:19 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 06/12/2012 10:22 AM, Bruce Ashfield wrote:
>>
>> Adding the 3.4 variant of the linux-yocto-rt recipe. This updates
>> to 3.4.1-rt9, and builds and boots on the supported targets.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>> =A0meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | =A0 32
>> +++++++++++++++++++++++
>> =A0meta/recipes-kernel/linux/linux-yocto_3.4.bb =A0 =A0| =A0 =A02 +-
>> =A02 files changed, 33 insertions(+), 1 deletions(-)
>> =A0create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> new file mode 100644
>> index 0000000..d7de4b6
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> @@ -0,0 +1,32 @@
>> +inherit kernel
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +KBRANCH =3D "standard/preempt-rt/base"
>> +KBRANCH_qemuppc =3D "standard/preempt-rt/qemu-ppc32"
>> +
>> +LINUX_VERSION ?=3D "3.4.1"
>> +LINUX_KERNEL_TYPE =3D "preempt-rt"
>> +
>> +KMETA =3D "meta"
>> +
>> +SRCREV_machine_machine ?=3D "9dc5e97d144abb03deec411acb9c64883602cff9"
>
>
> Is this correct? ^^^^^^^^

Good eye! My script that creates the SRCREVs apparently doesn't like
the new repo.
Fixed on my branch (it's not required for the build, only for new
machines .. so things
built).

Cheers,

Bruce

>
>
> Sau!
>
>
>> +SRCREV_machine_qemuppc ?=3D "241a41d6104df6916280f1273894bbd7fa7cdd71"
>> +SRCREV_meta ?=3D "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
>> +
>> +PR =3D "r0"
>> +PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +SRC_URI =3D
>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=3Dgit;bareclone=
=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>> +
>> +# Omit broken machines from COMPATIBLE_MACHINE
>> +# =A0 qemuppc hangs at boot
>> +# =A0 qemumips panics at boot
>> +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm)"
>> +
>> +# Functionality flags
>> +KERNEL_FEATURES =3D "features/netfilter"
>> +KERNEL_FEATURES_append =3D " features/taskstats"
>> +KERNEL_FEATURES_append_qemux86 =3D " cfg/sound"
>> +KERNEL_FEATURES_append_qemux86-64 =3D " cfg/sound"
>> +
>> +require recipes-kernel/linux/linux-tools.inc
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> index 9205901..af6130d 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> @@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?=3D
>> "4988a7e34bccd531b511c57f93358de9fcc672a0"
>> =A0SRCREV_machine_qemux86 ?=3D "a8291fa6f723b0182d2b7033b5d59f412ba7cf72=
"
>> =A0SRCREV_machine_qemux86-64 ?=3D "a8291fa6f723b0182d2b7033b5d59f412ba7c=
f72"
>> =A0SRCREV_machine ?=3D "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
>> -SRCREV_meta ?=3D "978f876e4368cdd0ef781e74ea28a6771bf69b79"
>> +SRCREV_meta ?=3D "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
>>
>> =A0SRC_URI =3D
>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=3Dgit;nocheckou=
t=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


