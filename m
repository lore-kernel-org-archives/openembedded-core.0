Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD7B960144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:11:58 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so299240igq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=njwUw4eV4kKBAGebH8r6Pmpo9dN1+0nxsJk5awUZjXU=;
	b=0UGEsUQE+zg1xKFx7Wv1/KJqHDJ+Msl0YBPzbnTW4SJX1GL7jylzmIqHagF8O5JkVn
	1ADhyl4ipTbaMpjD8rGaTl/7pnpTE3hb02jt1OGpSO4w24ChrrcUw5p7IcpkyRvOkH3c
	lKhCEUTKW0GG3BPbgkKcxw6nBsZk3o3WqdPPQ90Ni2wK0SR6F6teyMECZ12ZD98vEW2L
	EqVNjfqcQ+XxXC38/l5UjdDb0uX0Hfat909foDFGOUwK4/z6NojS3hipTQHNcHD8ERVi
	HbN6GnhERipARBLSvI3jXY+x7hsnWs8kryZQpPpvN54112gqOymTPh5ZicQ59qalzeRl
	Lecw==
X-Received: by 10.42.82.6 with SMTP id b6mr17418781icl.51.1408054319533; Thu,
	14 Aug 2014 15:11:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Thu, 14 Aug 2014 15:11:29 -0700 (PDT)
In-Reply-To: <53ED3164.2010705@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
	<53EC16FC.8020109@pabigot.com>
	<CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
	<53EC7E27.6010507@pabigot.com> <1408052429.21596.2.camel@ted>
	<53ED3164.2010705@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2014 15:11:29 -0700
Message-ID: <CAMKF1sovJkCXMBzREUaiacbHntGDcUgALMXjPA1ktmTd=CxmKg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 22:11:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 14, 2014 at 3:00 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> I'm content with the solution in my v2 gcc patch series, but I expect
> someday the underlying cause will re-appear as new processors have new
> features with ABI impacts due to gcc target optimization. Hopefully when
> that happens the discussion here will be of some help in identifying the
> problem.

general usecase on arm thus far is to use cross compilers and I think
we are good there. target compilation is not a norm but this might
change soon but then we can propose to change defaults in gcc to use
armv6+, we build arm native gcc using canadian cross method, thats
kind of different than usual known gcc compilation methods so there
may be less favors for this use case.

