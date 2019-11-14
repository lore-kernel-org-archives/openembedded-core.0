Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3A63C60273
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 07:54:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u18so4594251wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 23:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u2zvgeg/Aaurxgo6u+1FJEMbjLUP87TOl/j8BznMPlY=;
	b=SVBfo3xR6et1iK3dLDZXQwUG//2Mv2FHiuBy0RpYHI3SwjsCMWvf6iUFTJu+u5NMhK
	RTHifxv3Gh5tSbmIBtgmTAF7N6+7euxlbNQtF8HQqsZtYR+bt+bTHwbmi6TiELmCeBGR
	j6+f4/EU2qJ+f3PWiTUnJyIKl0reNmiItuQ2mg8K/18KkCdNz3vxLgHjvs8Vm6lgG+R6
	sREqGLBAeXsctQX9a8TpeNeAeVrR7Vjyvl8+Jw3SlqNnNfpu0HrDSPsAeyXIP3voKIK3
	dycMmMQUsHJ0K2zu36MuMOkqzeqtzf4oAFlgRlLE0Iv3ZYOGvCMtFMq++kNFxeLGJPmx
	XxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u2zvgeg/Aaurxgo6u+1FJEMbjLUP87TOl/j8BznMPlY=;
	b=AYXg2qJnY6YYbUDGUiBUcifNv6upK1WShwDVvRyl1HXj5wuik3CDiXUr/n7Fe3PPjV
	Imm5n6cRMGBBQpKpQUntmMCFF7cf2PRBopdTelRZSEyw/UUbu4Fb416E2Mxup8NCtbXK
	nKBlNSTYwxB843eB4dUplmN7etWwbw5hFzWMN8K6zRLaAxiPtwGqTuCAY/ycVV4fs+YE
	OsfUghhl3SVz18vZR+elrcRzCH940lnDs7Y3XVqa1iqxqMxWZA2F3kDB60zBR7LFww/t
	y/MyiCglY8JKmOwSBaKz3QVWUGUWPLGIpU0gTnESCtOaN5HpGELjCd1cmNSq/oKshjIF
	mwjg==
X-Gm-Message-State: APjAAAXPq0zWSDsEQmoQcCp6rYH8EZKWS+4fNk0aIq8w+JAtbRLASTI5
	f4L2LgxNVqeqMrfdJrXb8LbEJymOFqoHHM1FAwPVaOpe
X-Google-Smtp-Source: APXvYqxWp+e2F19a3is9nNaGQ5k9Bxyr+vimwvRlgZK9O+2zbrylF7JvizQgDGGaXjTDO3wNVMN0BKQ/u5xj/kN6iMo=
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr5884067wmc.123.1573718089734; 
	Wed, 13 Nov 2019 23:54:49 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0F1Rbu3H4X78HaZx8TtppA=raGcwJkQX13UXviL9FCB1g@mail.gmail.com>
In-Reply-To: <CADySD0F1Rbu3H4X78HaZx8TtppA=raGcwJkQX13UXviL9FCB1g@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 14 Nov 2019 08:54:38 +0100
Message-ID: <CAHtQpK4_wj8QZkcUuf9RLYBiB=3RSMyaTXN1Q2gnGKQ29nSHhg@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to set up custom layer correctly
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
X-List-Received-Date: Thu, 14 Nov 2019 07:54:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hey Ankur,

On Wed, Nov 13, 2019 at 9:55 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> Hi,
>
> I have a custom layer for custom board based upon am335x-evm and custom images.
>
> I have a master layer called "my-custom-layer" which has three sub-layers
> - my-custom-distro : custom distro based upon TI's 'arago' distro, Qt
> and other s/w recipe appends
> - my-custom-image : custom images, packagegroups, toolchain recipes
> - my-custom-machine : custom machine conf, bsp and kernel recipes

Those config files are OK to create, but can you please tell how did
you create your own machine?

>
> When I am building my image, it throws numerous warnings like below
> for almost all packages in the image:
>
> eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: libudev rdepends on
> u-boot-custom-src, but it isn't a build dependency, missing
> u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> WARNING: eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: eudev
> rdepends on u-boot-custom-src, but it isn't a build dependency,
> missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput rdepends
> on u-boot-custom-src, but it isn't a build dependency, missing
> u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput-bin
> rdepends on u-boot-custom-src, but it isn't a build dependency,
> missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
>

I would be interesting to see your u-boot-custom recipe here. Looks
like this one is not formed well enough. Did you base it from u-boot
recipe of am335x layer?

Another thing is if you're building your own version of U-Boot - you
would need to set a PREFERRED_PROVIDER to point to it. This

>
> And once sstate-cache is built and if I try to reuse it after bumping
> u-boot-custom to new SRCREV then I get errors like:
>
> Collected errors:
>  * Solver encountered 2 problem(s):
>  * Problem 1/2:
>  *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
> needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-base
>
>  * Problem 2/2:
>  *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
> needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-qt
>
Those might come from the point I stated above - your u-boot recipe
does not provide necessary packages, or the PREFERRED_PROVIDER might
not be set correctly.

> Something is definitely not right the way I am have setup my layers
> but I would like to understand what is wrong, why it is wrong and what
> is the recommended way to do it

I can tell you how I personally do it. This is a mere experience that
I have and it does not serve as an official How-To - there is a very
good documentation about the process of using Yocto on the website. :)
I base my new configuration on the oe-core/vendor BSP, utilizing as
much as possible from it at the first step. Then once the evaluation
image is built (for example core-image-minimal) I examine the
distro/machine to identify whether I can use it as-is, or create my
distro/machine based on those provided. In later case I try to keep it
as close to original source as possible, this would allow ease of
upgrade in the future.

As a suggested reading here:
https://www.yoctoproject.org/docs/latest/brief-yoctoprojectqs/brief-yoctoprojectqs.html

> Because in future I would like to add different machines, distros and
> images for different custom products. That is why instead of putting
> everything inside one layer I thought of keeping a separate layer for
> each.

This is a correct approach to follow. The only thing you would always
have to keep in mind is a concept of "non-destructive layer", meaning
that if you remove your layer from the build system - it should not
affect all other layers you have included, and you should always have
a possibility to build other distro/machine/image triplets. In other
words - don't pollute your build system with unnecessary dependencies.

>
> Looking forward to learning from your responses.
>
> Thanks
> Ankur
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Regards,
Andrey.

