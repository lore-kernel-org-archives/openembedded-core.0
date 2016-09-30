Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 585A36FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 23:07:49 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id p25so168655uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YHhVOIMSpR+eOrSF+4KMu4oUPn1uZPvUONQ+zrB9fZI=;
	b=m9V29pYedECBZwW9BbPbnng1GSKyepxCzvtr1I5mEMoaZwZrndnqcXFEJkt0DkRWVu
	lDyZMnS7XGuj70nn+Em3mOI6B/Kd+B118Uaz2ZDUAA8H4h2CFG6iQmAA+G1JW2fEJQmw
	ioZfvyO1LNI2+oySV1cy5CPCsWNiICG4nkAVgts98/rVA/1GhszW71j6IpZZ83+ywkM8
	l5TVri9DLd5iC4Z2mmZ5mCF6LpAFXUiBykhn8BJZANqCfBal9W3CGpG7+u+vacxYgq0p
	dwbgiAEVTG091efCY7FgiVzj2P8g4hLmbrq7gEPeXyk9ZSvhadb4LMBsd8CYlluHbqlq
	8yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YHhVOIMSpR+eOrSF+4KMu4oUPn1uZPvUONQ+zrB9fZI=;
	b=KTc41BuzB9ifdreJ0qW1cPfNdm2KPg94gZEazS1gHWWJjhEfiVWb6ZOJTCCflbKGAj
	+5SZRFXVWf7E9tzE+z48V8wQTt6ygLgpMSNL2zJEr8rhSE4XLJyFRImBeNzTl81Aj1l9
	LSBHBvlKKh9c2qWfZ/McsA3IeL5/Acad/b8iyMb2mP3zHj1rf/8Zz2/0xILx19FqrGxA
	4RJsRM+nfoD5u0NdFlALgQf/MT6Nj/60dqnxJwzQdeto1ZPzKqkyti5e2cYzpWvxvX1X
	pJcPizU4IVB/nflocezpPdBrIQqy4Cl+19nWFpO2rCQV4aiiY3TeonZFkDC+C1rNk8QQ
	BoVQ==
X-Gm-Message-State: AA6/9Rn+RwsVWFce29Wch6+Q8axDKHseHrgI4qaphCw6PSgNnlrwvdkeDF+A/k8N3KCPZvnPq7SPIz7/PmE5kg==
X-Received: by 10.176.86.84 with SMTP id z20mr6760897uaa.17.1475276870316;
	Fri, 30 Sep 2016 16:07:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Fri, 30 Sep 2016 16:07:49 -0700 (PDT)
In-Reply-To: <CAFkk2KQXbX-EDnEAct1KqHRZRd_6h33NxO1nTV9SSioPsQSkHA@mail.gmail.com>
References: <1475267636-3510-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAFkk2KQXbX-EDnEAct1KqHRZRd_6h33NxO1nTV9SSioPsQSkHA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 1 Oct 2016 01:07:49 +0200
Message-ID: <CAFkk2KQoyjVBgsGzQ60v5oB4fwSMpd15g-GWTfggXeeC12PY5w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] classes/uboot-extlinux-config: Add class
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
X-List-Received-Date: Fri, 30 Sep 2016 23:07:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 1, 2016 at 12:54 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Fri, Sep 30, 2016 at 10:33 PM, Fabio Berton
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
>> index 0000000..3480dd6
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
>> +        workdir = d.getVar('WORKDIR', True)
>> +        if not workdir:
>> +            bb.error("WORKDIR not defined, unable to package")
>> +            return
>> +
>> +        labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
>> +        if not labels:
>> +            bb.debug(1, "UBOOT_EXTLINUX_LABELS not defined, nothing to do")
>> +            return
>> +
>> +        if labels == []:
>> +            bb.debug(1, "No labels, nothing to do")
>> +            return
>> +
>> +        cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
>> +        if not cfile:
>> +            raise bb.build.FuncFailed('Unable to read UBOOT_EXTLINUX_CONFIG')
>> +
>> +        try:
>> +            cfgfile = open(cfile, 'w')
>> +        except OSError:
>> +            raise bb.build.FuncFailed('Unable to open %s' % (cfile))
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
>> +                raise bb.build.FuncFailed('OVERRIDES not defined')
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
>> +                raise bb.build.FuncFailed('UBOOT_EXTLINUX_ROOT not defined')
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
>> +}
>> +
>> +do_install[prefuncs] += "create_extlinux_config"
>> --
>> 2.1.4
>>
>> --
>
> Out of personal curiosity, when would 'raise bb.build.FuncFailed(msg)'
> be preferred over bb.fatal(msg)?
>
> Looking at the FuncFailed() constructor, it seems the argument was
> originally meant to be the name of the function, though no one seems
> to use it like that. It's still called 'name'.

Looks like bitbake/lib/bb/build.py raises a FuncFailed with the
function name. That one's raised as a side effect of calling
bb.fatal() too, after bb.fatal() logs the message and raises
BBHandledException.

Got the following on IRC, so seems bb.fatal() might be more appropriate:

< kergoth> the *original* intent was for the function/task to error
via whatever appropriate means, bb.fatal, whatever, and funcfailed was
what you'd catch if you were calling exec_func/exec_task. that is,
it's what those functions raise, not what metadata functions should be
raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

Cheers,
Ulf

