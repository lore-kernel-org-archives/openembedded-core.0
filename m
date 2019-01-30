Return-Path: <leon@sidebranch.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 908827C3C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:44:17 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x64so809803vsa.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gTdCpx4j19jhzEjtD+tFgtY8k/sMjZWDY8r9meDyYKU=;
	b=r71EUEFPr7EcWVpfNlCWDrEqhOllT9u3CLMLLvfWSHeTWgHW5CRPhfCbR8Aax1BisL
	w0xkiGBml2df7UWbhEbbb58q8CfhSEGxfIxaQobWZ0+5Chq99TXiT2nD6GHwQk7hu7AU
	x7udmMYRXiFJyYBxV0p3hCceut3kenuwFQDoBuvGCBKihc1uRuMPNRXYvYovTEQSZkcL
	W0bPw6QuZo0JfvFXxNpJqgkNlr4zjIfuu5CwH5ZZQkRxRXEDHSJQZ296Xq2i9iQxpAmC
	dz2SF1qF7rwV4A1IGjjMx8wmYHAoA2cSQ6MsBdvFFLVVhTlK4kooxA0kxdvINcbfrHTS
	EKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gTdCpx4j19jhzEjtD+tFgtY8k/sMjZWDY8r9meDyYKU=;
	b=QAp76+MKOtHjU+QYLst8XSr119fPqXZx+uF3enmSjPNepfa3XRyJdwKnbznZJxYKVt
	7g32StE/wkDXNmX8SRkbIBJa4eGqggYj206jRu5S2SqbMC/fh8+zjwFd5nfg7+hdxFa5
	S4adOpGW7E/252iFzqbToXwu944JAhTV0DDOs9KsfJDrKWB4XXKyfjA+TOOeQ43FXG8S
	p1Lx7/bi3R5J2WjV7L1wBWmVODpTs5YrXgZl0BOu1yIT5D0CjGtOl+1qFt47msT33O2r
	MYyWEUbJiqxHplbaQ4++k49tQkBxElTLpeHbK5AyAbynySHTlhCA0AvIrzrx2qUvkMo4
	VD2Q==
X-Gm-Message-State: AJcUukdGr7UxlSMxoRdRPfnw4422vG8MQ4V3BIJCFPjLuVmckgbF1Jun
	sEgjJZsXsMizqln+/0eD5h8VGgSmzGBwdDqDCzu/oDx1sfg=
X-Google-Smtp-Source: ALg8bN7DMzYIUHQEz0wqfu5kV6iQLMRI4s+I1xyy3NRwuGvYOpArMZs5EW2vlnv4CA3Z4/JkSsnQHYbDlNJ0oAIxyRU=
X-Received: by 2002:a67:d684:: with SMTP id o4mr14321376vsj.174.1548888258067; 
	Wed, 30 Jan 2019 14:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
	<71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
In-Reply-To: <71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Wed, 30 Jan 2019 23:44:07 +0100
Message-ID: <CAMjhiJgL14LfyNu1s9WHZpCAVHZSrjCoEkG83+mc4CQgLu3B1g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 22:44:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, Jan 30, 2019 at 11:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> One reason I'm a little nervous of devmem in busybox is security attack
> surface.
> It is useful so I am torn but its worth keeping this in mind...
>
I agree with this reasoning.

devmem(2) really is a development tool, and indeed I would leave it
out of any defaults in Yocto.
There are numerous attempts to minimize cruft, and in typical images
devmem should not be used.
For the people that need it, it is typically easier to add such tools
to their image than it is to minimize their image.

As for automated deployment, I would rather see that an imaginary
PACKAGECONFIG[debug-tweaks] or such would include this busybox tool
through configuration rather than have it opt-out.

Just my two cents (and yes devmem is in my images but they are for
development, not in releases).

Regards,

Leon.

