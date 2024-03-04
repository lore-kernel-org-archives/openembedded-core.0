Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DD3C54E41
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 09:26:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.94441.1709544362734359893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 01:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9t1Hu7P;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d275e63590so58788591fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709544360; x=1710149160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GWOTSzX4UthImtD+3nDrOrkyY/jYupC210v0wpDjVXE=;
        b=J9t1Hu7P+P9nhG0hJjhO+4ixueBMIacL9PaAV4mpA2X0QE6VLu/pMTshC7pAt4WSGW
         iA5Zgh3m5Oz54wV5wCxb0WNwj1g4GOH1bT7cFyxCpXPR9NnbBT3ch826n6BesnCBUAzz
         4iD8R71SNkVxcP7O9pml/0yDA3+ui9XI1HIN3zrufLPLWOPuimHNixhtCTNi0+GOHb/L
         J3eEZOOI61kt6nRR1ZfA8T/wHnRPEbRMoNdaggnnpJeVJBDo47R3AiRHqcXN2yR+x7PO
         +pPUfEMR7vKD9MkerWthf5fNbHRZUYur7TxkyIFFQ6sIIvBxov6P/GAHH90p7mvAwIBN
         BoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544360; x=1710149160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWOTSzX4UthImtD+3nDrOrkyY/jYupC210v0wpDjVXE=;
        b=gYpxNt7/K4ajwbNA/caQtqTsCD2EPbQbCHlOwxQoFi5AnDeHiUt987k0rOq6HGOytZ
         rfo14fiBozBpzGixrS42P5f0w18ATDJ9gPB1nsmca7AfTKsXqiJv3jTvssze3zyUTccq
         xOgCwEes+bmH9jcY0ot/VdPsoMocwu367tRZVGNp7lznPkE+g8tudxKzuo3prUjOKKvK
         5KABs7m7vbnLcCTw7C7Ph1hdS43aqghtYYVmwKsUTvjCClhIKfe4Cs/wqM7VYfVFDBcA
         1f+6x1eGuI8bhRp1afAm3gLPe3EaAPtTCUH/nZ+FOwLkVhkUQM+2RiKg3L0WjYL8E1b8
         kMxw==
X-Gm-Message-State: AOJu0Yx9dax13kGwMJ9eHcsGvWwunGkuyEvdz8U1lV3OZObWYIFanC8j
	cTE8BZgT2b+U5SAVPz9BvDKPdouT2l/rPqfuIDs/5U6e7Dh3yDsx/ZYWi8fZTO7S3OPMT8u7HxE
	d0+s4t3Nq7a10NKQlIUv5xcRBpAo=
X-Google-Smtp-Source: AGHT+IE8+S7srWcoIJH0p58zfrnwS0xhvFlPR11gvU+Cr+v9zYmgzyMSSFGEScZHbnPBBjFddXHsGmKikj++a9J7g3I=
X-Received: by 2002:a05:651c:a05:b0:2d3:db38:1cc with SMTP id
 k5-20020a05651c0a0500b002d3db3801ccmr636703ljq.0.1709544360355; Mon, 04 Mar
 2024 01:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Mar 2024 10:25:49 +0100
Message-ID: <CANNYZj-=6FAbQFBVpjzw+M6bc9huAYpO5vGnf6nwvxXx7Wc8dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 09:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196592

There is a feature freeze now, so this might have to wait for after that.

Alex

On Mon, 4 Mar 2024 at 07:16, Johannes Schneider via
lists.openembedded.org
<johannes.schneider=leica-geosystems.com@lists.openembedded.org>
wrote:
>
> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" = the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
>
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
>
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up again
> when collecting the rootfs of such a extension image.
>
> with all this in place an example usage could look like this:
> some-core-image.bb
>   inherit core-image
>   IMAGE_GEN_PKGDBFS = "1"
>
> extending-image.bb
>   inherit image-sysext
>   IMAGE_FSTYPES = "squashfs"
>   IMAGE_BASE_PKGDB = "some-core-image"
>   # the above pointing at a package-db similar to:
>   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-pkgdb.rootfs.tar.gz
>
> then on the device, running some-core-image, with the extension image placed at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=debug systemd-sysext merge
>
> As long as the VERSION_ID of the extension image matches the os-release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-sysext.
>
> =========
>
> changes with v2:
>         rebase from 'kirkstone' onto 'master'
>
> changes with v3;
>         incorporate review suggestions for simplification
>         add task dependency handling
>         add oe-selftest for the pkgdb handling
>         add variable documentation and
>         some more comments, and examples in the commit-msg
>
> changes with v4;
>         rebase onto 'master' => no functional changes
>         fixed patchtest findings
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196588): https://lists.openembedded.org/g/openembedded-core/message/196588
> Mute This Topic: https://lists.openembedded.org/mt/104717642/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

