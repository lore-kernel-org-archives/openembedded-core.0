Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 272B57EBC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 16:29:36 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h10so6716430ljg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zZ1fd9ibIoCcARoQ+/TWFzx6IVIMrOfOPCz6u/sS7Ow=;
	b=TqdSkTgYPv3rdrkcC4waLYadRgQhGw9XO7j6bcxqgQLl0I7AJ+cw55mIEQdzEUl/J/
	ZPXuiB0a0R7ZAJzt0sZ3xI2IaVlU8GuHzV0wEvNGDMSNxF3hsZvM9uE4mK6Ln99l1a1f
	zHqW0tlwOxTWk5/+aJhF0AUFhbUWX617PN2hLiX/U5Yb2ZM8/VlZy1WvxNAyGf+Zk+2l
	nIJ8T9MX/7DqnAiSHelMxyEAQ3HTftSEVB14OxldybFZeLyIx+X+SHhDq3hO7030cZJX
	HAQTHBa+1LcOf8AuYG0jSXlAE6KPlWFY0v0FP9EYnElL3hpFRDEsc9xA/CMMlbyR1Jcj
	rGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zZ1fd9ibIoCcARoQ+/TWFzx6IVIMrOfOPCz6u/sS7Ow=;
	b=dO+sjLonogwoXciNpl3R+8TNUj50OrbLqDVCdohgDodpaPGIV/Uz7iswKwzFtYtDcx
	OabuZ7BPw5BOrIAwh2E+REw+myHEaxleY6TNwR979bq+3zrGuzXmotkQkwW1dliWMOjR
	Rra2lY5qd7oMuGqnAtkfEDZfMrqUeJant8RNrPKklgL+TyIQ/tynDq+d3zN1qm49j8c7
	xlbxEhRphsTOTBAPBCco/uH+EUsOlE1tI5rdjGRs6+lfEvV1T120xL+/AExV/GsjNMHk
	S52SL0RODyodrpCXj1pR98vhRjy64m4FTXoxdiXpQ2KJc969AUb/FjydfxVteEKTDBdC
	vl3Q==
X-Gm-Message-State: APjAAAWqDi5So9SrTxuD6BZ/arwA9/gnkV7IzRLT38m16HvSayYB2NLs
	GuxyjGrL+pDSIQO4YUDc1xelgiVHzKQhvgt0cn4=
X-Google-Smtp-Source: APXvYqxnkhvUT+dp5iAoVqyv70qf+CWHdW3QD73EKNHgx9zvuZht92eZPEHkpSztFYx/VQKxFMA++G9EhjG+0dXA9hc=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr25049962ljj.185.1562257776585; 
	Thu, 04 Jul 2019 09:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
	<7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
In-Reply-To: <7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jul 2019 12:29:25 -0400
Message-ID: <CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Jul 2019 16:29:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 4, 2019 at 11:18 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-07-04 at 08:48 -0400, Bruce Ashfield wrote:
> > On Thu, Jul 4, 2019 at 7:02 AM Zhaolong Zhang <zhangzl2013@126.com>
> > wrote:
> > > Currently, Yocto can not realize the modification of the cfg/scc
> > > files indirectly
> > > introduced by scc files in custom layers.
> > >
> > > Instead of introducing complicated scc parser code, this patch
> > > walks though
> > > FILESEXTRAPATHS and takes all the cfg/scc files into account when
> > > calculating
> > > checksums.
> >
> > There used to be a bugzilla around for this .. but I can't find it
> > now.
> >
> > While the approach isn't wrong, I think it is too heavy, since it is
> > looking at *all* the .scc and .cfg files that can be located in the
> > search paths, not just the ones that are actually used.
>
> That isn't quite right. With the checksums its important to know if a
> new file appears at location X, we should reparse as it could change
> the outcome.
>
> We therefore have to account for files which doesn't exist as much as
> the ones that do.

Maybe I'm misunderstanding what you are saying here, but these are
just sitting around (like unused patch files). They are not on the
SRC_URI and they are not necessarily used at all. Just because someone
drops a new file in those locations, we should not be re-running the
meta data task.

What that routine is currently doing is just wrong.

>
> > I do have some old code from the existing bugzilla that I can try and
> > locate. The right approach is to have the kern-tools emit the list of
> > files, since that's where we know the includes, etc, and what is
> > actually going to be used. What you have will also conflict a bit
> > with
> > some changes that I'm making to tweak the config handling.
> >
> > Since I can't find the old bugzilla, can you open a new one, put the
> > patch there and I can find the code to dump the list of files from
> > the tools.
>
> This doesn't work since we need to be able to predict the task hash
> checksum at parse time. We don't have the kern-tools available then to
> be able to know which ones it would actually use...

So there's only python code allowed in those hash routines ? If so,
what is there is still wrong, and needs to be reworked.

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

