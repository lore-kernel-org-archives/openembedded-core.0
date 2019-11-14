Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC71E7F69B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 10:19:19 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id j14so4582553lfk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oa6O4HDjsWwmw1lL178kQqVkGr0X7e53RyneMISX6RM=;
	b=mYWA9WY/w1laSXvwKbduy95OjNHKYyQ6nvi7PZZXUpFNkmlqiVHvk8JQjHbbf7C9KW
	XDCc+yO7wQcG43j1G+3iwEGArHbtf8eUj5AC3nem8p6D/Z43LUfw1HIWZPbwpU11fpY+
	Ae7OKLkNNFMQGLClDn/14PaqQzuullOsbgqF7Je5hG9uM/7mSNAhiyxPnZkydIKmQZep
	es3GT2C4wmWJK6l9i7RRSIkWKTvnCztQ2Qi5a6tAa5O1G1ruttlU5SLYkrolPJId4Oay
	e2pWBqbGZfIeCxxWZF2Z2Z40jK7DlLMDwMUFhv8roD6Qi4yycJ2srSY1sQU90B4RnOUN
	aLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oa6O4HDjsWwmw1lL178kQqVkGr0X7e53RyneMISX6RM=;
	b=Ahf+AsHfF8AUa66y6Q7L2gj2yd4NbUdXSo/S8+FENUJWj0BKH6QbhoOvAolKF9BcuE
	RZlveyH4Azc0++PgiDhftd1EbQVqal1/Dx8bAy1r/UjqIg6EqZryXJqVoRdBfIUia4sZ
	T8WsUP64wAH/Fxp6vj9/vosHExmQGrlruRvIT+IEgaRVsc+EzivuzDF5nA1mrGKAWhe/
	M+DtM0fBzYUQ9U6Z7wBVSmrD7OX1/pJYBqlQzFCBGPHeDoIq+f9CKIY3/Wqjx34YX6Uq
	4BQsUpvyKP8ruX+xJeT44xFwAh0v6teN+ismjcD+Ty+xgmhWHJ7pWLq/RVN7KW60kvtV
	krSg==
X-Gm-Message-State: APjAAAX3iJFk7dzaCKGfhWWwvYkxmsqHz4OHuyEXeAePJUxlNYevCR9X
	kOHoBDLVt6i7OpznDUYYC7RJeMVg2aQQnxfMcaI=
X-Google-Smtp-Source: APXvYqynjxAwJk4Fk3wWAnjed2oDDhw7G3CRMo2xkWdksA7BTk7n/ShMVBGq1WwClccPjpuG1IoSQBvbiwEuZyOGj2A=
X-Received: by 2002:ac2:5195:: with SMTP id u21mr6128539lfi.97.1573726759868; 
	Thu, 14 Nov 2019 02:19:19 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0F1Rbu3H4X78HaZx8TtppA=raGcwJkQX13UXviL9FCB1g@mail.gmail.com>
	<CAHtQpK4_wj8QZkcUuf9RLYBiB=3RSMyaTXN1Q2gnGKQ29nSHhg@mail.gmail.com>
In-Reply-To: <CAHtQpK4_wj8QZkcUuf9RLYBiB=3RSMyaTXN1Q2gnGKQ29nSHhg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 14 Nov 2019 23:19:08 +1300
Message-ID: <CADySD0HaAGi=sjJUDZ5spwXX5GnNRpF7txv64XVYi24mo8vWuQ@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 10:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andrey,

On Thu, Nov 14, 2019 at 8:54 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hey Ankur,
>
> On Wed, Nov 13, 2019 at 9:55 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > Hi,
> >
> > I have a custom layer for custom board based upon am335x-evm and custom images.
> >
> > I have a master layer called "my-custom-layer" which has three sub-layers
> > - my-custom-distro : custom distro based upon TI's 'arago' distro, Qt
> > and other s/w recipe appends
> > - my-custom-image : custom images, packagegroups, toolchain recipes
> > - my-custom-machine : custom machine conf, bsp and kernel recipes
>
> Those config files are OK to create, but can you please tell how did
> you create your own machine?
My custom machine is based upon am335x-evm

custom_machine.conf

require conf/machine/am335x-evm.conf
UBOOT_MACHINE = "custom_machine_config"
SERIAL_CONSOLES = "115200;ttyS0"
MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 800"
UBINIZE_ARGS = "-m 4096 -p 256KiB -s 1024 -O 4096"

> >
> > When I am building my image, it throws numerous warnings like below
> > for almost all packages in the image:
> >
> > eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: libudev rdepends on
> > u-boot-custom-src, but it isn't a build dependency, missing
> > u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> > WARNING: eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: eudev
> > rdepends on u-boot-custom-src, but it isn't a build dependency,
> > missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> > WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput rdepends
> > on u-boot-custom-src, but it isn't a build dependency, missing
> > u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> > WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput-bin
> > rdepends on u-boot-custom-src, but it isn't a build dependency,
> > missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
> >
>
> I would be interesting to see your u-boot-custom recipe here. Looks
> like this one is not formed well enough. Did you base it from u-boot
> recipe of am335x layer?

Correct, it is based upon u-boot-ti-staging from meta-ti layer
>
> Another thing is if you're building your own version of U-Boot - you
> would need to set a PREFERRED_PROVIDER to point to it. This
>

Yes, I have set it up in my distro conf

> >
> > And once sstate-cache is built and if I try to reuse it after bumping
> > u-boot-custom to new SRCREV then I get errors like:
> >
> > Collected errors:
> >  * Solver encountered 2 problem(s):
> >  * Problem 1/2:
> >  *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
> > needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-base
> >
> >  * Problem 2/2:
> >  *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
> > needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-qt
> >
> Those might come from the point I stated above - your u-boot recipe
> does not provide necessary packages, or the PREFERRED_PROVIDER might
> not be set correctly.
>
> > Something is definitely not right the way I am have setup my layers
> > but I would like to understand what is wrong, why it is wrong and what
> > is the recommended way to do it
>
> I can tell you how I personally do it. This is a mere experience that
> I have and it does not serve as an official How-To - there is a very
> good documentation about the process of using Yocto on the website. :)
> I base my new configuration on the oe-core/vendor BSP, utilizing as
> much as possible from it at the first step. Then once the evaluation
> image is built (for example core-image-minimal) I examine the
> distro/machine to identify whether I can use it as-is, or create my
> distro/machine based on those provided. In later case I try to keep it
> as close to original source as possible, this would allow ease of
> upgrade in the future.
>
> As a suggested reading here:
> https://www.yoctoproject.org/docs/latest/brief-yoctoprojectqs/brief-yoctoprojectqs.html
>

Thank you for the insights, it was helpful as I have also been trying
to follow the same path

> > Because in future I would like to add different machines, distros and
> > images for different custom products. That is why instead of putting
> > everything inside one layer I thought of keeping a separate layer for
> > each.
>
> This is a correct approach to follow. The only thing you would always
> have to keep in mind is a concept of "non-destructive layer", meaning
> that if you remove your layer from the build system - it should not
> affect all other layers you have included, and you should always have
> a possibility to build other distro/machine/image triplets. In other
> words - don't pollute your build system with unnecessary dependencies.
>

Thank you again for your valuable inputs, will keep these points in my mind

> >
> > Looking forward to learning from your responses.
> >
> > Thanks
> > Ankur
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Regards,
> Andrey.

Thanks
Ankur

