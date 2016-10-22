Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAF960123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 11:51:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161022115143859_0684;
	Sat, 22 Oct 2016 11:51:43 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=35712 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxupt-0006k5-DM; Sat, 22 Oct 2016 07:51:37 -0400
Date: Sat, 22 Oct 2016 07:50:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ulf Magnusson <ulfalizer@gmail.com>
In-Reply-To: <CAFkk2KTbuq=gTjcWGxOa3FJ-yaQiK6gdAALxxGFhAPNTAL-edQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610220749240.7751@localhost.localdomain>
References: <alpine.LFD.2.20.1610220333510.8533@localhost.localdomain>
	<CAFkk2KTbuq=gTjcWGxOa3FJ-yaQiK6gdAALxxGFhAPNTAL-edQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in what recipe context can "bb" show me TOOLCHAIN_HOST_TASK?
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
X-List-Received-Date: Sat, 22 Oct 2016 11:51:45 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Oct 2016, Ulf Magnusson wrote:

> Hello,
>
> On Sat, Oct 22, 2016 at 9:39 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   a question about chris larson's nifty "bb" utility ... i recently
> > figured out that, to get rpm-build into the SDK, i needed to add:
> >
> > TOOLCHAIN_HOST_TASK += "nativesdk-rpm-build"
> >
> > to my local.conf. now i'd like to use "bb" to display the full
> > value of that variable, but i'm not sure what recipe context to use to
> > do that. as in:
> >
> > $ bb show -r core-image-minimal TOOLCHAIN_HOST_TASK
> > Parsing recipes..done.
> > TOOLCHAIN_HOST_TASK=" nativesdk-rpm-build"
> > $
> >
> > that just shows me what i appended. in what environment or recipe
> > context could i run that command to get the full value of the variable
> > when the SDK is being built?
> >
> > rday
> >
> > p.s. same question if i was using "bitbake -e".
>
> You're seeing the final value of TOOLCHAIN_HOST_TASK (before any
> changes to it within a single task anyway). To extend the default
> value instead of replacing it, you would need to do the following
> (note the space after the "):
>
>   TOOLCHAIN_HOST_TASK_append = " nativesdk-rpm-build"
>
> Below is an explanation of why this works:

  actually, i just noticed that a few minutes ago. i'm well aware of
the difference in processing between += and _append, it just didn't
occur to me to see if there was a difference at the time. duh.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


