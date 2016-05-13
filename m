Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1756010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:07:02 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id v68so11097854vka.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QmQwKVqrS65x4Shsql18HUCEUjRx4eXRmCW9G1+Ji3k=;
	b=PmzEm8Av1DH8xFFF8MRr4tQNq55bXzROFXQ9OBwyo+x9TjdJ8/j4G88yx8mSUCFlsd
	TU+l5NYrG5b1kQ7CzJ/PzmqpQEp7qthYeUXjhG7AnlMDKYRzJAMjzFKLf1vZnhePSZwD
	wK8RB74Kmb1qr4B7h9L5w1kgecRanLmqf3Uwr1X1hQMSdZUTN/o3JRNXIT7gLrKnqOA5
	KvhEZBPQRPXm7oq6RuJvS8jjV1ogOvCuUOff33Duk6YuPP38LT4r1HZs6ADk0gyQqdwD
	KI8v+dd6NWdIO/C9991mEzUi8QV3HiknqEUjOqRAWRD1woCCiTBhOoFVTVZXP+SPky3h
	XzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QmQwKVqrS65x4Shsql18HUCEUjRx4eXRmCW9G1+Ji3k=;
	b=f3sObl/eXywSLK5bfNf1ekzDg40Wpmk10aX9OqMkSId0ds9eIfcIlqoMh85TBMVh8r
	Bp5/i67zP8aeUf9FkGz3hDOorn4uRMASdIHqMoYa7Vss46cZjP76AT8N7U0HD2ay0f7t
	dAqaJ5eBCB8PePJ8lLYlRxKLw1ARftOvMlTuqC2dPqbBJ4Y0XN98MBp8lj55x59M+bjm
	a3KmNhf08IhSvP6NLAdej1Kbjab1F0MVCnbGoC/lhN9zauAgUGx3w/+y/8fL4tKzRm/9
	ijrPWZSW5r3dnV80ng8hUy/cHHiFNVMVdchB9pnP5wtz+CbYBBBERKGsx6e2PlKunswA
	ID1Q==
X-Gm-Message-State: AOPr4FXZh/SmaBvXwT6DRA0DR7QgpOM/Gu6IubnT/PxY2frVOMmj1vXm/soO6ZpUakLaH255FmA/EDc/IsNVvg==
MIME-Version: 1.0
X-Received: by 10.31.82.129 with SMTP id g123mr7131420vkb.120.1463123223528;
	Fri, 13 May 2016 00:07:03 -0700 (PDT)
Received: by 10.159.34.82 with HTTP; Fri, 13 May 2016 00:07:03 -0700 (PDT)
In-Reply-To: <573578BA.80207@windriver.com>
References: <573578BA.80207@windriver.com>
Date: Fri, 13 May 2016 09:07:03 +0200
Message-ID: <CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: krogoth's core-image-minimal is much bigger than jethro's
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
X-List-Received-Date: Fri, 13 May 2016 07:07:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 13, 2016 at 8:48 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> * For ext4:
>   11M -> 26M
>   The similar to vmdk, qcow2 and iso.
>
> * For tar.bz2:
>   2.7M -> 4.5M
>
> The main problem is eudev-hwdb which would be 12M after installed, jethro
> doesn't use this, but udev by default, and it's gone in krogoth.
> $ du -sh core-image-minimal/1.0-r0/rootfs/etc/udev/*
> 0        core-image-minimal/1.0-r0/rootfs/etc/udev/cache.data
> 6.4M     core-image-minimal/1.0-r0/rootfs/etc/udev/hwdb.bin
> 5.2M     core-image-minimal/1.0-r0/rootfs/etc/udev/hwdb.d
> 8.0K     core-image-minimal/1.0-r0/rootfs/etc/udev/rules.d
> 4.0K     core-image-minimal/1.0-r0/rootfs/etc/udev/udev.conf
>
> Is there an easier way to fix this problem, please ? It's not a good
> news for the user who uses core-imag-minimal/udev when they want to
> upgrade to krogoth. And this would hurt the small device which uses
> udev.
>

Somehow we have to explicitely opt-out:

+BAD_RECOMMENDATIONS += "eudev-hwdb"

IMHO for embedded devices it would be better to disable by default and
let the distro/machine add a specific RRECOMMEND.

Regards
Andrea

>
> The conf is:
> MACHINE = "qemux86-64"
> DISTRO = "poky"
> PACKAGE_CLASSES = "package_rpm"
> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> USER_CLASSES = "buildstats image-mklibs"
>
> $ bitbake core-image-minimal
>
> For jethro:
> $ ls -lh core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
> 11M  core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
> $ du -sh core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
> 7.9M core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
>
> For krogoth:
>
> $ ls -lh core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
> 26M core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>
> $ du -sh core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
> core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>
> --
> Thanks
>
> Robert
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

