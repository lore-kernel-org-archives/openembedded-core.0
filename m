Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 836B16BDE3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 11:29:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p10so6997824wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ecsRgm7PbjbVu7gKjfmjCKKJ98TYv/IuTuiMCrwLEsI=;
	b=GvTHrKqvSkS4q1n3WkOkZjrFjPGGLWrwt+X2y0tEYsv/xI8e6SLI7lFVgFlwTab8d4
	HR1Mr0ttXiKyslykSLjvMOYEzs3OOgCdz82n7W/AYC2Sl9xA4+IMVlZNWh6q6wp6DiGi
	gnSL51s/XBaMpiZAJ1Km2LYB88ThqoC7PM+6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ecsRgm7PbjbVu7gKjfmjCKKJ98TYv/IuTuiMCrwLEsI=;
	b=P45BcJ2LDk1pfIi6epnM8NyVVHNDWiGOs2hbwvDqdiJ9qgjRXDyqOAF50hyX2+BmI4
	+l9yDY58PI1Fr5tFct2hibteqLMcsHYvcbA4jOHf2bKRrxPZ1K9JUPZiIFoOGmeI0OjU
	PZcneArfeNLYOtO3ThwLp5sKFqVcLYRFaxgDjoRXvgzMS5+iWp5MYP6GZpfHarv7y17E
	FftuNVbBXlb6ywza6HNgSpQnpry1Mlp58JvSDDvdpNsUpo3x6FoJEhvs8IkPxbvNvMyD
	s6mbmfdczQ7OJqeogLgo7QX9950fCvCD+tge2Qa0CW2NN8/eHRtKVV/9nVCsawYHTAkX
	5TZw==
X-Gm-Message-State: APjAAAUA5Xvc2X+CB3+n987XwEOV6bWET5AD8laJug5gYLSc8LtsJUZM
	NUGwqBSSbhjJb5ElTB/iYvVvRg==
X-Google-Smtp-Source: APXvYqxoHssV19oh7fTKegW3gRtjMmb7ymLCXw/ZOon5onI5zVr79i9xkU8d7PTR4pp0UFZOsusYOg==
X-Received: by 2002:adf:e510:: with SMTP id j16mr11772494wrm.259.1553426962486;
	Sun, 24 Mar 2019 04:29:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d9sm10592771wmb.8.2019.03.24.04.29.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 24 Mar 2019 04:29:21 -0700 (PDT)
Message-ID: <dd82a561e377d27c9b749229b2bf547ca12afe31.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Neal Gompa <ngompa13@gmail.com>
Date: Sun, 24 Mar 2019 11:29:19 +0000
In-Reply-To: <CAEg-Je8F0cVBd5=gW=Wo=fr_GmEa=gSxrmKLuyyGoJnyXHyniw@mail.gmail.com>
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
	<CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
	<155329719078.6500.854973581146180677@takondra-t460s>
	<8db32a05a6f93737792b95ce73b70b335ab06e8e.camel@linuxfoundation.org>
	<CAEg-Je8F0cVBd5=gW=Wo=fr_GmEa=gSxrmKLuyyGoJnyXHyniw@mail.gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
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
X-List-Received-Date: Sun, 24 Mar 2019 11:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-03-24 at 01:41 -0400, Neal Gompa wrote:
> Has anyone considered the (perhaps radical?) idea that the sending
> changes as an email patch series should be replaced? For example, if
> git.openembedded.org and git.yoctoproject.org were overlaid with
> Pagure[0] frontends (it uses Gitolite internally, so you can have
> multiple frontends in place for the same Git repos), it would be easy
> enough to support pull requests, even from external Git servers. And
> with that model, OE/Yocto can use CI properly (e.g. using Jenkins,
> Zuul, or something else) rather than building more hacks on top of
> emails.

Using alternatives does get discussed periodically.

It depends which problem(s) we're trying to solve really. I don't
believe that pagure/github/gitlab/etc would solve a CI problem since
our real CI challenge is we can't run our test matrix in a time frame
which allows testing of every patch.

If you mean patchtest/patchwork testing, that is a small subset of CI
and has to be carefully designed as its effectively remote code
injection. I appreciate the likes of travis also have ways of
mitigating potential issues there, there are a lot of ways it could be
done, patchtest was the way some people had time to make it work.

I'd note that pagure also has an issue tracking system so it isn't just
a front end to gitolite, its also looking to replace bugzilla.

I actually think our main issue is people with time to help work on
things. If you're saying that switching to pagure will mean we then
have number of new developers with time to help us on the project then
we should seriously consider it. I'm not convinced that is the main
barrier there to that, or that would be the outcome. I do agree it may
be a barrier to occasional submitters unfortunately though.

Also, keep in mind these pull models work well for cases where you have
a small number of reviewers. The mailing list model works better where
you have a wider team looking at review. I suspect if we switched to
something which didn't have a mail interface, we'd probably lose much
of the review we currently get and mean that we'd rely on a small
number of peope for all the review.

Obviously this is all my personal opinion and I'm very mindful of that,
I don't want to be seen to be shutting down ideas and impacting
innovation. We do also need to be mindful of what we have where it is
working too though.

Cheers,

Richard


