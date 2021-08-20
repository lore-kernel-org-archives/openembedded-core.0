Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.83999.1629464249508324900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 05:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qr8ZGayu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id e21so4176857ejz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDXZVu8i8cezWXusvW8ThWY5nV0g4wnXp5RQqcSA+XU=;
        b=qr8ZGayuTst1HVYPETXgr/E/Rr+4gbERQR9LTDGJBSoSakeC8TMLFYKnoq4nEA1lEJ
         Xc/bHHCxBQoB+DtnL9MkN6r15NYYlh/WxOzIgvowUoUYAe2Bw49pir4VF3Rnm5icEiQP
         hlCrKHAn5I8VHHZjWdZsQWAIT7b65ocTyWPBJQgyI7NSKCnQNtS0jlqMYeXBA2MIKBJp
         NaVlg0BSOL1Nk2kzLGvt3O5J7tB3vQigBAKphvu4rVxXuxN9306OkI41EXk/+f0sAZg8
         uNUmlgzOkgvwsoypwvCsMcm+D1skoaisEI1Rn/mOAJD1GwJgi8pPM8JnLei8kscVqarF
         V5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDXZVu8i8cezWXusvW8ThWY5nV0g4wnXp5RQqcSA+XU=;
        b=tFoGffMUDqQTmajEtVdIMtCkN5mw7t54IQqBDPjePrjC4GgL1od50o5gndffjn1dLn
         xfgTa8hWcTRzw26Ji+sh0KRyP6j5kxiRNn8KmXDNzPvNO/DikIley2MbXNSZyuPUpmIc
         hSRHFFAKICQSyJaBcfR3EsS5gGEusk5GDWSigNL2NTE+utNTTMwbPjDmYYsrHLb2Xtkj
         GjY0iQfqSjRdvXqJf6Ka1xi7H1gratRqtasa6x3ulinzpY+Z8AHUaipONe6mtNgHr1tC
         8DlTWgZYfBSfrVpmDb1k29QhBT7i8waw34u6eULd0BwADktnrz0Ela8ygxToWCpUz95b
         jrZQ==
X-Gm-Message-State: AOAM530Vv5hco6yCq2YVedYJ7pEyuBvz+/A72ihnjmFHtjSA5BkzZz9n
	ukXbRAOJhsshHDVp1hVvddrm+dBBrOCe/cOYSGU=
X-Google-Smtp-Source: ABdhPJwSdmdOyu2FPqdzFjnc7aGh2T9bzkVswUD5nR0YOuM0/3TEhIcKnYfmDedPlz5xnKXG//3w/0VgDtm07GsCXL4=
X-Received: by 2002:a17:906:c795:: with SMTP id cw21mr21885779ejb.357.1629464247970;
 Fri, 20 Aug 2021 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
 <91f494738fb9c63499fae982fb7b09cb29c3afed.1629213685.git.bruce.ashfield@gmail.com>
 <CAHtQpK4rAfAjB7dwXoz4D42887whGu5xgrxGcCxKRYmNUiE3-Q@mail.gmail.com>
In-Reply-To: <CAHtQpK4rAfAjB7dwXoz4D42887whGu5xgrxGcCxKRYmNUiE3-Q@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 20 Aug 2021 08:57:17 -0400
Message-ID: <CADkTA4NyVdfVbeqBJRkj8TVWJd1-HhqC5kJy9sw9FSSO+9WsWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] lttng-modules: update to 2.13.0
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 7:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Bruce,
>
> On Tue, Aug 17, 2021 at 5:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating to 2.13.0, so we can pick up the latest -stable and
> > support for 5.14+ kernels.
> >
> > We refresh one patch for new context, and update the LICENSE
> > checksum due to commit 2df37e95fa4303 [Cleanup: Move headers from
> > toplevel to include/lttng/]. which impacted the LICENSE file (but
> > licensing is the same).
>
> I'm seeing a build failure with this new LTTng and CONFIG_TRACEPOINTS
> not enabled on the kernel 5.13.12. The failure comes from the Kbuild,
> which does not demote the missing trace point config option from error
> to warning. There is a patch file already in the layer, but it is only
> appended to the 'class-devupstream' and is missing in the SRC_URI.

Hmmm. I ported the original patch, but yes, that Kbuild patch is also
needed (and it is my own patch no less).

I was just updating the devupstream version yesterday, and ran across
that patch.

None of the oe-core qemu* BSPs I test against have a disabled
tracepoint configuration, so I didn't run into that.

I have the bumped devupstream version and the ported patch done
locally, I can send it out shortly, but it sounds like you've already
done that, so I can sit on that change.

>
> I was going to submit the patch to recipe to have it included, but
> testing the build stage with this patch included I'm seeing a lot of
> other errors then, something like:
>
> lttng-modules-2.13.0/src/lttng-tracepoint.c:227:36: error: 'struct
> module' has no member named 'num_tracepoints'
> -- or --
> src/probes/../../include/instrumentation/events/rpc.h:208:36: error:
> implicit declaration of function 'rpc_qname'
> [-Werror=implicit-function-declaration]
>
> and the list goes on... :/
>
> Have you seen this during testing of this new version? Any advise on
> where to look next?

Not really. I end up updating lttng frequently, due to my constant
work on new kernel versions, but I'm not a lttng expert by any
definition.

The smoke tests passed when I ran the tests, I'll poke around a bit
and see if I can come up with any ideas (since clearly, our kernel
configurations are quite different, given that I never did run into
that patch not being in devupstream).

Bruce

>
> >
> > MODULES_MODULE_SYMVERS_LOCATION must also be specified in this
> > release, as the lttng build has moved the module target to a
> > 'src' subdirectory.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 32 ++++++-------------
> >  ...ules_2.12.6.bb => lttng-modules_2.13.0.bb} |  6 ++--
> >  2 files changed, 14 insertions(+), 24 deletions(-)
> >  rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.13.0.bb} (88%)
> >
> >
>
>
> --
> Regards,
> Andrey.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
