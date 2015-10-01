Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABB376F56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:28:47 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so86952091ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J8f7hhqf/GpL77dRu4MRCUb8EZ3RCIishsMCZ4oQviQ=;
	b=lu9c2al7dxp+aiPlB20DTxMDLpLAuP7z37pXX9THIn3qvueVbb9Fad5cGItfXvN6Lo
	atilfJFK95vFzzV9VDBS/SJ28DqomEKary8Wv3LVsO1ys0K2n5YPC8fkgBZZ4vJKCdNO
	XxyKxub0PMFEthBxhTP0COxfaZIoSf01oxz1YaQy0i86o3f38cww866nDDhoiY/5x+ia
	l9dPMLi+7SLjEpnGnJsPLh9BjdPVb+Fh1Yc81tJ1qZzl/mbeOuHUwslZ0qtv9c8gyBiO
	uBi5FgxUJxDeUCS77siV/y7KQCpvmjWBTrPWJ73HiellW8bEpR/UZD5hCNWUtvTqXt3O
	C8qg==
X-Received: by 10.107.137.106 with SMTP id l103mr8302479iod.112.1443709727722; 
	Thu, 01 Oct 2015 07:28:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 07:28:18 -0700 (PDT)
In-Reply-To: <1443709445.14733.5.camel@linuxfoundation.org>
References: <1443709445.14733.5.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 07:28:18 -0700
Message-ID: <CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 14:28:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 7:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Just a heads up for people that we've branched for release and that
> jethro branches are now available. Bitbake branched as 1.28, I decided
> to save bitbake 2.0 for another occasion.

what would be the occasion ?
this time lets branch consistently. Across different repositories
please.  I would also suggest to not use codenames in branches
but rather the numbered release. If we want to use codenames for
branches then lets drop the numbered release names.

>
> These branches are going to track master for a while yet as we stabilise
> the release.
>
> Cheers,
>
> Richard
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

