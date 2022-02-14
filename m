Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B70C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:28:52 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web09.36525.1644856131255271069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Snbf5+g+;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id l10so2265171vki.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBuCDp7m6iiBUKHOwvXQodD+mce5DOytb1l3woJJiYU=;
        b=Snbf5+g+2W15+7IzX3DTkeRwdwoEV7ygwJ/XEV/H23ismRw+XtA8ORQrtfRyEACNkJ
         TyDF9XBbjSP5jwnxrq6spdRX1sxOkDA6pHhwMFDEVeI+10B9qI5cCqAk230tlZlx9jMX
         s9mFcnVN6XYUUd1DYhvrsSnO4t3s/NWzQnr0/ona+98ty92Ydm0wleBq3Z4Xq4FtNbL4
         nJs2b5HXD8K06LRYA9GIDINUSo9suP29JiLRTYJQ/kZR7TkxtnRF8H0z/vELgCptfuGQ
         /Q78GlHebxH+9V+dyVGdrsKsvqq7YxEhBewl4hWpOBLe8/xsY3kYC9C483xzAX9BbG46
         77YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBuCDp7m6iiBUKHOwvXQodD+mce5DOytb1l3woJJiYU=;
        b=BVcuWMwj+SK2ID2X2/zfSG0UXCEFe24zSf9kaQSU8mLNrZ6Hcm6H0o/REH7Je2USgW
         Ertvvur6QEii5+2dQ+RLRk743yUau2OJ2lTDsgrRWJWDnWmNRf0UHqE9QO1OWKhpGvKq
         wbUr02p/OlT4HaIqP/Mig7MLIxyV29KkmLA2oFwTITdCledJojI4wc/31vU6H3X6GU0H
         IYJwk8dq9ch5i9If/oMioJNpLOrkqPnIT8xQfUeieqnoX0tuk+IoCwvqbVxQYbtVxJ0v
         4kP6jP9iTf6GNgML6o7JbRdBWxwg5WLlL/Cc90LNOYmrB4Pdm0wyeBEqP+OTY+Sbue7W
         cHXw==
X-Gm-Message-State: AOAM531lX3yD3tEO8mwTZsCtCVpfyYvmvItOSyHQH/hk5NQZAsmz5Web
	UGRsX5BZFt7LDjopMunj4o4AccZTneqwEb6/IHs=
X-Google-Smtp-Source: 
 ABdhPJwFIyQA37EHc4ZF2tLCyrWMatHxpGxJAaVHjn9412HaLiHd6czMdq5cNETkO2s2sE+t1qkEALpOjdZFONxUPFU=
X-Received: by 2002:a1f:ab56:: with SMTP id u83mr94306vke.30.1644856130283;
 Mon, 14 Feb 2022 08:28:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220214154521.26905-5-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220214154521.26905-5-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Feb 2022 17:28:39 +0100
Message-ID: 
 <CANNYZj8scA0wBen_qmXQEb1yD_hx806xGynxBwyJzqbyQCL-9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/5] selftest: wic: Disable graphic of qemu
 to support WSL
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:28:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161724

This fixes one location where the problem can occur in selftests, but
what about all the others?

Generally, it is not selftest's job to ensure qemu can be started: you
need to either tweak runqemu to detect WSL, configure
qemu-system-native from your local.conf so that it doesn't enable sdl
or gtk, or, better yet, fix the problem at the source - find out why
graphical qemu doesn't work in WSL and fix that.

Alex



On Mon, 14 Feb 2022 at 16:46, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Disable graphic support of qemu to support qemu tests in WSL.
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
> Changes in v2:
> - Add patch
>
>  meta/lib/oeqa/selftest/cases/wic.py | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index a021f8d84b..6f3dc27743 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -851,7 +851,7 @@ class Wic2(WicTestCase):
>          self.assertEqual(0, bitbake('wic-image-minimal').status)
>          self.remove_config(config)
>
> -        with runqemu('wic-image-minimal', ssh=False) as qemu:
> +        with runqemu('wic-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
>              cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' " \
>                    "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '/dev/sda4 /mnt'"
>              status, output = qemu.run_serial(cmd)
> @@ -871,7 +871,7 @@ class Wic2(WicTestCase):
>          self.remove_config(config)
>
>          with runqemu('core-image-minimal', ssh=False,
> -                     runqemuparams='ovmf', image_fstype='wic') as qemu:
> +                     runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
>              cmd = "grep sda. /proc/partitions  |wc -l"
>              status, output = qemu.run_serial(cmd)
>              self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> @@ -1059,7 +1059,8 @@ class Wic2(WicTestCase):
>          self.assertEqual(0, bitbake('core-image-minimal-mtdutils').status)
>          self.remove_config(config)
>
> -        with runqemu('core-image-minimal-mtdutils', ssh=False, image_fstype='wic') as qemu:
> +        with runqemu('core-image-minimal-mtdutils', ssh=False,
> +                     runqemuparams='nographic', image_fstype='wic') as qemu:
>              cmd = "grep sda. /proc/partitions  |wc -l"
>              status, output = qemu.run_serial(cmd)
>              self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> @@ -1119,7 +1120,8 @@ class Wic2(WicTestCase):
>          self.assertEqual(0, bitbake('core-image-minimal').status)
>          self.remove_config(config)
>
> -        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
> +        with runqemu('core-image-minimal', ssh=False,
> +                     runqemuparams='nographic', image_fstype='wic') as qemu:
>              # Check that we have ONLY two /dev/sda* partitions (/boot and /)
>              cmd = "grep sda. /proc/partitions | wc -l"
>              status, output = qemu.run_serial(cmd)
> @@ -1180,7 +1182,7 @@ class Wic2(WicTestCase):
>          self.remove_config(config)
>
>          with runqemu('core-image-minimal', ssh=False,
> -                     runqemuparams='ovmf', image_fstype='wic') as qemu:
> +                     runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
>              # Check that /boot has EFI bootx64.efi (required for EFI)
>              cmd = "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
>              status, output = qemu.run_serial(cmd)
> @@ -1418,7 +1420,7 @@ class Wic2(WicTestCase):
>              bb.utils.rename(new_image_path, image_path)
>
>              # Check if it boots in qemu
> -            with runqemu('core-image-minimal', ssh=False) as qemu:
> +            with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
>                  cmd = "ls /etc/"
>                  status, output = qemu.run_serial('true')
>                  self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161718): https://lists.openembedded.org/g/openembedded-core/message/161718
> Mute This Topic: https://lists.openembedded.org/mt/89138943/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

