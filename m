Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.1232.1625540045049573401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 19:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FWMpcEvr;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id m17so4346466edc.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VIOmelyX27Yyd77JNhJAlcLPpf5U56BzE5Ncuoaedcs=;
        b=FWMpcEvrBGWy/R9UrbuqT/7QmW+1xlmMDvafd0yndtnLydleutofq4MCpAXLNTKppc
         PXXDxtzXxdeWk9GmkmaJTsy25cU5WoKVJVVDfGOeJU/UPDcL8HUIQ2vmSaMGO9GGEJM+
         iFYSj0hJJ+G598GIcfo7PP9DumrrhGP5DPT5XkFNASm6sxnrBk4OHh8n1DmPr/f+brUe
         X7QShOzz9LhLpXtft6+frslER2QEQOzVvFQ5E6V76t3Dt/5e0ln7BUJ4ltAfYA5wA4H2
         Pg9u3139MJCt58LVS0Y00GYfTfT97RAYeAsuHYmrfsiwCFokMaE8eJH0h8iKbgDHi+Fb
         8Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VIOmelyX27Yyd77JNhJAlcLPpf5U56BzE5Ncuoaedcs=;
        b=dzmLypop4PhBIO/4WzbRMoJfa4gFvUjM0fTMeAlsgBnnepbkB4ay+2ukyCAMBvq5gd
         IpjguAsq/z/lrEuBxZSOcEq0KsGLv3TcXjIPjnHU5trNuvLQUPALx6cMhsg30Y85Jt16
         hoVG65YqExwmZUcnM1FotRDJlq8GqE+gwJdZBIX+FgaPelrNag64q0AZ9xfTqTMyAWf5
         kJ6CLvG0ihxOcjwWGqnz2Igy3sBqShO5frxNh8LNdEVDcNMw+9QnNUG2zXr1lzC/i2aV
         al0IGsagbj1hVUxvZHZMp4SG14DPg3KJXW1aZ0P3iS0Qlbm24kYN+8v/fDyWOBTNKawM
         PlrA==
X-Gm-Message-State: AOAM533CXRM0O/YpSbHe7cV0PEHhS2PR4OyV28GTnU81y1h6f11oNxrS
	Y96SG5QWciBYxfKTYr762M1q3CY33oizlD1nF4E=
X-Google-Smtp-Source: ABdhPJx9fcOd479o5/ou7a2Pb191yTWuLHzqoTnVRPXQfD9Ye3DrGuz681aJCudAL4GGCMi2t51QOSvaZQUz1rvg3oA=
X-Received: by 2002:a05:6402:b79:: with SMTP id cb25mr19762652edb.164.1625540043564;
 Mon, 05 Jul 2021 19:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623876372.git.bruce.ashfield@gmail.com>
 <3b93416cddd4db742f8bd957614b11ce9b796e51.1623876372.git.bruce.ashfield@gmail.com>
 <CADkTA4Pzsfk+1-D8daFnzmmuqa+7Rj0wDUBY1DDA7uEWzr+x3A@mail.gmail.com> <f90709882e71f4b21d3e5ab60427769facd0dfba.camel@intel.com>
In-Reply-To: <f90709882e71f4b21d3e5ab60427769facd0dfba.camel@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 5 Jul 2021 22:53:52 -0400
Message-ID: <CADkTA4M4Kfs=aAzjOT2JAFtrqiZr8wavbDxdUgiJhvs=ZJDe1g@mail.gmail.com>
Subject: Re: [PATCH 1/6] linux-yocto-dev: base AUTOREV on specified version
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 10:49 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Hi Bruce,
>
> On Mon, 2021-07-05 at 09:52 -0400, Bruce Ashfield wrote:
> > Hi Anuj,
> >
> > Could you queue this patch for cherry-picking into your next
> > hardknott update ?
> >
> > It is now in master, and I designed it to help folks out using our
> > -stable releases so linux-yocto-dev will stay on the version that was
> > available in the release timeframe.
>
> Yes, I will include it. Would it also help to switch one of the build
> configurations on autobuilder for future releases to use -dev kernel so
> it gets built/tested?

Hmm, yes, that is a good idea.

I'm not exactly sure how to do that, do you have a pointer ? I know
we've talked about testing -dev on the autobuilder, so having a config
for this in master would work, and then it would trickle into released
versions for more testing.

Bruce

>
> Thanks,
>
> Anuj
>
> >
> > Bruce
> >
> > On Wed, Jun 16, 2021 at 4:48 PM <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > linux-yocto-dev tracks the latest mainline kernel, and uses
> > > standard/* for that support.
> > >
> > > Archived -dev versions are under v<kernel version>/standard/base.
> > >
> > > This policy works, except that a released branch will still follow
> > > the new kernel versions, causing potential breakage with newer
> > > kernels than are supported in that release.
> > >
> > > Rather than lock the SRCREVs and update branches in old releases,
> > > we can preserve the AUTOREV nature of -dev, and allow them to
> > > switch automatically to the archived branch based on the
> > > LINUX_VERSION
> > > in the -dev recipe (which is unchanged in the release branch).
> > >
> > > This is consistent with the other branch switching done for the
> > > kernels and with the -dev workflow.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/classes/kernel-yocto.bbclass | 24 ++++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/meta/classes/kernel-yocto.bbclass
> > > b/meta/classes/kernel-yocto.bbclass
> > > index ba139dd7f8..0df61cdef0 100644
> > > --- a/meta/classes/kernel-yocto.bbclass
> > > +++ b/meta/classes/kernel-yocto.bbclass
> > > @@ -631,7 +631,31 @@ do_validate_branches() {
> > >         # if SRCREV is AUTOREV it shows up as AUTOINC there's
> > > nothing to
> > >         # check and we can exit early
> > >         if [ "${machine_srcrev}" = "AUTOINC" ]; then
> > > +
> > > linux_yocto_dev='${@oe.utils.conditional("PREFERRED_PROVIDER_virtua
> > > l/kernel", "linux-yocto-dev", "1", "", d)}'
> > > +           if [ -n "$linux_yocto_dev" ]; then
> > > +               git checkout -q -f ${machine_branch}
> > > +               ver=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\
> > > *//)
> > > +               patchlevel=$(grep "^PATCHLEVEL =" ${S}/Makefile |
> > > sed s/.*=\ *//)
> > > +               sublevel=$(grep "^SUBLEVEL =" ${S}/Makefile | sed
> > > s/.*=\ *//)
> > > +               kver="$ver.$patchlevel"
> > > +               bbnote "dev kernel: performing version -> branch ->
> > > SRCREV validation"
> > > +               bbnote "dev kernel: recipe version
> > > ${LINUX_VERSION}, src version: $kver"
> > > +               echo "${LINUX_VERSION}" | grep -q $kver
> > > +               if [ $? -ne 0 ]; then
> > > +                   version="$(echo ${LINUX_VERSION} | sed
> > > 's/\+.*$//g')"
> > > +                   versioned_branch="v$version/$machine_branch"
> > > +
> > > +                   machine_branch=$versioned_branch
> > > +                   force_srcrev="$(git rev-parse $machine_branch
> > > 2> /dev/null)"
> > > +                   if [ $? -ne 0 ]; then
> > > +                       bbfatal "kernel version mismatch detected,
> > > and no valid branch $machine_branch detected"
> > > +                   fi
> > > +
> > > +                   bbnote "dev kernel: adjusting branch to
> > > $machine_branch, srcrev to: $force_srcrev"
> > > +               fi
> > > +           else
> > >                 bbnote "SRCREV validation is not required for
> > > AUTOREV"
> > > +           fi
> > >         elif [ "${machine_srcrev}" = "" ]; then
> > >                 if [ "${SRCREV}" != "AUTOINC" ] && [ "${SRCREV}" !=
> > > "INVALID" ]; then
> > >                        # SRCREV_machine_<MACHINE> was not set. This
> > > means that a custom recipe
> > > --
> > > 2.19.1
> > >
> >
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
