Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 15C8560720
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 09:20:13 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id o16so1237375ilq.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y7ZJ6tKDhEi3som9bR5K0+dksCQjRqA6CaJOCCUNm/I=;
	b=Bei3y1s+TBuo8MaoNWMggqkEsuXh7Y9a4JOvyzF0p5+eByfnTG6PfHBl/knfp2qt7X
	NRnEmGUPa1sla09nwgyGd6bFbyL5/AfwalNb/uXG4uykj4z94FBfHTzR2tVFKPODeHFh
	Z4iiudfYBj9rHkmDf403IuedOgWqYMEAbIsUfu+Mwetlli/F87AcmIo2J0t/LeETjq5I
	3QuH3ITPfyxBwGrj3ttDMZxaJx6HlIf/buZmpHInQCt+jv32RpiOZcABI9txRnoHfm/W
	Jj2nG7Q8d32E9wp2c1vImYuN+Y6KTSjL+X9WmjDCY/SYMt7lExdgfjt9uNv2rKJ7moJh
	V+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y7ZJ6tKDhEi3som9bR5K0+dksCQjRqA6CaJOCCUNm/I=;
	b=TUd+O1b+ambiJkpjKTjwfu3NAAqWnGjDvaXEX/fhMt1SXGqLf/NNjlABTPq95nxidZ
	NjcvBec9SD1fN8JNQfz+4kpIBewpQjeqF5VR1yfI5kbmuSu6qe6CPc+kAFnR4CI/3I0e
	iOm6OaX5qp8X89twogXvs5gciX9mvPJ6rf22PGjpife/p9NyNbtZz0Bq5K5OE3oovOqK
	aOabeYXStpLOVUJF8DFvrVU0TE/apQy2sZ8iDQ6394xpT52EronO/3r7tWgPEKLXJyVP
	7uA6ZLRRl0hpqLf8IVDws5M/GhfnVPoqByP60dKNxcMhJ05fzoZzPpyb45acvG+F8mJ2
	dF5g==
X-Gm-Message-State: APjAAAWq78MS5VO7Tezuh/5q41taoWngvzs/g20d8RMlMhkyADmWajtz
	jBURNgg/Iqh5DNLQ83AdC5+m496A/wXStgywT/Y=
X-Google-Smtp-Source: APXvYqxvyciQUMLeyj5pXGAKG/yw3wBzqi4xjSqVwJs0ROhrO9nWDSE3ABMmRbelA3jFTM9Ez0RuYyUOI5G7rpC/RjU=
X-Received: by 2002:a92:60e:: with SMTP id x14mr15118232ilg.301.1571563215012; 
	Sun, 20 Oct 2019 02:20:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sun, 20 Oct 2019 02:20:14
	-0700 (PDT)
In-Reply-To: <a4ef22e6-7c12-027a-b1cd-fa807fcfccb8@gmail.com>
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
	<ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
	<CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
	<CAMKF1soEbDhviZb7LR3NcL4ieFr-Qw-G+k0eKVt1iScVDR1NDw@mail.gmail.com>
	<CAA=hcWR8bR0Fs9gGYhF=2n-mUqw4LD3wiEObGtPu1Yc6LmAGkA@mail.gmail.com>
	<a4ef22e6-7c12-027a-b1cd-fa807fcfccb8@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 20 Oct 2019 20:20:14 +1100
Message-ID: <CAA=hcWSWWWZH1fbrKdZZUUrza7DkhwbguvQjd5AbBPt_Jk3nCg@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 20 Oct 2019 09:20:14 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Ferry and Khem,

Finally built the zImage-initramfs, but it does not bundle the rootfs,
how can I included the rootfs to the zImage?

There is n old style link in  kernel.bbclass:
use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio

I think there is some new way to do it, what relevent kernel setup
variables need be defined?

Thank you.

Kind regards,

- jh

On 10/13/19, Ferry Toth <fntoth@gmail.com> wrote:
> Hi
>
> Op 13-10-19 om 11:10 schreef JH:
>> On 10/13/19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>> $ vi local.conf
>>>> IMAGE_ROOTFS += " core-image-minimal-initramfs"
>>>>
>>>
>>> INITRAMFS_IMAGE should be an image name. Like core-image-minimal or
>>> somesuch
>>
>> Hmm, change it to my image, the name is solar-image.bb (bitbake
>> solar-image), is it correct to change it in my local.conf as per your
>> instruction?
>>
>> $ vi local.conf
>> INITRAMFS_IMAGE = "solar-image"
>>
>> That caused circular dependecies. Without specifying INITRAMFS_IMAGE,
>> my build was all fine, as soon as add INITRAMFS_IMAGE, it's first
>> error was "Nothing RPROVIDES", I must miss things here.
>>
>> ERROR: These are usually caused by circular dependencies and any
>> circular dependency chains found will be printed below. Increase the
>> debug level to see a list of unbuildable tasks.
>> ERROR:
>> Dependency loop #1 found:
>>    Task
>> /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_complete
>> (dependent Tasks ['solar-image.bb:do_image_cpio',
>> 'solar-image.bb:do_image_wic', 'solar-image.bb:do_image',
>> 'solar-image.bb:do_image_tar'])
>>    Task
>> /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_bundle_initramfs
>> (dependent Tasks ['solar-image.bb:do_image_complete',
>> 'linux-solar_4.19.bb:do_install'])
>>    Task
>> /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_deploy
>> (dependent Tasks ['linux-solar_4.19.bb:do_packagedata',
>> 'depmodwrapper-cross_1.0.bb:do_populate_sysroot',
>> 'linux-solar_4.19.bb:do_bundle_initramfs',
>> 'linux-solar_4.19.bb:do_populate_sysroot',
>> 'linux-solar_4.19.bb:do_assemble_fitimage_initramfs'])
>>    Task
>> /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_wic
>> (dependent Tasks ['linux-solar_4.19.bb:do_deploy',
>> 'u-boot-imx_2017.03.bb:do_deploy',
>> 'gptfdisk_1.0.4.bb:do_populate_sysroot',
>> 'dosfstools_4.1.bb:do_populate_sysroot',
>> 'mtools_4.0.18.bb:do_populate_sysroot',
>> 'solar-image.bb:do_rootfs_wicenv', 'solar-image.bb:do_image',
>> 'parted_3.2.bb:do_populate_sysroot'])
>>
>>
>> ERROR: Command execution failed: 1
>
> As an example you might want to look at my repo, I have 2 images minimal
> and initramfs:
> https://github.com/edison-fw/meta-intel-edison/tree/master/meta-intel-edison-distro/recipes-core/images
>
>
>>
>> Thank you very much Khem,
>>
>> Kind regards,
>>
>>   - jh
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

