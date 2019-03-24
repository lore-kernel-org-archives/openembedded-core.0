Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 594397D042
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 23:37:28 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z16so8384784qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 16:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xu/0DotD7nf/xP+VeDT99DnXWO2YZJNT3CylbAKZqcU=;
	b=I5cBtsLJGVOhtPrcUMEQlTnSFrjNXRsbAoBZfnXXFDyom5F8ApZp4vZMQ8yrHMK7Yo
	oz95PVyVAl0XY+CGbv2BVy19AVhst7VXhuSOpebyAHIqAgkAl+6e2nU3OSUXLh0xBk7M
	ktXt1QyQ7hGe+9tbccOGkRDKAriSKkl/EYjoQ//4cD5u8S7c/I2OvvYgq+ULb7qwV+Nr
	D2Pv2RJ9fLUIz3MBKi4tcl+AKgo4lrgVpje5IkohfrHWyQYbPWIYB/lJtJT7sBoqNtAl
	QAgISTb+v2burRpCJdefetmhvOMgyO++BMBE9Y01kSPbXBPUb2aHXDPmql9PhjadxozQ
	Gv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xu/0DotD7nf/xP+VeDT99DnXWO2YZJNT3CylbAKZqcU=;
	b=iFfOzhG7rbACzMaGvJpe14nb0aOVToPpPdJiIcLHTNVVrgFCG7YvVY8m4oGbn2ELXw
	y7/jReUPqKsoaF7eebToP1jI8dmHQGlizIx4td3MwCPauVPUR06b2Z0AgQBwQJpYuYq6
	9Jq24sx1eNG3A5DFQjc2yv+PwLQ3RxIP42HFUxfG0XhveuKKMuMX65mB5LJcWo4Gc7hi
	1+vCBHqIfDTDgfhisMbD4NAlZ+jhsEG00fH9ZPz9J7769hO1OCkoYuo9ut3+faSO4uh3
	B54D0IY34tY7RcYiMfnDKuKxQubSFmHS9PkHS7dFMPn/jJG6eFK0SlgV84kH1vRNUXqd
	JqIw==
X-Gm-Message-State: APjAAAVJP4Zwrp2HWsCjvJXSUDpLzRe4ReLTB8931fOy2RtL71jWoMcN
	ZN7shWjbrrYiRUSHUdv7E1lZpSluMseFdQDt/+4=
X-Google-Smtp-Source: APXvYqx6dxMh4EF6kGyNuZrylFCnjgBe5gFNzKfxMtggR1dhb9pSs1JIlaYClm+guvBZsS8Zo8EQ4ttlTw3jOsWKw34=
X-Received: by 2002:a0c:ba1d:: with SMTP id w29mr18051938qvf.228.1553470648905;
	Sun, 24 Mar 2019 16:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
	<CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
	<155329719078.6500.854973581146180677@takondra-t460s>
	<8db32a05a6f93737792b95ce73b70b335ab06e8e.camel@linuxfoundation.org>
	<CAEg-Je8F0cVBd5=gW=Wo=fr_GmEa=gSxrmKLuyyGoJnyXHyniw@mail.gmail.com>
	<dd82a561e377d27c9b749229b2bf547ca12afe31.camel@linuxfoundation.org>
In-Reply-To: <dd82a561e377d27c9b749229b2bf547ca12afe31.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Mar 2019 16:37:02 -0700
Message-ID: <CAMKF1soUuwzsrwqe9qR40YZYj2zXk+XMadFWJra9Qw3HPQqK2g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Pierre-Yves Chibon <pingou@pingoured.fr>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Mar 2019 23:37:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 24, 2019 at 4:29 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-03-24 at 01:41 -0400, Neal Gompa wrote:
> > Has anyone considered the (perhaps radical?) idea that the sending
> > changes as an email patch series should be replaced? For example, if
> > git.openembedded.org and git.yoctoproject.org were overlaid with
> > Pagure[0] frontends (it uses Gitolite internally, so you can have
> > multiple frontends in place for the same Git repos), it would be easy
> > enough to support pull requests, even from external Git servers. And
> > with that model, OE/Yocto can use CI properly (e.g. using Jenkins,
> > Zuul, or something else) rather than building more hacks on top of
> > emails.
>
> Using alternatives does get discussed periodically.
>
> It depends which problem(s) we're trying to solve really. I don't
> believe that pagure/github/gitlab/etc would solve a CI problem since
> our real CI challenge is we can't run our test matrix in a time frame
> which allows testing of every patch.
>
> If you mean patchtest/patchwork testing, that is a small subset of CI
> and has to be carefully designed as its effectively remote code
> injection. I appreciate the likes of travis also have ways of
> mitigating potential issues there, there are a lot of ways it could be
> done, patchtest was the way some people had time to make it work.
>
> I'd note that pagure also has an issue tracking system so it isn't just
> a front end to gitolite, its also looking to replace bugzilla.
>
> I actually think our main issue is people with time to help work on
> things. If you're saying that switching to pagure will mean we then
> have number of new developers with time to help us on the project then
> we should seriously consider it. I'm not convinced that is the main
> barrier there to that, or that would be the outcome. I do agree it may
> be a barrier to occasional submitters unfortunately though.
>

I believe if there are no occasional submitters than eventually there are less
regular contributors. So in a way having it easy for occasional contributors
is a way for increasing chances of making more regular contributors.

several projects are thriving without using mailing lists for patches these days
some of them are full distros too.

Mailing lists were only way to share before these infrastructures existed
but aren't necessarily a better workflow than others as of today. It does have
a automation problem, where human hand is needed more than some of
these new tools, where automation is quite good in the whole workflow.

> Also, keep in mind these pull models work well for cases where you have
> a small number of reviewers. The mailing list model works better where
> you have a wider team looking at review. I suspect if we switched to
> something which didn't have a mail interface, we'd probably lose much
> of the review we currently get and mean that we'd rely on a small
> number of peope for all the review.
>
> Obviously this is all my personal opinion and I'm very mindful of that,
> I don't want to be seen to be shutting down ideas and impacting
> innovation. We do also need to be mindful of what we have where it is
> working too though.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

