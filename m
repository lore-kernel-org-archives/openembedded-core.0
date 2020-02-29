Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 21C6561138
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:37:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48V9WR0H8Cz4S;
	Sat, 29 Feb 2020 16:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582990627;
	bh=TB6u02LYUsrDWovyQ0wER+wilM6NBnj3CzAIGM7JnA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6jXH8sgpty9Sgk/Z1dt3/zrIQdpru7DjGCnHnVHV+qTPTQCZPPxnQ20nFgvLZ0KI
	KkGgmHIkCwDgKk57WWUYyKHCUclvl6M3e5fetR9UMBHY/Zk0eiR+7DxFyK4y+xv+pm
	gbIfEirPUshq+YkTch6HzH4DfazWW8fue9SM9dIx2E06iiPquOMXCpYZ+1/tehRhTF
	xCuNVI+jnor4J2F9XuoRq+2bwtaCvq4L69n0Vaz7fGZJOy0H1G31IlPU38UmVUkt5/
	4G8YhM6/vqZ20cQeXeJ3WFO1sUGlSx0ieFApx76x/isTJeUpU2UH6XAm8frNU/C0eN
	gUKqHYA1+CXJv+K6isyq6OV05DYNa+3R0oR+jblhEZrcjA6uy9Si+u0usPtm3yx1BL
	uXYGHcEfUic0w/q7tKKwGhFCsWayVvABliYMkoFASimAgiUxlnXvLH0ERNRTbftivT
	0NBBHD5BiR5xMSixkV1twGnnv4Jdc33gAEsv4eGk08zaRv5cVEniz1FNQHNlQQhYuW
	0Vo1Xd83oV5cNVhpkKvhSqXJvHTBfctIDWnYHskTuEsw1vrdwQUnXFfqipbw+vUosA
	VwI1xaYdBerNcZztkDSXitOa+AiL+IzO3Nj3ic8fJJmPvJfglodquqg9ItbCCmuVro
	DJyBr7LQk15w63j1KwURdDmc=
Date: Sat, 29 Feb 2020 17:37:05 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <20200229153705.GB25145@localhost>
References: <20200228225151.28015-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200228225151.28015-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: add fix for arm6
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
X-List-Received-Date: Sat, 29 Feb 2020 15:37:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 28, 2020 at 02:51:51PM -0800, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
> We have had similar problems with missing atomics on arm6 that arm5
> has.

How are you able to reproduce this problem?

I was wondering why the upstream fixes that happened in the meantime 
didn't fix it for armv5, but a qemuarmv5 build of mesa on master worked 
even after commenting out this line.

>...
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -161,6 +161,7 @@ EXTRA_OEMESON_append = " -Dasm=false"
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>  
>  CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
> +CFLAGS_append_armv6 = " -DMISSING_64BIT_ATOMICS"
>...

cu
Adrian

BTW: armv6, not arm6 - arm6 is armv3

