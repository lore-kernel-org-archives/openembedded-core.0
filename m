Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0E5C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:37:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155.1787845030422930692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kWxzTXjU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F3B14E4131E;
	Thu, 27 Aug 2026 15:37:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD4AB602B8;
	Thu, 27 Aug 2026 15:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F31611C78071;
	Thu, 27 Aug 2026 17:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787845023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=07ndTFJstsQR6ehqXN+NAoFcLefnWiOaahdxDMASKXg=;
	b=kWxzTXjUUXLAAx1TRwi7kly+Oba5FIT8f4ABFpgOX8FNHCLhgRMLLMz83fPd1lZ/+aGVpM
	7YyNqjUwbqd/5F2TNQw/tNsrrgU6jUhh9oNMmDpsFZV+hEe/UkiHK61PgLqzc2Adaz3KLf
	UR0qMEsJwv1vDg9c0zt6zfG+2tnBy/TfpcEyAzmYS/+s4ku4WcFGPiNOceuUwhhDRzdKa5
	BrFuGdyJ1b0vz8hngCEYhEHi7mBTYKHbIMAJk6tTQwhqsLFqbPR87xcRjWiH4nQyWEIK6Y
	ZpkLUjVxYipzFTLiGI7WRkrxDpvmHJSkXOxQrNNCYTh9sWcWEYfIK58B/lg7FQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 17:37:01 +0200
Message-Id: <DKZU60DTZ0YA.193MLWMYN7AU6@bootlin.com>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: introduce
 reference kernel recipes
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
 <20260821112509.861559-4-bruce.ashfield@gmail.com>
 <18CF953235C263D2.642712@lists.openembedded.org>
In-Reply-To: <18CF953235C263D2.642712@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244499

On Thu Aug 27, 2026 at 8:20 AM CEST, Mathieu Dubois-Briand via lists.openem=
bedded.org wrote:
> On Fri Aug 21, 2026 at 1:25 PM CEST, Bruce Ashfield via lists.openembedde=
d.org wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> 7.2 is our next versioned reference kernel. The standard, preempt-rt
>> (v7.2-rc4-rt3) and tiny variants are all generated and available.
>>
>> Signed SRCREVs point at the freshly generated v7.2 branches; the kmeta
>> tracks the yocto-7.2 branch.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>
> Hi Bruce,
>
> I tested the 7.2 kernel, using this commit in meta-yocto:
>
> https://git.yoctoproject.org/meta-yocto/commit/?h=3Dcontrib/mathieu/maste=
r-next-tests-72&id=3D98c8b2ca0c149201f6b2ee52157ca460fd0a2eb4
>
> So far, I saw two different errors.
>
>
> First, a fail of kernelmodule.KernelModuleTest.test_kernel_module on qemu=
x86:
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-cor=
e/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-cor=
e/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-cor=
e/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   [Previous line repeated 2 more times]
>   File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-cor=
e/meta/lib/oeqa/runtime/cases/kernelmodule.py", line 48, in test_kernel_mod=
ule
>     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> AssertionError: 2 !=3D 0 : cd /usr/src/kernel && make scripts prepare
> ...
> In file included from ./include/uapi/linux/elf.h:5,
>                  from arch/x86/tools/vdso2c.c:66:
> ./include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kern=
el headers from user space, see https://kernelnewbies.org/KernelHeaders" [-=
Wcpp]
>    10 | #warning "Attempt to use kernel headers from user space, see http=
s://kernelnewbies.org/KernelHeaders"
>       |  ^~~~~~~
> arch/x86/tools/vdso2c.c:74:9: error: unknown type name 'bool'
>    74 |         bool export;
>       |         ^~~~
> arch/x86/tools/vdso2c.c:69:1: note: 'bool' is defined in header '<stdbool=
.h>'; this is probably fixable by adding '#include <stdbool.h>'
> ...
> make: *** [Makefile:248: __sub-make] Error 2
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4474
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4437
>
> And then, failure in runtime_test.RustKernel.test_kernel_rust_sample
> selftest:
> 2026-08-26 14:11:09,216 - oe-selftest - INFO - runtime_test.RustKernel.te=
st_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-08-26 14:11:09,221 - oe-selftest - INFO -  ... FAIL
>
> Stderr:
> 2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-80320=
4/conf/local.conf
> 2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to=
 using a license ref pointing to an actual license file, e.g.
> LICENSE =3D "LicenseRef-test-CLOSED"
> WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to=
 using a license ref pointing to an actual license file, e.g.
> LICENSE =3D "LicenseRef-test-CLOSED"
> ERROR: When reparsing /tmp/selftest-fetch8rb2fo4w/test.bb:do_checkuri, th=
e basehash value changed from eaf531c7d0304fd45f77fab173d0399db2b76e45cd464=
87426eb74bae7d4b7bb to 2cdec1b5839750d0c5998dd35b7ab7380727d2fa3a33aed86414=
4428d3a78f7d. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_checkuri -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
>
> I suspect the warning about the LICENSE value is unrelated, but is
> something else I should fix.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4680
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4502
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4724
>
> Thanks,
> Mathieu

Hi Bruce,

Thankfully Richard reminded me of something: warnings are not shown on a
rebuild, when sstate-cache is used. And as I messed up my first build, I
do had to rebuild.

So here's a new mail to summarize the warnings I've got. Basically there
just two different things here.

We have a first group of warnings, both on beaglebone and
beaglebone-alt:
WARNING: linux-yocto-7.2+git-r0 do_kernel_configcheck: [kernel config]: spe=
cified values did not make it into the kernel's final configuration:

    [NOTE]: 'CONFIG_FB_MODE_HELPERS' last val (y) and .config val (n) do no=
t match
    [INFO]: CONFIG_FB_MODE_HELPERS : n
    [INFO]: raw config text:

        config FB_MODE_HELPERS
        	bool
        	depends on FB && HAS_IOMEM
        	help
        	  This enables functions for handling video modes using the
        	  Generalized Timing Formula and the EDID parser. A few drivers re=
ly
        	  on this feature such as the radeonfb, rivafb, and the i810fb. If
        	  your driver does not take advantage of this feature, choosing Y =
will
        	  just increase the kernel size by about 5K.

        Config 'FB_MODE_HELPERS' has the following Direct dependencies (FB_=
MODE_HELPERS=3Dy):
                FB(=3Dy) && HAS_IOMEM(=3Dy)
        Parent dependencies are:
             FB [y] HAS_IOMEM [y]
    [INFO]: config 'CONFIG_FB_MODE_HELPERS' was set, but it wasn't assignab=
le, check (parent) dependencies

    [INFO]: selection details for 'CONFIG_FB_MODE_HELPERS':
        Symbols currently n-selecting this symbol (no effect):
          - FB_CLPS711X
          - FB_IMX
          - FB_UVESA
          - FB_ATMEL
          - FB_RIVA
          - FB_I740
          - FB_I810
          - FB_RADEON
          - FB_SAVAGE
          - FB_NEOMAGIC
          - FB_3DFX
          - FB_TRIDENT
          - FB_VT8500
          - FB_WM8505
          - FB_PXA
          - FB_FSL_DIU
          - FB_SMSCUFX
          - FB_UDL
          - FB_SM750

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4500
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4500

And then a second group, with qemuarm MACHINE:

WARNING: linux-yocto-7.2+git-r0 do_kernel_configcheck: [kernel config]: Thi=
s BSP contains fragments with warnings:
[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_CRYPTO_AES_ARM

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4469
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4529
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4529

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


