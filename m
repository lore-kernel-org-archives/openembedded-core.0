Return-Path: <freesilicon@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C77377A9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:37:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o36so11692610qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PkTmWQnD7mgzY3UrX8LnQdTX4F7sM7YKqychaNhcffM=;
	b=XYhPYF/AwLlLvGkHUuUmIHfOxIavIxqOdxDdLKDWF+lHfsO4UoYvapXY0jRGYhPse5
	ZrgmxF7i5mKnh+rc2o8bbvHpKfmy+B4lcTuh/0S1CrvNDF2MVU22O2k1U3LGAwyQjJjD
	j7Mivya9YlJurO+rzcwRMUjQACRaD8lPOhcVF6GPEaZxqRUBumdj+trK+grwDSHLYzLc
	dR1Wh7kVduV/BlM3V+nTBs6IMAzfQewerIcgt+fYvl2w9C1HA34++lCKXs04DtoN+iDI
	Jae9fFM4XwUh+zuWluTlIpzI25NDPdOWtmh1Zg+4WlgJR/jlaX9cAOWSfUvMvRffWsOU
	ozJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PkTmWQnD7mgzY3UrX8LnQdTX4F7sM7YKqychaNhcffM=;
	b=rxWIKELUx9IZBcURnM/MjTD0dHOLTd1f+yMQMqR2sSmbn11va8CyT9KZ4ZBMVagjDp
	ZBWNwZ49Q1J+37VIedOD7EdplYIjP0uaBjURcDoIBQdh3nIPADkOvu976mtOLjjLF9Ls
	drFhLe1X/6TT++kSbx1MYcJrMs1C8TwdZgeVl2trPix0O9Uj43jJvmlJdZui1TlYd8kO
	u+5v4JOJEjYCOgTP9dc4YkAsisTicNIh04n89j2uNyfRFbKW5svf5V2qsCnigmWRgRxX
	DrqPZTxvn7XR9pvQjJW3YFF4I0HUwez4vtWj3RQawvBidgT3ulGL5Pt6aHOLK/G2ezpX
	o5pQ==
X-Gm-Message-State: AN3rC/47722i+/ne+22Kx9r0/wAciCfDOZ5+pIqDqzsrDsg8pGz4lEMa
	1kPGtJJju+mrmzLxJiJN3ro7NoB1FA==
X-Received: by 10.200.43.146 with SMTP id m18mr12717229qtm.210.1492778257197; 
	Fri, 21 Apr 2017 05:37:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.220 with HTTP; Fri, 21 Apr 2017 05:37:36 -0700 (PDT)
In-Reply-To: <20170421133034.59e68228@t510.zcs.saftware.de>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
	<CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
	<20170421133034.59e68228@t510.zcs.saftware.de>
From: David Vincent <freesilicon@gmail.com>
Date: Fri, 21 Apr 2017 14:37:36 +0200
Message-ID: <CAKRNOGyKJ5_W5Ws0Q7E2Nm9d8SV6bTZzXac2K6uEexE7567UjA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 21 Apr 2017 12:37:36 -0000
Content-Type: text/plain; charset=UTF-8

On 2017-04-21 13:30 GMT+02:00 Andreas Oberritter <obi@opendreambox.org>:
> On Fri, 21 Apr 2017 13:02:51 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
>
>> On Fri, Apr 21, 2017 at 12:39 PM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>> >
>> > It broke dpkg's update-alternatives, which requires absolute paths.
>>
>> This is really uncommon.
>
> Actually it's not. Try it on any Debian or Ubuntu system.
>
>> I had already expressed my negative opinion about absolute paths for kernel [1].
>> Personally, I had to patch the bootloader (kexecboot).

Same here, that's why I submitted it in the first place. Didn't
thought that would break dpkg...

>>
>> So please try some workaround instead of changing it back.
>
> Well, there's no workaround. Other than opkg's update-alternatives, dpkg's maintains
> an alternatives database in /etc/alternatives, so the symlink is going to point to
> an absolute path outside of /boot anyway.

The problem is that, for bootloaders, it is not always possible to
mount the rootfs. So, it must only rely on information in the boot
partition that can be mounted anywhere.

>
> To fix your problem, kernel.bbclass should be changed to not use update-alternatives
> at all. But it's definitely wrong to break the original u-a by using invalid command-
> line arguments.
>

And reverting this patch breaks boot for those who rely on a relative
symlink ; that is also wrong. Maybe you're right and
update-alternatives should be abandoned altogether for managing kernel
symlinks.

> Regards,
> Andreas
>
>
>> Cheers
>> Andrea

David

>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/2014-July/093988.html
>>
>> >
>> > | update-alternatives: error: alternative path is not absolute as it should be
>> >
>> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> > ---
>> >  meta/classes/kernel.bbclass             | 6 +++---
>> >  meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
>> >  2 files changed, 5 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index 12a748d..8cf357f 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -49,11 +49,10 @@ python __anonymous () {
>> >
>> >      for type in types.split():
>> >          typelower = type.lower()
>> > -        imagedest = d.getVar('KERNEL_IMAGEDEST')
>> >
>> >          d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> >
>> > -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
>> > +        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
>> >
>> >          d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
>> >
>> > @@ -61,8 +60,9 @@ python __anonymous () {
>> >
>> >          d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> >
>> > +        imagedest = d.getVar('KERNEL_IMAGEDEST')
>> >          priority = d.getVar('KERNEL_PRIORITY')
>> > -        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>> > +        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>> >          d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
>> >
>> >          postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
>> > index 22e374f..41aad7c 100644
>> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> > @@ -63,7 +63,7 @@ pkg_postinst_kernel-devicetree () {
>> >                         DTB_EXT=${DTB##*.}
>> >                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>> >                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>> > -                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>> > +                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>> >                 done
>> >         done
>> >  }
>> > @@ -76,7 +76,7 @@ pkg_postrm_kernel-devicetree () {
>> >                         DTB_EXT=${DTB##*.}
>> >                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>> >                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>> > -                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>> > +                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>> >                 done
>> >         done
>> >  }
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

