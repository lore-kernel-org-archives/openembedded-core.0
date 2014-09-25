Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id B66D5609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 23:15:37 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q107so8403265qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 16:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xjEzfZkg6bySekOs0fSZTwtn3VZO41HaI1xN++iNWnQ=;
	b=H+XxKbPabQyyPHdpUz5bQO+04PL3Gg1l4SN4wb7RqP8HQ/zzQvXdpLcKWftj/cr/P/
	GfhEPBZZjEZq5Wsh1m53/jze/ldk2WIVLRJxMr2yP8CJdfyzePCNW5CV+ajB7vDIRUVX
	YRsv6azquE1qHOBF+JcKGqh4mhqtltX4p9zBLlTPaGj8CjmWiDbVbDeS5kLY8wmLlLvr
	fj7dVzCaizqrBqbMHHwP4ELuoJHmKiu7AWmw/7wn6CEsljL9HcenxHV95kpQ2+RFkhPf
	qKTLXQWIRHmQDeASB0N24yhfwTUjM/LR0AuK0PNDtKTDy3H5PiK8fAl8CNwMC8UWzH4Y
	xY/A==
X-Gm-Message-State: ALoCoQmdQqRXHQio6n3uBREn7NkL7n0LKZMUi/g2i9Y+9bhtkR53MRPNSXG1wl3iu3oVT8RTZFoA
X-Received: by 10.140.27.139 with SMTP id 11mr20624044qgx.59.1411686938315;
	Thu, 25 Sep 2014 16:15:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 16:15:18 -0700 (PDT)
In-Reply-To: <54249BD8.1030702@windriver.com>
References: <1411641352-19058-1-git-send-email-f.deldegan@endian.com>
	<CAJTo0LYf-qWXia8EuKSnck5=yYLGspckqm27y3kxMDESSdL5Og@mail.gmail.com>
	<54249BD8.1030702@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 00:15:18 +0100
Message-ID: <CAJTo0LZGT0ogEA-PDfZOYVznJew0BP069d=_UU75qX-z2pPSyg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH] bash: update to latest (025) patchset (fixes CVE-2014-6271)
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
X-List-Received-Date: Thu, 25 Sep 2014 23:15:37 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 23:48, Mark Hatle <mark.hatle@windriver.com> wrote:
> So I would recommend that someone get the 025 patch (don't forget to patch
> bash 3.2 as well) in.. and we should wait until their is an official one for
> 7169.

Agreed, and patches sent.

Ross

