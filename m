Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD127E616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 21:31:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v29so1103994ljv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8b556vZ6Egpx3tC+GW+5q1sOsAxTPMyl1VPOFUaU3Pk=;
	b=FMmt0uAsQcfo65UBdUN20jfxdiOFjtygXuqBuWHxF/b0R1wzAJe8ac8yXnqfb74I5h
	A3Fc6RVpQYMTKhVy5omAggEqA45rqdLoDIHCE+WVZ+F7kH6J+lD5/+Jbso5nyav9Jkof
	X61byIInEFCgKdkipQIuR0K8+Rf4P1XXls9VC8CBaOd4pf0ZiV0eNPWkT1kqtYgSzmxx
	JNdYoYJtrKCMrTmytj1oINbeztXHRUO2KmnxqH/cGl2G98QyUz2U0+MqUsmwCczRM6qi
	8QZ4EMv9JCOjVmErafrXvQEg9OXNVUTo/HAAN7+PVdzXz0eaO6d8l8pnbHAr0wpqzTTE
	GEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8b556vZ6Egpx3tC+GW+5q1sOsAxTPMyl1VPOFUaU3Pk=;
	b=ge7GA/doknQjF1juPjsVK3kpSkeN4kUCWbas4oufYXwAOOTROnwC0G9/SynUrrRJeB
	9h+p01fvZ+x9GClsdT+mndY1TMf+iunQUDRyBf66ROZXVD/IkrHDchb/GKyRuvCivAax
	jlI/IuplA2HfSeHv09p/M7BRV15zMrm7eSvptvpWD0glEKSH0r4tml+bV/91i+0jqjLL
	GLe8kNxiYc8FfLQEO3SAFf8wEuVU4rpP/EJb+Emi7EYWdpXfZ9w7KmRfvqnhYMhkU0r3
	Kvqngb1eHNfpwqp4OsKHVj3Hy4YCbkAOal9qZyg6GT9XiUOt5JrYQ/L3/Yui8QTbW2WH
	Mn8A==
X-Gm-Message-State: APjAAAVOSYPtu/opyETssKGK9+PD0we1C07JN4z0KlbZu81zCwzpxaqG
	ETFjq7dXlKxbW7JlIHk6Y26eyZcem8ckscVVbEk=
X-Google-Smtp-Source: APXvYqy5iMQc/asQPgdj01G83NV1smJuRkwKtRdSAi6z/1TyS954T8VATsytVjWCy3wQfYKYhNNXpD2mgOZuu2DHsOY=
X-Received: by 2002:a2e:5b52:: with SMTP id p79mr7188141ljb.208.1559338275601; 
	Fri, 31 May 2019 14:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
	<CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
	<dc3b129e2bf00200521f1a86d1384a1087fa4664.camel@linuxfoundation.org>
	<CADkTA4NU6SZTcr3FSCiwEozWFjde9PZYW=d5ivpowFE_Q6qA=Q@mail.gmail.com>
	<037a7bb7f19f73dae1c51b663ad4471100e37b4a.camel@linuxfoundation.org>
In-Reply-To: <037a7bb7f19f73dae1c51b663ad4471100e37b4a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2019 17:31:03 -0400
Message-ID: <CADkTA4NrX-rQpjMZ8dFesddizuqyV+e2R3-MnVrPZGrYa6VdUQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 May 2019 21:31:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 1:07 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-05-31 at 09:46 -0400, Bruce Ashfield wrote:
> > On Fri, May 31, 2019 at 9:22 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > On Fri, 2019-05-31 at 08:53 -0400, Bruce Ashfield wrote:
> > > > On Fri, May 31, 2019 at 4:01 AM <
> > > > richard.purdie@linuxfoundation.org>
> > > > wrote:
> > > > > This fails in testing with one failure on qemuarm:
> > > > >
> > > >
> > > > bugger, I didn't expect that!
> > > >
> > > > I'll dig up how I mocked up a systemtap test environment before
> > > > (it
> > > > will be next week before I get to it though (unless I'm lucky),
> > > > since
> > > > my cycles today are spoken for)
> > >
> > > FWIW this is some change after 5.0.13 that is triggering the issue.
> > > I
> > > can likely merge the patches to that point (tests are still
> > > completing).
> >
> > Yah. I spawned a core-image-kernel-dev build and will setup a quick
> > bisect environment to track it down. I'll also test against my 5.2-rc
> > kernel, to have a look for a fix, or do a fix there as well.
>
> Just for fun I checked the 5.0.17 update and that does fail so its
> somewhere between .13 and .17 afaict.

I've isolated the issue. Should just be a config tweak, but I have to
get a test pulled together first.

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

