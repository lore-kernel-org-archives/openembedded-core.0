Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1C3719E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 22:24:11 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 49so2415295uac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 15:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sbsW/lxKCKifFsyCGPGbpRkzOoZayqpRHfBKwkKCVvE=;
	b=kduZsq7Q+q6NypCQ18H9OuUfQ/JxCNNNX5kSBjCw3gZXw98cJs/Nm4Ixy6sFCote4o
	sp+kfYLVVem4t+Iy2R97/uR9zGYtlYDF9nu/Hc82ipUMeld42k/9ol1cHvz8j7gr8CWG
	V178D4ElrA3lPCBu5cdXYwg0vjoUKywIigz6q0FRjmngryt2RUqQ1Ch56PyXzZFwmiGo
	uoTJ1ogKneKCxov2WPJuwhs64vph3T3QBYEZadfGrZWkIQ/wNu4rO61itAM030FauILz
	/jvMuelXUZJSHn1XDdjid2/IEC5FBKU6y9nA8q+mvBD+CBdA9uCXw0UhruHKuxZm5spT
	N0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sbsW/lxKCKifFsyCGPGbpRkzOoZayqpRHfBKwkKCVvE=;
	b=gt7N5qNtgGizI19C52C7VZpikfhNY7k2oI/uP0aCLcBBdGr+NFyPPDshrH7rDgKu+9
	DQrm5WgmJKxGoHrhWRTsS/CFKOPmyOXXh4Cq3jlJH4cQKawkrIHmo8TsT8T13e+Vk7PX
	S8jvDkK/e/P0BJOQkKW9V23UZzSV1PBTgOHotzyIGxlq0zkAA4Wa97jYqKlsk9Jpm+v9
	ZPs004ufRTICYuVIGdI2nplieYJybuWDZyCRBSGlLvwN4CuXjlEayOrv6eQGovLJ9OEn
	t8TthDHXEZvabEJy4Fb3ryRgQHACoIny4DW5+/DvUWujLrZvFVzNfti0nqpImOArFxao
	eRlw==
X-Gm-Message-State: AA6/9RmsMvY/bx2uGzpI3RtYGGySeEbjDJlrfwDD1aVcCMETyxKEM/UL+7H1mtrp8n2ThQh4rq+LIxUFqSZlXg==
X-Received: by 10.176.67.2 with SMTP id k2mr230060uak.153.1475533452541; Mon,
	03 Oct 2016 15:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Mon, 3 Oct 2016 15:24:11 -0700 (PDT)
In-Reply-To: <CAFkk2KSCRAuCTTxoDdVuKJd7jeZBqO6-RAsq4ZaMnOS2wExhGA@mail.gmail.com>
References: <1475497055-1059-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAFkk2KSCRAuCTTxoDdVuKJd7jeZBqO6-RAsq4ZaMnOS2wExhGA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 4 Oct 2016 00:24:11 +0200
Message-ID: <CAFkk2KSTr+x_93DP-=ag-Oj4bmcDz5ep1r77xqKGyX6pZ_Zd8g@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] classes/uboot-extlinux-config: Add class
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
X-List-Received-Date: Mon, 03 Oct 2016 22:24:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 4, 2016 at 12:08 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Hello,
>
> On Mon, Oct 3, 2016 at 2:17 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> This class allow the extlinux.conf generation for U-Boot use.
>> The U-Boot support for it is given to allow the Generic Distribution
>> Configuration specification use by OpenEmbedded-based products.
>>
>> This class can be inherited by u-boot recipes to create extlinux.conf
>> and boot using menu options.
>>
>> U-boot with extlinux support is machine dependent, so to use this class
>> you need to set UBOOT_EXTLINUX to 1 in machine configuration file and
>> also set root= kernel cmdline UBOOT_EXTLINUX_ROOT. This variable is used
>> to pass root kernel cmdline, e.g:
>>
>> UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk2p2"
>>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/uboot-extlinux-config.bbclass | 130 +++++++++++++++++++++++++++++
>>  1 file changed, 130 insertions(+)
>>  create mode 100644 meta/classes/uboot-extlinux-config.bbclass
>>
>> diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
>> new file mode 100644
>> index 0000000..a4dc0c0
>> --- /dev/null
>> +++ b/meta/classes/uboot-extlinux-config.bbclass
>> @@ -0,0 +1,130 @@
>> +# uboot-extlinux-config.bbclass
>> +#
>> +# This class allow the extlinux.conf generation for U-Boot use. The
>> +# U-Boot support for it is given to allow the Generic Distribution
>> +# Configuration specification use by OpenEmbedded-based products.
>> +#
>> +# External variables:
>> +#
>> +# UBOOT_EXTLINUX_CONFIG            - Configuration file default set to source dir.
>> +# UBOOT_EXTLINUX_CONSOLE           - Set to "console=ttyX" to change kernel boot
>> +#                                    default console.
>> +# UBOOT_EXTLINUX_LABELS            - A list of targets for the automatic config.
>> +# UBOOT_EXTLINUX_KERNEL_ARGS       - Add additional kernel arguments.
>> +# UBOOT_EXTLINUX_KERNEL_IMAGE      - Kernel image name.
>> +# UBOOT_EXTLINUX_FDTDIR            - Device tree directory.
>> +# UBOOT_EXTLINUX_INITRD            - Indicates a list of filesystem images to
>> +#                                    concatenate and use as an initrd (optional).
>> +# UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
>> +# UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
>> +#
>> +# If there's only one label system will boot automatically and menu won't be
>> +# created. If you want to use more than one labels, e.g linux and alternate,
>> +# use overrides to set menu description, console and others variables.
>> +#
>> +# Ex:
>> +#
>> +# UBOOT_EXTLINUX_LABELS ??= "default fallback"
>> +#
>> +# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
>> +# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
>> +#
>> +# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??= "../zImage-fallback"
>> +# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??= "Linux Fallback"
>> +#
>> +# Results:
>> +#
>> +# menu title Select the boot mode
>> +# LABEL Linux Default
>> +#   KERNEL ../zImage
>> +#   FDTDIR ../
>> +#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
>> +# LABEL Linux Fallback
>> +#   KERNEL ../zImage-fallback
>> +#   FDTDIR ../
>> +#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
>> +#
>> +# Copyright (C) 2016, O.S. Systems Software LTDA.  All Rights Reserved
>> +# Released under the MIT license (see packages/COPYING)
>> +#
>> +# The kernel has an internal default console, which you can override with
>> +# a console=...some_tty...
>> +UBOOT_EXTLINUX_CONSOLE ??= "console=${console}"
>> +UBOOT_EXTLINUX_CONFIG ??= "${S}/extlinux.conf"
>> +UBOOT_EXTLINUX_LABELS ??= "linux"
>> +UBOOT_EXTLINUX_FDTDIR ??= "../"
>> +UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
>> +UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
>> +UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
>> +
>> +python create_extlinux_config() {
>> +    if d.getVar("UBOOT_EXTLINUX", False) == "1":
>
> Is there a reason why False is passed here? Passing True would make
> the code more general, as the value of the flag could come from
> another variable, e.g.
>
>   UBOOT_EXTLINUX = "${SOME_FLAG_HELPER_VAR}"
>
> , or from a function, e.g.
>
>   UBOOT_EXTLINUX = "${@needs_uboot_extlinux()}"
>
> As a minor style note, the indentation of the function could be
> decreased by doing
>
>   if d.getVar("UBOOT_EXTLINUX", True) != "1":
>       return
>   ...
>
> That might avoid excessive indentation if you use 'with' as mentioned below.
>
>> +        workdir = d.getVar('WORKDIR', True)
>> +        if not workdir:
>> +            bb.error("WORKDIR not defined, unable to package")
>> +            return
>
> Could be simplified to the following to make it clear that 'workdir'
> is never referenced afterwards (I know there's some existing code like
> the above though):
>
>   if not d.getVar('WORKDIR', True):
>       ...
>
>> +
>> +        labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
>> +        if not labels:
>> +            bb.fatal(1, "UBOOT_EXTLINUX_LABELS not defined, nothing to do")
>> +            return
>
> 'return' is redundant after bb.fatal(). bb.fatal() throws an exception
> (BBHandledException, though that's internalish), so the 'return' will
> never be reached.
>
>> +
>> +        if labels == []:
>> +            bb.fatal(1, "No labels, nothing to do")
>> +            return
>
> Redundant 'return'.
>
>> +
>> +        cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
>> +        if not cfile:
>> +            bb.fatal('Unable to read UBOOT_EXTLINUX_CONFIG')
>> +
>> +        try:
>> +            cfgfile = open(cfile, 'w')
>> +        except OSError:
>> +            bb.fatal('Unable to open %s' % (cfile))
>> +
>> +        cfgfile.write('# Generic Distro Configuration file generated by OpenEmbedded\n')
>> +
>> +        if len(labels.split()) > 1:
>> +            cfgfile.write('menu title Select the boot mode\n')
>> +
>> +        for label in labels.split():
>> +            localdata = bb.data.createCopy(d)
>> +
>> +            overrides = localdata.getVar('OVERRIDES', True)
>> +            if not overrides:
>> +                bb.fatal('OVERRIDES not defined')
>> +
>> +            localdata.setVar('OVERRIDES', label + ':' + overrides)
>> +            bb.data.update_data(localdata)
>> +
>> +            extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE', True)
>> +
>> +            menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION', True)
>> +            if not menu_description:
>> +                menu_description = label
>> +
>> +            root = localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
>> +            if not root:
>> +                bb.fatal('UBOOT_EXTLINUX_ROOT not defined')
>> +
>> +            kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE', True)
>> +            fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR', True)
>> +            if fdtdir:
>> +                cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
>> +                             (menu_description, kernel_image, fdtdir))
>> +            else:
>> +                cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
>> +
>> +            kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS', True)
>> +
>> +            initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD', True)
>> +            if initrd:
>> +                cfgfile.write('\tINITRD %s\n'% initrd)
>> +
>> +            kernel_args = root + " " + kernel_args
>> +            cfgfile.write('\tAPPEND %s %s\n' % (kernel_args, extlinux_console))
>> +
>> +        cfgfile.close()
>
> Using Python's 'with' syntax would be a better way to handle the file.
> That way, the file is guaranteed to be close()d immediately even if
> the function exits via bb.fatal().
>
> It is possible to use 'with' even after opening the file by the way.
> Just do the following:
>
>   with cfgfile:
>       ...
>
>> +}
>> +
>> +do_install[prefuncs] += "create_extlinux_config"
>> --
>> 2.1.4
>>
>> --
>
> I'm not familiar with the functionality itself, so hard to say
> anything constructive there.
>
> Cheers,
> Ulf

The manual doesn't make it perfectly clear that bb.fatal() raises an
exception. I opened a documentation bug for it:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10363

Cheers,
Ulf

