Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8FB77C3BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 15:38:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t6so10724487wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wRH9Xa6//ydHRQIKxc/8xKPKBkfWNUGZJlu3C+TxrUk=;
	b=TsPoqFB6/fVhVVBPUvweqLto9aFk9P3jfD9OprynxVvHUbAGqiHpLcUxCyNtvc1oB4
	1zgGdtoRsF5GTLk4CUvMTzCfXHky3rS1iYC8iUpr7dHPNV8INRzqmYfCgBI+RuuOlSrv
	01d3OIdyCDC5feXPfTlMF6A2Bk3loA4td010M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wRH9Xa6//ydHRQIKxc/8xKPKBkfWNUGZJlu3C+TxrUk=;
	b=OLxk0c172IbQjPOOTVjJ4NaGtBzTklp+CFzWelacctCpQlpvZhXOUixRFB5bbbf6VJ
	akX6U+2xJ8bJV8mIiu+wUaqr8twUvMKTmmw3yhMqWoyOBqC35oOiLjOX4u2aVm5Svh2d
	NM+xIhiVMKvIpBYfB4zRYxMKY38mwSvUgWsYz8XuH29ijXmN3dYNvhfsQJScfuEDoIJC
	CHN5Gk1sGX/xiPD+ZvTnoLkhxcwXoLyROZyAHU7TlJVkVY0LQvE113vzwe4auUDFwcUT
	711FweV6E9B2P51hwYVAMHtBQSGVtYx1sPI0aCH1hWiWJ0XXHGrntDjw2XBPhw54RKxT
	AIvQ==
X-Gm-Message-State: AJcUukfvRvf7RyDEZQdGavdWdH0ZQp7rbwqVmKG9cxRrFhO8cwev2VCK
	c4qoiZZRBkKW1IkZbmmpRpykVA==
X-Google-Smtp-Source: ALg8bN5lKRUdlFgX1n1YO2WgnQGqsOI+mUreQsRWA7A1wO/bFrov0AssMHWi+MZNntah4N0iJ2B8CA==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr11373030wrj.91.1548430739408; 
	Fri, 25 Jan 2019 07:38:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o16sm149317214wrn.11.2019.01.25.07.38.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 25 Jan 2019 07:38:58 -0800 (PST)
Message-ID: <12e06882b3c8cf4e17e0e6663dc8fa50c770d46a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Fri, 25 Jan 2019 15:38:57 +0000
In-Reply-To: <c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
	<CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
	<c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 15:38:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-25 at 09:37 -0600, Joshua Watt wrote:
> On Fri, 2019-01-25 at 13:13 +0100, Alexander Kanavin wrote:
> > There is a similar issue in multilib for target packages (a warning
> > because qemu usermode support is missing):
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/214/steps/7/logs/warnings
> > 
> > I'm as well not sure how to handle this:
> > 1. Keep these two warnings as warnings so users see them in their
> > local builds, but
> >  add some kind of string pattern to AB so it excludes missing qemu
> > support and missing wine support warnings.
> > 
> > 2. Turn them into notes, which means they will go to the logs only,
> > and users are not going to see them ever. On the other hand, the
> > postinsts tend to
> > create things like font caches and similar, which should not
> > generally
> > be needed at compile time (which is what SDKs are for).
> > 
> > I'm leaning towards option two.
> 
> I was leaning toward keeping them warnings and then suppressing them in
> the cases where we know they don't work and are unnecessary (perhaps
> with a variable like POSTINST_INTERCEPT_${PN} = "0" ?)
> 
> That way if a user enables a package where it's not going to run and we
> haven't previously evaluated it to be OK, they will at least see the
> warning. I naively think this might help reduce the number of bugs
> filed, or at least make them easier to triage :)

I think this may be safer...

Cheers,

Richard


