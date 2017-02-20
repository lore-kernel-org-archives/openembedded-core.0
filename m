Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF0D71ADE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:08:30 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r141so48315961wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 02:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zR/6B6uATlXzt9Jk3THLwEaxbNxAs9MfVHX22VpGWv4=;
	b=PuIxHwujQR66YOzlbqLxDjOA3fsBvkjIac6hTC8alKHY0XF51fvzUvX2Dp2t1xqFWU
	UsJo0jeqrpyN31Ewj3WhUm7YuI4JMeOHXvNYYWDRwebRVsEr+Hnd2vLK5lpIoqsppAUe
	PwYHPvgHMV9SkIx6kgxxDr6ohBwCgAExNts1r2RM/6+ZHx3yQvKRKmCfSmeSPMW6/ieZ
	jawhq6AufmJdo0S7KlQf0/L7y/djhditaSTPCmeSPc6GqtFDIxZI/Nx4hVYzIzO0ELyK
	1tB2Fl5s0AH21tlv074CnS2PZm6SzkKoff1zhoAjeNQA2MpYaLxSvqjm11NkQ2RfJxUe
	EaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zR/6B6uATlXzt9Jk3THLwEaxbNxAs9MfVHX22VpGWv4=;
	b=TUz88SwM0YH+FJRH6Je+T8D+gMhXOtC37hKDuGyMQo0Nn+KKLouXN9wLnNMOJvwQ/l
	BM9LXpgYg4hpIkK00kau5AYjHvrm4xuqnHDNuMBRtjYNut4fNMavg8JxA2x57kunkUAu
	Q/8Nilmov5Xg6Bs003NNiJkrdp8o0aEePevKzlFyfkR7ZLlfW90EAMia/Tmt96qiyDJ8
	MP3TLml1tknjRGfW4RTCx71joXcGk6mtMCjZ5ryl4GbmTwHXvYokmHc8ngLouwWmMInm
	I1W9DVGTlGUqWe+WfnBUhDKBBkYul3px8ROhkBX/u9Rn2tLSdt9IQpGEuE7ZzXOIqGgV
	ZZAA==
X-Gm-Message-State: AMke39mu7Rm0Jz8z2NaQXegzyPOHgGP2xpYKh7oIzo7diZs+klb2A0lgIHZouaDep40chZFZEIXwmTCs6ACxSg==
X-Received: by 10.28.8.130 with SMTP id 124mr16969019wmi.65.1487585310657;
	Mon, 20 Feb 2017 02:08:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 20 Feb 2017 02:08:30 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702191315090.8096@localhost.localdomain>
References: <alpine.LFD.2.20.1702181316120.26007@localhost.localdomain>
	<1487525710.30548.20.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1702191315090.8096@localhost.localdomain>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Feb 2017 02:08:30 -0800
Message-ID: <CAJ86T=UAx=k663CMc+95oo6PT38ZhR7T3rXNh5vyhGxz=QFiuA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: possible consequences of adding "extraneous" layers to a build?
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
X-List-Received-Date: Mon, 20 Feb 2017 10:08:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 19, 2017 at 10:19 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> i understand that a layer can do pretty much *anything*, what i was
> more interested in is what it *shouldn't* do unless it comes with huge
> warning signs telling you about it. as a more concrete example, if
> someone says, "hey, i have this great new layer that provides all
> sorts of cool recipes," i'd want to to know that i can add it to
> bblayers.conf and, unless i explicitly choose to start using content
> from it, it shouldn't quietly change my current build.

The priority of recipes within the layers (ie BBFILE_PRIORITY_xxx)
gives a good indication of that. Layers which just provide cool news
recipes (ie fill in gaps in oe-core) generally have a priority lower
than or equal to oe-core. BSP or distro layers (which often need to
over-ride or modify stuff in oe-core) generally have a priority higher
than oe-core. You should be very cautious about adding new distro or
BSP layers to your build.

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

