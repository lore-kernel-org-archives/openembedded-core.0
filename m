Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09550C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 21:14:13 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.3653.1632950051812698383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 14:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fccl7fap;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id g41so16252659lfv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rA2LIex5aqfNC+afAQ7XCqN8YRVCO2UCZRl1OjKvKbk=;
        b=fccl7fapBiChUxBvri9SMk1Ijg1g+GHizAErATj2IiqxAN53ZCTyBSYQgujutSNKYX
         FSGGFPZ8M3shfPvGh4TsYu4vWLtG0ghMe9l/nrmF7RW4Gg8FbghwkK36JvtXumZv+lMV
         bAgvzN05URSDI0qizktW8WVj1lihukgwwvjggg1lMM7MI8lduVy+sh+7il+PMkLCsm1q
         WGO01S1ssZ2rY0QF3qfFwdBSLxk30hg6h61ZvzDbVvMc7SchThtliimVH0vtp6YVCxgm
         HHezXeOGx5yPRzSl+XsGIe5fOSPOnmz7s/x5crlpal37wm6uPoZTI/RocZKGQaLnlugz
         ODvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rA2LIex5aqfNC+afAQ7XCqN8YRVCO2UCZRl1OjKvKbk=;
        b=JP69+RkcKaxPSpyQ1gKLS/xz3tQqwqifQAsmRHGF2lg5DT7tQ9z2CYvHKJLvjhCiS+
         bxzBgNnuv3URVrqfoiL640bB+m2X1IZfxFN3Q+Dda7O0dwSWGRmHS8VcH2UCkOFZf66N
         5UuWPtrjqvbOflcRq3syFnruDDpLdL6Tu8TLa+thh+11WejcD9r4VD+Ht4IQWtKzdvJu
         G7pubAvfpxIJ5mTB2do9RqQ0ss5QEK/smJ9uvkZXamSg1lLt5yvX9pxXLqiY6UdemCET
         j89mg9O9Eoy5qc7M3wR5ctk8jrX4jMlJiTgeszIPNEQyqQnxhUf6ECLzqhEXDbHOOhIj
         pkVQ==
X-Gm-Message-State: AOAM533EebJiTC73omZ6FBy/p0XwDKLsFWDfPEim/ms3gDm9pvrE0B8S
	4R1I4RS77xWr2AiuYbZAVgTeypAdBDGnHkCFCC0=
X-Google-Smtp-Source: 
 ABdhPJyISFEGhg6TkMlUONp19tLmEePKN7oEEAbX67A4rl1/GnzYam1riWUxw2D33xXnbuu0iqjBNta2ya3Xq2sUPOA=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr1856294lfq.160.1632950049693;
 Wed, 29 Sep 2021 14:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210929205711.193186-1-raj.khem@gmail.com>
In-Reply-To: <20210929205711.193186-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Sep 2021 17:13:58 -0400
Message-ID: 
 <CADkTA4MzNm6q-azbR6G5Jdwk4tG2s=VgOs4mevTbaZJxzY7P-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace_5.13 -> strace 5.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Persian Prince <persianpros@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 21:14:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156476

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

Interesting that none of our oe-core build coverage picked this up.

I'll send out a patch that adds the packagegroup containing strace to
core-image-kernel-dev, so it won't be missed on future libc-header
updates.

Cheers,

Bruce

>
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

