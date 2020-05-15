Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.1601.1589579556649207885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 14:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FYRu0E3M;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id y10so4362264iov.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 14:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bvmdpfzk45bZWMDG0hLeVrfV+hEXwyRCdhx2cTvSZYE=;
        b=FYRu0E3MDmi9LpJnrq9w2AbLMyVrmzsRd8s4yhAZTnpzcaGZbDZW2xk9rulW1vveVp
         YtxBBBynUFRjMT2Z7K0wbecyoiEpL/FIVLaqJ/fVGF5hlu9ih7zKmucKzSpqOhL0XVvt
         L9Fv+t3IfvwAjEKDcbU2hxcCXVLrI9t36kVzfvpashvemB/N5ioPurfL1Zx7hKNXzs0E
         r9tO9uNDQniSZE9vCp+ckgt8EG5WD6iSi7/IErVgZ0gbLhgpQkM5AnhDiybbeIa1errd
         NJr192QA06hE5TI8fWwfJVl6ZgXxTU5dZINVbBHtyuBvGevk33s0jkuZZznN71RtTQdh
         edTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bvmdpfzk45bZWMDG0hLeVrfV+hEXwyRCdhx2cTvSZYE=;
        b=gnTMI1NmUdYq1Xw4EHqMvYdYLEDINO99VVU5uOwoGemrwtACziL6/A2pkdpt6BrFiG
         IupNBRJqjXw1+k1WxVWZbKNqYoki20vH9P6pkYxbq0h63aOcgMjaeFYSGTNHrVtEiRGM
         mKgR9uIlGVBTwXpMooQ5mCR5ZEztCDnM+//qnaUGINswZPLGhTY8LsUKVQqxj/Q0XhoK
         5nuds5Pv1uMZR5eM+4PwHmvQi/AiuibX4LHITTYBp6SfLMzN/rvNjiv4juTVBDOB2ZjC
         qLFUdy8N0er87C1mwS+Y0EusTysaz/MfKQhY4kxKgzTv2/keL6+5okLcKkDYxlyFdP28
         DqIQ==
X-Gm-Message-State: AOAM531GTJLTZJlgbmrNBjK9MWK8lEeF94eFu4OYeGe7pkB1FBXu6qvi
	brMR7SHtyQWIYPoXXW7vr/j+3/9jHrTQVpbf6J8=
X-Google-Smtp-Source: ABdhPJx40DvJ+RxKDNF9Qcf8fnSWUFVDpJ1PBLqyeeYFtkiEsH16deyOjqZLwYoRLd9RX8N+diJKLmTJvgG4gjHvZvI=
X-Received: by 2002:a6b:3ad4:: with SMTP id h203mr4764028ioa.43.1589579556148;
 Fri, 15 May 2020 14:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com> <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org> <160F519E3DB5CDF9.29809@lists.openembedded.org>
In-Reply-To: <160F519E3DB5CDF9.29809@lists.openembedded.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Fri, 15 May 2020 23:52:23 +0200
Message-ID: <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 11:42 PM Andreas M?ller via
lists.openembedded.org
<schnitzeltony=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
> lists.openembedded.org
> <schnitzeltony=gmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > >
> > > This seems to be missing features_check inherit, so that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> > >
> > > Will send patch shortly.
> > Do I miss something? It was never applied
> >
> > Andreas
> Ahh I did not find it due to Umlaut in my name - it was applied
> indeed. Author is now Andreas M?ller now.
>
> Andreas

And to turn this completely off-topic: on each mail I send to the list
I get an email on extra thread with  'Andreas M?ller via
lists.openembedded.org' in it's title.

This is since we moved to new mailing system (forgot details). Did
send a mail here and there nothing happened... Should look for a
different name...

Andreas
