Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.1827.1608838802767079789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 11:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApjPA60J;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id d14so2743362qkc.13
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 11:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r9bCgd24x+Sln5a3/PKY7DlvaXXtvmkFmN0EHFjXL1s=;
        b=ApjPA60JvtIX3DF7KJWxm/5CKCNC6CDicXFqrxjopzmTk9KIw9WG4vbgJVdV+B/CcM
         IjBto28DwwifBzoUZK/09NvSp1P86qUVJmFG1iMYjN5IYbt+WlgvXdNfeI7JKzGNRrRK
         bVMr1GScrEr8axwZxOoi6Z2jxP4m6e/glwsUSpTw2FBBP0qteb0pf870tUzEKscWj1IH
         PcGmLK9M0M9S9hhqXMYgdgBVkAYvq4bN43R2loLVbDWTf+ci8Emxu1uIu9DNSIYrRySZ
         KCh/DXw8EJvfyOYOxy4cNLVUL8Z+fzouM9TJ+Z5th4pBCt9oOpVwmW6NoCkKWLYZl5mx
         5ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r9bCgd24x+Sln5a3/PKY7DlvaXXtvmkFmN0EHFjXL1s=;
        b=MyZn4gcTHO6/N3Ae9mmVG7UyRASlIAFUrQSMST8vBoI0JMQiQVB6UjYCsWmQkbeH5w
         gP5IgxRvNtKQ/EuuoIcyTYe3LTdMHnoIF/Fib6o6pa4+iaV8Uim0FaY5QKh1YwvnV6Pd
         gngBHFzrjcOcRq0EMx1/zEw8f3rFW763dTsHHdWqk6WAL8O8UfkALErq1BBmq7Kt2bNT
         DUxa8TgjLTU9HSTCAcNaRO1ifgELGGf72SOhagDRyEdCMYIQD8u5y5txbT0QopF44hHM
         S/Lz9CYjnC5/wAKiWz77Rn7xGo1Tous9P01Qf9yDbQpYYs+cdJqI/89p4JK5vd93hUqS
         JDsA==
X-Gm-Message-State: AOAM530ajHt7o7Ihbgh4/8ca5d1K6nPUl+fZF8dFaadAD56BTIvnDttC
	8Uzv18f1iiu1v40LpO+pKIP9Bgz4FPzEDN7ApXs=
X-Google-Smtp-Source: ABdhPJyAyyXbHCrydFU7Vxl0tVexTkIBKoT2txJw6217M8YXC47C8S3nMp4SCrloRSqj+uft/NvjO/drJwFHejzTKNQ=
X-Received: by 2002:a37:6189:: with SMTP id v131mr31353729qkb.337.1608838801717;
 Thu, 24 Dec 2020 11:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20201222070029.40230-1-twoerner@gmail.com> <CAMKF1so1E7Dw8Uwy8epT0UanOv0QcdcPqzobSV+tOMURHPK5uQ@mail.gmail.com>
 <20201224133813.GA3039@localhost>
In-Reply-To: <20201224133813.GA3039@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 24 Dec 2020 11:39:34 -0800
Message-ID: <CAMKF1sq5srLmnvBVGr7=JQ6yW0bgEBjpJJU6p3Eb9pksRp+qWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sysvinit/rc: show text progress
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 24, 2020 at 5:38 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Wed 2020-12-23 @ 03:27:50 PM, Khem Raj wrote:
> > On Mon, Dec 21, 2020 at 11:00 PM Trevor Woerner <twoerner@gmail.com> wrote:
> > >
> > > In addition to the progress bar, show which startup routine is running by
> > > using the "MSG" facility of psplash.
> > >
> >
> > This is ok but lets make it optional and controlled via some knob. End
> > products usually want clean graphics
>
> I'll add it with a knob, default off.
>
> I'm not sure what you mean by "clean graphics". To clarify: there's a hidden
> text box already built into the psplash application just above the progress
> bar, any MSG text sent via the fifo appears centred above the progress bar.
> I'm displaying the text-name of the currently-running bootup script (e.g.
> postinsts, networking, sshd, etc) as a means of feedback. As the device boots
> the user is not looking at a slowing moving progress bar and wondering which
> service is taking so long to startup.
>
> For example, on first boot, the sshd service takes a while to startup since it
> may need to generate a bunch of keys. With this enabled the user will see the
> progress bar stop (momentarily), but they'll also know that it's due to sshd
> running. Or if you're using dhcp and there's no dhcp server on your network,
> the user will see the progress bar stop (momentarily) and the text above the
> progress bar will say "network" so they know that's the cause of the pause.
>

I understand that what I am mentioning here is that all this
information is good for debugging
diagnostics but not needed when a device is normally booting since
this information
is less useful to end-user and sometimes undesired for aesthetics. So
while you are here
having this option along with your enhancements is what I am asking
for. Hope this helps.

> This doesn't mess up the logo/graphics at all. I could make a video of it, or
> you could try giving it a whirl once it's added. I think it should be default
> on :-)
