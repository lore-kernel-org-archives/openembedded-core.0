Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web11.626.1590526566570783863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 13:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GLXUdrv/;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id g7so7684542uap.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 13:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fdD/n0Z/rDt4xbL9abF0gX1AKNouqWJ4L9hmsnZ5gHo=;
        b=GLXUdrv/Zx19u5BTRXCV9x1RBjeZwdRzzfhPslN3BKlStMNi4xetRjKoodmLYmMVfI
         F73vdlv7zriffH51rA4yD1QPUzduRJhU/TZ9865nckSkcQQl8BtOS+zw0RDYhnl3cj50
         FK3y4Laa9aY3/XnGSaP4e5cvx/tn3IEZ9w61lOWqDcI+Rx2MZCzksMGkX/rRoQDShvmv
         5rCnJGEnTE0Bn8GxQJFm1Kyvn3yqTOgl74jrlEgQ52wuprBhNBNEHaedCmld+y77OAC3
         gRClIG+fXR3GQJPaLgbqH7YwL67h8zyZ9q/sLCY5CweJaoOSgeQ01iOYAUUvGLnD40il
         2W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fdD/n0Z/rDt4xbL9abF0gX1AKNouqWJ4L9hmsnZ5gHo=;
        b=gvAkFbqMLkRLtftXHk01gLPtL9Y4i3SfAlrVEiip7aNNFc0NBO5HJk46lrUl3efOZl
         I0lAs1I+LEw6Igu6wgBD9DLHMhrTup8w+HRPbR/J0FkqrVkrzewtPRtOYAi3OIfsTHK3
         3NGSgGegaVxli1nYNpnYwc/wzeq1YiJ2+TQfwiUQUH+OfSv7IsxGyn6XISs1E8ip2y26
         vbgrsUbgKTv1kaaiVF5ICzhfHWo+lk4o4DhGxxT93Sg2pzxpljAoUr4X7V6iuwDGnLWA
         0SJv8M0exVwYVKJTZwyflCoczWU3CQWyipLk3JfyzcS7me+P4mMBal10aa2gREa+6ABv
         muHg==
X-Gm-Message-State: AOAM533htH1IZAYfOE0BKKgNQg4ChFTNIrJoQBPcKGO4v6VuWipst58D
	k6+Icv4xh45sdHCPjCKIXGp02AB7ed3tYRzP4lI=
X-Google-Smtp-Source: ABdhPJyewmgf6PoY/t1Py5wmlxOp8QU9SIuYURR/L8eOROSODjcHx4mFpR1mfg1c9gzQg4RZNaT0hlnjcBHvi7UQhl0=
X-Received: by 2002:ab0:6713:: with SMTP id q19mr2341085uam.114.1590526565666;
 Tue, 26 May 2020 13:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
 <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
 <20191021202444.GB1500@jama> <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
 <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com>
 <CADkTA4PV6-Oh=s3TTnqCTMfAOytU+=rMWCAqSPpHgieZ7HcLDg@mail.gmail.com>
 <CAHtQpK5bDbibVfHytO5D2ksc-=93pHuSEdYY7+GJzdXFPwGmUw@mail.gmail.com> <20200526203944.czx4xbpjblwnfdgf@jama>
In-Reply-To: <20200526203944.czx4xbpjblwnfdgf@jama>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 May 2020 22:55:55 +0200
Message-ID: <CAHtQpK5PpHi8s=o-ecjaoQjkGZviYVdq_mdUrbq_06Dk_VydUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] perf: drop 'include' copy
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 10:44 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Tue, May 26, 2020 at 10:22:07PM +0200, Andrey Zhizhikin wrote:
> > Kernel 4.4 is also LTS and has (had) a very long time span, so I
> > believe there are some people out there who might still have it in
> > their Products (industrial applications are pretty conservative guys).
> > I have to admit that Yocto 3.1 + Kernel 4.4 is a rather strange
> > combination, but it also has a valid reason to exist.
> >
> > I guess reverting this patch is not really an option, but this topic
> > deserves then a bit of documentation somewhere so people can look this
> > up and have a quick fix for themselves. The question is: where to put
> > this information?
> >
> > Honestly, it didn't take me long to find the commit that solved the
> > build, it took me rather long to figure out why I didn't see changes
> > from it on the [dunfell]...
> >
> > >
> > > What exactly was the build error that you saw ?
> >
> > Exactly what JaMa had and fixed with his commit, namely a multitude of:
> > <bitops> error: #include nested too deeply
> >
> > and some of:
> >
> > <snip>/perf/1.0-r9/perf-1.0/tools/include/linux/list.h:5:10: fatal
> > error: ../../../include/linux/list.h: No such file or directory
>
> But this isn't your only issue with perf on 4.4 kernel, right?
>
> I still carry whatever is needed in a .bbappend, for dunfell I have
> also:
>
> # The tools/lib/api in kernels older than 4.8 don't respect WERROR env
> # variable exported by perf.bb
> EXTRA_OEMAKE += "EXTRA_CFLAGS='-ldw -Wno-error=stringop-truncation'"
>
> # scripting PACKAGECONFIG is now using python3, but perf in kernel
> # supports python3 only with 4.17-rc1 and newer kernel (here we are
> # currently using 4.4.84), see:
> # http://lists.openembedded.org/pipermail/openembedded-core/2019-September/286902.html
> PACKAGECONFIG_remove = "scripting"

Mine's got only:
PACKAGECONFIG_remove = "scripting"

And now I have in addition:
+PERF_SRC = "Makefile \
+            include \
+            tools/arch \
+            tools/build \
+            tools/include \
+            tools/lib \
+            tools/Makefile \
+            tools/perf \
+            tools/scripts \
+            scripts/ \
+            arch/${ARCH}/Makefile \

I guess you can safely drop the -Wno-error=stringop-truncation, it was
fixed with [d943a53ac6d7bd5eab93adecfe9b37356e46da44] in 4.4.y

>
> Maybe some of it got already resolved elsewhere, this bbappend just
> collects whatever tweaks are needed when it gets broken and I very
> rarely have time to go back through them to re-check if it's still
> needed (with newer oe-core revision or slightly newer 4.4 kernel).
>
> Cheers,



-- 
Regards,
Andrey.
