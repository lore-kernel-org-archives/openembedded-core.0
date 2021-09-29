Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7BCC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 22:29:16 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.4577.1632954554517207449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 15:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OyJHYW1k;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g7so14229525edv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 15:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Icy/7aOx257IzNlCbhSjEXgLiujYZV8UOERkFfR1h78=;
        b=OyJHYW1kEOzpXL3TJGjtELBp9cFIDNfqPPFej+MpoIkM2X91lgx8DXndcR1ggYnavT
         HPu/zSje7B18RzhatLZ8n1RPLl+9JqMx3wI2IHDl4lXw/DMMwBToOZJwNJ2bc/l2Ps+L
         ePsyXWNkbzjSaMHsbqTps93gDYakBECe5uII6oo3ws2vGj0cYWmzVxwOeth6Hu2aBUpn
         VvSfBccw8Kz7svQbMMv4cGVEpp2HZeadXOkQ5gpo8v1FW+OpTDfFuqZ234h7zt4W77ZJ
         fBhaFNHmfNFxeCbryQRRnmufvwEWHaaVsQFuc0/UZ+Mkdp+rcRZQTHzu42ExJMCkRhOS
         HTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Icy/7aOx257IzNlCbhSjEXgLiujYZV8UOERkFfR1h78=;
        b=AhZ8muFhOGKPuMLmyhQ7oD/1MnCJ7lWz/q8o01k0e6/AHL/5nx6pnZkfqmNPf2YTIk
         3P6ephr8UXTcIwZgBIyAap/XE9QFnGO4Sbllt2P4yLI77d5umogHgphNuyEn4NqrN5ol
         PjnVy8n60XaJAgTEScMeIJf9QWjmrMitnRQrr6gzM3ullY+fbu3b1WQHIaYc+grTjIf/
         9+DwzfgVDu/GCaDyaUVqdw/Gl9O1sNbHvnqEkdQkoJua7hzGXuZEg3omVP7rGEU7aPax
         WgGpjNJa4eYGoPaG/epwP4Hca3xPkUIR/LmRt/Kt+BjwCoEmHLBIlkuSFWiKYupaMb1T
         YnLw==
X-Gm-Message-State: AOAM532TijfjFmYaZ8c6YlkLxvW5phIWbn2sauSa9fB/84s+x1Or6GxI
	oQbWV/6Z17geqiKfFyFKC13o/LJrl7POPZ4EfwY=
X-Google-Smtp-Source: 
 ABdhPJwwGdlBdGgbume2p2BuUKKhnbEFhMqClljcs5zsLPjZmmd6hL3gLLDaYwJqz/71if2g4wwU0pqi64YVi+Jwzlk=
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr2737748eje.165.1632954552846;
 Wed, 29 Sep 2021 15:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210929205711.193186-1-raj.khem@gmail.com>
In-Reply-To: <20210929205711.193186-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Sep 2021 18:29:01 -0400
Message-ID: 
 <CADkTA4OThEQPEMUMq-nzmpZ57gYSHERhWS9PYnv37Ua_sU-5-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace_5.13 -> strace 5.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Persian Prince <persianpros@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 22:29:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156477

On Wed, Sep 29, 2021 at 4:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Persian Prince <persianpros@yahoo.com>
>
> Strace 5.13 won't compile with 5.14 headers:
>
> | ../../strace-5.13/src/fs_x_ioctl.c: In function 'fs_x_ioctl':
> | ../../strace-5.13/src/fs_x_ioctl.c:64:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
> |    64 |         case FS_IOC_FSGETXATTR:
> |       |              ^~~~~~~~~~~~~~~~~
> | ../../strace-5.13/src/fs_x_ioctl.c:71:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
> |    71 |         case FS_IOC_FSSETXATTR:
> |       |              ^~~~~~~~~~~~~~~~~
> | make[3]: *** [Makefile:5011: libstrace_a-fs_x_ioctl.o] Error 1
> | make[3]: *** Waiting for unfinished jobs....
>
> According to https://strace.io/files/5.14/:
>
> * Improvements
>   * Implemented decoding of memfd_secret and quotactl_fd syscalls,
>     introduced in Linux 5.14.
>   * Enhanced prctl syscall decoding.
>   * Enhanced decoding of IFLA_* netlink attributes.
>   * Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port netlink attributes.
>   * Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, SCTP_*,
>     and UFFD_* constants.
>   * Updated lists of ioctl commands from Linux 5.14.
>

I am curious for a bit more information about the configuration that
was used for the broken build, since I was able to build the existing
strace with 5.14 libc-headers and the 5.14 kernel on two different
machines.

The bump is fine, but I'd just like to understand what configuration
triggered it, so we can catch it next time.

Bruce

> Persian Prince <persianpros@yahoo.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} (96%)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.13.bb b/meta/recipes-devtools/strace/strace_5.14.bb
> similarity index 96%
> rename from meta/recipes-devtools/strace/strace_5.13.bb
> rename to meta/recipes-devtools/strace/strace_5.14.bb
> index 7d93f2da98..02a4843edf 100644
> --- a/meta/recipes-devtools/strace/strace_5.13.bb
> +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> @@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>             "
> -SRC_URI[sha256sum] = "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
> +SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
>
>  inherit autotools ptest
>
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156475): https://lists.openembedded.org/g/openembedded-core/message/156475
> Mute This Topic: https://lists.openembedded.org/mt/85959484/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

