Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 184616FF30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 16:15:12 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id a129so148884494ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FwPmTqBhqvhKw+A2woKYnVydK01MZBhyoplShAa2L0k=;
	b=rGiYW2mk10dxGHalHGCDbnbyepMUB06mx71xfm1d3tIScrAkL7D/nXdTHUnIvxbdsT
	E25nSO4nWx3LEMNko3lYmnEVkuZ4M2AI+OJMLQkZpMy9tSRoIQ94G12I3phdWZLMp4Nh
	+LJv11I8SbbjgOfoCUetXrJvYtT3opBGp/BTMAV7pBsp4te0ZFJY6Z6js/B0qahQliBk
	tHBuLuVUqkLHO/e8HVrTHDbzqU8SPpcjyR3YdwVYMqOiL3vkaUaU34KgEYSHGlLjqV4S
	bMKHr8U6uHjOHrKnbMZec58oKiIWdw0r12KJJR3QLCqYgTxlNa1zcSaI79fOWnnqrV4d
	PRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FwPmTqBhqvhKw+A2woKYnVydK01MZBhyoplShAa2L0k=;
	b=kcrT66t6Cxhk2+1YvPsoV5htVtNcXfnlkd3fxh5ggwK9HTPo/vPPSRGNFqnSWMH7IR
	HKfWRfPxhfEK6FdHK/ZGEZvS7/s4HRi+XeW83BlbWyLbR37N6sreqVhvYGR1ZOSHYiCm
	pvCamKGgt4AVOh7RN5YJCTB8xmo9xna6JsuX8JYZIN8xuyhDqVzzgAg+LPkD2BnegnLg
	5B24nwk5xSewP+KC1/olCLAJx5fAveRgfn892G93Sak6Bo29rBD6Goc306SdaJM0Q8hD
	Uv3UDcy871YjxCPDImAKAdJW+n5sFUo3sYkqhoYsmwbk4DpuMNuDEruIyf579ECfxwRs
	LVpg==
X-Gm-Message-State: AD7BkJLJKEfYAJkDnMvLpTa9mCkG5720+nguQtL/zxW2LRvlr3snIZgYNkzFGOpqkq252Ml3xIoPTZnuDzkha42s
X-Received: by 10.107.14.142 with SMTP id 136mr5418034ioo.94.1459527312536;
	Fri, 01 Apr 2016 09:15:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.201.136 with HTTP; Fri, 1 Apr 2016 09:14:33 -0700 (PDT)
In-Reply-To: <1459521916.7348.27.camel@linuxfoundation.org>
References: <1459521916.7348.27.camel@linuxfoundation.org>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 1 Apr 2016 17:14:33 +0100
Message-ID: <CAPhnLPC-zR6g4LxcD125U8qjMFD2GNVhivNHPULg+_MFVHtedg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Availability of automated buildhistory for master/master-next and YP autobuilder
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
X-List-Received-Date: Fri, 01 Apr 2016 16:15:16 -0000
Content-Type: text/plain; charset=UTF-8

On 1 April 2016 at 15:45, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We've had buildhistory for a while and its long been intended to make
> better use of it. I'm pleased to say that we now have this available on
> our automated infrastructure (thanks Beth, Michael and others who've
> helped!).
>
> The output gets shared into a git repository at:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/
>
> For master builds, there are branches like:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/log/?h=poky/master/nightly-arm
>
> with one per autobuilder build target. These logs are incremental and
> data is appended to the previous build data.
>

Some additional notes on this. Right now we treat repositories
differently depending on how they are whitelisted in the autobuilder.

BUILD_HISTORY_WHITELIST = "{'git://git.yoctoproject.org/poky':['master']}"
BUILD_HISTORY_THROWAWAY_WHITELIST =
"{'git://git.yoctoproject.org/poky':['master-next']}"

We are capable of extending either of those (and I intend on doing so
for at least BUILD_HISTORY_WHITELIST to map to release branches).

> master-next poses some challenges since it can be rebased. Right now
> the autobuilder is pushing a fresh branch each time, e.g.:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/log/?h=poky/master-next/nightly-arm
>
> These are reset for each new build. Comparisons can be made against
> the latest master branch but for now that is a manual process since the
> autobuilder doesn't know how to map "master-next against master". There
> are also other branches created for other poky-contrib based builds.

I've been thinking about how to do this a bit and it's certainly for
2.2. The first thing I'd like to do however is to take some of the
things I've had to do to CreateAutoConf for basic setup (buildhistory
makes some assumptions about repos/branches existing) and pull them
into buildhistory.  All this slows down CreateAutoConf a bit (as we
need to do some git ls-remotes).

Once I get some of that pulled into buildhistory we can look at how to
do some mapping. Something like:

BUILD_HISTORY_REPO_MAP = "{'git://git.yoctoproject.org/poky':{

'master':[{'git://git.yoctoproject.org/poky':'master-next',

  'git://git.yoctoproject.org/poky-contrib':'ross/mut'}]}}}"

> We do need to start analysing this data as it does highlight there are
> problems within the builds. For example, looking through the latest
> master packages diff for arm:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/commit/?h=poky/master/nightly-arm&id=76be4fa8cbcab7c334ae299188f3c3d7684d5349
>
> why did the attr-dbg package change its FILELIST? It could have been
> the gcc patch but was it a good change?
>
> The files contained in images is also a bit worrying:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/diff/images/qemuarm/glibc/core-image-sato-sdk/files-in-image.txt?h=poky/master/nightly-arm&id=77580baf448a95c6d66f963d112300a0214c233a
>
> The /usr/src/kernel dir/subdir permissions changed. Was that
> intentional?
>
> /var/lib/sudo/lectured changed into /var/db/sudo/lectured. Why?
>
> I'd love some help going over this output, logging bugs for issues
> found and then help in fixing the builds. I'm pretty sure there are
> some serious reproducibility issues buried in there. By that, I mean
> that two builds which are supposedly of the same revision, have
> produced slightly differing results.
>
> We do have some tools like buildhistory-diff which are designed to
> filter the repository data and come up with a list of "serious"
> problems and filter out normal version changes. We're aware there are
> shortcomings in those tools but this may give us the push to go and fix
> or improve them!
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

