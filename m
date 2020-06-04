Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.320.1591314496810962297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 16:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M8CNsGw3;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id er17so3870541qvb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 16:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBmqCTTTUlnKnfyOC8j8gMXBgbDERo2Lbu1Qbs0vMCM=;
        b=M8CNsGw336h5SALpRDod2802YgJ/62Uz/mI2JI9TLU7VPtnN29z5/iVaF1b2jo01ne
         vug2U6cTBnLG/6MO5rLHNa5X+Fgsm/Zq0cKNUI4mgKJDJ76GTqCQTsPcFkTK2DUOeCZE
         cLaTXpE3MKQUvR3UwfQbBKKdzdfJ9G/i09byNFXDfcqa6TCQJX4ptRIq8yTDThneeRh+
         ydnp9zFRatcoFCUAocwU+KiSYaZdIw2VrAd+Wq318u/HZU1twWSrU52sWjT32WO6ANMc
         jhbmgvyysG1lhtpyyTL5YksSzKqYRxN0UWP6eGDDtINvPwhew45/+3HEDiA+AVwC3gNM
         KLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBmqCTTTUlnKnfyOC8j8gMXBgbDERo2Lbu1Qbs0vMCM=;
        b=YeO8cCpdj5FQ9risu14J4e9JLhnI5zMzWmyPRDX3Ql9kghX6GDF2l1uqgCTDDDASj4
         uD48VUeRDHC8aIsTfoFIuPJR0pFZsUKkvRO5RdJYMyAYujL49kGuc2XYZGo4FhFiP5xj
         syAP0jx07CglP3gvdSGXvc18DYTRTHgL18Y0jixhkW23sZEQABps1IZN7WTxFqWTDnKV
         TCndty35Vjrbpc7KCBioe6AGIgmD0zYNEWx2kPkArdcB4hsYsaWn9/SNAOqbDWdjdiiT
         ooHe//UNtvgYI3Njz4AaWSRnDtFJySdtMyBFFtUrrP4jDuVXWL0RgG7JjV3C9bRdGmTh
         C26Q==
X-Gm-Message-State: AOAM532Sah4BVL9l9sEkAFcbqQA8QsveKM/HVoA9Re3WUE4N2XMztzyG
	D+jBEsdmsxYR+y0rCRTex4aVQCKtA8rakP8AQfE=
X-Google-Smtp-Source: ABdhPJzAB6Y4QTcrOWyKGPIoK9ZBHm/kw12kZh4p7CZXZqSWEdr068734vB4YDNki1mgqxY3qmqfTATaxpTPSJugJTg=
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr7243227qvw.146.1591314495809;
 Thu, 04 Jun 2020 16:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200521161543.3273063-1-raj.khem@gmail.com> <20200521161543.3273063-8-raj.khem@gmail.com>
 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
 <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
 <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com> <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com>
In-Reply-To: <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Jun 2020 16:47:49 -0700
Message-ID: <CAMKF1sov2-BP_3a6ZOxNy86zpb5F7TjV83G6Urfk9nDwXsuWcg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 5:23 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-05-21 at 17:05 -0700, Khem Raj wrote:
> > On Thu, May 21, 2020 at 4:49 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Thu, 2020-05-21 at 19:37 +0200, Martin Jansa wrote:
> > > > On Thu, May 21, 2020 at 6:16 PM Khem Raj <raj.khem@gmail.com>
> > > > wrote:
> > > > > Now that they uses -mcpu, its better to have tune specific
> > > > > build
> > > > > directories, since aarch64 wont be appropriate any longer
> > > >
> > > > I agree with Steve that this is a bit invasive for stable branch,
> > > > but
> > > > on the other hand it's long overdue and if we don't improve it in
> > > > LTS
> > > > branch then many people will need to carry local work arounds for
> > > > multi-machine builds. +1 from me.
> > > >
> > >
> > > But this is against the LTS/Stable branch policy. What is the point
> > > of
> > > having a policy if we are going to keep making exceptions? There'd
> > > be
> > > other changes as well for which people might be carrying work-
> > > arounds.
> > > Would we be willing to make exceptions for all?
> > >
> >
> > Thanks for bringing this up. Policy exceptions are not common but
> > they
>
> That's two exceptions in a week.
>
> I am not against the change but I think the policy document should be
> modified to define how exceptions should/will be handled.
>
> > are not absent either
> > hence context is important for such changes, I am definitely
> > interested to hear
> > about how it is going to affect arm64 users at this early stage of
> > release.
>
> The release has been made and I think the branch is assumed to be
> stable from the time it was released and policy should be applied?
> There's no early release stage defined where-in such changes would be
> acceptable.

we do have QA qualification criteria for releases and LTS is no different for
meeting that requirement. so these patches if regressing should be
found out before
point release.
LTS has to be useful for new SOCs and with the least amount of
patching, I am yet
to hear technical downsides or concerns for this patchset. I have no problem
in maintaining them in the downstream distro since they are already in master it
really is fine since they will be in the next LTS and we will be fine.
I was hoping the
experience better for others and have a bit of fewer patches to maintain.

>
> Thanks,
>
> Anuj
