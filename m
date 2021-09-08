Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.12263.1631111187475503336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wnOvoUNV;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.53, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f53.google.com with SMTP id x6so3563943wrv.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x950dE8m124h1RhRSmcYnhA367ug8VmBjn3Ao+OkXf0=;
        b=wnOvoUNVukLvJkQN1JtyNyD7At0jyYEi3uES8mYaUc8bGaOmWhB5w/ScZyZ7ZOWx0t
         HX0psrUWpzdpfj+u6t9Dwh0l/kVKR7XRH/JP50sTwuAw5dupMCUQztMuzyu25c7ZM61V
         DIjIa78s4nKXotO5JuG2l06tWN6W8+b90acBdgM5Rfzx0tTTsQVRXIwKgDDKqHgH9HQf
         3YS2JDH8Z2+5UDpZ6WK9vX4+KY1BfLbmHQiUjI2g6a8PSLOUmKbuMKmQonJzhv7H3B9u
         XhHfMt1f+EUKE23rrLGTaFFyAY+boQ+Ma8kTsAhMB2KRvCE4rNb+Ze+ob4eseClGj3CN
         fGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x950dE8m124h1RhRSmcYnhA367ug8VmBjn3Ao+OkXf0=;
        b=ZPArp+JFRL4tt39BYRoV6kUNy7cXb/08gGxg3klIWMLlvHmrdq+FVxo9d6Nc7g1wLR
         dDoM3WHm8KFL+E5Y/xr4h2gOXwcRUzsvr0HlMME9GPFA8Pvjum5pZG9BN9Pcgi6tF5Fr
         jhvxqS4x3c8wmOt9gusWMp7rhJhyMNBXrlWftjuV0ZiOIjHGX3BN5TVf0l5IOX60mXvz
         1xYAp3BJfyEybBAZjmOAuv5Z9cdIPpnunf8T+1rkcPvl40aeslEP2+INpOnJWG8B+sWA
         bHB8DUGLYbGx+09hlnGvwgoxHQ2jewwimTbgduLn3TKYRC4Sj3Tf69C79x1bl04UJYsM
         p+cA==
X-Gm-Message-State: AOAM5319hc5ndA/N4j2L3bdvpJyASB4fjEc3mlWHttCuIg0hTFK14Vkz
	fKNUH/IRZynh1lTKhP0E7MsF/Oav1SDFR7HYyU2/EQ==
X-Google-Smtp-Source: ABdhPJzfBABHeLaE7UQKQVXIVn43tgsDSCq7W1hBV4BdIlfV3TDITJ5W7Fb/mnAUGbFAEHCA0gEWDRZBX09g2SGhcrw=
X-Received: by 2002:adf:edcf:: with SMTP id v15mr4503493wro.61.1631111185745;
 Wed, 08 Sep 2021 07:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210823101205.29267-1-andrej.valek@siemens.com>
 <20210826131549.2349482-1-andrej.valek@siemens.com> <3f9e5142ddd2b90cc3e150287d0f88456188d56b.camel@siemens.com>
 <CAGDS+n=1TESUosknrqcO2NePBtufzL+QwAp40zpq6MzH0mju2w@mail.gmail.com> <67be0df323696c2822d8cb010a44631cb6c3e217.camel@siemens.com>
In-Reply-To: <67be0df323696c2822d8cb010a44631cb6c3e217.camel@siemens.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 8 Sep 2021 04:26:12 -1000
Message-ID: <CAOSpxdaQeUZjyh2wO0r85VCqBpXndZc1b9NdqEWKL8wrSJ2G5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] vim: add option to disable NLS support
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "sakoman@gmail.com" <sakoman@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 9:49 PM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hello Steve,
>
> What's the current status in this case?

It is in my most recent pull request for openembedded-core:

https://lists.openembedded.org/g/openembedded-core/message/155775

> I see, that changes are in dunfell-nut branch
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=stable/dunfell-nut

Patches start there for testing, then move to stable/dunfell-next when
ready for a pull request.

> . But you bumped the 3.1.11 version already
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=dunfell ) where
> the changes are not there.

Richard took the version bump patches from yocto-docs and meta-yocto
prior to the final openembedded-core patches.  Not a problem, we plan
to build and test 3.1.11 next week and will create the 3.1.11 tag
after successful completion of testing.

Steve


> On Wed, 2021-09-01 at 12:35 -1000, Steve Sakoman wrote:
> > On Wed, Sep 1, 2021 at 9:04 AM Andrej Valek <andrej.valek@siemens.com>
> > wrote:
> > >
> > > Hello Steve,
> > >
> > > Could you please cherry-pick this patch into dunfell branch too?
> >
> > OK, will add this to my test queue.
> >
> > Steve
> >
> > >
> > > Thank you,
> > > Andrej
> > >
> > > On Thu, 2021-08-26 at 15:15 +0200, Andrej Valek wrote:
> > > > - Some distributions with UTF-8 locale have problem when National
> > > > Language
> > > > Support is enabled. Add there an option to disable it.
> > > >
> > > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > ---
> > > >  meta/recipes-support/vim/vim.inc | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-
> > > > support/vim/vim.inc
> > > > index 17d1c24a7c..860fd24863 100644
> > > > --- a/meta/recipes-support/vim/vim.inc
> > > > +++ b/meta/recipes-support/vim/vim.inc
> > > > @@ -54,11 +54,12 @@ do_compile() {
> > > >      autotools_do_compile
> > > >  }
> > > >
> > > > -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> > > > +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> > > > selinux,
> > > > elfutils, nls
> > > >  PACKAGECONFIG ??= ""
> > > >  PACKAGECONFIG += " \
> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui',
> > > > '',
> > > > d)} \
> > > > +    nls \
> > > >  "
> > > >
> > > >  PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
> > > > @@ -67,6 +68,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> > > >  PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> > > >  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-
> > > > selinux,libselinux,"
> > > >  PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> > > > +PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
> > > >
> > > >  EXTRA_OECONF = " \
> > > >      --disable-gpm \
> > >
> > >
> > >
> > >
>
>
> 
>
