Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.6349.1589509695704701829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 19:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k7hLglqG;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id s3so883798eji.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 19:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pz60MKZh+DevigEzmATL+k8XpHQONbHvDDBlD7NH1f0=;
        b=k7hLglqGshXFCHFF9jbf9msuY3HMvUfIVJSeTjfmcmyTPqd1yUD9wB16XsJ96Oiaa5
         1SzhXPB7Iw4IrZ4hu1zWvn5ivmQeqAuUL/YOHea9Pkq2mpDB1+VGIOgW6/0B39U04xIN
         KHR6yB8Lanr9M4oEnaQOxJFWobF3cC8JB0+9Ad1ugLTdO8LjLlKnAbZal7uNrlhtjP7w
         CdVafiPhCds8XK1Wn49q6TwblhXlfsADJL6LDADe4HlrfZSUR051vEdwNNHDTFZr7JPk
         sW3gvyoD8wCI7CmJuFrWguDV+3v1V/OVX8dGdYyIROs/fVWO276r9P2ZO+SofB2QdiWt
         nglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pz60MKZh+DevigEzmATL+k8XpHQONbHvDDBlD7NH1f0=;
        b=Ydhg6Q4HdhEwtHZk52l2HvZ1wCz4vxiXxQqcTb4x7aHRwocisXXMLRUC7LRk6aqWGP
         QPLnM56QN/dRRaCKknZWaf8XyOttb5jreq3AqjT4mPD9h0NOr3Hitd3cg+FqyEaF/WpS
         2cnSHPL9fsJUYjES+aKfhjDM+R2/ZCUQNg567u5p/DoxQKiusfV33sRZEnvT6bB0rvDf
         dD2AFwOj5cxiaIL7ityiiX2AsTiKhKN1FbiqMoQLcnnBrhWmGp1aU6jcMANO5iBjAq1E
         DJ6GIZbPTRggsE2WzIuz0dgi2GEbtjxMPpG/4bwHP1umBlsk+tvUViVyKbP14A1Bb1+F
         pRgA==
X-Gm-Message-State: AOAM5337/sObcpkAFrcnYKxAfRkGs7hmqXLUyll5hg6KGZ4cDlBP0DdR
	n766r8E6WxpgbsQMkHz5gDn/AgJJE0LALATzjYI=
X-Google-Smtp-Source: ABdhPJxZPAfSSZNDBW4tiyK0Vok/Y9V/xGHJxo+kBsuPAtAlh2hQIjPqdR0Vgg63JgCkPBACGmQCNcbMUYLCbgC5oUM=
X-Received: by 2002:a17:906:2b96:: with SMTP id m22mr842825ejg.330.1589509694152;
 Thu, 14 May 2020 19:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
 <160EEB0DDF36CFC2.25549@lists.openembedded.org> <CADkTA4N9OVMWenYf1p5Tq6xvoa12JOaNNKfccT4of-t33NH6WA@mail.gmail.com>
 <78de346ce051f49a641ca92edd33a778b6881e93.camel@linuxfoundation.org>
In-Reply-To: <78de346ce051f49a641ca92edd33a778b6881e93.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 22:28:02 -0400
Message-ID: <CADkTA4O3dR4DTmcb+qEokXbBMEQGM-iXDa25KTxp1XQ0HaPg8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 4:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-05-14 at 15:44 -0400, Bruce Ashfield wrote:
> > On Thu, May 14, 2020 at 10:22 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > On Thu, May 14, 2020 at 10:09 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Hi all,
> > > > >
> > > > > This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> > > > > -stable
> > > > > bump to v5.4.40.
> > > > >
> > > > > The extra changes to make these pass the AB tests are the kernel
> > > > > reproducibility commits.
> > > > >
> > > > > The issue we had on the last submission was that IKHEADERS was
> > > > > switched
> > > > > to a module, and hence was failing reproducibility tests as we didn't
> > > > > have the timestamp variables exported for the module build. It has
> > > > > always been a problem, just one we hadn't hit.
> > > > >
> > > > > I've left the fix as two commits on purpose, since the copy of the
> > > > > reproducibility export fixes the problem, and is definitely safe for
> > > > > dunfell,
> > > > > and the second commit is my effort to remove the duplication of logic
> > > > > and
> > > > > create a common python routine they can call. I've used the
> > > > > techniques for
> > > > > subprocess running that I've done in other kernel build elements, but
> > > > > if they
> > > > > aren't the right ones to use, point me in the right direction.
> > > > >
> > > > > All said, these are green on the AB and should be ok for master and
> > > > > dunfell.
> > > >
> > > > I think this triggers something here:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914
> > > >
> > >
> > > In that case, just drop my effort at factoring out the source date
> > > epoch into a python function.
> > >
> > > It looks like the git check went nuts, and since we don't need it, and
> > > I won't have time to work on it again for a while, if you toss it in
> > > the bin, all should be well.
> >
> > I did tweak the python code to handle the git return code more
> > gracefully. I did test all the conditional paths before, and they
> > worked, so I'm not sure how to trigger the failure here.
> >
> > I can try an AB run against the fixed up routine, but what target
> > should I be running ? Obviously quick doesn't hit it, or I would have
> > seen it.
>
> You need to push a plain oe-core branch to oe-core-contrib and point
> the build at that. This is the target:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47
>
> (qemuarm-oecore)
>
> Not setting a DISTRO would also do it.

My local builders are running out of space, so I tried to push to
oe-core-contrib, I don't have access. I assume a github fork of
oe-core would work as well.

But when I checked out that target on the AB, it didn't offer me the
ability to schedule one. Does something need to be granted for that ?

Bruce

>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
