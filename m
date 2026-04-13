Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8953BF34C5C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:32:31 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.274051.1776090745112824114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OL5Qhdmh;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d87c138e1so46764261cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776090744; x=1776695544; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9nDQYd3tAtdQ+ONbbGlwnJIkGh0Fa6ts3vbbIPPQNo=;
        b=OL5QhdmhCbibwEhrrNKLDystd2OoULfKgrHMdwBN/+d6wj6vRqJsWALR5aeHWeO9q4
         zhXzWXFsz02kO9JkioIaSQKbYYmVyqJGjKtHMqzPJ+4KZDiMTrf3pGKPPzK3dJVvSk5a
         t4CIYlc7v3Xj00mun3IWk5lFASyJSd7Y/CgN0hun/Ot0RHshVTXqBuyfGLgBQFaaLJnm
         BuQ57mSboQWy/gkmDH+F+ePHBUX/p8gY+ku3E3aiLiu0VYNZ3pZ0rzyONYEAPOh9+Lao
         nTsxHYE+mUMICnQezMySgwqZ/P2tDTc8x7vek37Y7uGRGgSwEP46U2f4ydYwA5kK0kbd
         qhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090744; x=1776695544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9nDQYd3tAtdQ+ONbbGlwnJIkGh0Fa6ts3vbbIPPQNo=;
        b=lWEEsEObFzR+dyUycd1CftaRq8aVLJ10GMZgQ7SroTAUbA2gEIZeRvhKly8zNBuEhQ
         yKyyAIyixqd7oPeD26pwYsVzb0lzcMYFwkosnAQ7SF0cey2Vzykib8JrbtEFPPS580oL
         mpB7pbiMsI/J2uLO3CAxhxQSAmBScIcf4YusLhvj5mvVEXoqwaiXGM/rQo6YrwV+jrWz
         1IqvCuUGi/vzBFeRHgOwJFfpj+07XMwbSAKgLazGsvLcQ7Le0KPVxKpJphW6RNaBIYdG
         am5mbfcSf7YY2ryihH242oxx7B/7ln2tH2Gv3/aoNg3NLg15YyZeMHcBP+DgoscslAxg
         Z1JA==
X-Gm-Message-State: AOJu0YzgXCjITTt5bOUEWU/GuMNjDR4kmgh/aM56TvoVmtk2lZ6cFfQb
	262uo09LXnyVhYpMBzonizOe9NW5ifZOrMCbCRJndkXB5sOhSbObM2KEcs2qbvi5
X-Gm-Gg: AeBDietOCt7GZuhWjI8G5381KxFzkWqHbGk02GVf36jYJgyGpXwmWyCHzTOs/RsL/jT
	ce/uI1tazDdba848VTyy/AGU0SaeQOTAxB08106mz7MpV70OoYd6OslVs02CPH3H8n7/k40E5c5
	IITQkHyxrgGhrbHRglNSVea1Gxze8JtrCyVMN42G6w7xIFFdE9J3t1avyuZQ97yFhGN2oqPhIBi
	S9PyvHlroU9pSXxvsNfWZy92QDc0kXvblHsyGzvQpLhGAS563mO/NOVGGKJwNg0s1tU9PSblYm9
	YW+tVIkGG3+z8xCKRE7ikhoJ0ODj+cjEPpFPseXGIThzCDhF6HtBsq6xqFxE4951zdJmKBBN/kt
	65YWMXOrIHpsFznZ5k2fl887ptJcQbOvi51y6nk5+HUBdIQejD8wNp8jUW0mi9CUbPQeuDeB7S/
	khtz/GY2Ym0JkbR9mYGY22OXb+ragKw6h7R42q6CG1U0bVMBBiy14nXeikrvW0UHoRkg==
X-Received: by 2002:ac8:5741:0:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-50dd5c63931mr195941631cf.52.1776090696963;
        Mon, 13 Apr 2026 07:31:36 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd5651482sm86404341cf.31.2026.04.13.07.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:31:35 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:31:33 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v8 1/1] wic: re-implement sector-size support
Message-ID: <adz-RZli86PVz34E@localhost.localdomain>
References: <20260326001150.203099-1-twoerner@gmail.com>
 <20260326001150.203099-2-twoerner@gmail.com>
 <DHRX8N5OL55X.3OKSM6LCFRKA1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHRX8N5OL55X.3OKSM6LCFRKA1@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235115

On Mon 2026-04-13 @ 11:32:16 AM, Antonin Godard wrote:
> Hi,
> 
> On Thu Mar 26, 2026 at 1:11 AM CET, Trevor Woerner via lists.openembedded.org wrote:
> > The previous implementation had the following limitations:
> > - required the variable WIC_SECTOR_SIZE either be defined in a
> >   configuration file or be defined in a --vars file
> > - this means that every invocation of "wic ls", "wic cp", or "wic rm"
> >   needed this variable defined (config or --vars)
> > - required the user to create separate *wks files for every sector size
> >   they wanted to use
> > - required the user to specify the --mkfs-extraopts by hand to specify the
> >   correct sector size: e.g.
> > 	bootloader --ptable gpt
> >         part --fstype vfat --label emptyfat --mkfs-extraopts "-S 4096"
> > 	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"
> > 	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
> > - it would not be possible to generate images with different sector
> >   sizes in the same build since the configuration and *wks files would
> >   need to change and the build re-run for each size
> >
> > The new implementation handles the sector-size via a CLI argument, while
> > preserving the previously implemented variable definitions:
> > - the sector-size may now be provided on the cmdline to the "wic ls",
> >   "wic cp", "wic rm", and "wic create" commands: default = 512
> > - this means the configuration and/or --vars file does not need to be
> >   changed in order to perform those operations on images with different
> >   sector sizes
> > - support is provided implicitly for mkdosfs and ext[234] partitions
> > - the user no longer needs to know and supply the sector-size magic in
> >   --mkfs-extraopts (thereby clobbering the other defaults)
> >
> > As before, if the --sector-size command-line argument is not given,
> > allow the sector-size to be provided via the WIC_SECTOR_SIZE bitbake
> > variable. The user is warned that this behavior is deprecated. If both
> > are given, warn the user that the cmdline argument takes precedence.
> >
> > AI-Generated: codex/gpt-5.1-codex-max
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> >
> > - restore environ test case, as it is still supported (but obsolete)
> > - revised commit message above
> >
> > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > ---
> > changes in v8:
> > - Mark Hatle stepped in to help provide advice and updates
> > - add back the code and test to support/allow users to specify a
> >   sector-size in --mkfs-extraopts, this gives the user 3 places in which
> >   the sector-size can be specified:
> >   1. cmdline
> >   2. --mkfs-extraopts in *.wks files
> >   3. WIC_SECTOR_SIZE bitbake variable/--vars file
> 
> I've written a migration note here (sent on the docs list):
> https://lore.kernel.org/r/20260410-second-release-notes-6-0-v1-11-40213436c3ca@bootlin.com
> 
> Could you confirm that this is the right approach?

Yes, that should work. I was envisioning people writing their own
classes to call wic with the appropriate sector-size setting, but
WIC_CREATE_EXTRA_ARGS should work fine as well.

Thanks!

