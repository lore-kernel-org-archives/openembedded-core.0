Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id E302973243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 15:19:56 +0000 (UTC)
Received: by iofb144 with SMTP id b144so60044179iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sGzyVlz53Y6FK104LQ/0K2FVhoqzS+XbK7s7ULqOKX4=;
	b=Qo7Gs3hQ3aWBY+0X9U6+RV8E84Gj7dcRaLoO6pbpuHhnNwHf7cJ3LSyCdJPdPLK+xl
	cpO0OOcKgNBKKymTJk/gpnallB5DoVd6TcFTIRLGsxi5Ow7OU1LvuetvW73KiCJpxaCq
	ZTWdJMTtkmkcl5/IV3B9bYBZlwacfkVag+2z/ulpIWO+zpu2aVHB4rJtflBoeqUVUlmK
	FzcFEmwMipzdihVOtwf85TWrXwM9TJSK5K6JT3xWKrNFtiQ6sSyZx3H42cjiaDlLBY7p
	V8Jsw0NdgY3p7iHtF2RyMY4lW08j93mVwn2HKojJq+V//P0rvLvGu19MLIUPVR/7qFtI
	KQmw==
X-Received: by 10.107.137.106 with SMTP id l103mr14061801iod.112.1442589596812;
	Fri, 18 Sep 2015 08:19:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 18 Sep 2015 08:19:27 -0700 (PDT)
In-Reply-To: <55FBDAF1.3030906@communistcode.co.uk>
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
	<55FBDAF1.3030906@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 08:19:27 -0700
Message-ID: <CAMKF1sqnvsMy2wYk=sY-xYr8mnJD-zw=h1Mb_XCbZ4nKLh6_jw@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 15:19:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 2:35 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> is 'anybox' a good name for the virtual provider? What happens if we have a
> new suite of core utility replacements without box in the name, I assume it
> will be a nightmare to retroactivly change the name so we should probably
> come up with a more generic one now. virtual/core-utils, virtual/base-utils?

I think thats a fair point. I think virtual/busybox could be another
option but it might confuse some people seeing the word busybox
virtual/core-utilities will make it sufficiently not confuse with coreutils.

