Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70839C001DF
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 13:35:06 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.11085.1691328899379147696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 06:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g1Nv7/qa;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-583e91891aeso42520707b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691328898; x=1691933698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dU0olsDn2QQYf0x4uUJqz8YdVypDPY/PRYW/mxbNvoc=;
        b=g1Nv7/qal4aHTyyYGGf778xgFiwZzEkSM4PLAdwQ+62e9TCHEbHR6GVrW/TDUhoKTo
         fwkXmqi+h4p/mrn4/j2wDGSmOP4y6pnZvYwmu/5gJyE6HdIB3vtbQOz2AropgkkSbhjp
         wiKcLuQKYwVP0vcPhWKQ9OXhAHvtOUlPb6UIzv3mFL4+x5FjEJY3LRfGOPjx/XUiEtQN
         6oI1HOe2QD+Zchqg0+EuM/nVyW4Yk8GkZEbKcdNq1ZcULdf4M3guz3tMjKEEL8unMlnD
         zWxZYbRfskqiIGfv7nkl3zN7mFuKuuOqB6ij7ZBtlz5ORtDOM0/Y55MgzxITxF+0K2vk
         D8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691328898; x=1691933698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dU0olsDn2QQYf0x4uUJqz8YdVypDPY/PRYW/mxbNvoc=;
        b=Pg+HxA+ypAdM9+/zW2FHL2nO9xaswSKCl0oYg+2r3kZE2IcgOPnf6CJlIvgK7rONP0
         GITlfla5DUlbSw8vfDitj6vMKmE6DuFC0nCPsE9VmUc49IB4BgR1gsyU6llQovGIOimZ
         0jkCWf6PofHUwRmWxIUQFPUSdFBJAak6b3NXNBdVvdviCWGazPAslVFuDtTHXQw3dHdl
         p8GPcAhO9yLEZhGsIOD1YgUXdo9yxfDjyeq4SGSeaAmPxbWzcV9VdOx/bm1jZzvD0BSG
         OMjkJKy7InRIehFkr3JYHgMasQHP0ZUh1mL8YiPt3U4/HIUlXaFZRVMquHcOAy55xZ4x
         VT4w==
X-Gm-Message-State: AOJu0YyYI7mfr/1bchaBB1GGoxDU9sVQjImLh8m17JYpc5Y5B3kydIRK
	WwtON/EqeC5Wot10Rg8VTj6KNxG0kHkrvFZSTS8=
X-Google-Smtp-Source: AGHT+IFzHl/wEMt2En2j0IebqQ8Wc6A9paNFWdJS8TBDvdknI82VKMvbamKAt3FpgxSW3x/D1wCxuH/I1hJOLpYNDkY=
X-Received: by 2002:a0d:e2c4:0:b0:565:c1a7:d197 with SMTP id
 l187-20020a0de2c4000000b00565c1a7d197mr9137298ywe.39.1691328898284; Sun, 06
 Aug 2023 06:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com> <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com> <20230806132213bed8666e@mail.local>
In-Reply-To: <20230806132213bed8666e@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sun, 6 Aug 2023 14:34:47 +0100
Message-ID: <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 13:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185568

On Sun, 6 Aug 2023 at 14:22, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 06/08/2023 14:15:27+0100, Luca Bocassi wrote:
> > Where does that objcopy command come from? It looks awfully like it is
> > hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
> > have to be calculated based on the components being added to the PE.
> > I'd recommend to use 'ukify' as that makes it much easier, and
> > actually we have an intern working to add a bbclass for that just now.
> > But it's not needed, you can do the calculations by hand too, dracut
> > used to do something similar and was fixed some months ago iirc.
>
> This is from do_prepare_partition in scripts/lib/wic/plugins/source/bootimg-efi.py

https://git.yoctoproject.org/poky/plain/scripts/lib/wic/plugins/source/bootimg-efi.py

                objcopy_cmd = "%s-objcopy" % target_sys
                objcopy_cmd += " --enable-deterministic-archives"
                objcopy_cmd += " --preserve-dates"
                objcopy_cmd += " --add-section
.osrel=%s/usr/lib/os-release" % staging_dir_host
                objcopy_cmd += " --change-section-vma .osrel=0x20000"
                objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
                objcopy_cmd += " --change-section-vma .cmdline=0x30000"
                objcopy_cmd += dtb_params
                objcopy_cmd += " --add-section .linux=%s/%s" %
(staging_kernel_dir, kernel)
                objcopy_cmd += " --change-section-vma .linux=0x2000000"
                objcopy_cmd += " --add-section .initrd=%s" % initrd.name
                objcopy_cmd += " --change-section-vma .initrd=0x3000000"
                objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)

Yeah that's a bug, and it needs to be fixed, those sizes can't be
hard-coded like that, as soon as you build a slightly different stub
it's going to break.

