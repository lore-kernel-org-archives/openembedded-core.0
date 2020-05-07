Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.683.1588875311641026196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 11:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YVgqDoJC;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id e16so7525359wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0C+DLTcLZYBES6REcGWV/S/BikUFV6E9YHEAt7OXJ7Y=;
        b=YVgqDoJCFzn9K4cuMEA8VJybVcf+GKNGTruQXYCP3PSIYlfOEuvM2EQ54JlooeoRck
         mMtUIhs6XQMVzDmWMTPcnFO6wxYHyKDCr79zTH3ou5M7e6QqWVEQQtgz4+SGJkKFjGWy
         u+2G8gpk6XGHjaefN7fQ4EMjiVcTFvjheO+zX0gyLhlECz9dtSSUNBFmmO4N5ilSV9yG
         Z2qBHYFBOJW4Aap9m5rvTt28NEuM7ld9JGBzacCYgkys9yV6xj0tU4D+Rb7KyrPB9/tt
         hTAk6fVrLvSjm5e1LPjyP+MNWYZUUWzMp7l5WXplUaiMQY5KMs3W6hQvd9ulv5Q0djTO
         zoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0C+DLTcLZYBES6REcGWV/S/BikUFV6E9YHEAt7OXJ7Y=;
        b=FIFZNVPsAVwtE608+ft5KuXJkAXVHriYbdk7pTJspFKaBVzTk73yDva7d2o7mL0CXj
         9bgQl5it/jJ0FNsUQS5pqwIJIObU8D/aK6lEeyJ3qAZOY2oCY/UOBRE7ZKX81smCxHCc
         +AXkZDpvPBq3kTni/CuhYZNKoc77AoFiKYGtY2iAJ92037FVf2KG48rnRWN1HZTQ0Y1u
         QuOqfkkfDFGFQtQLQ+KFEgTN0hqKWN3lXour4heuPhq0tqc2+Bb9Ko5RsDZKU7ZvxPoF
         4/d/L3opOEHPUtMNPhwLc2yT10HicFrkAKl/at09zx+ZJySrxnmmMqIT7X8GqaEskXh2
         om1A==
X-Gm-Message-State: AGi0PuZcaRqGCiDU+XnlUBg1q+4dPF17eg1uw74qhXwQ86VCUxr5x+GE
	Krcd0cUw+HmnHSK+X6u3ewHlzpgrNAmHB1I0a/A=
X-Google-Smtp-Source: APiQypIPFrPy4equc7HYtO+9AJrRuvzFDl2iagr5B6yenBzZfiMjHZifL0uCACVdYF1v1ygKHFAnixVqxe7md+mEnWM=
X-Received: by 2002:a5d:4112:: with SMTP id l18mr5570268wrp.230.1588875309931;
 Thu, 07 May 2020 11:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
 <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
 <160BD489BF65999D.29536@lists.openembedded.org> <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
 <ded31e364a1c6c5bcc5bd791b9bf49d9b8747b4b.camel@linuxfoundation.org> <CADkTA4NST80Bx=6KCBiaU5wxR6LxS3QXUN7SJ3g1cJcY6dnpmQ@mail.gmail.com>
In-Reply-To: <CADkTA4NST80Bx=6KCBiaU5wxR6LxS3QXUN7SJ3g1cJcY6dnpmQ@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 7 May 2020 08:14:58 -1000
Message-ID: <CAGDS+nmRH8t8cYSrqd9nFcSLPxxBH8JTD-uYvzHRrDJcvKPuqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From the discussion to this point it seems that these patches aren't
quite ready for dunfell.  Let me know if/when that changes, or if I'm
mistaken in that assumption!

Steve

On Mon, May 4, 2020 at 3:34 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Mon, May 4, 2020 at 9:24 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2020-05-04 at 09:06 -0400, Bruce Ashfield wrote:
> > > On Mon, May 4, 2020 at 8:56 AM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > > On Mon, May 4, 2020 at 4:31 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > Hi Bruce,
> > > > >
> > > > > On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrot=
e:
> > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > >
> > > > > > Hi all,
> > > > > >
> > > > > > Here are the -stable updates I've collected since m3 of dunfel=
l. I
> > > > > > ran things through the autobuilder, and no new kernel issues w=
ere
> > > > > > picked up.
> > > > > >
> > > > > > The -dev bump is good for master, while all of the 5.4-stable =
bumps
> > > > > > are good for both master and dunfell.
> > > > >
> > > > > I pulled these into master-next and saw reproducibility issues. =
I
> > > > > wondered why your test build didn't show it, turns out it also d=
id:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/1024
> > > > >
> > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducibl=
e.ReproducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - -----------------=
-----------------------------------------------------
> > > > > 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testres=
ult.real._StringException:
> > > > >
> > > > > AssertionError: The following deb packages are missing or differ=
ent: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/r=
eproducibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yoct=
o-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> > > > > The following ipk packages are missing or different: /home/pokyb=
uild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp=
/deploy/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.3=
8+git0+f405543442_6cb5b11e83-r0_qemux86_64.ipk
> > > > >
> > > >
> > > > I don't see any changes in the kernels that would have triggered i=
t,
> > > > but they never are obvious.
> > >
> > > I am working on some kernel reproducibility changes that were
> > > discussed about three weeks ago.
> > >
> > > Is the default for reproducible builds in master-next different from
> > > what it was before dunfell was releases ? If so, that might explain
> > > why I'm not seeing a change that would have triggered it (i.e. this =
is
> > > unrelated to my -stable changes).
> >
> > There are no reproducibility changes between master-next and dunfell.
>
> interesting. I'll take a closer look at the changes again and see what
> might pop up as a culprit.
>
> >
> > > Like I was mentioning before, if there's a document or pastebin of
> > > steps I can follow, I can run the tests against my pending changes a=
nd
> > > finish them for master. They of course would not necessarily be
> > > suitable for dunfell.
> >
> > The good news is the autobuilder has some debugging built in for this
> > kind of problem. You can see the diffoscope output here:
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-v=
hr0o_t9/packages/diff-html/
> >
> > which tells us its kheaders.ko in .rodata by the looks of it. Some
> > changes are cause, some are effect, e.g. the build ID is different as
> > the sections are different so that isn't the issue but an effect of it=
.
> > It looks like diffoscope doesn't know how to decode the .rodata which
> > could be compressed?
> >
> > The raw data is also there (the packages that differ), e.g.:
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-v=
hr0o_t9/packages/reproducibleA/tmp/deploy/deb/qemux86_64/kernel-module-khea=
ders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.d=
eb
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-v=
hr0o_t9/packages/reproducibleB/tmp/deploy/deb/qemux86_64/kernel-module-khea=
ders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.d=
ebe
> >
>
> cool. That's definitely useful, I'll have a look.
>
> At the same time, I'll try and clean up the documented kernel
> reproducible changes and trigger another run to see if they help.
>
> > which would allow you to look further at them by hand.
> >
> > You can manually run this test locally with:
> >
> > oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
> >
> > but it will take a while to run as it has to run two builds and compar=
e
> > them and only uses sstate for one of them. To make it faster since you
> > know where the issue is, edit
> > meta/lib/oeqa/selftest/cases/reproducible.py to change images (core-
> > image-sato, core-image-minimal and friends to simply "virtual/kernel".
>
> I'll do that cut down of the tests and see if I can trigger it here ..
> With those full builds, I'd be at about an 8 hour cycle to see the
> results!
>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
