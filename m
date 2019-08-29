Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id A676A7F2F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:08:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l1so1299901lji.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ndIH12B53nk0uKuYFl3o5mb4q6hwR5C+Td1/vMJi6h8=;
	b=o0tAkXEvO6R0e8ycO1vw/00/oTWC+cs68KPpcd2eGZQj2G1tvp843PT38qzS2a8awa
	q+Tg2QMdtNmVzBE7DuYfFJsxUtngV5vULk7S1q47RerSiKrJLT5ozxY2vI1Jld9KoIxG
	adX87LhCR7Mk1WXObTZooaxklUKUf3d9lt4kXcqCkP3oP81z+HxPApY/ugGKY5Lx6kxf
	a1jCvtgd1D6Cu4iIe+KhKs6rSbc+fHSI1A3FO6Ag4TE2+8xm0RxYhNWnAqHUQlJWO+Bm
	kd0pA0jzM/FMPpWqO+BthNSuOwg4uLxh396DxBdTu2EMElJC5vBSkv02Ko5xCH+t503p
	eCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ndIH12B53nk0uKuYFl3o5mb4q6hwR5C+Td1/vMJi6h8=;
	b=DQvsQWg4yQe8ECYZ9faVxwwizdbt1FcDGdxO0n2+FTb2D5tfiW9tAP3RBjTRStbJx1
	Qc0Ye9fq0NaTsLsyXEPcqh7N4AmzXU+9WWc7Sqo1SKD403rUN/4+r4j0g2ERRwWVzqMg
	Fwc+23yEX958TPXw6HipEXS9IOMJarz7eq7ZACtIcx90xXTnk0p5Oz9Rj89eOB06BjaM
	HtVUY9SDFf2SUTm65Oq6GZbXvFeqvsBWMFQsm0y/SSNHv6qP7jZxK1NdiVML5UqqzzUg
	fPdDvy6y7JNGXs1g6LvxnV1UP5rA+c343s+yLiH/JIe0w1gZ30LK/QoEGnHdgKehUYhy
	5HFw==
X-Gm-Message-State: APjAAAVHjK7cXIcSY6gNAd1OeiOX2EwK2zxmVcEU03oeLATspncsPZXB
	3ha8zC8oP1gHbG6jjhkSqfMEyCVoCLtYkMf90AM=
X-Google-Smtp-Source: APXvYqz48qZbGhDv5b/IwmY6ueJVhzL3W4i+svCEJ6ncS1YeOrDhYDS5vHS6BdAbLgzRzB2MrASlhJAiM8IvxPwBBeo=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr3491306ljg.232.1567040927838; 
	Wed, 28 Aug 2019 18:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
	<8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
	<CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
	<390a239da98f0f9013f9d32726354958620baf68.camel@intel.com>
	<CADkTA4Mg-wtkuyik8yEm=jMDO+VPq934oOocUnLN1sgo_vapAg@mail.gmail.com>
	<CADkTA4OgaPUwvN4h=+095DDgn6gUgFjwGH2kipC+Uh+DbVSDdQ@mail.gmail.com>
In-Reply-To: <CADkTA4OgaPUwvN4h=+095DDgn6gUgFjwGH2kipC+Uh+DbVSDdQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 21:08:36 -0400
Message-ID: <CADkTA4M0rRD6XFhoe0V5bwraAAS6zbMB2L34ZBQTKMACUCe7ew@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 01:08:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 8:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 8:24 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 8:18 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> > >
> > > On Wed, 2019-08-28 at 20:13 -0400, Bruce Ashfield wrote:
> > > > > On Wed, Aug 28, 2019 at 8:01 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > > wrote:
> > > > This is causing failure for 5.0 kernels probably because the attr.py
> > > > > python -> python3 changes are not there ...
> > > > >
> > > > > ERROR: perf-1.0-r9 do_package_qa: QA Issue: /usr/libexec/perf-
> > > > > core/tests/attr.py contained in package perf-tests requires
> > > > > /usr/bin/python, but no providers found in RDEPENDS_perf-tests?
> > > > > [file-
> > > > > rdeps]
> > > > > ERROR: perf-1.0-r9 do_package_qa: QA run found fatal errors. Please
> > > > > consider fixing them.
> > > > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> > > > > worker/genericx86/build/build/tmp/work/genericx86-poky-
> > > > > linux/perf/1.0-
> > > > > r9/temp/log.do_package_qa.36284
> > > > > NOTE: recipe perf-1.0-r9: task do_package_qa: Failed
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/975/steps/8/logs/step1b
> > > > ote:
> > > unfortunately, I can only cover the active kernels in master with any
> > > certainty, and I already have a patch to drop 5.0, so I didn't
> > > > trigger
> > > this.
> > > I can spin a patch for 5.0 and make sure it is version proofed a ibt,
> > > but if anyone else has issues with <insert version here>, they'll
> > > > need
> > > > >
> > > > unfortunately, I can only cover the active kernels in master with any
> > >
> > > Can we cover at least the kernels in OE-Core master right now affected
> > > by this change? So 4.19 as well ...
> >
> > Consider 5.0 to be not there. It is going to be deleted in about a
> > day. My hands are very full, so I'm not able to spend much time on it
> > at the moment.
> >
> > 4.19 did work in my earlier testing, but I will have a look ASAP
> > (probably next week, since my cycles are largely spoken for at the
> > moment).
>
> .. but I will visually check 4.19 for any other scripts that reference
> just 'python' visually and make sure my tests are broad enough. It is
> more builder and boot cycles that I don't have easily accessible. It
> shouldn't be too hard to make the fixes generic and broad enough to
> cover it.

I retract that statement. I was able to jiggle things and testing on
4.19 is no big deal. I'll send a v2 that covers 4.19/5.0/5.2/5.3-rc
testing shortly.

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > Thanks,
> > >
> > > Anuj
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

