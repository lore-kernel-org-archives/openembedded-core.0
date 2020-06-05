Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.596.1591315529686522963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 17:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CAbmhlXE;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id u17so6974295qtq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 17:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZV621zqL605Pe9wbIOWw/qUEQxYHeq0U1KydPVMkX9c=;
        b=CAbmhlXEOQEkSPFBnzAbWCQ3t9N4ERS+djOAgLX1QAgwmm0PTKYyCACRV5K9UL424j
         NB5CgV92LTZ1EJlftZlmGDigOjvEk6c9gj5/yP3GTjDODyHJvTUlfVKY6Ys+wQbuAoGn
         e2EGZwnJ2no6BpOPQtTEsNibKfikeYxxqzM8cmYpNW+CJDcYMicZg5d+kWwRwPx9l6r3
         s5oJLt+DYkRa2kTESLvfojVWTdP4rk7WHRorwGsFdgrBgvDZe4x9/R4rugbM/EizDm1j
         /1dRA1VCbbXOQLz9Nl/ctQq/4SVISpvrysN7tKVTusLFEx58zFRj7fmlZcvcN78BFAug
         24yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZV621zqL605Pe9wbIOWw/qUEQxYHeq0U1KydPVMkX9c=;
        b=kBI2t/hWCNJV3wRXdanS+iXp1gJhbexgegpFLU2tfuMJ4h9rcKhzmHLzZmohYhTkxl
         CYkupRbdkdsgl3Ribd8WxyNhT2NU4KgZIPmiLGbHq97wI27fz1zMv9mn4lHiLaA6xRp7
         GRXhVd9kf0Ya3iLhPc2tY8r3HutOQY+ctVoNnzPR1SUQEikYUo8QloU810JlVZlVyd+K
         H4OrTNVQpaQaCK2WmA3bX5E5VPUw7Qrjd3D3y2WEAilNNxmgcxXB1TYQmFp6VaxxSetm
         B51BMrzgp69GQB3Ly79glhrbgRsJ++TVZPjNFYdJaf/TcdkTEi9pJTziZCL9pWaM/msO
         4wJA==
X-Gm-Message-State: AOAM532Y/nRQENPh4wJ5Wokt53OhayoqCntmVpVJh6sUNJaxv+/F4hDm
	fvCNC822lTo1gd5d98we3U3ZEV4l/0DrJE9RYaU=
X-Google-Smtp-Source: ABdhPJwo34F2fwZahX7T3pzh2NAQKSDffCuugp2W1A1kmUyoIU9KzSo22g4GUABUz8VPJuwf4CvD0yK0EpLFFOACPSg=
X-Received: by 2002:aed:3f55:: with SMTP id q21mr7368475qtf.190.1591315528630;
 Thu, 04 Jun 2020 17:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200521161543.3273063-1-raj.khem@gmail.com> <20200521161543.3273063-8-raj.khem@gmail.com>
 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
 <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
 <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com>
 <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com> <d2545e9653c46da43381d255fb874950022c45dc.camel@linuxfoundation.org>
In-Reply-To: <d2545e9653c46da43381d255fb874950022c45dc.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Jun 2020 17:04:53 -0700
Message-ID: <CAMKF1sopJ3fq6c9L9sKR0+Wt704Z-nFkj7WEhcpsc=aWQ1QMrg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 4, 2020 at 1:30 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-05-22 at 00:23 +0000, Mittal, Anuj wrote:
> > On Thu, 2020-05-21 at 17:05 -0700, Khem Raj wrote:
> > > On Thu, May 21, 2020 at 4:49 PM Mittal, Anuj <anuj.mittal@intel.com
> > > >
> > > wrote:
> > > > On Thu, 2020-05-21 at 19:37 +0200, Martin Jansa wrote:
> > > > > On Thu, May 21, 2020 at 6:16 PM Khem Raj <raj.khem@gmail.com>
> > > > > wrote:
> > > > > > Now that they uses -mcpu, its better to have tune specific
> > > > > > build
> > > > > > directories, since aarch64 wont be appropriate any longer
> > > > >
> > > > > I agree with Steve that this is a bit invasive for stable
> > > > > branch,
> > > > > but
> > > > > on the other hand it's long overdue and if we don't improve it
> > > > > in
> > > > > LTS
> > > > > branch then many people will need to carry local work arounds
> > > > > for
> > > > > multi-machine builds. +1 from me.
> > > > >
> > > >
> > > > But this is against the LTS/Stable branch policy. What is the
> > > > point
> > > > of
> > > > having a policy if we are going to keep making exceptions?
> > > > There'd
> > > > be
> > > > other changes as well for which people might be carrying work-
> > > > arounds.
> > > > Would we be willing to make exceptions for all?
> > > >
> > >
> > > Thanks for bringing this up. Policy exceptions are not common but
> > > they
> >
> > That's two exceptions in a week.
> >
> > I am not against the change but I think the policy document should be
> > modified to define how exceptions should/will be handled.
> >
> > > are not absent either
> > > hence context is important for such changes, I am definitely
> > > interested to hear
> > > about how it is going to affect arm64 users at this early stage of
> > > release.
> >
> > The release has been made and I think the branch is assumed to be
> > stable from the time it was released and policy should be applied?
> > There's no early release stage defined where-in such changes would be
> > acceptable.
>
> This series doesn't have a decision on it yet. If an exception were
> made, it would be two exceptions in the lifetime of the LTS so far, not
> just a week. The fact we'd like to make a point release is focusing the
> fact we need to make some decisions rather than a sudden stream of
> policy exceptions.
>
> I'd also note its most likely we'd find issues just after release as
> people start using things, over time it becomes much less likely.
>
> If such issues are identified, particularly now as people start using
> it, the question is what we do about it. If we can fix things to
> improve things for users and the risk is either low, or managed to a
> specific subset of users who can benefit, that does seem like a
> sensible thing to do.
>
> I guess I'd hoped we could all be sensible about these things, the LTS
> policy is there as a set of 'guide rails' to make decisions against but
> as a maintainer, I know that not everything that makes sense neatly
> fits within a written set of rules. The LTS maintainer does need to
> have some ability to make decisions and I've always thought it was
> clear the TSCs are the ultimate decision makers for any technical
> decision the project faces should there not be consensus.

downstream distros will require such things for supporting their products,
in past it was done on their chosen release and they stayed with that
release with their own delta, the hope is that they will use LTS and just from
LTS to LTS in product cycles. IMO LTS will have to considerate to
this fact, if we do not want downstream distros to diverge significantly
and if we want to put hard conditions early on release then I guess
users will have to devise their own plans regardless of LTS.
e.g. See the delta between ubuntu
LTS first point release ( 20.04 and 20.04.1 ), most users wait for first point
release to migrate to next LTS there is a reason for that.
There is quite a bit of stabilization that happens
early on in LTS life.

>
> In the case of these patches I'm not seeing anyone arguing against them
> on technical grounds or saying they don't make sense other than some
> things I've said to Steve! The complaint is that they break policy.
>
> I will discuss making a escalation and final decision path clearer with
> the YP TSC (who wrote/maintain the policy).
>
> Cheers,
>
> Richard
>
>
>
>
>
>
