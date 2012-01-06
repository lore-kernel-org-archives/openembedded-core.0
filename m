Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RjDqy-000545-Vp
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 18:45:21 +0100
Received: by pbcc11 with SMTP id c11so904341pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6j+N5NAumHKAK9C9qoLac+2BilVaxm4yfIUh47TdH4k=;
	b=aWLKZud+02h6Yp2cf+8YwNOSeJF2rK0gn6nSSQwYXzv0yfg+3eJVuuGQe/9Be+GtV8
	FVMd+lZskOg/BqtaJ8jYsdAz5V1e870oH5xUq6g6n19U/8D9C7zRFV9Ekf/tPotH83Lw
	DLtGYxdkZTc1hXAMJmX/j5lllseF7PskHDvxk=
MIME-Version: 1.0
Received: by 10.68.191.195 with SMTP id ha3mr16902061pbc.130.1325871474825;
	Fri, 06 Jan 2012 09:37:54 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Fri, 6 Jan 2012 09:37:54 -0800 (PST)
In-Reply-To: <4F072989.8060808@linux.intel.com>
References: <1325793967-13002-1-git-send-email-raj.khem@gmail.com>
	<CADkTA4PFLMdSNM47+__79NXwuocFb7Y70o1qwP=+ft2aS4jd1A@mail.gmail.com>
	<CAMKF1spvGpZbV0T_vKbzc4UiBt2bmpj520ymZ5-AA66VwKOOsw@mail.gmail.com>
	<CADkTA4MvYECL=7vxz24PSO8zqw+7Gm-oZ_eqMCJFp1S61ny7jQ@mail.gmail.com>
	<CAMKF1sr481YYkPK-Cn=nb0PAyJXPwOkROvk31mF1+kmwqJXynQ@mail.gmail.com>
	<CADkTA4NU1Pkoinqa792acoC0c9UL6HVotV_-eLY8NFaKh_AueQ@mail.gmail.com>
	<4F072989.8060808@linux.intel.com>
Date: Fri, 6 Jan 2012 12:37:54 -0500
Message-ID: <CADkTA4NX_xxSaByuHf+oqmgj4+gWu9MQjSvw7jiVy=wfKnmw7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.0: Fix compile failure in perf
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
X-List-Received-Date: Fri, 06 Jan 2012 17:45:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 12:04 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/06/2012 07:41 AM, Bruce Ashfield wrote:
>>
>> On Thu, Jan 5, 2012 at 4:20 PM, Khem Raj<raj.khem@gmail.com> =A0wrote:
>>>
>>> On Thu, Jan 5, 2012 at 12:59 PM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> =A0wrote:
>>>>
>>>> On Thu, Jan 5, 2012 at 3:55 PM, Khem Raj<raj.khem@gmail.com> =A0wrote:
>>>>>
>>>>> On Thu, Jan 5, 2012 at 12:13 PM, Bruce Ashfield
>>>>> <bruce.ashfield@gmail.com> =A0wrote:
>>>>>>
>>>>>> On Thu, Jan 5, 2012 at 3:06 PM, Khem Raj<raj.khem@gmail.com> =A0wrot=
e:
>>>>>>>
>>>>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>>>> ---
>>>>>>> =A0...Undef-before-redefining-__attribute_const.patch | =A0 33
>>>>>>> ++++++++++++++++++++
>>>>>>> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =A0 =A0 =A0 | =A0 =
=A04 ++-
>>>>>>> =A02 files changed, 36 insertions(+), 1 deletions(-)
>>>>>>> =A0create mode 100644
>>>>>>> meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-before-=
redefining-__attribute_const.patch
>>>>>>
>>>>>>
>>>>>> Khem,
>>>>>>
>>>>>> I just built multiple linux-yocto kernels, for all the qemu targets
>>>>>> and haven't seen this
>>>>>> error at all. Do you have any special configuration that would be
>>>>>> triggering this ?
>>>>>
>>>>>
>>>>> yes I am building with eglibc 2.15 ( recipes I have not posted yet)
>>>>> and this defines is reported to be defined in usr/include/sys/cdefs.h
>>>>> which is a header from libc.
>>>>
>>>>
>>>> Aha. Perfect. This explains it completely.
>>>>
>>>>>
>>>>>>
>>>>>> The change itself looks sane, and in fact makes sense, since the res=
t
>>>>>> of the file
>>>>>> has the same protection for the new defines. Nothing has changed tha=
t
>>>>>> should have triggered
>>>>>> this to become an issue. I'm just trying to figure out why it has
>>>>>> popped up now.
>>>>>>
>>>>>> I also checked and the 3.2 kernel still has the same issue, so pushi=
ng
>>>>>> it upstream makes
>>>>>> sense as well.
>>>
>>>
>>> btw. I made the change thinking that perf utils want it that way to I
>>> undefine
>>> the previous definitions before redefining. But if it was a placeholder
>>> where
>>> it was defined because something needed it and there was no definitions
>>> from
>>> standard include headers then I think right fix would be to check if it=
s
>>> defined
>>> before redefining it. In both cases the warning will go away
>>>
>>> However with current patch the behaviour remains same as it was but if =
we
>>> check
>>> for definition before redefining then that may change.
>>
>>
>> Agreed. Let's keep the behaviour just as it was (just without warnings
>> for now), and
>> if it needs to change in the future, that's easy enough to do as well.
>>
>> I'm grabbing this change now.
>>
> Just to confirm, with Bruce and Khem:
>
> If this change comes in from Bruce before we grab the 2.15 eglibc, we won=
't
> need the patch, correct?

I'll take the patch now in preparation for any updates to 2.15, and put it =
in
both the 3.0 and -dev (3.2) kernel trees. We won't technically need
it, but there's
no harm when it is in place, so it's fine to have in the tree ahead of time=
.

Cheers,

Bruce

>
> I am going to hold off pulling this patch for now.
>
> Sau!
>
>
>> Cheers,
>>
>> Bruce
>>
>>>
>>>>>>
>>>>>> And I see you asked on IRC, so I'll answer here. Submit a patch to t=
he
>>>>>> kernel like
>>>>>> any upstream kernel change. Simply send the patch right from your
>>>>>> linux working tree,
>>>>>
>>>>>
>>>>> You mean send to oe-core ml here right ?
>>>>
>>>>
>>>> Yep!
>>>>
>>>>>
>>>>>> and I'll pickup the change, merge it into the tree, push it out and
>>>>>> send a pull request
>>>>>> with updated SRCREVs that collect all the queued changes.
>>>>>>
>>>>>
>>>>> Will you be able to bean this patch out from the one I sent or should
>>>>> I resend it ?
>>>>> the patch itself should be git am'able
>>>>
>>>>
>>>> I'll grab it, no need to resend. I'm doing 3.0.16 merging right now,
>>>> so I can collect
>>>> it with that set of changes.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-befor=
e-redefining-__attribute_const.patch
>>>>>>> b/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-befor=
e-redefining-__attribute_const.patch
>>>>>>> new file mode 100644
>>>>>>> index 0000000..b85cc97
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-befor=
e-redefining-__attribute_const.patch
>>>>>>> @@ -0,0 +1,33 @@
>>>>>>> +From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00
>>>>>>> 2001
>>>>>>> +From: Khem Raj<raj.khem@gmail.com>
>>>>>>> +Date: Thu, 5 Jan 2012 11:42:35 -0800
>>>>>>> +Subject: [PATCH] compiler.h: Undef before redefining
>>>>>>> __attribute_const__
>>>>>>> +
>>>>>>> +This is required to avoid warnings like
>>>>>>> +util/include/linux/compiler.h:8:0: error: "__attribute_const__"
>>>>>>> redefined [-Werror]
>>>>>>> +
>>>>>>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>>>> +---
>>>>>>> + tools/perf/util/include/linux/compiler.h | =A0 =A04 +++-
>>>>>>> + 1 files changed, 3 insertions(+), 1 deletions(-)
>>>>>>> +
>>>>>>> +diff --git a/tools/perf/util/include/linux/compiler.h
>>>>>>> b/tools/perf/util/include/linux/compiler.h
>>>>>>> +index 791f9dd..f17ecef 100644
>>>>>>> +--- a/tools/perf/util/include/linux/compiler.h
>>>>>>> ++++ b/tools/perf/util/include/linux/compiler.h
>>>>>>> +@@ -4,9 +4,11 @@
>>>>>>> + #ifndef __always_inline
>>>>>>> + #define __always_inline =A0 =A0 =A0 inline
>>>>>>> + #endif
>>>>>>> ++#undef __user
>>>>>>> + #define __user
>>>>>>> ++#undef __attribute_const__
>>>>>>> + #define __attribute_const__
>>>>>>> +-
>>>>>>> ++#undef __used
>>>>>>> + #define __used =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__attribute__((__un=
used__))
>>>>>>> +
>>>>>>> + #endif
>>>>>>> +--
>>>>>>> +1.7.5.4
>>>>>>> +
>>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>>>>>> b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>>>>>> index b650c84..2e87f7f 100644
>>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>>>>>> @@ -23,7 +23,9 @@ SRCREV_meta ?=3D
>>>>>>> "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
>>>>>>> =A0PR =3D "r2"
>>>>>>> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>>>>>>
>>>>>>> -SRC_URI =3D
>>>>>>> "git://git.yoctoproject.org/linux-yocto-3.0;protocol=3Dgit;nochecko=
ut=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>>>>>>> +SRC_URI =3D
>>>>>>> "git://git.yoctoproject.org/linux-yocto-3.0;protocol=3Dgit;nochecko=
ut=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta
>>>>>>> \
>>>>>>> +
>>>>>>> file://0001-compiler.h-Undef-before-redefining-__attribute_const.pa=
tch \
>>>>>>> + =A0 =A0 =A0 =A0 =A0 "
>>>>>>>
>>>>>>> =A0COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumips|qemux8=
6-64)"
>>>>>>>
>>>>>>> --
>>>>>>> 1.7.5.4
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Openembedded-core mailing list
>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>>> thee at its end"
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end"
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


