Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8B1C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 22:46:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.365.1633041963539893351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 15:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EHjLP6Xj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a18so418134wru.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=86opSorsQxcZmr97Y11mrdCNvFZp66CdU2QillQCqQ4=;
        b=EHjLP6XjJtU8u01oAZQLrngbdg82p6qoGdHGMgTd771xHpuzEFGVL0YLwI2xOgGDTz
         zopSa8EHc7byk21kppUPN//p+NvlIXjXBJMT5WFUAm391YW5iAj4XOy1qUAG3K+GIEW/
         z0i67fyVfqTShIQHudlFp9PzcbPRglqBwh4OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=86opSorsQxcZmr97Y11mrdCNvFZp66CdU2QillQCqQ4=;
        b=4KaNXDNQOz6uL6GbhYVMy7EczIsOeHqSw/C/lEhamiR79uT2BpoGu3MsbFxmx7VeST
         hxU2Fmx6BM7wlF9hQxdkSEwbLOtvHjwCxYbzF4Qe6gatynoNYPKBw0MstTxG/0MUBEPV
         chH59UtoFWx5vVFeLr0Vlg+hxlR6u2WSHFHtiUE2+gfG97ZKttdZhIM49nGBRKrIqwOv
         v7V8P4NfII3lN4ebxKwtdVaB65U/OV+jc9AuGlEz892zD2fotwqRzkSIAgwrvwusMGLF
         r5q0D5DmJ3AFq/s2JUwa/n+r745orz8JzZx1dX/zmcpuQ41c/Fo2iyBbdYnuIMrHHOrH
         XBAQ==
X-Gm-Message-State: AOAM532ODS3poAq9Et5tZtVwJmewZhS3t9ehvRuvoS7iXIcbQupPdI8v
	C3S8Sw+HIudZpuXku2tAc+Ph9g==
X-Google-Smtp-Source: 
 ABdhPJyk2X7XlnzQkd1O3RiY6EvsPKqMFF9ENAU8OyCoIi+hOAtdhhN7YJonwlBjX/wtg4sQStix8Q==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr8932243wrc.102.1633041961734;
        Thu, 30 Sep 2021 15:46:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:415a:6029:9a90:9863?
 ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 p12sm4579447wrm.90.2021.09.30.15.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:46:01 -0700 (PDT)
Message-ID: 
 <0c89091d931bd81497bb81df47f1dfb559f2fffe.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] wic/bootimg-efi: Add Unified Kernel Image option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Klausen <kristian@klausen.dk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Sep 2021 23:46:00 +0100
In-Reply-To: <YVGooo7LiUG3JQ0h@bob>
References: <20210913081304.10799-1-kristian@klausen.dk>
	 <YVGooo7LiUG3JQ0h@bob>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 22:46:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156509

On Mon, 2021-09-27 at 13:18 +0200, Kristian Klausen wrote:
> Den Mon, Sep 13, 2021 at 10:13:04 +0200 skrev Kristian Klausen:
> > "A unified kernel image is a single EFI PE executable combining an EFI
> > stub loader, a kernel image, an initramfs image, and the kernel command
> > line.
> > 
> > [...]
> > 
> > Images of this type have the advantage that all metadata and payload
> > that makes up the boot entry is monopolized in a single PE file that can
> > be signed cryptographically as one for the purpose of EFI
> > SecureBoot."[1]
> > 
> > This commit adds a create-unified-kernel-image=true option to the
> > bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
> > it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
> > Specification[1][2]. This is useful for implementing Secure Boot.
> > 
> > systemd-boot is the only mainstream bootloader implementing the
> > specification, but GRUB should be able to boot the EFI binary, this
> > commit however doesn't implement the necessary changes to the GRUB
> > config generation logic to boot the Unified Kernel Image.
> > 
> > [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> > [2] https://systemd.io/BOOT_LOADER_SPECIFICATION/
> > 
> > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> 
> Any update on getting this merged?
> 
> Cheers,
> Kristian
> 
> > ---
> > V2:
> > Add os-release as dependency
> > Pull os-release file from STAGING_DIR_HOST, so it doesn't need to be
> > installed into the rootfs
> > Add selftest
> > 
> >  meta-selftest/wic/test_efi_plugin.wks         |  6 ++
> >  meta/classes/image_types_wic.bbclass          |  5 +-
> >  meta/lib/oeqa/selftest/cases/wic.py           | 29 ++++++++
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 71 ++++++++++++++++---
> >  4 files changed, 99 insertions(+), 12 deletions(-)
> >  create mode 100644 meta-selftest/wic/test_efi_plugin.wks
> > 
> > diff --git a/meta-selftest/wic/test_efi_plugin.wks b/meta-selftest/wic/test_efi_plugin.wks
> > new file mode 100644
> > index 0000000000..1603d6c4bb
> > --- /dev/null
> > +++ b/meta-selftest/wic/test_efi_plugin.wks
> > @@ -0,0 +1,6 @@
> > +# short-description: This file is used in oe-selftest wic module to test efi plugin
> > +
> > +part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,create-unified-kernel-image=true,initrd=${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --active --align 1024 --use-uuid
> > +part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
> > +
> > +bootloader  --timeout=0 --append="console=ttyS0,115200n8"
> > diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> > index d561fb2636..e3863c88a9 100644
> > --- a/meta/classes/image_types_wic.bbclass
> > +++ b/meta/classes/image_types_wic.bbclass
> > @@ -27,6 +27,7 @@ WICVARS ?= "\
> >  	ROOTFS_SIZE \
> >  	STAGING_DATADIR \
> >  	STAGING_DIR \
> > +	STAGING_DIR_HOST \
> >  	STAGING_LIBDIR \
> >  	TARGET_SYS \
> >  "
> > @@ -84,8 +85,8 @@ do_image_wic[deptask] += "do_image_complete"
> >  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> >  WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> >  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> > -WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
> > -WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
> > +WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> > +WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
> >  

Sadly this fails during testing on several machines:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2676

which is probably from the os-release dependency. I need to remove this patch
and retest but given it is wic failures, I suspect this patch...

Cheers,

Richard


