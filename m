Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6A1F75268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 17:09:35 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q2-v6so3975729lfc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jIG9VaOaZWzUJj+X3fxBI4u58nGnsE8bvGpJOuZCwQw=;
	b=oxOa6WPp6IQEfskF/USkruAS3dc5SEXYmck39131oMKsNkqyIBhe6oC8buCawLSBET
	u7pGw3EW4pQ5AgLbiUZwzPBC2O+WDT3UqrtOSkFqrgDyVWEbFm3yhLTfTACzYYd82S8a
	/XWi3MVidNlACPpfnJMv6uL7l+/uITNq6Re6jYuBMYRpAdX5Nv8MQYJHz+0xssK2yUjM
	11H+wsKhth9QTXG23xk148HBCbL5QHrMXck9yeIfE8khxbOG76yFnSP47iqXDZSe7/9S
	SgE1651Fmegavz7YHF87gMg5l2SoZ+hxiNwunAbTCBtzbrHFaCsKzNeBo2zsT0GQIOfo
	sNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jIG9VaOaZWzUJj+X3fxBI4u58nGnsE8bvGpJOuZCwQw=;
	b=T3O7z9aAOYIJp+zKn4izob4FihBpTXStmTi++1AsWF8YgWRLgUseRlYYdQqUn9BowB
	ch932BjlVjKReiF1cNQMDqs+TNkmjRj2k1/ZphXSrkz5VlPZwfK+0SS8PmDkXsgPggX8
	SBrHj2y3vep+VzjkJaHQfvqP4/l1dNqSAGEz2nHFfUvTPpJl5LbVH+I5B6stLgKwYabp
	WQevhlndd9mbvAxzYeujOFmIPWB0MYeyn0Ggaz85qvT/xQMZkaGMVEtDrluVR1baUqoE
	ol3wYAz1RzBSQB2uELedPCAxHKZS3Wag76JpTj+1tY+2QhqGV1zeDk08mIEeoiptSd//
	9YyA==
X-Gm-Message-State: ALKqPwfCTpd6Yf/dyDvIL/RqGPyZybYkyreDbTB2AhNO/UsZDS+Kuif8
	quBmIJy7zI8t1XP6ZjjmkqHJxduhHlF3HNsaUsI=
X-Google-Smtp-Source: AB8JxZq9trbMhVGd+QLVPXmpJvH3wuVXmLzIneYtst17UNIt7RitCjyHc8oQlGXlS+O18BIcT3GMpTIgzh2texEqUSs=
X-Received: by 2002:a2e:8759:: with SMTP id
	q25-v6mr1684012ljj.66.1525972176382; 
	Thu, 10 May 2018 10:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP; Thu, 10 May 2018 10:09:35
	-0700 (PDT)
In-Reply-To: <CAJTo0LYyJ_=Tr1XTB8rW5O9-oQf7oNaguoaMq7y2cSC9Upcw1Q@mail.gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<1525922097-15292-3-git-send-email-armccurdy@gmail.com>
	<86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
	<CACS+7ZSzjg6f3jpEk+BHAs7XbmUGiPZN_P4HYcnNWvmvjKpYQw@mail.gmail.com>
	<CAJTo0LYyJ_=Tr1XTB8rW5O9-oQf7oNaguoaMq7y2cSC9Upcw1Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 10 May 2018 11:09:35 -0600
Message-ID: <CACS+7ZSs9fdafLw8kBAytWXmgTV6jpbcFgf4jhwZk5_DwOpN3A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 17:09:36 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 May 2018 at 10:33, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 May 2018 at 16:47, Dan McGregor <danismostlikely@gmail.com> wrote:
>> I'm with Khem. meta-darwin and meta-mingw are things, even if they
>> haven't been updated in years. If interest arises they shouldn't have
>> too many barriers to starting development again. I've also started to
>> attempt to build on a FreeBSD host.
>
> meta-mingw builds Windows binaries from Linux and meta-darwin builds
> Darwin binaries from Linux, so they're not relevant.

Neat, I only took a quick look; I guess I misinterpreted their purposes.

>
> People *are* at least trying to use Windows Subsystem for Linux to
> build Yocto on Windows, but I suspect as far as bitbake is concerned
> that is Linux.  There's no practical way we can build on macOS right
> now due to the recent security changes.

When I tried, early in the WSL testing, bitbake wouldn't start due to
some missing syscalls. inotify related, IIRC.

>
> Builds on BSD would be interesting, I'm curious as to how much breaks
> from GNU userland expectations and whether the build override is
> actually useful.

The problem I'm running into right now is pseudo. FreeBSD uses a
different API for extended attributes, so all the various xattr_...
things don't work. I might need to make it depend on a port of the
xattr wrappers.

Outside of that, I've been using a FreeBSD hosted cross toolchain for
embedded Linux for years. It works well on its own. Hopefully the
build-* overrides will be helpful for the small differences I've
noticed.

>
> Ross

