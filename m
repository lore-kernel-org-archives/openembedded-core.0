Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 03E1D6071F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 12:10:11 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s64so8836558lfs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ah5cExuwck0MB4NMZho1fPeXJGSwJkjS5Vs0HHre61Y=;
	b=J3SKrZU1UcvtvyzuJGFtnjubCp9z6xrucv5Y3sw3lea7Y694FIjrISXlUnb4Ov5xa4
	TedSqxc4Agt+IheZnWjaeuHcPeZlILR8a6URycq2LfR1rv9aDuwIv8hLhYmY6JD67+Jr
	l596d5ZuY6mbEMsPCwgCaqFfgEqjZkhnG2kstd3wGDvvf7REoFtLJWXvUCh+00JHntEU
	EjVthb3Ehw1sWwFJKd7cNshWJQPoE2E9p5j1DqM5bPWVcCwDQX9CS9GYn/puGT9Dj14K
	hCBZQCeiIo9pn3Kz+ynX2QoqYyEwDFEDEIgbpSj/XzuIiDH8hM6cuC0hiJ4JB1TeRsCo
	RYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ah5cExuwck0MB4NMZho1fPeXJGSwJkjS5Vs0HHre61Y=;
	b=P6S0DkMb1bQo7Eit+GCDgbvrexl6mhJkWluKA2iluGyaFG4+JAb2dS5AiCVzMQi01m
	MAhahpvqGe6EMAGpgreqIp5PmEDVB5u1ybEPH4l9B1a/ep5bTB9m4oeCgBnVmfCdAm0Q
	BV0m4BxhgmrQBjSlXM0zsYpcvo8/J/LQnHtDRv6rGj5z9k/pWS9mqFrByWPeQaVyNcKR
	evF8sURv3OhrZNH0yySYYcmW4YIthd2qLXI6os2DCa9E9IK5R5mN7Bi8YCaPOqSSlKrq
	Z7i8uvKeFz/Lea8qf14gRy9l1P1k0+MHvAZpaMy29wu8fR83X+6RAX/qjavns0BBuN7u
	j/Ug==
X-Gm-Message-State: AA6/9RkBCS2SqQK5WWwU4ZG6UOfNDsk0hvxDE1ZjEltFRgssKsZ4kFfWMikkqXqfUF8JQcn2hjgCKrBtDHz04Q==
X-Received: by 10.25.40.83 with SMTP id o80mr7951306lfo.54.1475496612225; Mon,
	03 Oct 2016 05:10:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.24.195 with HTTP; Mon, 3 Oct 2016 05:09:41 -0700 (PDT)
X-Originating-IP: [177.100.224.38]
In-Reply-To: <CAFkk2KQoyjVBgsGzQ60v5oB4fwSMpd15g-GWTfggXeeC12PY5w@mail.gmail.com>
References: <1475267636-3510-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAFkk2KQXbX-EDnEAct1KqHRZRd_6h33NxO1nTV9SSioPsQSkHA@mail.gmail.com>
	<CAFkk2KQoyjVBgsGzQ60v5oB4fwSMpd15g-GWTfggXeeC12PY5w@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 3 Oct 2016 09:09:41 -0300
Message-ID: <CAAPZna04+s6f6KtzuW1_vpJDPJv8Y5DRrV8AmXkonQOiHJC6pg@mail.gmail.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
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
X-List-Received-Date: Mon, 03 Oct 2016 12:10:12 -0000
Content-Type: multipart/alternative; boundary=001a1141196c708e45053df4d3f3

--001a1141196c708e45053df4d3f3
Content-Type: text/plain; charset=UTF-8

Hi Ulf,

Thanks for review.

I agree and I'll change code and use bb.fatal() instead of FuncFailed and
send a v2.

Fabio

On Fri, Sep 30, 2016 at 8:07 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:

> On Sat, Oct 1, 2016 at 12:54 AM, Ulf Magnusson <ulfalizer@gmail.com>
> wrote:
> > On Fri, Sep 30, 2016 at 10:33 PM, Fabio Berton
> > <fabio.berton@ossystems.com.br> wrote:
> >> This class allow the extlinux.conf generation for U-Boot use.
> >> The U-Boot support for it is given to allow the Generic Distribution
> >> Configuration specification use by OpenEmbedded-based products.
> >>
> >> This class can be inherited by u-boot recipes to create extlinux.conf
> >> and boot using menu options.
> >>
> >> U-boot with extlinux support is machine dependent, so to use this class
> >> you need to set UBOOT_EXTLINUX to 1 in machine configuration file and
> >> also set root= kernel cmdline UBOOT_EXTLINUX_ROOT. This variable is used
> >> to pass root kernel cmdline, e.g:
> >>
> >> UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk2p2"
> >>
> >> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/classes/uboot-extlinux-config.bbclass | 130
> +++++++++++++++++++++++++++++
> >>  1 file changed, 130 insertions(+)
> >>  create mode 100644 meta/classes/uboot-extlinux-config.bbclass
> >>
> >> diff --git a/meta/classes/uboot-extlinux-config.bbclass
> b/meta/classes/uboot-extlinux-config.bbclass
> >> new file mode 100644
> >> index 0000000..3480dd6
> >> --- /dev/null
> >> +++ b/meta/classes/uboot-extlinux-config.bbclass
> >> @@ -0,0 +1,130 @@
> >> +# uboot-extlinux-config.bbclass
> >> +#
> >> +# This class allow the extlinux.conf generation for U-Boot use. The
> >> +# U-Boot support for it is given to allow the Generic Distribution
> >> +# Configuration specification use by OpenEmbedded-based products.
> >> +#
> >> +# External variables:
> >> +#
> >> +# UBOOT_EXTLINUX_CONFIG            - Configuration file default set to
> source dir.
> >> +# UBOOT_EXTLINUX_CONSOLE           - Set to "console=ttyX" to change
> kernel boot
> >> +#                                    default console.
> >> +# UBOOT_EXTLINUX_LABELS            - A list of targets for the
> automatic config.
> >> +# UBOOT_EXTLINUX_KERNEL_ARGS       - Add additional kernel arguments.
> >> +# UBOOT_EXTLINUX_KERNEL_IMAGE      - Kernel image name.
> >> +# UBOOT_EXTLINUX_FDTDIR            - Device tree directory.
> >> +# UBOOT_EXTLINUX_INITRD            - Indicates a list of filesystem
> images to
> >> +#                                    concatenate and use as an initrd
> (optional).
> >> +# UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
> >> +# UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
> >> +#
> >> +# If there's only one label system will boot automatically and menu
> won't be
> >> +# created. If you want to use more than one labels, e.g linux and
> alternate,
> >> +# use overrides to set menu description, console and others variables.
> >> +#
> >> +# Ex:
> >> +#
> >> +# UBOOT_EXTLINUX_LABELS ??= "default fallback"
> >> +#
> >> +# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
> >> +# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
> >> +#
> >> +# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??= "../zImage-fallback"
> >> +# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??= "Linux Fallback"
> >> +#
> >> +# Results:
> >> +#
> >> +# menu title Select the boot mode
> >> +# LABEL Linux Default
> >> +#   KERNEL ../zImage
> >> +#   FDTDIR ../
> >> +#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
> >> +# LABEL Linux Fallback
> >> +#   KERNEL ../zImage-fallback
> >> +#   FDTDIR ../
> >> +#   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
> >> +#
> >> +# Copyright (C) 2016, O.S. Systems Software LTDA.  All Rights Reserved
> >> +# Released under the MIT license (see packages/COPYING)
> >> +#
> >> +# The kernel has an internal default console, which you can override
> with
> >> +# a console=...some_tty...
> >> +UBOOT_EXTLINUX_CONSOLE ??= "console=${console}"
> >> +UBOOT_EXTLINUX_CONFIG ??= "${S}/extlinux.conf"
> >> +UBOOT_EXTLINUX_LABELS ??= "linux"
> >> +UBOOT_EXTLINUX_FDTDIR ??= "../"
> >> +UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
> >> +UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
> >> +UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
> >> +
> >> +python create_extlinux_config() {
> >> +    if d.getVar("UBOOT_EXTLINUX", False) == "1":
> >> +        workdir = d.getVar('WORKDIR', True)
> >> +        if not workdir:
> >> +            bb.error("WORKDIR not defined, unable to package")
> >> +            return
> >> +
> >> +        labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
> >> +        if not labels:
> >> +            bb.debug(1, "UBOOT_EXTLINUX_LABELS not defined, nothing to
> do")
> >> +            return
> >> +
> >> +        if labels == []:
> >> +            bb.debug(1, "No labels, nothing to do")
> >> +            return
> >> +
> >> +        cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
> >> +        if not cfile:
> >> +            raise bb.build.FuncFailed('Unable to read
> UBOOT_EXTLINUX_CONFIG')
> >> +
> >> +        try:
> >> +            cfgfile = open(cfile, 'w')
> >> +        except OSError:
> >> +            raise bb.build.FuncFailed('Unable to open %s' % (cfile))
> >> +
> >> +        cfgfile.write('# Generic Distro Configuration file generated
> by OpenEmbedded\n')
> >> +
> >> +        if len(labels.split()) > 1:
> >> +            cfgfile.write('menu title Select the boot mode\n')
> >> +
> >> +        for label in labels.split():
> >> +            localdata = bb.data.createCopy(d)
> >> +
> >> +            overrides = localdata.getVar('OVERRIDES', True)
> >> +            if not overrides:
> >> +                raise bb.build.FuncFailed('OVERRIDES not defined')
> >> +
> >> +            localdata.setVar('OVERRIDES', label + ':' + overrides)
> >> +            bb.data.update_data(localdata)
> >> +
> >> +            extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE',
> True)
> >> +
> >> +            menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION',
> True)
> >> +            if not menu_description:
> >> +                menu_description = label
> >> +
> >> +            root = localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
> >> +            if not root:
> >> +                raise bb.build.FuncFailed('UBOOT_EXTLINUX_ROOT not
> defined')
> >> +
> >> +            kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE',
> True)
> >> +            fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR', True)
> >> +            if fdtdir:
> >> +                cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
> >> +                             (menu_description, kernel_image, fdtdir))
> >> +            else:
> >> +                cfgfile.write('LABEL %s\n\tKERNEL %s\n' %
> (menu_description, kernel_image))
> >> +
> >> +            kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS',
> True)
> >> +
> >> +            initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD', True)
> >> +            if initrd:
> >> +                cfgfile.write('\tINITRD %s\n'% initrd)
> >> +
> >> +            kernel_args = root + " " + kernel_args
> >> +            cfgfile.write('\tAPPEND %s %s\n' % (kernel_args,
> extlinux_console))
> >> +
> >> +        cfgfile.close()
> >> +}
> >> +
> >> +do_install[prefuncs] += "create_extlinux_config"
> >> --
> >> 2.1.4
> >>
> >> --
> >
> > Out of personal curiosity, when would 'raise bb.build.FuncFailed(msg)'
> > be preferred over bb.fatal(msg)?
> >
> > Looking at the FuncFailed() constructor, it seems the argument was
> > originally meant to be the name of the function, though no one seems
> > to use it like that. It's still called 'name'.
>
> Looks like bitbake/lib/bb/build.py raises a FuncFailed with the
> function name. That one's raised as a side effect of calling
> bb.fatal() too, after bb.fatal() logs the message and raises
> BBHandledException.
>
> Got the following on IRC, so seems bb.fatal() might be more appropriate:
>
> < kergoth> the *original* intent was for the function/task to error
> via whatever appropriate means, bb.fatal, whatever, and funcfailed was
> what you'd catch if you were calling exec_func/exec_task. that is,
> it's what those functions raise, not what metadata functions should be
> raising
> < kergoth> it didn't end up being used that way
> < kergoth> but there's really never a reason to raise it yourself
>
> Cheers,
> Ulf
>

--001a1141196c708e45053df4d3f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Ulf,<br><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:small">Thanks for re=
view. <br><br>I agree and I&#39;ll change code and use bb.fatal() instead o=
f FuncFailed and send a v2.<br><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">Fabio<br></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep 30, 20=
16 at 8:07 PM, Ulf Magnusson <span dir=3D"ltr">&lt;<a href=3D"mailto:ulfali=
zer@gmail.com" target=3D"_blank">ulfalizer@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">O=
n Sat, Oct 1, 2016 at 12:54 AM, Ulf Magnusson &lt;<a href=3D"mailto:ulfaliz=
er@gmail.com">ulfalizer@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Sep 30, 2016 at 10:33 PM, Fabio Berton<br>
&gt; &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossy=
stems.com.br</a><wbr>&gt; wrote:<br>
&gt;&gt; This class allow the extlinux.conf generation for U-Boot use.<br>
&gt;&gt; The U-Boot support for it is given to allow the Generic Distributi=
on<br>
&gt;&gt; Configuration specification use by OpenEmbedded-based products.<br=
>
&gt;&gt;<br>
&gt;&gt; This class can be inherited by u-boot recipes to create extlinux.c=
onf<br>
&gt;&gt; and boot using menu options.<br>
&gt;&gt;<br>
&gt;&gt; U-boot with extlinux support is machine dependent, so to use this =
class<br>
&gt;&gt; you need to set UBOOT_EXTLINUX to 1 in machine configuration file =
and<br>
&gt;&gt; also set root=3D kernel cmdline UBOOT_EXTLINUX_ROOT. This variable=
 is used<br>
&gt;&gt; to pass root kernel cmdline, e.g:<br>
&gt;&gt;<br>
&gt;&gt; UBOOT_EXTLINUX_ROOT =3D &quot;root=3D/dev/mmcblk2p2&quot;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@oss=
ystems.com.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
&gt;&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossyst=
ems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/uboot-extlinux-<wbr>config.bbclass | 130 ++++++=
+++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 130 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/classes/uboot-extlinux-<wbr>config.b=
bclass<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/uboot-extlinux-<wbr>config.bbclass b/met=
a/classes/uboot-extlinux-<wbr>config.bbclass<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..3480dd6<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/classes/uboot-extlinux-<wbr>config.bbclass<br>
&gt;&gt; @@ -0,0 +1,130 @@<br>
&gt;&gt; +# uboot-extlinux-config.bbclass<br>
&gt;&gt; +#<br>
&gt;&gt; +# This class allow the extlinux.conf generation for U-Boot use. T=
he<br>
&gt;&gt; +# U-Boot support for it is given to allow the Generic Distributio=
n<br>
&gt;&gt; +# Configuration specification use by OpenEmbedded-based products.=
<br>
&gt;&gt; +#<br>
&gt;&gt; +# External variables:<br>
&gt;&gt; +#<br>
&gt;&gt; +# UBOOT_EXTLINUX_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Configuration file default set to source dir.<br>
&gt;&gt; +# UBOOT_EXTLINUX_CONSOLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
- Set to &quot;console=3DttyX&quot; to change kernel boot<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default cons=
ole.<br>
&gt;&gt; +# UBOOT_EXTLINUX_LABELS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- A list of targets for the automatic config.<br>
&gt;&gt; +# UBOOT_EXTLINUX_KERNEL_ARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0- Add addi=
tional kernel arguments.<br>
&gt;&gt; +# UBOOT_EXTLINUX_KERNEL_IMAGE=C2=A0 =C2=A0 =C2=A0 - Kernel image =
name.<br>
&gt;&gt; +# UBOOT_EXTLINUX_FDTDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Device tree directory.<br>
&gt;&gt; +# UBOOT_EXTLINUX_INITRD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Indicates a list of filesystem images to<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 concatenate =
and use as an initrd (optional).<br>
&gt;&gt; +# UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION=C2=A0 - Name to use as des=
cription.<br>
&gt;&gt; +# UBOOT_EXTLINUX_ROOT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - Root kernel cmdline.<br>
&gt;&gt; +#<br>
&gt;&gt; +# If there&#39;s only one label system will boot automatically an=
d menu won&#39;t be<br>
&gt;&gt; +# created. If you want to use more than one labels, e.g linux and=
 alternate,<br>
&gt;&gt; +# use overrides to set menu description, console and others varia=
bles.<br>
&gt;&gt; +#<br>
&gt;&gt; +# Ex:<br>
&gt;&gt; +#<br>
&gt;&gt; +# UBOOT_EXTLINUX_LABELS ??=3D &quot;default fallback&quot;<br>
&gt;&gt; +#<br>
&gt;&gt; +# UBOOT_EXTLINUX_KERNEL_IMAGE_<wbr>default ??=3D &quot;../zImage&=
quot;<br>
&gt;&gt; +# UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION_default ??=3D &quot;Linux =
Default&quot;<br>
&gt;&gt; +#<br>
&gt;&gt; +# UBOOT_EXTLINUX_KERNEL_IMAGE_<wbr>fallback ??=3D &quot;../zImage=
-fallback&quot;<br>
&gt;&gt; +# UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION_fallback ??=3D &quot;Linux=
 Fallback&quot;<br>
&gt;&gt; +#<br>
&gt;&gt; +# Results:<br>
&gt;&gt; +#<br>
&gt;&gt; +# menu title Select the boot mode<br>
&gt;&gt; +# LABEL Linux Default<br>
&gt;&gt; +#=C2=A0 =C2=A0KERNEL ../zImage<br>
&gt;&gt; +#=C2=A0 =C2=A0FDTDIR ../<br>
&gt;&gt; +#=C2=A0 =C2=A0APPEND root=3D/dev/mmcblk2p2 rootwait rw console=3D=
${console}<br>
&gt;&gt; +# LABEL Linux Fallback<br>
&gt;&gt; +#=C2=A0 =C2=A0KERNEL ../zImage-fallback<br>
&gt;&gt; +#=C2=A0 =C2=A0FDTDIR ../<br>
&gt;&gt; +#=C2=A0 =C2=A0APPEND root=3D/dev/mmcblk2p2 rootwait rw console=3D=
${console}<br>
&gt;&gt; +#<br>
&gt;&gt; +# Copyright (C) 2016, O.S. Systems Software LTDA.=C2=A0 All Right=
s Reserved<br>
&gt;&gt; +# Released under the MIT license (see packages/COPYING)<br>
&gt;&gt; +#<br>
&gt;&gt; +# The kernel has an internal default console, which you can overr=
ide with<br>
&gt;&gt; +# a console=3D...some_tty...<br>
&gt;&gt; +UBOOT_EXTLINUX_CONSOLE ??=3D &quot;console=3D${console}&quot;<br>
&gt;&gt; +UBOOT_EXTLINUX_CONFIG ??=3D &quot;${S}/extlinux.conf&quot;<br>
&gt;&gt; +UBOOT_EXTLINUX_LABELS ??=3D &quot;linux&quot;<br>
&gt;&gt; +UBOOT_EXTLINUX_FDTDIR ??=3D &quot;../&quot;<br>
&gt;&gt; +UBOOT_EXTLINUX_KERNEL_IMAGE ??=3D &quot;../${KERNEL_IMAGETYPE}&qu=
ot;<br>
&gt;&gt; +UBOOT_EXTLINUX_KERNEL_ARGS ??=3D &quot;rootwait rw&quot;<br>
&gt;&gt; +UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION_linux ??=3D &quot;${DISTRO_N=
AME}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +python create_extlinux_config() {<br>
&gt;&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;UBOOT_EXTLINUX&quot;, False) =3D=
=3D &quot;1&quot;:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39=
;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not workdir:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;WORKDIR =
not defined, unable to package&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 labels =3D d.getVar(&#39;UBOOT_EXTLIN=
UX_<wbr>LABELS&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not labels:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;UBOOT=
_EXTLINUX_LABELS not defined, nothing to do&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if labels =3D=3D []:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;No la=
bels, nothing to do&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfile =3D d.getVar(&#39;UBOOT_EXTLINU=
X_<wbr>CONFIG&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cfile:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFail=
ed(&#39;Unable to read UBOOT_EXTLINUX_CONFIG&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile =3D open(cfile,=
 &#39;w&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFail=
ed(&#39;Unable to open %s&#39; % (cfile))<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.write(&#39;# Generic Distro C=
onfiguration file generated by OpenEmbedded\n&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(labels.split()) &gt; 1:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.write(&#39;menu=
 title Select the boot mode\n&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for label in labels.split():<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata =3D bb.data.c=
reateCopy(d)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 overrides =3D localdata=
.getVar(&#39;OVERRIDES&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not overrides:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.=
build.FuncFailed(&#39;OVERRIDES not defined&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;O=
VERRIDES&#39;, label + &#39;:&#39; + overrides)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.update_data(loc=
aldata)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extlinux_console =3D lo=
caldata.getVar(&#39;UBOOT_<wbr>EXTLINUX_CONSOLE&#39;, True)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 menu_description =3D lo=
caldata.getVar(&#39;UBOOT_<wbr>EXTLINUX_MENU_DESCRIPTION&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not menu_description=
:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 menu_desc=
ription =3D label<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root =3D localdata.getV=
ar(&#39;UBOOT_<wbr>EXTLINUX_ROOT&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not root:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.=
build.FuncFailed(&#39;UBOOT_<wbr>EXTLINUX_ROOT not defined&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_image =3D locald=
ata.getVar(&#39;UBOOT_<wbr>EXTLINUX_KERNEL_IMAGE&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdtdir =3D localdata.ge=
tVar(&#39;UBOOT_<wbr>EXTLINUX_FDTDIR&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fdtdir:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.w=
rite(&#39;LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n&#39; %<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(menu_description, kernel_image, f=
dtdir))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.w=
rite(&#39;LABEL %s\n\tKERNEL %s\n&#39; % (menu_description, kernel_image))<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_args =3D localda=
ta.getVar(&#39;UBOOT_<wbr>EXTLINUX_KERNEL_ARGS&#39;, True)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd =3D localdata.ge=
tVar(&#39;UBOOT_<wbr>EXTLINUX_INITRD&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if initrd:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.w=
rite(&#39;\tINITRD %s\n&#39;% initrd)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_args =3D root + =
&quot; &quot; + kernel_args<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.write(&#39;\tAP=
PEND %s %s\n&#39; % (kernel_args, extlinux_console))<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.close()<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_install[prefuncs] +=3D &quot;create_extlinux_config&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.1.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;<br>
&gt; Out of personal curiosity, when would &#39;raise bb.build.FuncFailed(m=
sg)&#39;<br>
&gt; be preferred over bb.fatal(msg)?<br>
&gt;<br>
&gt; Looking at the FuncFailed() constructor, it seems the argument was<br>
&gt; originally meant to be the name of the function, though no one seems<b=
r>
&gt; to use it like that. It&#39;s still called &#39;name&#39;.<br>
<br>
</div></div>Looks like bitbake/lib/bb/build.py raises a FuncFailed with the=
<br>
function name. That one&#39;s raised as a side effect of calling<br>
bb.fatal() too, after bb.fatal() logs the message and raises<br>
BBHandledException.<br>
<br>
Got the following on IRC, so seems bb.fatal() might be more appropriate:<br=
>
<br>
&lt; kergoth&gt; the *original* intent was for the function/task to error<b=
r>
via whatever appropriate means, bb.fatal, whatever, and funcfailed was<br>
what you&#39;d catch if you were calling exec_func/exec_task. that is,<br>
it&#39;s what those functions raise, not what metadata functions should be<=
br>
raising<br>
&lt; kergoth&gt; it didn&#39;t end up being used that way<br>
&lt; kergoth&gt; but there&#39;s really never a reason to raise it yourself=
<br>
<br>
Cheers,<br>
Ulf<br>
</blockquote></div><br></div>

--001a1141196c708e45053df4d3f3--
