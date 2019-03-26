Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 188DC6D5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 10:32:17 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id u65so9684817itc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NwlFIwSTF2vrxTiEmN071skRsyKZSyZCsxc/1KBzbms=;
	b=LOT/GV/SJv26uWkPU+2gmELqBzoZvwwVnprM5RFzY2KOHhLkT1zrSONHWr4fbcwKBa
	5hsPjydAxgcAtLFLvu33hkLZalWhJ0US1lYb6lmWeovfoEe9vUtW/GX43dW2P75kTRvc
	4/9dlAIhx87laQqwm2wGhCABRXnkbf+I8XtgOxXE15C6r+S7UPTKK//IBHaGRkmgHEa2
	fWJJYgXJ09axcpGgRwrMd6tRp3qE80UQpo039vUq2y2hVgjPbAd6MGaeyTRAmm2ZqgrU
	tn/Hhy895JweQvIKeFZyX/FcazoyFBBtgEeOHNFld10yjRJleUmMtiAXt5UObucLtr1v
	cEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NwlFIwSTF2vrxTiEmN071skRsyKZSyZCsxc/1KBzbms=;
	b=VVpjpV/VmSaCQAHNtm4i07xpxUq4LIiTwmqoMdQ/vtOkr7X2nybVOwBMItqtJ5rbvx
	vpPiyzNkwQVjoA7DwdiQxfZ1UqrZPwVa898IAXexI7dSDPNQuFIJnbbAVYap/mDU9N8q
	VDaN5EqxD0U3BFZBuSJHQNe6J08m0pe8d7PCCl2eIYTE+qmX6vkYafGcygFJaYy9lNkr
	C3kY3kWxeXr87er5BJNG6Zfxymk0nEh/mLEYxRg+/q53BYlReWXSRVlIjwbGalLm9zru
	GZ3OdnC3W0a+kaaAbShkqQZpGsGCAKaDRrM5jy2xptoibPJrlmmui9DaZ59M7pipSeMo
	8sJQ==
X-Gm-Message-State: APjAAAUKoSYb1+UoV5otI2gnWuldEsze1nEi/2g8IBp4ffAX5NgevZVY
	Km3WjdN9crebZFxw41aUliL7gZjWq92WbT/qOjQ3iA==
X-Google-Smtp-Source: APXvYqxbtSRLXp6arY41plgYl1cxtS4uWCNBsiprMOUUWVHOiho7MpbPvdwuRROP77SurMiU7XHytCa6MdUmySEuvgY=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr2690397itj.62.1553596339082; 
	Tue, 26 Mar 2019 03:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama>
In-Reply-To: <20190326102017.GA1929@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2019 10:32:07 +0000
Message-ID: <CAJTo0LaFy7s7gjzxxB9yBn6613wCz=Jp=LtVbz8UsDxk1Ls58A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 10:32:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2019 at 10:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> http fetcher won't (usually) fetch different version just by changing 1
> variable inside the recipe and vice versa, renaming the recipe won't
> fetch different SRCREV with git.

Sure it will.  gcc_http.bb sets PV=8.3.0 in the recipe, and SRC_URI
uses ${PV}.  The only catch is that http fetches have a secondary
layer of transport checksums that git doesn't have.

> If someone wants to update SRCREV in libcoms to be 10 commits behind
> 0.1.10, is he expected to rename the recipe back to libcomps_git.bb and
> re-add the PV variable (with new +git${SRCPV} suffix)?

Yes.  The recipe ships a release.  If the recipe is changed from
shipping a tested and maintainer approved release to a git snapshot,
that definitely should not be trivial.

> I got used to "+git${SRCPV}" being dropped when the SRCREV matches
> exactly the git tag, but renaming the recipe and removing the PV seems
> too much, what is the benefit of doing that? It's not for clarity or
> easier maintenance (at least for me), because PV next to SRCREV makes
> much more sense to me (and helps people not to forget updating both at
> the same time).

For clarity and consistency: by convention recipes that ship releases
put the PV in the filename.

Ross

