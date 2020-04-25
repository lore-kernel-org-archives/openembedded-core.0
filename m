Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.4267.1587811509965888270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 03:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gg4m0Mcm;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id p10so13210421ioh.7
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uop+lM34UIwY5UzR7UJqKGpO6Ypz9xYfBgACKYvtsaw=;
        b=Gg4m0McmzEK9JldsKXnER8Gln6+gilRmGvd37yTVRs7dPpuPnmvnwY5ZXefCJXgzKr
         R5/JQo/4j9uIosmweWlD+zYNq5OULTIdcnKJU4Lg5v6lGRpHztNYkuklL0MEiMZH8H7F
         S/6IlInnCwDw/iDRaGPUWNJ3VuAN7eN2dT58Hl+b/jOVbYcEMzFw6Py2sO7qDp6rTwRX
         xM+rC04b6yr+wSai2rCydoDAhYX3z9eUS1cElYrLCOKliQpgE9lP1CC6lWG6MS3TsMky
         mvmLYOvWGr+OQt0DnpXSQKCnaykwxesyT3ucpXKkqvAJYkDe3v/6aPgsDIYNj8vraANa
         bLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uop+lM34UIwY5UzR7UJqKGpO6Ypz9xYfBgACKYvtsaw=;
        b=Fh7hqFPnX136Cnkm90/W4T2rCwouObIbwPmN5qwjaV+tecKNIlMIIVz7n/b9luRvZC
         dUsT8CuVh0R/YY8SmD5FndTNbmFARcdd4eQaCfpmWQ19/V54ym4lRFKSLnrKifeGnQra
         J6C/LJIbolmZ9OV7y6k/Ut8cp64HFmiQAUmLPa1OmmhcNv+gs3XChFpeU8YyUSj3zxfU
         peBAudS6pb/EvfydTgX52xbHjy4HPjUxz0knmvsXonrZQAeuFgEAbIvJLbOIB0eAop1U
         H2pZdgANFFMeY9DO1xHxhUqAXgIYosKqCm5lX8UlxKQGru0KE/iU9aXvaU0wzWIwpcRi
         F1IQ==
X-Gm-Message-State: AGi0Pua2GuSj4PfMtwJ2ywlAaci4pOeyD/kEnXDIKNebUiw+cek2CALr
	ci6J5fygYUxTCFw0p7AeFOoMz3Jo6pVTbuAx+4A=
X-Google-Smtp-Source: APiQypJO72j4bOOBeU6RqZWY6En38qL1PpeSAFkLE78n35cJiUxkal0bylUXUdlM2cKZiW/QTRzMvtBeWh9GR+H90wo=
X-Received: by 2002:a6b:f20f:: with SMTP id q15mr13017683ioh.48.1587811509338;
 Sat, 25 Apr 2020 03:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
 <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
 <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
 <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com> <e2745c5f-8856-56f5-3fa0-84a89fd26216@gmail.com>
In-Reply-To: <e2745c5f-8856-56f5-3fa0-84a89fd26216@gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Sat, 25 Apr 2020 11:44:58 +0100
Message-ID: <CAO5Uq5S8cxQJJGetX=2ndAi_XWoi81DZ3hy_A9JL-mYQpgFuqw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Khem Raj <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 25, 2020 at 2:43 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 4/23/20 10:14 AM, Andre McCurdy wrote:
> > On Thu, Apr 23, 2020 at 1:30 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >> On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >>> On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >>>>
> >>>> sshd.socket launches the templated sshd@.service, so by moving the
> >>>> sshdgenkeys.service to sshd.socket, key generation can start in advance
> >>>> of a connection.
> >>>
> >>> Is deferring key generation until the first connection a bug or by design?
> >>
> >> If you've installed it, presumably you're expecting connections. But I
> >> agree you could argue it either way.
> >
> > The trade off is between slower first boot (or every boot for
> > read-only rootfs if host keys are not persistent) -vs- slower first
> > incoming ssh connection.
> >
> > Since the first incoming ssh connection may never happen (especially
> > if ssh is only used for debugging or development), optimising it at
> > the expense of boot time doesn't seem to be an obvious improvement.
> >
>
> I tend to agree. Perhaps it could be covered under read-only-rootfs
> DISTRO_FEATURE
>

I just ran both through systemd-analyze. For qemuarm, this adds 5s to
the total boot time, but graphical.target is reached in the same time.

Clearly you can cut this one both ways - I don't have a specific
problem this fixes, it was more an annoyance (for me).

> >
> > 
> >
>


-- 
Alex Kiernan
