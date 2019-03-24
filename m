Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B89B7D010
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 22:53:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k8so6136362lja.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 15:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hdVNtBtkdftdO4lEFutfHCFi49FatG+HhHFBiz61yDk=;
	b=kq1i1fFLE/baINeVqI1ymFZ7t6XoChwoAEqVamsjZ3FmUXK8O2/0XxYJK8Lnot6MLP
	OKTezsEaZ3IzSd9HaQe4mCgMjkgtnrOtfkb8Q6IW7ngqCsU4Rf7lewbVuy0UTX+l6zaV
	Trj5lOx5agh0n5hfOJf0f3PdBYyO2lTMuNV1WdW1sztOtVHq24vM6cqQSVmz1qVmVzy/
	Xt8XBg5SaCBx+IMsRG6V+VwAfFpBuDlhYcc10D0Oj76Z6Oqs5TKHGru5qkl5jVAVcZii
	jpX27FFROrIgzmvemjT3pUonVwuyi2/xpH/GdxAI2pkdy04Ai+/COh87fxE+5Kkj+aa9
	R9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hdVNtBtkdftdO4lEFutfHCFi49FatG+HhHFBiz61yDk=;
	b=kcXjRlf0jE9jmAL89tHGxsisB7XQ3YplD5VSJ1bAsPezKtAPJhc1Q5GjgjEkE7Uxmu
	G9KCkHs12wshrNB6BViZKiomdyOSH9xG5n0zGYlmnJ+KpU/9gZrU2UXCS+4M7SB3T2Ei
	EepqRCkZeluvoSZE07ZrEr6CV6kIaYUcP7Zn4czMH2CQUu8sYtkVYLLCEoxBtvxynFQI
	uCSGVLE6dd9yKHmwAkT/YL2w0YobxaSIbZpAFtu8R4nrfz/YUsRSeWSxwxDPq7XS2iVN
	iPap46xB6ZKUXJ/ycoeNzv5pdVF3itM25rgfedQFsbZAdOce+yd1M7HrxffIaeftsPvg
	OwOA==
X-Gm-Message-State: APjAAAW6zvNBgOeRPxNTduKEiTSPJIkbcw2jyEndar/EB4s+EJNFGnh4
	pEgV0vxEAO9fdZ95HaaXhoze5dxFhP0+HEgEcc0=
X-Google-Smtp-Source: APXvYqx6IwzGwFjkgQPFCJbob3YhC3jCMxr8S3mTN+Nwv/DKCCV3W3q8QI9xzm8iplTUsLgl9MjhI9ohz0kA819V65M=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr11635123ljj.84.1553467995489; 
	Sun, 24 Mar 2019 15:53:15 -0700 (PDT)
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
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 24 Mar 2019 18:53:04 -0400
Message-ID: <CADkTA4M5vU8sDW8W_mJ5U9zBA8Tj9xuwy4X=AC7Pfeh=4-+Zfg@mail.gmail.com>
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
X-List-Received-Date: Sun, 24 Mar 2019 22:53:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 24, 2019 at 7:29 AM <richard.purdie@linuxfoundation.org> wrote:
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
> Also, keep in mind these pull models work well for cases where you have
> a small number of reviewers. The mailing list model works better where
> you have a wider team looking at review. I suspect if we switched to
> something which didn't have a mail interface, we'd probably lose much
> of the review we currently get and mean that we'd rely on a small
> number of peope for all the review.

This is my main concern as well. Really, the patch quantity in the oe
lists isn't much compared to most of the projects that I monitor, so the
patches being sent isn't much of an issue.

Once things go to the background/backend of pull requests, without
a patch set being sent as well, a lot of eyes on changes tend to be
lost. But of course mixes of the various approaches can make sense,
it isn't like many of us don't push to our contrib branch, send the pull
request and broadcast the patches .. hence both are already in play.

Cheers,

Bruce

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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

