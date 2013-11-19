Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7084960D74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:48:58 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id n7so6792416lam.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 14:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0Nxiv2o7ZPR/BflgGL+CyHjq8pF5HjfC1iXVfNDOOMc=;
	b=FY5IkghIKnNYCiN2dpS0JwNHenDJH9sCuhS/hZZl4bJnyDqMsPmVssrEfertjYeV0v
	mtEZHOgJfXFz6Ir723Prn8tWBlMExZ7yJARW2mJ13OBZiD9vEDMj/IDQQBFn9QfljI+C
	YqC/iKSWGx1stjG4pGe4PLTG2gF39LiVxG0SxwV1J4+A9j5BMvpdVqgmzkkpHKpc5ehz
	mvtWkaG6MPgPTZOPR97PKE96rc1OA8f4llGNJU4BQwbRnCOrbuHWAsJGmy+bOv9VsxQI
	fbNnMnAfER3ckTqHU6FPDeplfPOGgxXLseB7S3dvQW+9XaumI1Y0lLPu9PhBcUbsT6Sk
	Mgnw==
MIME-Version: 1.0
X-Received: by 10.112.72.233 with SMTP id g9mr19859056lbv.2.1384901339670;
	Tue, 19 Nov 2013 14:48:59 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 14:48:59 -0800 (PST)
In-Reply-To: <1384904664.4213.4.camel@x121e.pbcl.net>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<CADkTA4ODwRaRMVehxmjjoA=iozbH2LhBKqiHyNLwvB_9n_D_mg@mail.gmail.com>
	<1384904664.4213.4.camel@x121e.pbcl.net>
Date: Tue, 19 Nov 2013 17:48:59 -0500
Message-ID: <CADkTA4NKP_w_WmWycZwfg6_dYnL7bbOCwT-29J97kqqELKXF0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 22:48:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 6:44 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-11-19 at 17:37 -0500, Bruce Ashfield wrote:
>> Alternatively, recipes need to be fixed to call the
>> modules-base.bbclass routine to restore
>> scripts, and I think it is obvious that won't work in all cases.
>
> Admittedly I'm no expert, but this is not obvious to me.  Why can't
> those recipes just be fixed to do the right thing?

Alas, people with legacy build environments that they've wrapped and ported
to bitbake .. they either can't or won't change, so I'm stuck at least trying
to detect them.

That wasn't the primary driver for this though, if that case breaks, they'll
live and so will i :)

I think we are converging to removing the sstate scripts restore, which is
fine with me a this point, as long as Khem isn't broken.

Bruce

>
> p.
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

