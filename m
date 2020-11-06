Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.13995.1604680269664232893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 08:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i9pnYmtG;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id k3so2741737ejj.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LLYIOyKWxCpbOHnEgYM/1m4dyU2eSorARVsGmU8cWQ=;
        b=i9pnYmtG0SicgrpMIrx7xQBD5pSJ9kDHUWKpVrUGBH5FoT4jL/0SKGrOLt4M3/NHse
         dJMZG6y0JwaPLc9gHkESOFkgHp/phy0rgKS/cY3IVvjmFlSfSQjEOU2jj0SJrz/cnEc0
         xVt/Ycvev2tJsf8PIsggBbnlIxFGh6EkshKAA+VHhamb8ZS4MNtQfs3c57pdHbHsZEF1
         UlEcL0cHwLX9xpbDXhrx1acHFnp5arVOcLAOe5lYK1YKpEMzH3SyQw6tyK21F436dQ7N
         Q3mfIqfnTFByCuTnWIkS3FlCOiGTJKfe+aapOZMDPx8wYDrhagcDdfZIKkZbouR0tlqu
         BSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LLYIOyKWxCpbOHnEgYM/1m4dyU2eSorARVsGmU8cWQ=;
        b=X32o+C39dVhaI8jHd2L3yxA7LfNxnlIPeFIdXHtrE1gYcANLrjVujsSFxiNRv1oha5
         W8k8mmAuidxhxUkOaA9sSlzDdmi3EMswry3x1ycAG9HtNZhQn4ldKDVn+y/bkiBrA/BX
         K7Y/tKnYoA1vMjKbZOL+gT+ETZwB8ONkgrxg/mwQLNyjsITxhjv+ccwlu4nTncKvGXdn
         RBJl5sDNDHJTUcOeRBt6DQkQD/LyfvJpl9DYYUIJjdHG7H8+zf+L9n+0g0oPLKa5DNGL
         RmNWgTMnB7ZdtjlNug5F6VCmLOaGuN833evz/xZBucK1BtppsZbuhqkqIpghVKZ6+QVV
         a0lw==
X-Gm-Message-State: AOAM531ceu7tKDoSZKo5IQVWnnKrx6TGRsR/AfM991NskQTf8xBglGys
	x0+nyR+D4k8JPunkJ65lk4I9Bg/r0HRtWEIVnrRKuw==
X-Google-Smtp-Source: ABdhPJwPFKlQJwdfiF9uNcVeprvijUoXcVad395qxBXrJuF0/M/n8UMGBSzUn31LnwxXrz/B2io88fFFo0l8JShpt60=
X-Received: by 2002:a17:906:2ad3:: with SMTP id m19mr2763202eje.81.1604680268063;
 Fri, 06 Nov 2020 08:31:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604643684.git.anuj.mittal@intel.com> <1bc33490ef6c48a3665bee69be398866ffd2d76a.1604643684.git.anuj.mittal@intel.com>
 <CAOSpxdbqAbYhhHfR3sHUzOMakcvcECmM6UpjHUdKYw-Vi+_wmw@mail.gmail.com> <9f21fe25eee1d915590f9398a8e91d67feb5c00f.camel@intel.com>
In-Reply-To: <9f21fe25eee1d915590f9398a8e91d67feb5c00f.camel@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 6 Nov 2020 06:30:56 -1000
Message-ID: <CAOSpxda_JGYuZqp6HjavEYtZqKrUJ1fcwWPkPe-iXRamprzVRQ@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 22/22] update_udev_hwdb: clean hwdb.bin
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 6:04 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Hi Steve,
>
> On Fri, 2020-11-06 at 05:45 -1000, Steve Sakoman wrote:
> > This is another patch I don't see in master -- just in case there is
> > a
> > "master first" policy for gatesgarth.
> >
>
> Yes, it should be master first. I can see it here:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=994ca65e6f828dd38e0d7d09fb5243147ba4e36b

My bad!  I must have fat-fingered my search.

Sorry about that.

Steve

> > On Thu, Nov 5, 2020 at 8:29 PM Anuj Mittal <anuj.mittal@intel.com>
> > wrote:
> > >
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > >
> > > Steps to reproduce:
> > > echo "IMAGE_INSTALL_append = \" udev-hwdb lib32-udev-hwdb\"" >>
> > > conf/local.conf
> > >
> > > When install both udev-hwdb and lib32-udev-hwdb as above,
> > > there comes below do_populate_sdk error:
> > >  $ bitbake core-image-sato  -c populate_sdk
> > >  ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with
> > > exit code '134'
> > >  NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need
> > > to be rerun and 1 failed.
> > >
> > >  $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-
> > > r5/pseudo/pseudo.log
> > >  [snip]
> > >  inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-
> > > sato/1.0-r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-
> > > poky-linux/lib/udev/hwdb.bin' ino 427383040 in db, 427383042 in
> > > request.
> > >  [snip]
> > >
> > > It is because both udev-hwdb and lib32-udev-hwdb will generate
> > > ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during
> > > do_populate_sdk
> > > and it triggers pseudo error.
> > >
> > > So clean hwdb.bin before generate hwdb.bin to avoid conflict to
> > > fix the above do_populate_sdk error.
> > >
> > > (From OE-Core rev: c7472925feb53ce92c1799feba2b7a9104e3f38f)
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit
> > > 994ca65e6f828dd38e0d7d09fb5243147ba4e36b)
> > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > ---
> > >  scripts/postinst-intercepts/update_udev_hwdb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/scripts/postinst-intercepts/update_udev_hwdb
> > > b/scripts/postinst-intercepts/update_udev_hwdb
> > > index 102e99b947..8076b8ae6f 100644
> > > --- a/scripts/postinst-intercepts/update_udev_hwdb
> > > +++ b/scripts/postinst-intercepts/update_udev_hwdb
> > > @@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
> > >                 ;;
> > >  esac
> > >
> > > +rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
> > >  PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
> > > $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
> > > ${UDEV_EXTRA_ARGS}
> > >  chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
> > > --
> > > 2.28.0
> > >
> > >
> > >
> > >
> >
> > 
> >
>
