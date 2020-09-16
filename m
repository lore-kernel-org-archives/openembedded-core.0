Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.361.1600269493188340507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 08:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BBQw3HC2;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id r7so10859652ejs.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLkfFg5y+o0okokLWm+ONKYfWkuUZCEaMGJDVgtOOT0=;
        b=BBQw3HC2esSgQ/jVGU5El/5ddSzWMpW2bpTqG7gwEGR1XBB2cUf4LsihP9NP6Y/SRg
         usVfG3d49HcbiZdYC9DIbK4qNjvNxS7ohWBIFdecf6RKLjxHBdJFLHCSuw0ssF9jR9Kw
         1sPt2XwwY4CWC2mOsAr+OpEJSwJ7KT9Lz3Bw13tW4yPd/Tvs/RqwZ1FIXgtsi4jnBE57
         R3JKTjg48c2nhKiaidaxs1a/695m7U9n5DpmOiim1LUMBayMngW5r7x5g++Jr/z9Pq/q
         2OXcNZqxXGPYEtagsHqFYjLdZEsEg8MO5Ac6+TZ0HTNLXN2EDvCfKLtjT931bDj7SReO
         WnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLkfFg5y+o0okokLWm+ONKYfWkuUZCEaMGJDVgtOOT0=;
        b=qpsYn/+y/osiM9LN4SCkSoey4076KqO17ljkZPaYdaw3eI5F/+d6MHhFyVWufL2B7Z
         Xc1/l34UkHde7R3QP73t2v1/MBH5hb27j7qdWZ9nbbHIEdpouODG+vxlhA4DoIKMW04N
         aBIYV9bD9ai+5jRUansyhO6yljWp8knx1rQidpEHenPbS9KZiqx8VvcSLqsN1QGsGmrc
         u5rg3wAFbq/7a8AQgPikPdDAIf2/g4o9h5uCIAuciRRsw6499fMqquNWbIjHsIER/rlT
         HkihLiTY+NfIuAMBZxiYn3XeOPpb3PXluF3+lBReZfkEJPHzoMipp+9Injy4Kdz/A//S
         Jn/Q==
X-Gm-Message-State: AOAM531edugKRINsU5d2yedbpO4CSWzBhGoqLXXl2/OLmCAwiHGubdYM
	XOcJFzoOf/WH3iTNtbefcU7yWuWk6md1mgxP7eeQPQ==
X-Google-Smtp-Source: ABdhPJyEAe08N1Kxxmk4LM+Q3ig69umS4sundn7u+8EyCCN0X2oHnL/BmrT41TyKvqfeU9kavL48vPFtAZgTFMjodj4=
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr9021323ejb.225.1600269491409;
 Wed, 16 Sep 2020 08:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
 <CAPTzV15cU7POhAMFoPhqkCBT-9jsHJ_6z3XKWMPHF81dJcBz3A@mail.gmail.com> <16341EFF0D914A74.16354@lists.openembedded.org>
In-Reply-To: <16341EFF0D914A74.16354@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 16 Sep 2020 05:18:00 -1000
Message-ID: <CAOSpxdZDfGUw_0b6DXpcfrhSUvMabYZjvV05P6UCEcXFJbQHHA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 23/25] kernel.bbclass: run do_symlink_kernsrc before do_patch
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Chanho Park <parkch98@gmail.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"

Since there is an upcoming dunfell release and we don't have a fix for
this issue I am going to revert this patch.

When it is fixed in master I will reconsider taking this patch and the
fix for dunfell.

Steve

On Sat, Sep 12, 2020 at 9:10 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Looping in Rasmus, the patch author.
>
> Would you like to submit a patch to fix this issue?  Otherwise I
> should probably revert this patch in dunfell.
>
> Thanks!
>
> Steve
>
>
> On Fri, Sep 11, 2020 at 3:40 PM Chanho Park <parkch98@gmail.com> wrote:
> >
> > Hi,
> >
> > This patch makes STAGING_KERNEL_DIR symlink broken if externalsrc is used.
> > I filed a bug for this.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14044
> >
> > Best Regards,
> > Chanho Park
> >
> > On Mon, Aug 31, 2020 at 3:19 AM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > >
> > > There's a race between do_symlink_kernsrc and do_populate_lic, since
> > > the latter is ordered "after do_patch"; so the two may run in
> > > parallel. In some cases, that actually causes do_populate_lic to fail
> > > if it happens to look for a license file somewhere under ${S} in the
> > > short window after shutil.move and before the symlink has been
> > > created.
> > >
> > > Fix that by simply ordering symlink_kernsrc before do_patch. Any task
> > > that pokes around in ${S} looking for files should be ordered after
> > > do_patch, so this should also fix similar latent races with other ad
> > > hoc tasks.
> > >
> > > Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit c5dfc2586b4135cc86e91bb04fed837daf505676)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/classes/kernel.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 9e3c34ad48..9eb9bd2844 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -152,7 +152,7 @@ python do_symlink_kernsrc () {
> > >              shutil.move(s, kernsrc)
> > >              os.symlink(kernsrc, s)
> > >  }
> > > -addtask symlink_kernsrc before do_configure after do_unpack
> > > +addtask symlink_kernsrc before do_patch after do_unpack
> > >
> > >  inherit kernel-arch deploy
> > >
> > > --
> > > 2.17.1
> > >
> > >
> >
> >
> >
> > --
> > Best Regards,
> > Chanho Park
> 
