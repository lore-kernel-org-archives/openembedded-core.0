Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2F97C790
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 11:58:39 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x9so10215551iog.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 03:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0bDr3raxovd4q/uKRbNwRDKzxECj0GB74L2UK/niC7E=;
	b=xmZn7eKHVHsT8PkfllFJaevjHQR236uV9FRpRO1ijnB+mzQ2+5k0miHeaHSa9DVCrf
	yZKcgfn72jZE6XjIX4VixvMHa8B+iqrwKoIfC/WHeggQA8q8lqtsIj+dFDuVwZO4ZZPl
	D2DvQ3ZaekYS1jVMr8LlZt/4Q6tqXsIeSW81NMGhd0nPUdlqJATKI+QEE7C4LKOp56Qn
	WWfksxDM0TDJvf255NNJZCkVuMNELVajoSwOXHdB6zoD0ZwHIgucrGR02gylHl2Tvw14
	y1dSkv/UANB3HZBmxONfVgr3WFRD1V4CdVErXL18nSL/d+85tASzN/hG3GxuT6+iQneq
	e1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0bDr3raxovd4q/uKRbNwRDKzxECj0GB74L2UK/niC7E=;
	b=fcNoNSpBIzN8XTm4IMDuUWt0/MWj4bVgri7dRlL12+omSRbzhs5Iv6JTeXdbtxiHdF
	izc5SeAR7g7AXvZSqIfoGcIcxqqGKfs0kiR3YJXu7hu8/Gh4+wuC4MW44mlAm+pp5LL7
	Nyps6+6qn628hXKUb1bx8vYVoTv2ALPdMravaaEnn4GIib2kIx8VEUWXBxPIIGyCBuDz
	zxO4vLxz8x3ChpBw9M8Wunufv3DAM0VDY4WI2iSLMbW/trjhHJIrESvFQO9I4jSa1xKl
	zWhMQ1rx4Jg8FbE2oOKfY2AA+PcLA0Q+W7HCMGi8Jy/OAMB+uLInj+vocWQ1wMNscMIG
	8wcg==
X-Gm-Message-State: AHQUAubk/3TffYIWwwNguu0HG4enYG5Cs+sfX+p5iiwhx2/rqw34QNCe
	x3iOg3ovhYk+1ZoO61XfnM1/YEwWjXzbne5sWRz3u55s
X-Google-Smtp-Source: AHgI3IYgrjinYgCPqUmZYgwlrrsjhPSo0kfuBf6NFLJYrYpzb/kNFmT6X3SEJmPeaCBQPNW8ELs/E0gdsgq740DkcXM=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr11124167iom.270.1551182321009;
	Tue, 26 Feb 2019 03:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2019 11:58:29 +0000
Message-ID: <CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Tue, 26 Feb 2019 11:58:40 -0000
Content-Type: text/plain; charset="UTF-8"

Patch has been accepted, so we need to cherry-pick the patch I mentioned.

Ross

On Mon, 25 Feb 2019 at 20:26, Burton, Ross <ross.burton@intel.com> wrote:
>
> I'm also not convinced this was right and have submitted
> https://lists.freedesktop.org/archives/mesa-dev/2019-February/215791.html.
> When that is reviewed we'll know whether this change is fine, or we
> should pick a the patch.
>
> Ross
>
> On Mon, 25 Feb 2019 at 19:04, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > So far:
> >
> > <dcbaker>rburton: according to this commit it's intentional:
> > cc15460e182148292be877bec5a8a61cec57377d
> > <dcbaker>although I'm not sure that patch was correct now, it looks
> > like autotools has generated a 1.1.0 since 2014
> >
> > On Mon, 25 Feb 2019 at 18:54, Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > packages/corei7-64-poky-linux/mesa/libgles1-mesa: FILELIST: removed
> > > "/usr/lib/libGLESv1_CM.so.1.1.0", added
> > > "/usr/lib/libGLESv1_CM.so.1.0.0"
> > >
> > > Is that intentional?  Looks like a version mistake in the meson.build.
> > >
> > > Ross

