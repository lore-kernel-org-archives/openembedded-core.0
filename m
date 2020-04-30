Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.686.1588205037642188024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 17:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RsEPmO7j;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id x4so3960395wmj.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QcF/uO8SGAc00UrYXL/w8/9tO7r4K3QwhmoDLRbLm3w=;
        b=RsEPmO7j6n4y+vuyDgqXI7XSQ3htUxdb2+Po3p2ehQOESgx268gzHqEbV6V0bvwgMr
         tabV88kAaUIdi2BGDP2++V1wehmLmPqGg8lzHZcWSvTQ80guACvDgGOpLv+JTbiwwr6v
         3vLYvD1IN2mV276TDErOH7hoJDwAH3C5UXSx40dFSg1s7SDPgd2YGkurfe9Fxqv16Z8S
         QNwiH9iXWvtaTWTxohJOqAh8J1fE2LxIp2t1h83WOtez3PbRm/hFezo9r74pbbinQX3t
         t4js61YKMSu7qsCqzXp4Vkj3NQCbLn9Q23EDEiZnp98UG7fEOfZBRdEqg0jSfA6ycvcg
         Gt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QcF/uO8SGAc00UrYXL/w8/9tO7r4K3QwhmoDLRbLm3w=;
        b=UjBYNkizR9PKOq+THv3p/JQzaXlW76ljxh1DLhsInlBKkwu3WEBGMZMMsGpfqO1A2c
         e008UBrBll0AYndrMLZbjOFXVk4owIrqUvaqGnnFomKEJEEaY8AWjfxS8u/03Y9CFpFj
         10Ug6NJDRRMqVjI7TSaMfRQzVS+lO8zDnk/YlePbLa5UOSPEuuaQTGvf97flHeqWVm96
         MGMe2VWm2Gg4KKt3obr0GyNtQrhWzpZ+jILFjYS6X9stk8acubwpM+G5cS+Hamy4lS49
         QnMHvqhcylIt5JJvXV+4+2Utf8msmiLRM6H1/wvOk65xI89fWAG02b5LVurslS6BIpt/
         XjAw==
X-Gm-Message-State: AGi0PuakVETWD65ev0Yhn+8vMZauiaWZEs90hO5PZVhNiwd0RFW46Ku0
	sh5x1pVPwuPbXoAhIMs5ZIglLPrkQn3wzuoRVws0pg==
X-Google-Smtp-Source: APiQypIm7agnhIqXFZ2+tDpNfVf5qirF1anvo1eV+/yviuD6R54j9kRoCYcUrmXGlGCakeqX7sNGZyStJVfr0CDd+LU=
X-Received: by 2002:a1c:b757:: with SMTP id h84mr370950wmf.188.1588205035641;
 Wed, 29 Apr 2020 17:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org> <20200429234101.GS11927@denix.org>
In-Reply-To: <20200429234101.GS11927@denix.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 29 Apr 2020 14:03:44 -1000
Message-ID: <CAGDS+nkG-R+zm=vO4QgffnP5tKS9LzB_17axa3gYhJmnHT7jrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Require gcc 6 or later
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 1:41 PM Denys Dmytriyenko <denis@denix.org> wrote:

> So, this is for master, rigth? No plans to backport it to dunfell (hence, no
> rpm backport either), correct? Trying to make sure Yocto LTS will still work
> on Ubuntu 16.04 LTS...

I have the same goal, so no plans to backport to dunfell!

Steve

> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/sanity.bbclass | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 9e871017389..292c5591dd3 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -527,7 +527,7 @@ def check_wsl(d):
> >              bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
> >      return None
> >
> > -# Require at least gcc version 5.0.
> > +# Require at least gcc version 6.0.
> >  #
> >  # This can be fixed on CentOS-7 with devtoolset-6+
> >  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> > @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
> >
> >      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
> >      if build_cc.strip() == "gcc":
> > -        if LooseVersion(version) < LooseVersion("5.0"):
> > -            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> > +        if LooseVersion(version) < LooseVersion("6.0"):
> > +            return "Your version of gcc is older than 6.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> >      return None
> >
> >  # Tar version 1.24 and onwards handle overwriting symlinks correctly
> > --
> > 2.25.1
> >
>
> >
>
> 
