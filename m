Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FDFC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 12:22:19 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.7484.1646742137915098751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 04:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PToaedym;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id c20so5781708edr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 04:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZ0zAHxGcpNfv0g6JwKbirx1V2LhCNh92+nuen/N/PU=;
        b=PToaedymz9SOhSMBHYJyL70xInz5FskOBNIA7xroDJZg9sHyJl00Apblgk3ajAvc53
         O+ImOXCLfolAEpSbyBtqc/c20gqUKGSkACxwJMQoXvWpqgwODtyW2TNHMxr21npecy2g
         +iLOzX/AIzY0BMG7KlMaH4ZGAZ/a4XjHHr1nXD2oYEuVAePoAg9L4vffkd3+elYvQUl7
         hIi4Xfvo1kpTkNA8oeD4QxuGrXsIbjavfHHkLe0eOfYAU/Y6O8JlvD3wRth4Ed5vpe5C
         dIkVfDTtj1OE9jBFof/9wM7L5PbS3JHZcCdoiUQSY3Hl65y/JQmewZOSgtHyJEa8NtbC
         SKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZ0zAHxGcpNfv0g6JwKbirx1V2LhCNh92+nuen/N/PU=;
        b=ptR5CGGttgp07caiAMr2egdWZA731wKK5LId3YVW8kHAdupPKZ4JUJcnJaIgaV41G6
         igyRAnRrkvzo8vkJjBbTo46QsMwO7no12GI38wGqZBC62m3AKwPJTIeizbL2tUc1qd8A
         obu66iWSH5yI/UBIlVLzKMHgyKZPOpDl5EN6e2og92bdn4Sj6MYzB7p2A9mh2HeTUfRw
         942vzmr7UzAX8bsC7Q8aP7KV+IrA0ApLrlQpd13Qu0zXh9fS0RsFgPeqcR8Op7vDHQBM
         FoqDlReR5fl0358hO9sGlDuw+j/OU9NAlH9KdtTX+/m1MFM8eXY6TzZfSbKI7NLS4doq
         aj+Q==
X-Gm-Message-State: AOAM531fbaAsWMbD0P02dnBtYKb+PRUTQW57FiwUeQaODLfvKHkUOBPg
	Zomyn8UTrm6YFjz4ONllG+an30bJdX5u3niDNGM=
X-Google-Smtp-Source: 
 ABdhPJzgJh0k9cETvxUqA4KKZgX4gczW0mpzBguzbI75v6XjBwXud80KzIffYVp2GcePOteND+9MFxvhZvPnZQMVDAE=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr15782273edb.288.1646742135103; Tue, 08
 Mar 2022 04:22:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAFA6WYPbMYuHXHaHDe3qkDFoPE8senbZWhJjuUXmuZ6d9-2=2w@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYPbMYuHXHaHDe3qkDFoPE8senbZWhJjuUXmuZ6d9-2=2w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Mar 2022 07:22:03 -0500
Message-ID: 
 <CADkTA4OC6RibL_Jnv-7o+GECJ7Y5bCYArgdDiB=RUD4kyAx2bA@mail.gmail.com>
Subject: Re: [OE-core] Linux kernel GCC plugins build failure with SDK
 toolchain
To: Sumit Garg <sumit.garg@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.co>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 12:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162902

On Tue, Mar 8, 2022 at 4:26 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi,
>
> We have recently observed Linux kernel build failures while using SDK
> toolchain (built using gcc-cross-canadian_<version>.bb) especially
> after upstream changed the way to detect presence of GCC plugins here
> [1]. Logs below:
>
>   HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/sorttable
>   HOSTCC  scripts/asn1_compiler
>   SYSNR   arch/arm/include/generated/asm/unistd-nr.h
>   GEN     arch/arm/include/generated/asm/mach-types.h
>   SYSTBL  arch/arm/include/generated/calls-oabi.S
>   SYSTBL  arch/arm/include/generated/calls-eabi.S
>   HOSTCC  scripts/mod/mk_elfconfig
>   CC      scripts/mod/empty.o
> cc1: error: cannot load plugin ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>    ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
> _ZN8opt_pass14set_pass_paramEjb
> make[1]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1
> make: *** [Makefile:1214: prepare0] Error 2
>
> This is reproducible with current OE core dunfell (gcc9.3) and
> honister (gcc 11). But strangely this issue is not seen while building
> kernel as part of OE build using normal cross toolchain (built using
> gcc-cross_<version>.bb).
>
> I have tried to compare the two recipes: gcc-cross_<version>.bb and
> gcc-cross-canadian_<version>.bb but can't find anything explicit which
> can cause this behaviour. Also, following hack does disable GCC
> plugins detection during kernel build leading to a successful build:

It is likely a variant of a bug that I'm working on now, feel free to
add your steps to reproduce the issue there.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14681

Cheers,

Bruce

>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 553ef7fe62..5529932472 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -73,8 +73,6 @@ FILES_${PN} = "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
> -    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
> -    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.* \
>      ${includedir}/c++/${BINV} \
>      ${prefix}/${TARGET_SYS}/bin/* \
>      ${prefix}/${TARGET_SYS}/lib/* \
>
> Thoughts?
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e860048c53ee77ee9870dcce94847a28544b753
>
> Regards,
> Sumit
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162877): https://lists.openembedded.org/g/openembedded-core/message/162877
> Mute This Topic: https://lists.openembedded.org/mt/89633477/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

