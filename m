Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.15492.1599378265776110758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2020 00:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=So8Zox3U;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id n18so7927842qtw.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2020 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L3tlpcIt4NnWM8yEzZTWwixxHXwJhYcsutM6j4m/lew=;
        b=So8Zox3UR/mLpKKNWMchguFTg4lH8XxZif5zx90k6+s0v67ZaZSVlUwnkYfiV6PyZR
         WtqNISCbEAAnrR+DJsVktL2XWYb6usK2gLYap/WsVoKAtSgfIEQzpeku4DHAbm9TTqwJ
         e0Uxolsa6qlYCVZ8hU6rQF7Vn3Wg0vx3mveJIoxOCx7LJprqKNo6JVLa/rvbH5gobe4k
         LCvQXXWxWI1Yod/Y/QQXQRRsgHzZlTzw2OikGABi+3wfNoHcacnB1IXzosX7gpUR6nql
         Lrbz+MVHtLjFy6NkLdUzx75OBY0xhflGZeGwrXPHE0tDfauOeApwe6UTP39mijmy64Or
         Vccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L3tlpcIt4NnWM8yEzZTWwixxHXwJhYcsutM6j4m/lew=;
        b=ACsRPY36EdpIucnUwk8udLMEXiNzDsjHQY7RSpCmkCZMiooijVC4hmEoYuoqgApuSv
         0Jk9c8VvjEc3LjUTQl7/NfLe/r+tpqgeTlnvOmPqGU6P/fZRgkRIGWqyTo1fqC9cqg1c
         1keFVLO5Hcod/Oq8dptWftAgcmKkE+HMZ0GOn635wXFJ8OpESrUBv3ACW/5FGo75aHZY
         6USWDHefcgzLv+f1qOz6fMs0cMU7TJoM1/xTVYz8v2z6xuTen0uHHRBs7ZN/LjfhhOJ/
         tKt0kKEkkQrWptBL2Nzj4xd+aYvzj3L4ONUZcxvBgEmG+fjo5odiurOLBk2dn3i8bqYY
         lXng==
X-Gm-Message-State: AOAM531CZ++RDu4ROHXMVS/6ZIemunJu7TXsJx9RdJlWI8Ya1h5E8JlC
	5SM/SGcWjuGpDzPpWMxEbHZE0/NHatyMNMFAfL4=
X-Google-Smtp-Source: ABdhPJzs9MYUBKto+SRgp1BfKYT6mQzCg953rjyMSp3LqG6c0x4g6WuMslKoins8ivMbjylpfC45nR6Jev76tNyvn6c=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr16166399qtp.53.1599378264802;
 Sun, 06 Sep 2020 00:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <1599291707-36225-1-git-send-email-denis@denix.org> <234ef013cc44a254c590e867df3e1317beb4d1b4.camel@linuxfoundation.org>
In-Reply-To: <234ef013cc44a254c590e867df3e1317beb4d1b4.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 6 Sep 2020 00:43:58 -0700
Message-ID: <CAMKF1sr_kXQmJx_3VRcX01qjsCK5UzdYkhBEe0xOOUZ=FmwDkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston: upgrade 8.0.0 -> 9.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 5, 2020 at 8:09 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-09-05 at 03:41 -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Weston 9.0.0 is released! This release cycle has been pretty quiet,
> > with just a few new features:
> >
> > - A new kiosk shell allows to display regular desktop apps in an
> >   always-fullscreen mode
> > - Improved testing infrastructure: the test harness has been
> >   redesigned, DRM tests are now supported, DRM and OpenGL tests are
> > now
> >   enabled in our CI
> > - DRM panel orientation property support
> >
> > As always, a number of bug fixes are included as well.
> > https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> Looks like it fails on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2414
>

135 | fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
| ^~~~
| popen
../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error:
'O_RDWR' undeclared (first use in this function)
135 | fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
| ^~~~~~
../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note:
each undeclared identifier is reported only once for each function it
appears in
../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error:
'O_CLOEXEC' undeclared (first use in this function)
135 | fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
| ^~~~~~~~~
../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error:
'O_CREAT' undeclared (first use in this function)
135 | fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
| ^~~~~~~

it seems this file is missing #include <fcntl.h>

> Cheers,
>
> Richard
>
> 
