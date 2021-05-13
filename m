Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.1174.1620932644356452198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 12:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s/7OYyXA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id df21so4903812edb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4n7WWSuSK5CUZo/8eam/7yl0iR0r+rc68u3++vuL6rA=;
        b=s/7OYyXALq3VQo23d7ShdwLJGbtRPS9a+2Ri9B3eRwT3krvh0WabjRCFt9PYo5E20C
         Ofli6DIbJKQ9mkBvxWrZ0LR7A1IIFb45QUhy+7FDPFmXWCM7VU5jkH9mUkLxlK649/gP
         x/qhcuvig7BR0NCHWWeCWQtatfO8u9M2O4tOuHZqMRbRp2ekXEtSs7F8f/gaomXFbQ/M
         OM5ql+ljYSZBo9W/iNNu9cA5NEOOG0bgYrtaprHwvoDmVy65PtzdTJLaRhyVUHQoyKjy
         vpIeK6O9zq+42Vg+NrDR+tUn29PVJdwDo9gzozL8/L3rQyzGOBBlTDuKyt2M23FVCp4E
         O/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4n7WWSuSK5CUZo/8eam/7yl0iR0r+rc68u3++vuL6rA=;
        b=WHUGEsAtcRD5e0aqEYQA52enH2K2vC2I1+7aWKUBZDDqzgULMrJjYX1q4Xg7heyM8y
         KXMb7HNvwUwNjB0qnkI5JwY58OKbVnnjCOiEzvGmSMR6Z1ECQT4FPEOoP++vn0a+2KYK
         LD5MLstVNpRYmGilh40f4vAfDvwhxXmGHpcCjpats2BvTTCe7KF9jlfLLcgbLWReQcqI
         ItDTzwvzEUDuiXI/81SiQGrwVONnQ+k06lm4yqsXy5IS9/2Wp/lPK5VOsv+bjvRqVk9D
         Qbx7sglBn17hD391STrfVIwTP6LkhKqxKVqu6AQ+X+P11cQICqSf6oOz/+/1WS9+6glx
         67oA==
X-Gm-Message-State: AOAM532f87OwlyEHcTUCz2NDYPsHgxcpctHXTYjVP3rVPfYCAMOHR6rI
	iHgdz7eqbreamU3BIGdq/Zc4+M6hmsFo/hIBOkU3Zb4W4z8=
X-Google-Smtp-Source: ABdhPJyHk8pk0Q8CQ7OUkdrCKP7tyIwT/QDVJaOSyj4MwhKhZurFRag/7Vlrql7keq06B5oFol7fiE3e2zjvMhtFMco=
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr52718168edw.129.1620932642802;
 Thu, 13 May 2021 12:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4NeYBn6CqRWqfTOmfZOaXTHvf_0=-WWUtkubVsngS2e=g@mail.gmail.com>
 <3159.1620932524790775077@lists.openembedded.org>
In-Reply-To: <3159.1620932524790775077@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 May 2021 15:03:51 -0400
Message-ID: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Benjamin Gilbert <bgilbert@backtick.net>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 3:02 PM Benjamin Gilbert <bgilbert@backtick.net> wrote:
>
> On Thu, May 13, 2021 at 06:36 AM, Bruce Ashfield wrote:
>
> The problem is that your build system is penalizing upstream projects that are trying to migrate
> to using `main`.
>
> Similarly those same projects are completely deleting those branches,
> versus no longer making them the default. Which is penalizing the
> existing users.
>
> Deleting the branch penalizes existing developers, which projects might be willing to do.  Git branch names don't usually have any effect on users.
>

I'm not sure I see the distinction you are trying to draw.

We are somewhere between developers and users, but again .. it's not
really a relevant distinction.

Bruce

> --Benjamin Gilbert
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
