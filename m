Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.84656.1629468615852860648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 07:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9ysfUK6;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u3so20563246ejz.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hyZQRQ+DQUZvWwpvT573xUsje15zwRz0gXmWNuYSY9A=;
        b=H9ysfUK6B2dM4JdqQwsMmoy/oXBhi3Fis9fowGDpQ/5xT8fyvsPlM8xdz2wc97CEG8
         S/db502wk8YluG5Ki+SFXoK+/5FXtPM9AQcTyldbSYZEzEJjn4xq/3yS4OhfIZZGKD8R
         caPXidwunGz5dHlnKadedbeTCQJteLSg9B8W7w4GnA0SDGIVGwoVhXH4LznApUPABPRz
         RWAuRyfn18wYiyb1Sv6xLjnXITamcYveiWOA5FFPEiMPBMCErdrLnlFkRrVnq3ogjymo
         OmNHRU52eXmn/H3iInA+ELw6t7oCh0k+8Z9hp4PospPiawiXjQRe1l7/KX6d0TnOoZI6
         +QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hyZQRQ+DQUZvWwpvT573xUsje15zwRz0gXmWNuYSY9A=;
        b=eT6rV9NjLh/cOme5EZZmKGG1fbGBZkbMU4MxhWRoIrGoDf7zoBQZwLRmvmrE8NplY5
         33Hi0pTD84MRd+pe5XKDSb2Yogwd+g7S7iuv07WJS3+JJ+eVOseaUbEiCQVlWfSESo1+
         ExYHYpzEsjFFiHL4NEJu+KOdxkFRpOIsQ9DcdqjhncPjpehfZFyM/rB5wBZCw2u7YhLX
         zqlTfZ+pGWQeOoyO21DUYIG/2Mbvwrct4dNyXFMr2GQnbBr8qv0AqVF9so5QKEOJwzgi
         gb4DH+KNg0wlPuqvv/AmnVU9dQw5r2ZExInUizL8Uq7nB+HYlMiPh/zGNkor+u0+bGyk
         +u9w==
X-Gm-Message-State: AOAM531S4Me0Byj7PDOquJaRroBT8OJ1wHYjy3Yi9UmCRlHgeb6CdNZe
	gPuNXcyF8cYOztRbCKCWqQcSrKp9wlQkspwZL8I=
X-Google-Smtp-Source: ABdhPJzvqOZESQ47X3sdBM3H+dYXqEHgrAUQl8cTKJ6fu1vnAOyFKKsWAeD/qGcx1qgxH5RLK7aTaXJhOIt3GoPSSic=
X-Received: by 2002:a17:906:c34c:: with SMTP id ci12mr21989356ejb.247.1629468614330;
 Fri, 20 Aug 2021 07:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
 <91f494738fb9c63499fae982fb7b09cb29c3afed.1629213685.git.bruce.ashfield@gmail.com>
 <CAHtQpK4rAfAjB7dwXoz4D42887whGu5xgrxGcCxKRYmNUiE3-Q@mail.gmail.com>
 <CADkTA4NyVdfVbeqBJRkj8TVWJd1-HhqC5kJy9sw9FSSO+9WsWg@mail.gmail.com>
 <CAHtQpK41JVjaTC37uLxcjCyvk3zO5-8X50gFY1U1SNmj32cQbA@mail.gmail.com> <CAHtQpK4TrUU5fyh+aHJb=OS8KzDvju8SCSwnFgJ0Cb9UuojK8Q@mail.gmail.com>
In-Reply-To: <CAHtQpK4TrUU5fyh+aHJb=OS8KzDvju8SCSwnFgJ0Cb9UuojK8Q@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 20 Aug 2021 10:10:03 -0400
Message-ID: <CADkTA4NVEACy1h8MYu=6WiNqZHA4Kud2Gi8tC4YGADjYmJt=sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] lttng-modules: update to 2.13.0
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 10:04 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Bruce,
>
> On Fri, Aug 20, 2021 at 3:21 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > On Fri, Aug 20, 2021 at 2:57 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Fri, Aug 20, 2021 at 7:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > >
> > > > Hello Bruce,
> > > >
> > > > On Tue, Aug 17, 2021 at 5:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > >
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Updating to 2.13.0, so we can pick up the latest -stable and
> > > > > support for 5.14+ kernels.
> > > > >
> > > > > We refresh one patch for new context, and update the LICENSE
> > > > > checksum due to commit 2df37e95fa4303 [Cleanup: Move headers from
> > > > > toplevel to include/lttng/]. which impacted the LICENSE file (but
> > > > > licensing is the same).
> > > >
> > > > I'm seeing a build failure with this new LTTng and CONFIG_TRACEPOINTS
> > > > not enabled on the kernel 5.13.12. The failure comes from the Kbuild,
> > > > which does not demote the missing trace point config option from error
> > > > to warning. There is a patch file already in the layer, but it is only
> > > > appended to the 'class-devupstream' and is missing in the SRC_URI.
> > >
> > > Hmmm. I ported the original patch, but yes, that Kbuild patch is also
> > > needed (and it is my own patch no less).
> > >
> > > I was just updating the devupstream version yesterday, and ran across
> > > that patch.
> > >
> > > None of the oe-core qemu* BSPs I test against have a disabled
> > > tracepoint configuration, so I didn't run into that.
> >
> > I'd try to enable it locally on my end, just to see if LTTng would
> > build with trace points enabled in the kernel config.
>
> Just as a follow-up here: when FTRACE (and dependent config options)
> is enabled in the kernel - LTTng builds happily. I guess your sanity
> build went through with no issues exactly due to the fact that tracing
> is enabled in Yocto kernels.

Most likely yes.

As lttng marches on, we need a better solution than attempting to make
it build with the required configurations disabled.

I know that I'm not really enthusiastic about carrying the patches,
and that's why I didn't send my updates yet, since I was pondering
making lttng triggered by a distro feature, so that it just won't be
built in cases where it won't work.

Bruce

>
> >
> > >
> > > I have the bumped devupstream version and the ported patch done
> > > locally, I can send it out shortly, but it sounds like you've already
> > > done that, so I can sit on that change.
> >
> > Please go ahead and send out your version, I'll be figuring out those
> > build errors on my end, and it might take some time...
> >
> > >
> > > >
> > > > I was going to submit the patch to recipe to have it included, but
> > > > testing the build stage with this patch included I'm seeing a lot of
> > > > other errors then, something like:
> > > >
> > > > lttng-modules-2.13.0/src/lttng-tracepoint.c:227:36: error: 'struct
> > > > module' has no member named 'num_tracepoints'
> > > > -- or --
> > > > src/probes/../../include/instrumentation/events/rpc.h:208:36: error:
> > > > implicit declaration of function 'rpc_qname'
> > > > [-Werror=implicit-function-declaration]
> > > >
> > > > and the list goes on... :/
> > > >
> > > > Have you seen this during testing of this new version? Any advise on
> > > > where to look next?
> > >
> > > Not really. I end up updating lttng frequently, due to my constant
> > > work on new kernel versions, but I'm not a lttng expert by any
> > > definition.
> >
> > Same here, I just saw the build failure and started to poke around to
> > see what could be the root cause of it.
> >
> > Missing KBuild patch was an easy find, but those compiler errors are not...
> >
> > >
> > > The smoke tests passed when I ran the tests, I'll poke around a bit
> > > and see if I can come up with any ideas (since clearly, our kernel
> > > configurations are quite different, given that I never did run into
> > > that patch not being in devupstream).
> > >
> > > Bruce
> > >
> > > >
> > > > >
> > > > > MODULES_MODULE_SYMVERS_LOCATION must also be specified in this
> > > > > release, as the lttng build has moved the module target to a
> > > > > 'src' subdirectory.
> > > > >
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > ---
> > > > >  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 32 ++++++-------------
> > > > >  ...ules_2.12.6.bb => lttng-modules_2.13.0.bb} |  6 ++--
> > > > >  2 files changed, 14 insertions(+), 24 deletions(-)
> > > > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.13.0.bb} (88%)
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Regards,
> > Andrey.
>
>
>
> --
> Regards,
> Andrey.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
