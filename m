Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id A75CF7F93A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 15:23:12 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id u139so6273643ywf.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 07:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L70BoU/j2qncrbSUxT4UDJeVyGqglQXSQ/p4JVubdTA=;
	b=F2+iYHVwb3tac1SWj+s7x4R3PYa9+WSZ2/s75ROMKbmSh0fcNSszdJEph3fujnwBKW
	XUN0X7NYCkhWAxa1EKCNNVNo4wbJMrCzYpYENI7dRzwlWwXb5F6Z9UmkyhGi7tMqCLCh
	EoOvJKcOlMKeRnevM3Ei2bMn/Gi+UC+zej6IG/ohqL3rH1Xy3KMx46VE/qrQDK5UtsMB
	PmD9wsByEvh0jdQCBCK041bg4H225KlxN5n3SHnGzjmuxP8LLa8P42Blvu4vg72nZF25
	5BiVVjHi0YSd6EuYiKeUSnyMBrZdip0uzMan3hwkoRn322Tnyy+LYvjrIMn3VGbo0RDZ
	cm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L70BoU/j2qncrbSUxT4UDJeVyGqglQXSQ/p4JVubdTA=;
	b=qS4wn/7Mp9vpQ+sMDjUQRkcU9hGXHs/a1K9dM0XQdXQgaszzRlI5bSwth+hSA7QxIR
	2TnaOJ8AkcxfCKEAcEhss5MOqev8JMbKOl51Cu6pxgfSjpzzAov7dmqeT8H6s2FwgNpR
	1MalyJcJWKsblZBZTkAzNQVUxGpzJVnfEmfKDxmhOjd07x5JsCJE2+JS7s4tkaYFOTfs
	Zr2c3mBAbyUWc3GueSPAlIMhahswqpFjSX66BsPu2ABgdDnYYqsFO44C66vkKbMggLHQ
	kgaBYz0EP4795WTDPrPMR8oVcv2wp4zfVCLT7hXCCIkSjI5CgjJiS/hRoXgfF9A6aWvG
	GyIg==
X-Gm-Message-State: APjAAAWk365nzkCcwCPK/FFdTkElUD2H7Kp3qI3CWwqzjOvEu5JSe/LD
	Py8q7lRnTMU7T7gSmq7SZrPo+vt7xCufrQ9YeuZr4+6a57U=
X-Google-Smtp-Source: APXvYqxyXYmXkLMBYaeFztY8D+JBymq3P8dYijAEEYaKQ8u9w/DPqMkNNCZ2U5LVDsBOSGIKkpKzu3YjwHLSlv7mQws=
X-Received: by 2002:a81:1c15:: with SMTP id c21mr10041475ywc.408.1578928993461;
	Mon, 13 Jan 2020 07:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20200104200703.6758-1-maxim.uvarov@linaro.org>
	<1f1224ce-2bd6-4895-8c6a-8c113ca14e81@www.fastmail.com>
In-Reply-To: <1f1224ce-2bd6-4895-8c6a-8c113ca14e81@www.fastmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 13 Jan 2020 18:23:02 +0300
Message-ID: <CAD8XO3brWPLcF4FaEXJ3_BXhAArfRH49L4LiUjukxEfjxfd5=A@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Mon, 13 Jan 2020 15:23:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 16:57, Paul Barker <paul@betafive.co.uk> wrote:
>
> On Sat, 4 Jan 2020, at 20:07, Maxim Uvarov wrote:
> > Linux kernel can be compiled as UEFI stub and loaded directly
> > with UEFI firmware without grub or other UEFI shell.
> >
> > Tested with wic file:
> > bootloader  --ptable gpt --timeout=0  --append="rootwait"
> > part /boot --source bootimg-efi --sourceparams="loader=kernel" \
> >  --ondisk sda  --fstype=vfat --label bootfs \
> >   --active --align 1024 --use-uuid
> > part / --source rootfs --fstype=ext4 --label rootfs \
> >   --align 1024 --exclude-path boot/ --use-label
> > The same wic file for armv7, armv8 and x86_64.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
> > b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > index 2cfdc10ecd..a39d852f6a 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > @@ -13,6 +13,7 @@
> >  import logging
> >  import os
> >  import shutil
> > +import re
> >
> >  from wic import WicError
> >  from wic.engine import get_custom_config
> > @@ -204,6 +205,8 @@ class BootimgEFIPlugin(SourcePlugin):
> >                  cls.do_configure_grubefi(hdddir, creator, cr_workdir,
> > source_params)
> >              elif source_params['loader'] == 'systemd-boot':
> >                  cls.do_configure_systemdboot(hdddir, creator,
> > cr_workdir, source_params)
> > +            elif source_params['loader'] == 'kernel':
> > +                return
> >              else:
> >                  raise WicError("unrecognized bootimg-efi loader: %s" %
> > source_params['loader'])
> >          except KeyError:
> > @@ -243,6 +246,7 @@ class BootimgEFIPlugin(SourcePlugin):
> >              if source_params['loader'] == 'grub-efi':
> >                  shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" %
> > cr_workdir,
> >                                  "%s/grub.cfg" % cr_workdir)
> > +
> >                  for mod in [x for x in os.listdir(kernel_dir) if
> > x.startswith("grub-efi-")]:
> >                      cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir,
> > mod, hdddir, mod[9:])
> >                      exec_cmd(cp_cmd, True)
> > @@ -252,6 +256,29 @@ class BootimgEFIPlugin(SourcePlugin):
> >                  for mod in [x for x in os.listdir(kernel_dir) if
> > x.startswith("systemd-")]:
> >                      cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir,
> > mod, hdddir, mod[8:])
> >                      exec_cmd(cp_cmd, True)
> > +            elif source_params['loader'] == 'kernel':
>
> How about "uefi-stub" instead of just "kernel" here so it's more explicit?
>

It's the same file were other uefi stubs are defined (grub and
systemd), so I named kernel uefi stub as kernel.

> > +                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> > +                if not kernel:
> > +                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" %
> > target)
> > +                target = get_bitbake_var("TARGET_SYS")
> > +                if not target:
> > +                    raise WicError("Unknown arch (TARGET_SYS) %s\n" %
> > target)
> > +
> > +                if re.match("x86_64", target):
> > +                    kernel_efi_image = "bootx64.efi"
> > +                elif re.match('i.86', target):
> > +                    kernel_efi_image = "bootia32.efi"
> > +                elif re.match('aarch64', target):
> > +                    kernel_efi_image = "bootaa64.efi"
> > +                elif re.match('arm', target):
> > +                    kernel_efi_image = "bootarm.efi"
> > +                else:
> > +                    raise WicError("kernel efi is incompatible with
> > target %s" % target)
>
> Perhaps call this "UEFI stub kernel" instead of just "kernel efi" to make things clearer.
>

Ok.

> > +
> > +                for mod in [x for x in os.listdir(kernel_dir) if
> > x.startswith(kernel)]:
> > +                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir,
> > mod, hdddir, kernel_efi_image)
> > +                    WicError("cp_cmd = %s" % cp_cmd);
>
> What's this WicError created here for?
>

Good catch. Debug print. Will send v2.

> > +                    exec_cmd(cp_cmd, True)
>
> Wouldn't this result in the destination file being overwritten each time through this loop? I guess you're just copying from the grub-efi implementation above though.
>

It's expected that there are no other uefi stubs and I just copy
kernel to /EFI/BOOT/bootxxx.efi.

Maxim.

> >              else:
> >                  raise WicError("unrecognized bootimg-efi loader: %s" %
> >                                 source_params['loader'])
> > --
> > 2.17.1
>
> --
> Paul Barker

