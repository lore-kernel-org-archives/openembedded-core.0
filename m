Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC0BB7E33A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:47:07 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r76so9666811lja.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f7zcX3GHF6gDR3fn3ATuorik55Ai4rtncMbW4AFY9Zg=;
	b=tIaeWX8DSRMPsPhl+C1QIOnW+dGzmBKqXSJyKAVQ5Khugpls7YnFM+WO5JLKZBx4Oq
	9WODRAjmwMjfQwq2AZQulf6h1+EKmysRrxCjmWlXREQnf66VR13BN0uSt1sxDfNo/rwt
	0QrqGO93qzFfXlp5BxHPa0AfAQH0VXN9wiiD0FBcq3mz5j6tHQFhrmduR8XbllvaM5/z
	H95bsaaxPa+065FX0pwRic73fCiJluIpayLbfcg8yaWhZw1QxPamK38IyQVDFcWDL3/L
	eX2Xv/NAjp3qOq3S8FMnyNWS6jHx/bbJxG7+ykvJhSH7YGhwvwwWMj3BxRqqcLjBvLwH
	Mb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f7zcX3GHF6gDR3fn3ATuorik55Ai4rtncMbW4AFY9Zg=;
	b=onmbhIEH5bICsGCSsICabai+gWCQHs5f2RQKMPAyrRF3i/adKe9yG/uwNE+zGld+oe
	Rtaq3OqGxHNMBGZHbKAON+96peOjlsdH0HaKnKHkBvj4OEkpPG3hyGny3aHw3rvIZ2wB
	z4c7VOqCR75tdQCM9hXWg8JdK+x8byp4BrQflGzYwEPIoXM88bGt3Nv92x60lQ5A1Ghs
	0n1QSiwYpmllNmqGss08F1qOnPAGD3nUNFYbijDG6Uk5kBJwu8T6/YJ3/GLkADBuhKKx
	XSMd3j2xJC1l+ixCwwJ5VggYydXIssoaLZhV/0p9DzwC5k75oVZPmZ2Z7Gn+ORPKKtoM
	1BMA==
X-Gm-Message-State: APjAAAUJ2xt27uvUqP4pOC4yR13GDgE7TLCQZ62f6J8eJNJHStA6ZLce
	LnHkPJpi/Yv45yx/dB5VnOVHzPGU7083j2g+5Zo=
X-Google-Smtp-Source: APXvYqyXw7dA1DABEzYPGtRkcRdmBhNEYIFDMrecoCXu2f7n6RM99KBoMql6Lw3Ep+2XeBUkMZFVPQ+DXyCVBTqYK1Q=
X-Received: by 2002:a2e:868f:: with SMTP id l15mr1083426lji.118.1559310427940; 
	Fri, 31 May 2019 06:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
	<CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
	<dc3b129e2bf00200521f1a86d1384a1087fa4664.camel@linuxfoundation.org>
In-Reply-To: <dc3b129e2bf00200521f1a86d1384a1087fa4664.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2019 09:46:56 -0400
Message-ID: <CADkTA4NU6SZTcr3FSCiwEozWFjde9PZYW=d5ivpowFE_Q6qA=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2019 13:47:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 9:22 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-05-31 at 08:53 -0400, Bruce Ashfield wrote:
> > On Fri, May 31, 2019 at 4:01 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > >
> > > This fails in testing with one failure on qemuarm:
> > >
> >
> > bugger, I didn't expect that!
> >
> > I'll dig up how I mocked up a systemtap test environment before (it
> > will be next week before I get to it though (unless I'm lucky), since
> > my cycles today are spoken for)
>
> FWIW this is some change after 5.0.13 that is triggering the issue. I
> can likely merge the patches to that point (tests are still
> completing).

Yah. I spawned a core-image-kernel-dev build and will setup a quick
bisect environment to track it down. I'll also test against my 5.2-rc
kernel, to have a look for a fix, or do a fix there as well.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

