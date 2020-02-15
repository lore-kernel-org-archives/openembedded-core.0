Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93AB9611B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:21:42 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l16so3604870qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VQ/2oNNqS1h14s3tzaqSyf/BOM4Cb4N+f5SeYqxph30=;
	b=KwBr8yiVh4UuR3ge5+Rz88rRvqaO2p4FJnj3nRh05fngZcXCHh4kUj7GRfHneEw13v
	VeCHicqmjrb6uVoxBSBqtBYrYXv63+aXzDHVsx9TyTuNCwfnAiR/O1/YoJKDnO8N7qSf
	rBo2Bm1Duel2KZvv1+fhJLG8O+xklL4YEdYrd1FhaOeXf1PQJjpA+WQ1xPmhCkisV2VI
	AG8RAHhmzdeE9NoFyDY8IpXF0asp0yX8wxELdygSiETK6UQZFKsNlylYArialmQMs/64
	WfEVef20694M9XycvcJJQgucHm87CjGsWI9hG2876l4s5SuoCUF0ScL0F8sTOc/d/bA0
	bCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VQ/2oNNqS1h14s3tzaqSyf/BOM4Cb4N+f5SeYqxph30=;
	b=FacNn2a94OOc1bOiewUvgbBygTXQ8zdDlTLI+KF1YFRAKAMac1qCLg+r0Vau48RFYc
	WZ/s+wf7+pDxGCmfL1+DfO+h0uyjuXXZNh2HGl/0X3XM5YdAhYvOBiWQS3OHih4QTaIn
	+/byAsM3rtFXAD8X9iaIsDZXlsiQW0YZXqYrlHu3DzOpuWbp2B8KZNun/h7EcYBGeomL
	UdtHz3B632YQIoqAi30tRG27LY9KTFNefVPj0Qxbjq6gtBxAIXRMao+TSQw/OmNXztIm
	01DvK4QhMsCp6AMvBGyALZyesMk9ZMdy8/lZVralJu9luPfUncaeMtzDLzezUo0Q3L21
	q5Wg==
X-Gm-Message-State: APjAAAX9ODRSe7v4BT+v20TYpCM8zvE59N0/K1sYTee1Yh8ENOKZJ93o
	y5LXSZgOsfQgfigGs2D1sM+RzvHGvS884B6KTpw=
X-Google-Smtp-Source: APXvYqzso0jg78xQGcj+WjolgHTHbRa6wuVtKNJSZwM2RdqzUR4aMFt/EY/xWG6mLDPtzKbf7UWhEz4NEjcjmCaYxEY=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr4831332qtn.378.1581729703386; 
	Fri, 14 Feb 2020 17:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20200214154240.2222810-1-raj.khem@gmail.com>
	<CAJ86T=UzY5e5YvSBUATDYk+5WV-_xFdeqdQrWO8c3W1bFxUG_A@mail.gmail.com>
In-Reply-To: <CAJ86T=UzY5e5YvSBUATDYk+5WV-_xFdeqdQrWO8c3W1bFxUG_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 17:21:16 -0800
Message-ID: <CAMKF1sqp_iZRPiaZu5teRswsk2qwrJZoMQvpFvcMeTHptt0YtA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] musl: Update to latest tip
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
X-List-Received-Date: Sat, 15 Feb 2020 01:21:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 5:02 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 14, 2020 at 7:42 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Detailed changelog is here [1]
> >
> > [1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6
>
> Up to now, musl version updates have basically always just made things
> better and there's never been a good reason not to switch to a new
> musl release (in my own forks of oe-core I've updated both OE 2.7 and
> OE 3.0 to the musl 1.1.24 release, etc).
>
> However, after 1.1.24, musl switches 32bit targets to a 64bit time_t
> (in preparation for 2038) and from my initial testing that seems to be
> a change which is going to cause a lot of problems (both build time
> and run time) for proprietary components and BSPs etc which are only
> ever used on a 32bit target. Anything open source is likely to have
> been well tested on a 64bit target and so any assumptions about the
> size of time_t will have been fixed long ago, but even then there's a
> chance of problems (see recent fixes in oe-core for build time issues
> in strace, systemd, busybox, etc. I guess that run time issues are
> likely to emerge too as the latest musl snapshot gets more testing on
> 32bit targets).
>
> Updating musl beyond 1.1.24 in oe-core probably needs some careful
> consideration, especially just before OE 3.1 LTS.
>

yes I am well aware of 64bit time_t changes, 1.25 should release well before
3.1 cut-off, musl maintainers are aware of it
and we have been fixing buggy apps which have assumptions about
the length of time_t, we would like to ship with 1.25 for 3.1
so please report isssues if you find and we can work along with them

> (Note that the version of musl in oe-core master is already beyond
> 1.1.24, so these comments don't apply specifically to this commit).
>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index f4853b4f2e..b6ec6fe9af 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
> > +SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
> >
> >  BASEVER = "1.1.24"
> >
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

