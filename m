Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1328D7C3BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:31:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so517577wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xMmsRQG1FXWv5nhD5DDyRMBvdF6dwcE6f/AP13weB3Q=;
	b=RM7K5I9gBXGjBXTw3V9bzC0/teVxl3ahnFD+KqwiV6ahkeJAlPVowxsOSjjlukoJJk
	+8SKQXLIRRab/LxhBL+RpCTEWhIMG3l44qrFCr+Lsu9jfc4dYAJBi9YzI2cMK1nPhk/r
	rVBemVeWMQT04avCyvY7IUhT3YKPC8uPr6B8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xMmsRQG1FXWv5nhD5DDyRMBvdF6dwcE6f/AP13weB3Q=;
	b=nh2zkUIW798kAYVVzsoPFaRDyGJCcQt6oefvxiMmmM57azbxPclbMQcPZzwicc7b1d
	sN+W1XbhnTI6weW/t0Nn0zzSF+eTySF8h1V7nW3CgX69HVXQT7UdJIj5rTXkXbowxFf0
	pq5NtEmE4P6CY/vSCfZSTB+TF/5dUJWu5PHVCcndPVddX8r53+Yot0w/8p7WjaMrDv0i
	ovBvjdlAntOKHz/ZNklkb7FyR5HHU8mYAKuqjWjfFEOhKiHUeGReBdC+CvpEBK+ij7xV
	jO8EdBaGvN2lbYbG0mNKGxE9LlPN3c4Rd1Xx5JO/OZhIMKyzzm1djEULj+ttXTVNaq/N
	ZsSQ==
X-Gm-Message-State: AJcUukdhOR+z6mnaqXQ+BNCYx2cWPRw7moS0bWZGWJFoulFXiJlcwKF+
	1xyH0osl3Z2d67OeaGUn/7OTvw==
X-Google-Smtp-Source: ALg8bN6s0opfb9YsVnjnycKdlNEyBFnEyXo2CTU7UQFSL5E6qBWkut9Ss1ckJPEtZ6HBKKEL+ic9ug==
X-Received: by 2002:a1c:26c1:: with SMTP id m184mr25950469wmm.25.1548887520596;
	Wed, 30 Jan 2019 14:32:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81sm6171468wmd.10.2019.01.30.14.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 14:31:59 -0800 (PST)
Message-ID: <71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>
Date: Wed, 30 Jan 2019 22:31:58 +0000
In-Reply-To: <CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 30 Jan 2019 22:32:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-30 at 14:18 -0800, Khem Raj wrote:
> 
> 
> On Wed, Jan 30, 2019 at 12:31 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Wed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:
> > > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de>
> > wrote:
> > > >
> > > > This is a tiny but pretty useful tool.
> > > >
> > > 
> > > question is, do we need this enabled in default config, or could
> > be add it via
> > > some DISTRO_FEATURE meant for validation etc. May be if you
> > explain your
> > > usecase then we might be able to make a better assessment.
> > 
> > Sorry for being too terse.
> > 
> > devmem allows reading and writing hardware configuration registers,
> > which is useful both for debugging and for scripts.
> > 
> 
> Thanks for the info this seems useful can you also report how much
> does it increase size of busybox 

One reason I'm a little nervous of devmem in busybox is security attack
surface. You can of course argue that there are 101 ways to mimic
devmem so this isn't a concern. When you consider some configurations
can have suid busybox, it becomes more of a worry. Our default
separates out the suid pieces for the attack surface reason.

It is useful so I am torn but its worth keeping this in mind...

Cheers,

Richard




