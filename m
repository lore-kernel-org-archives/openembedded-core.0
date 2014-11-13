Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1EF60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 23:35:22 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id u7so10681479qaz.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 15:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sfejVODcwTiuaBoMT2jSDdlTr4FFxjqyCVN2QrufgbU=;
	b=dPkWcsjmjYW/sRbYvOfHbuUHO+ZtJHZ52UkfaJg6+/iAY+2uFOtT4WDGTe0lYAxAAu
	4zJb5/bHtyqxxyS4klFqOTFkYymhfHccc+fJalFWm7VemlpRo+XxdiFXWw9SAyp32Czv
	4nDuX+2/deN23VRQacVd7DztMaccTvBmE1TDRy1rua6otJgU5fcR33b7wWD/tBgcYAA1
	QtqAuPRl553TkDplqIPqgi1NoWtNiD/1i4hnQqkOdvqVpgfB5FJph0ehE0yx2PPHZyjk
	Yeo0XPBzGXEcKtVBHZv/VvAGmzJ1QfU3dtbMVrrt5ojTy/57HeCXiduiYdzHvwRCei6r
	aVew==
MIME-Version: 1.0
X-Received: by 10.140.22.201 with SMTP id 67mr6900654qgn.16.1415921722617;
	Thu, 13 Nov 2014 15:35:22 -0800 (PST)
Received: by 10.96.183.131 with HTTP; Thu, 13 Nov 2014 15:35:22 -0800 (PST)
In-Reply-To: <CAJTo0LZsx0Yswsap_YrKLZNY3E45ZCKdS0asXkQ2iMK7OGbkYw@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
	<CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
	<CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
	<CAJTo0LZsx0Yswsap_YrKLZNY3E45ZCKdS0asXkQ2iMK7OGbkYw@mail.gmail.com>
Date: Thu, 13 Nov 2014 17:35:22 -0600
Message-ID: <CACS+7ZTpz5tkDd13in=A1+_Wdcu868Q1_G9MDJt=Tf_EJ-qMGQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Thu, 13 Nov 2014 23:35:30 -0000
Content-Type: text/plain; charset=UTF-8

On 4 November 2014 07:45, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Dan,
>
> On 16 September 2014 19:45, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> No worries. There's a new version up now. I did some experiments with
>> other machines. Turns out it doesn't
>> work on aarch64.
>
>
> Said I'd merge these once 1.7 out and sadly there's some bad news:
>
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
> In function `__libc_csu_init':
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/glibc/2.20-r0/git/csu/elf-init.c:86:
> undefined reference to `__init_array_start'
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld:
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
> relocation R_386_GOTOFF against undefined hidden symbol `__init_array_start'
> can not be used when making a shared object
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld:
> final link failed: Bad value
> | collect2: error: ld returned 1 exit status
> | Makefile:407: recipe for target 'libasan.la' failed
>
> (https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/87/steps/BuildImages/logs/stdio)
>
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/imx53qsb/usr/lib/libc_nonshared.a(elf-init.oS):
> In function `__libc_csu_init':
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87:
> undefined reference to `__init_array_end'
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87:
> undefined reference to `__init_array_start'
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.1/ld:
> .libs/libasan.so.1.0.0: hidden symbol `__init_array_end' isn't defined
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.1/ld:
> final link failed: Bad value
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [libasan.la] Error 1
>
> (https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/builds/85/steps/BuildImages/logs/stdio)
>
> ERROR: Nothing RPROVIDES 'libsanitizer' (but
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> RDEPENDS on or otherwise requires it)
> ERROR: libsanitizer was skipped: incompatible with host mips-poky-linux (not
> in COMPATIBLE_HOST)
>
> (https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/89/steps/BuildImages/logs/stdio)
>
> Will you be able to work on these?
>
> Ross

Looks like I needed to use the same security CFLAGS as gcc-runtime and
libgcc. There's a new version up on my bitbucket page.

I still haven't found an elegant solution to the package group issue
on MIPS/SPARC though.

