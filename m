Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 54CEB779BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 18:07:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g10so19326714wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N1Lk3xRM3I5Gp24NQ5cDUgjeH7G6ydTBHz3yhHKesXc=;
	b=UZv1Dn8eP4AcdwnASCS/MLQkuI0UwgV/r093qOtYNhUTvfF3XYEMsHmxK+oO+dZFLH
	j3M5wfzOyTAgEFu8NlzaFTC7dtlMYAQKoyMy2QvIiRwrXQfzYiqioRXkRgWGdKVVSfhi
	L3hlvkTYZmW7FyxA1JLeByjGqSP3YCquQRMzk/gFyatNu/p9ZxapVfQLn/dbk8wzf6fA
	lA9qxpc9T9BrnjASNeuM942sH1DFO243WMy1zpbHNeZvlDtT1k0SK/BiNtyWmKYxZX0l
	YONY9XTo/aFLPmwDLtPJIL7MNXD2bM+MhkEbB8WLUZOkZKolF8wShGbLKTl1y9aVjNwf
	v5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N1Lk3xRM3I5Gp24NQ5cDUgjeH7G6ydTBHz3yhHKesXc=;
	b=ndZQhKJa/rlidWahrjsxu+HpUEZGv4nn3D1eyAi6S+vzOLPIVgMSSIgVFS1r1vmTcA
	ZacRSOGeEG5/LCMHRrl6wxdAeKNJLIj/USvQy8NxFPeCHf8PAonRS6wNlYt6KjSv+X3W
	q9asEWArRps41So6AIAT0MzjSy394Uw/EL8MjBsmKUsPPpPQlOgzN9lFpV8QApp++BWe
	Un1Xu1NhjkVHqmav+jbNO9UfyRVf4FIMjxnqpmnh6Tcv+sYceL/KgwxC4pZYUOPZeFYI
	dN3CZTfrzDCcEdAKUbjXEC5QWONPWi3WIgoa9cYug8aNQ7qlJOUkJEsNi/NSFE7EvoB8
	doDA==
X-Gm-Message-State: AFeK/H1CDd8F8xFGwyk4QvKmlt8QgJ1xbBO4QK3soCQJSdpxtOey5Pp2wHdczjUZV9lgruBMkklJBAEHJ9wEDQ==
X-Received: by 10.223.142.201 with SMTP id q67mr24736939wrb.182.1490033245734; 
	Mon, 20 Mar 2017 11:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Mon, 20 Mar 2017 11:07:25 -0700 (PDT)
In-Reply-To: <VI1PR0301MB19197C37AD0A002E5A5FFCCBE33A0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
References: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
	<1489929217-24568-3-git-send-email-liu.ming50@gmail.com>
	<CAAQYJAtekfDc6GmD0uhm=qTqf28PQde7-b9Qa1Xa1HHPhWrVsg@mail.gmail.com>
	<VI1PR0301MB19197C37AD0A002E5A5FFCCBE33A0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 20 Mar 2017 19:07:25 +0100
Message-ID: <CAAQYJAv_c8fchMd+TUMFxSD4fa+J1okhxjxrkBAik6fkM6F6Kg@mail.gmail.com>
To: Peter Liu <peter.x.liu@external.atlascopco.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Tao,
	Yue" <yue.tao@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
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
X-List-Received-Date: Mon, 20 Mar 2017 18:07:26 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 4:45 PM, Peter Liu
<peter.x.liu@external.atlascopco.com> wrote:
> Hi, Andrea:
>
>
> Thanks for your testing.
>
>
> I think you are absolutely right, actually I think you had found a fix for a
> potential defect, do_kernel_link_images needs to run after do_compile, and
> this SHOULD be set up in kernel.bbclass but not in linux-yocto.inc, since a
> dependent chain exists in kernel.bbclass as following:
>
>
> do_package->do_install->do_sizecheck->do_strip->do_kernel_link_vmlinux, so
> do_kernel_link_vmlinux->do_compile needs to set up in kernel.bbclass as
> well, am I correct? Or else the recipes inheriting kernel.bbclass might have
> a explicit dependency between do_kernel_link_vmlinux and do_compile. But why
> this did not show up before? Maybe because there is another incorrect
> addtask statement? As it is in kernel.bbclass:
>
>
> 563 addtask do_strip before do_sizecheck after do_kernel_link_images
>
>
> it should be:
>
> addtask strip before do_sizecheck after do_kernel_link_images
>
>
> I am just curious how it worked before without running into errors, but
> anyway I will send a V2 to also address that issue.



Without your last patchset it worked just fine for the case
KERNEL_IMAGETYPE ?= "zImage"

But for the mips target I discovered recently that the
kernel_link_images task was needed and I actually extended it in order
to consder vmlinuz.bin.

If we apply your patchset then this task is an absolute must and it
should be in kernel.bbclass. Our recipe does skip do_install so we
have to readd the task.


Cheers
Andrea

>
>
> the best,
>
> thank you
>
>
>
> ________________________________
> From: Andrea Adami <andrea.adami@gmail.com>
> Sent: Monday, March 20, 2017 10:38:19 AM
> To: openembedded-core
> Cc: Bruce Ashfield; Tao, Yue; Peter Liu
> Subject: Re: [OE-core] [PATCH 2/4] kernel.bbclass: handle kernel-vmlinux in
> KERNEL_IMAGETYPES
>
> On Sun, Mar 19, 2017 at 2:13 PM,  <liu.ming50@gmail.com> wrote:
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> There is a mess after KERNEL_IMAGETYPES was introduced in commit 849b67b2:
>> [ kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time ]
>>
>> There are two packages both providing vmlinux image if 'vmlinux' is set in
>> KERNEL_IMAGETYPES, they are kernel-vmlinux and kernel-image-vmlinux, to
>> let them to be able to coexist, kernel-image-vmlinux was set to empty
>> allowable, but its postinst/postrm scripts still remain trying to
>> install/rm
>> a update-alternatives link to /boot/vmlinux-${KERNEL_VERSION_NAME} but
>> that
>> file is actually being provided by the other package kernel-vmlinux.
>>
>> Fixed this mess by appending vmlinux to KERNEL_IMAGETYPES and process it
>> in anonymous python function. It would not change the original behavior,
>> all the generated packages would be same with before except that the
>> ALLOW_EMPTY variable, it is removed in this patch.
>
> Hi,
>
> I am testing the 'old-style' of embedding the initramfs in the images [1].
> Your patch does add 'vmlinux' even if we have KERNEL_IMAGETYPE ?= "zImage"
> so it leads to the following error:
>
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_deploy
> | install: cannot stat 'arch/arm/boot/vmlinux': No such file or director
>
> The solution for our custom kernel recipe is:
>
> inherit kernel
> addtask kernel_link_images after do_compile before do_strip
>
> as done in linux-yocto.inc.
>
> So with this little adjustment it is still possible to build in the old-way.
>
> I didn't test yet the other part of the patchset so I cannot fully ack it.
> FWIW I never liked the *BUNDLE framework for the need of specifying
> the INITRAMFS_IMAGE in a conf file and not in the kernel recipe as
> done with the old framework.
>
> Cheers
> Andrea
>
> [1]
> http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
>
>
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  meta/classes/kernel.bbclass | 47
>> +++++++++++++++++++--------------------------
>>  1 file changed, 20 insertions(+), 27 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 6905a9b..1a4335c 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -14,6 +14,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>>  # we include gcc above, we dont need virtual/libc
>>  INHIBIT_DEFAULT_DEPS = "1"
>>
>> +KERNEL_IMAGETYPES_append = " vmlinux"
>>  KERNEL_IMAGETYPE ?= "zImage"
>>  INITRAMFS_IMAGE ?= ""
>>  INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}',
>> ''][d.getVar('INITRAMFS_IMAGE') == '']}"
>> @@ -35,38 +36,33 @@ python __anonymous () {
>>      import re
>>
>>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>> KERNEL_IMAGETYPES
>> -    type = d.getVar('KERNEL_IMAGETYPE') or ""
>> -    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>> -    types = d.getVar('KERNEL_IMAGETYPES') or ""
>> -    if type not in types.split():
>> -        types = (type + ' ' + types).strip()
>> -    if alttype not in types.split():
>> -        types = (alttype + ' ' + types).strip()
>> +    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
>> +    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
>> +    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
>> +    types = ' '.join(sorted(types)).strip()
>>      d.setVar('KERNEL_IMAGETYPES', types)
>> -
>> -    typeformake = re.sub(r'\.gz', '', types)
>> -    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>> +    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', re.sub(r'\.gz', '', types))
>>
>>      for type in types.split():
>> -        typelower = type.lower()
>>          imagedest = d.getVar('KERNEL_IMAGEDEST')
>> +        if type == "vmlinux":
>> +            typelower = type.lower()
>> +        else:
>> +            typelower = "image-%s" % type.lower()
>>
>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> -
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/'
>> + type + '-${KERNEL_VERSION_NAME}')
>> -
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower)
>> -
>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>> +        d.appendVar('PACKAGES', ' kernel-%s' % typelower)
>> +        if type != 'vmlinux' or d.getVar('KERNEL_IMAGETYPE') ==
>> 'vmlinux':
>> +            d.appendVar('RDEPENDS_kernel-image', ' kernel-%s' %
>> typelower)
>>
>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> +        d.setVar('FILES_kernel-%s' % typelower,
>> '/%s/%s-${KERNEL_VERSION_NAME}' % (imagedest, type))
>> +        d.setVar('PKG_kernel-%s' % typelower,
>> 'kernel-%s-${KERNEL_VERSION_PKG_NAME}' % typelower)
>>
>>          priority = d.getVar('KERNEL_PRIORITY')
>> -        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' +
>> imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME}
>> ' + priority + ' || true' + '\n'
>> -        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
>> +        postinst = '#!/bin/sh\nupdate-alternatives --install /%s/%s %s
>> %s-${KERNEL_VERSION_NAME} %s || true\n' % (imagedest, type, type, type,
>> priority)
>> +        d.setVar('pkg_postinst_kernel-%s' % typelower, postinst)
>>
>> -        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' +
>> type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>> +        postrm = '#!/bin/sh\nupdate-alternatives --remove %s
>> %s-${KERNEL_VERSION_NAME} || true\n' % (type, type)
>> +        d.setVar('pkg_postrm_kernel-%s' % typelower, postrm)
>>
>>      image = d.getVar('INITRAMFS_IMAGE')
>>      if image:
>> @@ -319,7 +315,6 @@ kernel_do_install() {
>>         done
>>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> -       install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>>         [ -e Module.symvers ] && install -m 0644 Module.symvers
>> ${D}/boot/Module.symvers-${KERNEL_VERSION}
>>         install -d ${D}${sysconfdir}/modules-load.d
>>         install -d ${D}${sysconfdir}/modprobe.d
>> @@ -484,19 +479,17 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>>  # kernel-base becomes kernel-${KERNEL_VERSION}
>>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
>> kernel-modules"
>> +PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-modules"
>>  FILES_${PN} = ""
>>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>  FILES_kernel-image = ""
>>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
>> ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>  FILES_kernel-modules = ""
>>  RDEPENDS_kernel = "kernel-base"
>>  # Allow machines to override this dependency if kernel image files are
>>  # not wanted in images as standard
>>  RDEPENDS_kernel-base ?= "kernel-image"
>>  PKG_kernel-image =
>> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>  PKG_kernel-base =
>> "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>  RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>  ALLOW_EMPTY_kernel = "1"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

