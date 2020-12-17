Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.1928.1608249251562388988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 15:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+7GVDu1;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id 7so190912qtp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 15:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRtbFSfE5YA14s+Hc6sPQ8GZmBsXf8iqIU+SZfMqHsk=;
        b=R+7GVDu1yZmogkbrHOCATddTgUIaVNmQK2zg/yRfgEFscrGeeipc6aGfr2I5K3jHeF
         RAzE0mWAlm7HHsVDAW4FZ6Hsi8G2uwk1X7bu1izxAcRHv+mGfCBKIQ7zkxKM8CFOvO2D
         rkyyAGZudnGZ2MEPWxlHGTzgJ3JGg76tKaIrrTOOPk/fZg9sJxc5zfs/EAelstyOMWoX
         xXvcMlCUPCXcLh/VgCdoIqP4qyOAaM70/d8PxEiMPRVy5GI+FBTwTym0GqKx09qOraPr
         V/s6FQ3c01+QiTmS6qb6mfi1d2MPInqA+Xgk6eS3sz2eBGiyGpjV9fn7Re5RZxeesYXh
         D2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRtbFSfE5YA14s+Hc6sPQ8GZmBsXf8iqIU+SZfMqHsk=;
        b=AsceFbmZ4821LrEnxaOG1zhlnvZpFWPRPe+9LbfVFuEk9mnjfzIwLrhbvud0y53nht
         hSKbZ5q2Kgzq7/sh5aFqLArZ8XecJgmaTjaRWN9xa6CLpKx/xK57ysWNHh/0TvxCrJHX
         GCfdtp2XztYo78YWSM/rr1QuClJTizZ5dyOpcVXQSf4R+IHeuJGbJO9WWmLp9OXky4SL
         onXI014nBW5ef0/c5wGUEgfu+nvjM/T2bCb1b9CDVzq/Ug+MWPbA9Iwy/6Bln5PnsFdm
         z8waB2qkMaG+McnO6aQwT/QJKpcUN8SfjEeQcFb+PYrTgj9gfjvn7cr29Qt6OpATUgt1
         OJJA==
X-Gm-Message-State: AOAM533M+usUlsvbN3FGelPzVlCumsJjZt7ECJc3BVv2x2jHBocR4HuA
	DjFCuiEPWK05dtAUURI5PvspG1kDnB9s7HWb594=
X-Google-Smtp-Source: ABdhPJz+liXtQchcPKkw/nYXR2UZEWaefiGR7SAth+Hy2himwiOaFVeoJGVekNkj6YtCSYcPqhACwX6nILOxHaUukVI=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr1419593qto.53.1608249250661;
 Thu, 17 Dec 2020 15:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <CAJ86T=XXi5NtoFoQvTzuQe04gvBPizW6jjin2JkUovLCOti9MA@mail.gmail.com>
In-Reply-To: <CAJ86T=XXi5NtoFoQvTzuQe04gvBPizW6jjin2JkUovLCOti9MA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Dec 2020 15:53:44 -0800
Message-ID: <CAMKF1spNRZcLNFK3t-QQxHbV4UdOesJe6RAniYBezcJvc+yOLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] initscripts: use quotes for shell variable comparision
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 3:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Helps to execute it with busybox shell
>
> How does it help? Adding quotes would help if $rootcheck is an empty
> string, but that's not specific to busybox.
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > index 02f0351fcb..a63e71b780 100755
> > --- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > +++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > @@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
> >  #
> >  # Check the root filesystem.
> >  #
> > -if test -f /fastboot || test $rootcheck = no
> > +if test -f /fastboot || test "$rootcheck" = "no"
> >  then
> >    test $rootcheck = yes && echo "Fast boot, no filesystem check"
>
> Doesn't this instance need to be quoted too?

yes infact there are more cleanup to follow, this series just fixed
default boot errors on reference images.

>
> >  else
> > --
> > 2.29.2
> >
> >
> > 
> >
