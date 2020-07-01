Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.23252.1593614848842120250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WV4tOZfz;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id l12so3074642uak.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2cxH6hVfEKypFqm60nXLkg0k9wkQSfUsnvISpzqLgf8=;
        b=WV4tOZfzWWtjeS7p9HvWEt8uidm0xtTp2rOZ43yY96r+y/AzILizTLyJmcFIaEx2qG
         yKkmRnfA16HdTiNmooDW0/GOhYs3UavrOlcr+PLsonodBDxeS7M3Cg0HWP8deluR6M/G
         YIQLBBSIo3FaHfRgkKVdoPJlbJXi8+pbO21Fwxj739GtO0qhi0omyGQQOa1mRB2Ycvr5
         KjpVsTgPT3XxKIR2na/r+fr7etX+Wk0GnTL3OH4i/4kxMM/ZFBtlxjWGMRmmWMaOz19o
         +1SxSlmWMBokd+EVKlkuVHr1Eb8Pkfax6soeXECkTFZVl3VIw/0SgArpN0IPx7x4Wdeb
         n0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2cxH6hVfEKypFqm60nXLkg0k9wkQSfUsnvISpzqLgf8=;
        b=dNQom47hNTDa+RIBfnYxRSiGlMIcoWVHMMOx13Yy9mYpvBtBHaRNTP4JtvlKzg7r6/
         JX7RnK7YOnjIJxvebP8K+JNHVLTjw3AcCU3i8+K3G9MdGbHN6AyqQxh/bSokyUOImj9n
         jTacvGP2i+D6FhiYxIAcr8k/hXK1cK7TkDYLECdmRecTiM+JzVQwqwFqHA3VEoS2hjbH
         Mu8UsBORecJsIKW3LIDULmuIeGQ7SEc6FQB/fo+X6uqqvffSDm2xn+QSlOgz5FkCznRl
         MrdGAYiiU8+NTmVsJptc3i937513+PgH0ImlscHw8PDSj2hMbonZ8rjt8Rnmm7jk3pCE
         0iuA==
X-Gm-Message-State: AOAM530w6zrVz9i9mbTEyjKkq/aLRPrMGIW64z0mrOvTRmSIKaXrUCL1
	LVcfrtg4ykezEfxB4BS7z94oT85hce4S/+Pz4TQ=
X-Google-Smtp-Source: ABdhPJza6oFbVeIXkU6LlxaHTdZZ6S40Rfs0a0G6Xg6gUN5MOx9MEzbgkxIGmSRcWdt0zVDLk/iR8f9zGIJl85bL0WU=
X-Received: by 2002:ab0:5b91:: with SMTP id y17mr19265355uae.95.1593614847905;
 Wed, 01 Jul 2020 07:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701104628.32696-1-andrey.z@gmail.com> <CADkTA4N68p6gK-nO3mPJ0z+MtBDFJDjsvn0RpF=ou1+Wj-5UFQ@mail.gmail.com>
 <161DA278CF8B94DF.27211@lists.openembedded.org> <CADkTA4NuQZ+iVnwOwZeTwBipLWaSb19=PQoSweDE7SN+O2Am4w@mail.gmail.com>
 <CADkTA4NXDjKXhWaS6AxDu1MB4f+WkQG+=dj-49pxDQYDkOiGgQ@mail.gmail.com>
In-Reply-To: <CADkTA4NXDjKXhWaS6AxDu1MB4f+WkQG+=dj-49pxDQYDkOiGgQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 1 Jul 2020 16:47:17 +0200
Message-ID: <CAHtQpK4KvA5nVQ2LDJeGD4oV1yKZXs1rYA8Dc_GWokxzsFK=rw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel/yocto: fix search for defconfig from src_uri
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 3:32 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 9:26 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Jul 1, 2020 at 9:01 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > >
> > > On Wed, Jul 1, 2020 at 8:58 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 1, 2020 at 6:46 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > >
> > > > > Fetcher provides full paths to defconfig and scc files, which awk
> > > > > comparison operator does not catch during construction of
> > > > > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > > > > src_uri_defconfig variable to come out empty, and fails further
> > > > > validation if defconfig is only supplied via SRC_URI.
> > > > >
> > > > > Replace comparison operator with awk index function which searches for
> > > > > sub-string during filtering, effectively placing defconfig from SRC_URI
> > > > > into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
> > > > >
> > > >
> > > > Hmm. This passed all of my testing (defconfigs were picked up
> > > > properly), can you share your test configuration ? I'd like to test
> > > > this across my kernels, since I have even more corner cases than most.
> > > >
> > > > What issues did it cause in your build ? Was the defconfig skipped completely ?
> > >
> > > Ooops. I see you did mention this in the log.
> > >
> > > I do have an additional question though .. we only want to match
> > > on"defconfig", not a substring of something else that contains
> > > defconfig. Won't the replacement awk expression match more than just a
> > > single 'deconfig' word ?
> > >
> > > Which is again why I'd like to see your test config, because I was
> > > testing against cases like that, and they all worked here.
> >
> > I re-ran my tests, and I can see why my defconfig was being chopped
> > off, it was supplied through some KMETA variables and wasn't actually
> > an absolute path.

Yeap, that is correct. I use a meta-freescale layer, and defconfig is
supplied along with a recipe on a per-machine basis. This is picked up
by the fetcher with an absolute path, hence causing sccs_from_src_uri
to be filled in with fully-qualified name for defconfig which gets
filtered out. If the defconfig would come up via "side-channel" (say
KMETA) then the implementation would work perfectly though.

> >
> > I also mocked up a subtring test, and I can see that it is yanking out
> > something like "i_am_not_defconfig.scc" as well.

True, I missed this out with the awk index() function. However, this
case is rather unusual to get, and you might not even accept such scc
in kernel-yocto-cache... On the other hand: people go mysterious ways
and you never know if someone would come up with such a name in it's
own repo.

> >
> > This doesn't have to use awk, I'll poke around and see if I can come
> > up with something that handles both cases
>
> Sorry for all the email, I was trying to get something out before
> anyone else started working on this, so we wouldn't duplicate efforts,
> and it just ends up being more email.

No problem! I was offline for a bit now, and it just took me some time
to catch up with the thread. :)

>
> This solves the problem here:
>
> src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(match($0,
> "defconfig$") != 0) { print $0 }' RS=' ')

This would be better IMHO, I missed this one out since normally I tend
to use index() :)

>
> And my first boot/configuration looked fine.
>
> Did you want to update and send a v2, or did you want me to do the update ?

I'll take your suggestion in, test the build and come up with v2 of this patch.

>
> Bruce
>
> >
> > .. and then run some boot tests with the patch in my queue to ensure
> > what I ran before, continues to boot.
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > Bruce
> > >
> > > >
> > > > Bruce
> > > >
> > > > > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > ---
> > > > >  meta/classes/kernel-yocto.bbclass | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > > > index 41d8620e67..059d78b7dc 100644
> > > > > --- a/meta/classes/kernel-yocto.bbclass
> > > > > +++ b/meta/classes/kernel-yocto.bbclass
> > > > > @@ -156,9 +156,10 @@ do_kernel_metadata() {
> > > > >         # a quick check to make sure we don't have duplicate defconfigs If
> > > > >         # there's a defconfig in the SRC_URI, did we also have one from the
> > > > >         # KBUILD_DEFCONFIG processing above ?
> > > > > -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> > > > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") != 0) { print $0 }' RS=' ')
> > > > >         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> > > > > -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > > > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") == 0) { print $0 }' RS=' ')
> > > > > +
> > > > >         if [ -n "$in_tree_defconfig" ]; then
> > > > >                 sccs_defconfig=$in_tree_defconfig
> > > > >                 if [ -n "$src_uri_defconfig" ]; then
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > > 
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
Regards,
Andrey.
