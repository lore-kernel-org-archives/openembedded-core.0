Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8B7C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 09:17:37 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.70306.1674206255560588094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 01:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A8chznCG;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id z194so2165382iof.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlA8ZIMS/WWu3EZgmZUkOwS89ZSWfPUYhLXCR9WUQ3g=;
        b=A8chznCGK6XSW05qqUZ/Hn4x+ZRQgnVNIZnKPuNkHIKFBxVFO+Hzi0YKwVK7QPhLeA
         cfZLXKz/Bvb2pMOf87iGsH3QNaNcpkDM5JqVGM+ypimX6nLGEVmf3ZzxV5uTYNFDafRR
         Sk2rtZjCQERP0Sas98ensdYaU2bwPAJkAVir+AXj4Iuik9QERGjnF1EEH3bVgP1tbJi4
         AsMIYeY4qIBWwHcZo9Om4FXqGICPjj692I2R8hzoWoTKpXr3C3jAe19gA7i+QqFnXLAH
         H1wiBQ2b3GE9AghCCrB6XD/72sLYisYKpZio5s8NVOJ4LmscvWzaVDc7UeyyLv5LX47P
         49qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlA8ZIMS/WWu3EZgmZUkOwS89ZSWfPUYhLXCR9WUQ3g=;
        b=teaDKufjwJKYjyLY5SqQz5SHpXtvZiO3eY9JPAQZ5mhdvblhV1lEV/ZbNkNegB4Oxx
         SmdYaZA7dJEXqZ8QZPl0NKwBUkkwL9KUTG4HMdAdv71LzyktW3oMQ7xHga+QmNoM6OC1
         db+Ef+wYMKx5zboar4NYdMf2UWidxZTayc+OUQn8tvFfjHFYtIUAGfaZUXgqoSkYKzFR
         m4kupWKA7uu4WAlRI7BVZ3VQ3WEv3h4eC+s6xoFNgQQ7k3J51IuMwO7x4vP/moMpGtY3
         v4ViT0GfadOtT3ZyMAczis9l7bqFFZXATNIzetn5R1CfctSI7n6ZYpcLkhfm2zEtMzf/
         vWkA==
X-Gm-Message-State: AFqh2kpJBqNVq+vbMppiscBiNfEjgwE6yjFPxgrdR5w0L3A46Irpz+OJ
	NBXRLV8W2Ipf/IIFec2hUcp9aaT1sxpTnLvov7g=
X-Google-Smtp-Source: AMrXdXvwN2StTCa6bS//X8JY8oYFIIP2yJbxhoQPqtlTVpwqH+I7v5AU9NXqz3H8B3GepIEmUxEI6yOs0kJwVUPx8z0=
X-Received: by 2002:a02:c605:0:b0:3a0:794e:93b1 with SMTP id
 i5-20020a02c605000000b003a0794e93b1mr1221841jan.74.1674206254759; Fri, 20 Jan
 2023 01:17:34 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
 <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com> <173BAB2A8E99CD9F.14781@lists.openembedded.org>
In-Reply-To: <173BAB2A8E99CD9F.14781@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 20 Jan 2023 09:17:23 +0000
Message-ID: <CAO5Uq5QRK-5AXVmD9XpVMe-5O-zqqN8Lmm0wj8VtV-YeU+mMnQ@mail.gmail.com>
Subject: Re: [OE-core] Rust crate checksums
To: alex.kiernan@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 09:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176181

On Thu, Jan 19, 2023 at 9:18 AM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, Jan 19, 2023 at 8:53 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I think Cargo.lock contains those checksums and that forces cargo to
> > verify them? Can you check that verification happens and fails when it
> > should by e.g. patching it to have bogus checksums?
> >
>
> Ah, yes... I'll check.
>

Crates which are required by the main artefact are checked, errors
turn up like this:

| NOTE: cargo build -v --target x86_64-poky-linux-gnu --release
--manifest-path=/home/alexk/poky/build/tmp/work/core2-64-poky-linux/binary-security-check/1.2.7-r0/binary-security-check-1.2.7//Cargo.toml
| error: checksum for `goblin v0.6.0` changed between lock files
|
| this could be indicative of a few possible errors:
|
|     * the lock file is corrupt
|     * a replacement source in use (e.g., a mirror) returned a
different checksum
|     * the source itself may be corrupt in one way or another
|
| unable to verify that `goblin v0.6.0` is the same as when the
lockfile was generated
|
| WARNING: exit code 101 from a shell command.

But if you list a crate as the primary source, rather than pulling it
from git, something like this:

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d426d11f66aaa533f62910f3bd79dfb6"

SRC_URI = "crate://crates.io/binary-security-check/1.2.7"

inherit cargo cargo-update-recipe-crates

require binary-security-check-crates.inc

You end up down this code path
(https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/crate.py#n100)
and the checksum isn't verified.

So not terrible, but could do with fixing at some point since the
crate binary starting point is clearly the "tarball" starting point.

-- 
Alex Kiernan

