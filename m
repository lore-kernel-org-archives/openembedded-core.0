Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.24457.1599937847581917798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 12:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Xr4YjkMx;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id b12so13742847edz.11
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 12:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lu1Ie6eCGT/JOSHAabYNqUGq4yxhKl41VfFcKcZTLu0=;
        b=Xr4YjkMxWUwn9LYjNmT2z4cYiHwlGdWqbv+hXEp0IqumobgxLOqaDYqVNpr3j/geXg
         2zNgXGDEv0rCxcC9hAPbLqqrqkPI2G/PkRFWap4KvehOn9+CqdzVxn+K98AxAcWVBVMK
         7t7HLPGkTh0qgVf9Ki/0Qb5vNsCfqlqe3lDJIWH11Q2vDjUdLaOeGuJv74UokqdnXp5C
         Xorgf1VaLrlc6Y9tHj+iv2HW2SlJyllNGwESys5BRDexGowQXHj0RY9HBY8083/mMm59
         Y/285z38g/QoCKYbzb4vuuedJtTdjSPQ+IK7S1onx7WH74+5eiZ18JkJVCPiMQ+fMdXA
         jaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lu1Ie6eCGT/JOSHAabYNqUGq4yxhKl41VfFcKcZTLu0=;
        b=RJ8t6qYs2rFA9VTSrxRXDI7PCkOqJZhniN1KoA7roWldskEHRxOeJ2A+IAgRMiWre/
         1UWAcRaPw+Sy8Gjz/Y/jOMHCKvET+pKhvJVSaoqNWwP8QU2+X5BSczp/KMaUSoYVqnZ+
         w1oMVehGf+TNNCskWWUYnVpIsok7oPUsAT4Tfk/WVcdKZE1aYzv/wJRIedRASKKKwp/H
         I94gwrbkB88uY7LHfd1j4mpvtkvaYdLanrewuNw0g7YuDkNGsT3yx3fms/37RcxV4ODn
         4aMwD3m3OZ0txC1NOP9d6HmuXJFdKYzvjUBu5dmV/y/dV3PcUubSAAQKbSTh4TltsM2u
         uzKA==
X-Gm-Message-State: AOAM530y6JtIkydY6hFDdPyXfyn7oJo1cLuMo1Etxg3BoVY8DLKwJhqP
	jpbKtyxC9ynweMv0+BMv/svXg8VO+C8JLrS/c4FDyet26z4YC82q
X-Google-Smtp-Source: ABdhPJyeVkZuR1uT8HcdFpAj2E7c42WkQVEk3soXZRhwL5rkJLJltqfv00VARsYPLvLhfH3EB2UE8v5qiTVPmn5+LvI=
X-Received: by 2002:a50:f418:: with SMTP id r24mr9674639edm.295.1599937845524;
 Sat, 12 Sep 2020 12:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
 <CAPTzV15cU7POhAMFoPhqkCBT-9jsHJ_6z3XKWMPHF81dJcBz3A@mail.gmail.com>
In-Reply-To: <CAPTzV15cU7POhAMFoPhqkCBT-9jsHJ_6z3XKWMPHF81dJcBz3A@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sat, 12 Sep 2020 09:10:34 -1000
Message-ID: <CAOSpxdbQgd=4M3vpZfH+VMmPc8Yp7Rqtw7HmhsSVSmYpSwaHPg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 23/25] kernel.bbclass: run do_symlink_kernsrc before do_patch
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Chanho Park <parkch98@gmail.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"

Looping in Rasmus, the patch author.

Would you like to submit a patch to fix this issue?  Otherwise I
should probably revert this patch in dunfell.

Thanks!

Steve


On Fri, Sep 11, 2020 at 3:40 PM Chanho Park <parkch98@gmail.com> wrote:
>
> Hi,
>
> This patch makes STAGING_KERNEL_DIR symlink broken if externalsrc is used.
> I filed a bug for this.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14044
>
> Best Regards,
> Chanho Park
>
> On Mon, Aug 31, 2020 at 3:19 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >
> > There's a race between do_symlink_kernsrc and do_populate_lic, since
> > the latter is ordered "after do_patch"; so the two may run in
> > parallel. In some cases, that actually causes do_populate_lic to fail
> > if it happens to look for a license file somewhere under ${S} in the
> > short window after shutil.move and before the symlink has been
> > created.
> >
> > Fix that by simply ordering symlink_kernsrc before do_patch. Any task
> > that pokes around in ${S} looking for files should be ordered after
> > do_patch, so this should also fix similar latent races with other ad
> > hoc tasks.
> >
> > Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit c5dfc2586b4135cc86e91bb04fed837daf505676)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 9e3c34ad48..9eb9bd2844 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -152,7 +152,7 @@ python do_symlink_kernsrc () {
> >              shutil.move(s, kernsrc)
> >              os.symlink(kernsrc, s)
> >  }
> > -addtask symlink_kernsrc before do_configure after do_unpack
> > +addtask symlink_kernsrc before do_patch after do_unpack
> >
> >  inherit kernel-arch deploy
> >
> > --
> > 2.17.1
> >
> > 
>
>
>
> --
> Best Regards,
> Chanho Park
