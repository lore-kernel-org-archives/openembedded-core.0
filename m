Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id C606B7F54F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 09:10:31 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id c25so30523382iot.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AjIsf5mmSJBc9F4g6KAf3AjvZplaZS8RnedhbCKbqgU=;
	b=bThH2lx+yUpJxS4GJL6EWkCGl8dpew5LSF1SezilTr8ICLMXt6IgweuISgXyIaiTJk
	/zydWHJNqiY2NZZ3iQmPJJjqFbZ/yFb10cLs3K5yjwTRZs2hWNCNf68AxOaQ8GIWdFsv
	/6hMgXyuc0Hji5jPcPe/jXoek6QoKlC+pmdFuytkz5ExCAXuvow5my24IYT7p7Jzczk6
	wNu7Mfs8DjLQfC1XFb13MKKOUz+bRbdq+zPeneA7/Iwzf+v4BjcaDiUK9NSf3eV2ens2
	pP2uyVKXY7jSz+jdYN+ygrDVK6UWB1p0U0kltyqUtLXYqUo74LPN5vF7c3xMfk1lNmjr
	53Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AjIsf5mmSJBc9F4g6KAf3AjvZplaZS8RnedhbCKbqgU=;
	b=uRgz9czaGA6ZmVwDqDukSjUFZunzR3yH9PT4ervHaolaTTAwZrP2WuwSG57BBjZeYO
	mq200B0D0SBsmqGD0cIrqNjk5MHV24sbJ3OZlRPVhtR4ckRiPDgY2NEHEm/haLGCKWfr
	5Kn7ZDA3NIcCJ4RdtmP/vIB74Fy//ZGc25HHZY5jtNJRSQKH8SznfOGUzWJV2KMVR2ZA
	AfAJEuKl7Q9lF6U8yHrV5VEZY7iOr3CiudSdaKiWKCB3Jm8sXFTMj4ItVGplmN/+Sn8m
	JMVFflpYPZiO5YsuqHgWBbEvaEvraIsUPXC8jjT6FVPjY99CE/yoElROqN8XWp2gdph2
	WvmA==
X-Gm-Message-State: APjAAAXC4CVt3jiNTTaRCUbWLctYzzXO+kBPuGZCi3Iu8bXFuF/OBMOp
	LYHihPbe5+G1deBd+UkeppUY8HlECYYwY9z+cx4=
X-Google-Smtp-Source: APXvYqzhsUVg3AVvZoBSwQIl6scMJ3Pg5SacxJD4DEup74vAMedTUmGtAn7iILG6Cut0BzbF+cOM0IzDWxYoQxEVhas=
X-Received: by 2002:a6b:6914:: with SMTP id e20mr26366655ioc.53.1570957832785; 
	Sun, 13 Oct 2019 02:10:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sun, 13 Oct 2019 02:10:32
	-0700 (PDT)
In-Reply-To: <CAMKF1soEbDhviZb7LR3NcL4ieFr-Qw-G+k0eKVt1iScVDR1NDw@mail.gmail.com>
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
	<ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
	<CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
	<CAMKF1soEbDhviZb7LR3NcL4ieFr-Qw-G+k0eKVt1iScVDR1NDw@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 13 Oct 2019 20:10:32 +1100
Message-ID: <CAA=hcWR8bR0Fs9gGYhF=2n-mUqw4LD3wiEObGtPu1Yc6LmAGkA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 13 Oct 2019 09:10:32 -0000
Content-Type: text/plain; charset="UTF-8"

On 10/13/19, Khem Raj <raj.khem@gmail.com> wrote:

>> $ vi local.conf
>> IMAGE_ROOTFS += " core-image-minimal-initramfs"
>>
>
> INITRAMFS_IMAGE should be an image name. Like core-image-minimal or
> somesuch

Hmm, change it to my image, the name is solar-image.bb (bitbake
solar-image), is it correct to change it in my local.conf as per your
instruction?

$ vi local.conf
INITRAMFS_IMAGE = "solar-image"

That caused circular dependecies. Without specifying INITRAMFS_IMAGE,
my build was all fine, as soon as add INITRAMFS_IMAGE, it's first
error was "Nothing RPROVIDES", I must miss things here.

ERROR: These are usually caused by circular dependencies and any
circular dependency chains found will be printed below. Increase the
debug level to see a list of unbuildable tasks.
ERROR:
Dependency loop #1 found:
  Task /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_complete
(dependent Tasks ['solar-image.bb:do_image_cpio',
'solar-image.bb:do_image_wic', 'solar-image.bb:do_image',
'solar-image.bb:do_image_tar'])
  Task /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_bundle_initramfs
(dependent Tasks ['solar-image.bb:do_image_complete',
'linux-solar_4.19.bb:do_install'])
  Task /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_deploy
(dependent Tasks ['linux-solar_4.19.bb:do_packagedata',
'depmodwrapper-cross_1.0.bb:do_populate_sysroot',
'linux-solar_4.19.bb:do_bundle_initramfs',
'linux-solar_4.19.bb:do_populate_sysroot',
'linux-solar_4.19.bb:do_assemble_fitimage_initramfs'])
  Task /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_wic
(dependent Tasks ['linux-solar_4.19.bb:do_deploy',
'u-boot-imx_2017.03.bb:do_deploy',
'gptfdisk_1.0.4.bb:do_populate_sysroot',
'dosfstools_4.1.bb:do_populate_sysroot',
'mtools_4.0.18.bb:do_populate_sysroot',
'solar-image.bb:do_rootfs_wicenv', 'solar-image.bb:do_image',
'parted_3.2.bb:do_populate_sysroot'])


ERROR: Command execution failed: 1


Thank you very much Khem,

Kind regards,

 - jh

