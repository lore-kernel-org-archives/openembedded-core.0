Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id E048C7EBBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 16:43:04 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v24so6705454ljg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ce/YLIr+VP9es0XnZ6DAtFBxMVbPByLzyOfGfwiPJp4=;
	b=DSEhZ8fnlD+KzdM1+2F6iL4Lq/G8DSZc6u0UPsXbKfR0Y74SPs9UQAaDdCSxi3yKnk
	nfJPDJHZp9h9+L7f6S7N/fxgjfr3bMYAt5iNNuIbs4nlA4/6K3silyu6XClYMaU2xv2n
	eRJKvjL42TNRK7JBI5RI6kV4rW7NL4ZvpK9PYErMnzUw9MBUPCl/qNKhwD/Pm7XQzkbQ
	mYhMX+pUJwK73+wBeQxLl+iCZdSma1L0U/9ied5eIvvfmTl3qrRlhhIYvGrMFGDkVcva
	TqfVAmsqhIdg2h+0z96uoccOpFcsENplGazeQScubKxp4efT3h73ApjX3UsDq2bt09Be
	pObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ce/YLIr+VP9es0XnZ6DAtFBxMVbPByLzyOfGfwiPJp4=;
	b=oCe28F9RAUFTD+QoWqcbCj3j3RNuVcBBoKjjIZwaHvemswFOQpzYEounslq6LHH2qW
	iyVtytyKfbGhUsJyNRMUBgDcAIErdasH2uzJ9X5hwF1N+Ps9+5cxViVTl66OXedSzS6K
	8njdnajiJpYzIi/hzE3yAJSbnNrZ+PhGhXwv/AvawsRsFr4A/yhyudo6nOIsft4KX1Jn
	AqZKlupqQnGFNqTEV43Ea8sxZpZmdqIfN7GRfQ0OonqGFtfSf3K/koO2bEYNstFREBWL
	iNspK4gawYS0hZJB36XtDrrm64czq44g1LevFvIIOJhyl0Fd3570r7RNSRkjdwurmSdL
	tI2w==
X-Gm-Message-State: APjAAAVmXI5+euhH9AKH7BwnlxxKv4y/geugDu0G+OttGrsqCKCXe9En
	aFDfsndOhM/6FLtDaneYentwTr+ymDhh15Vs844=
X-Google-Smtp-Source: APXvYqwgxjj7YozNTOWx8Ge5OIypHglg9bJ5ZMXKJx4DEmDOwGLza741XngGiJmuMp7WztRSwKJmrriyWyYm2qQLJ0M=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr240000ljh.79.1562258585384;
	Thu, 04 Jul 2019 09:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
	<7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
	<CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
	<64ce05dd1d970dc5b0390d57b4c9b75c44f405f4.camel@linuxfoundation.org>
In-Reply-To: <64ce05dd1d970dc5b0390d57b4c9b75c44f405f4.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jul 2019 12:42:53 -0400
Message-ID: <CADkTA4PbeVuGHVc2oofZeavPvMsQ7DPT4dWm0RRKK2U-8OfxWg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Thu, 04 Jul 2019 16:43:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 4, 2019 at 12:36 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-07-04 at 12:29 -0400, Bruce Ashfield wrote:
> > On Thu, Jul 4, 2019 at 11:18 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2019-07-04 at 08:48 -0400, Bruce Ashfield wrote:
> > > > On Thu, Jul 4, 2019 at 7:02 AM Zhaolong Zhang <
> > > > zhangzl2013@126.com>
> > > > wrote:
> > > > > Currently, Yocto can not realize the modification of the
> > > > > cfg/scc
> > > > > files indirectly
> > > > > introduced by scc files in custom layers.
> > > > >
> > > > > Instead of introducing complicated scc parser code, this patch
> > > > > walks though
> > > > > FILESEXTRAPATHS and takes all the cfg/scc files into account
> > > > > when
> > > > > calculating
> > > > > checksums.
> > > >
> > > > There used to be a bugzilla around for this .. but I can't find
> > > > it
> > > > now.
> > > >
> > > > While the approach isn't wrong, I think it is too heavy, since it
> > > > is
> > > > looking at *all* the .scc and .cfg files that can be located in
> > > > the
> > > > search paths, not just the ones that are actually used.
> > >
> > > That isn't quite right. With the checksums its important to know if
> > > a
> > > new file appears at location X, we should reparse as it could
> > > change
> > > the outcome.
> > >
> > > We therefore have to account for files which doesn't exist as much
> > > as
> > > the ones that do.
> >
> > Maybe I'm misunderstanding what you are saying here, but these are
> > just sitting around (like unused patch files). They are not on the
> > SRC_URI and they are not necessarily used at all. Just because
> > someone
> > drops a new file in those locations, we should not be re-running the
> > meta data task.
> >
> > What that routine is currently doing is just wrong.
>
> Agreed, it is.
>
> I'm just saying that this situation isn't as simple as files exist, we
> also need to look at which files don't exist, but that would influence
> the build if they did.

Aha.

>
> The patch doesn't do that either!
>
>
> > > This doesn't work since we need to be able to predict the task hash
> > > checksum at parse time. We don't have the kern-tools available then
> > > to
> > > be able to know which ones it would actually use...
> >
> > So there's only python code allowed in those hash routines ? If so,
> > what is there is still wrong, and needs to be reworked.
>
> It has to be able to work on the information available to it at parse
> time. In reality that does mean python code. There are performance
> implications to anything too complex.

Understood.

I'll think on this for a bit. This has been something that I looked
into several times, and didn't come up with anything I really liked.
Maybe now is the time to solve the issue :)

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

