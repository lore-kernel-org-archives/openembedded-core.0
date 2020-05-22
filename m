Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.4346.1590105941169134920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 17:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cu6ANYOt;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 190so9214349qki.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 17:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RvZ2qcezSJQl6p5l/e1iCPbuL/8CpWa36ub27sExeo=;
        b=cu6ANYOtuzta+A83oek6ZbsjsprUKAzdEGgMyaMv11qoEfRXtuB3rndRf5ytoBqzT1
         WYgJTZGoH5lYIDqfH4PjzxBQ0h0Duq1/Ir39cl/5yCw/KiLRXpmMwtnN7SnSBN7uY4zT
         ccoW0gahKs7tWiOgkyIWQVLxiwQ5iAwedXwdmBbLqz+H3eNXQmqX0/1L4qmK6XSGjn2Z
         BNg5RHLxJ0B9VSTKOMbo0qHicB486tQXa01px85efXkme/1K+MM+fXs+D4CZZLT6ht1d
         N5SxAlkcM+gX8LevUZnG/YyTxE3WooMpQNHffW6ixLrgmmPfYTKERh4Alxi6U4aC2kKE
         /UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RvZ2qcezSJQl6p5l/e1iCPbuL/8CpWa36ub27sExeo=;
        b=mh+lXdvredzCWu+UAlpZQVSDzqDJjzf6YmFTw5+4TIeVIah4f82D4H/yJNYcCrCpV0
         Y0OxMes8GJ70iQqpH9iMQI5INlL7F1ovg4PF+LINxmeexZIcs3ns4zyxnJYtdG9y2TkQ
         fRTtfXaqlv5XBXMDQsLI0pyStV3/ke5PA5yuJTJDRxQq3XJXDOYvB0/y8aKn6Hh0ihEk
         brs1IqxKqjJt1HI9ATKpLu3iDew9yPaHdMLlS19yb2Jpd63+y7Za3n/6RfA/lM58EJrl
         UXMyCWqqjj8S75+wMAJbjIxoGOBeRxBpmrdC6zFXWr6os+YQt75sHo5T6lxWuUdO2ZMG
         nnHw==
X-Gm-Message-State: AOAM5308Z6w0MhzCqDjffd4zommbegmb5OF5Rxhb2eNNuj1UJypysu/y
	DlvScgZzDXSfzTrA3AfUuJ3n91xYblrxlBQV+5k=
X-Google-Smtp-Source: ABdhPJywzLUNgH8lEt6Rxuyr82ubA6lRkdLmx7Nq72t5K+3RXsuk6n/GC9MEk2ggmlEtNvwEGWZ4Bh/REI79QtPaBX4=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr11813454qkf.17.1590105940153;
 Thu, 21 May 2020 17:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200521161543.3273063-1-raj.khem@gmail.com> <20200521161543.3273063-8-raj.khem@gmail.com>
 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com> <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
In-Reply-To: <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 21 May 2020 17:05:14 -0700
Message-ID: <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 4:49 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-05-21 at 19:37 +0200, Martin Jansa wrote:
> > On Thu, May 21, 2020 at 6:16 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Now that they uses -mcpu, its better to have tune specific build
> > > directories, since aarch64 wont be appropriate any longer
> >
> > I agree with Steve that this is a bit invasive for stable branch, but
> > on the other hand it's long overdue and if we don't improve it in LTS
> > branch then many people will need to carry local work arounds for
> > multi-machine builds. +1 from me.
> >
>
> But this is against the LTS/Stable branch policy. What is the point of
> having a policy if we are going to keep making exceptions? There'd be
> other changes as well for which people might be carrying work-arounds.
> Would we be willing to make exceptions for all?
>

Thanks for bringing this up. Policy exceptions are not common but they
are not absent either
hence context is important for such changes, I am definitely interested to hear
about how it is going to affect arm64 users at this early stage of
release. if someone
is broken due to these changes that should be addressed.

> Thanks,
>
> Anuj
