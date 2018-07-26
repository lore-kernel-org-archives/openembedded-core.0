Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E0709745FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:01:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b5-v6so1843362qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JXgC6JOF4tzL5Cw0P8bOSIkyE0f9nVyoMzCXQqrHXg4=;
	b=OOarDDSVVSyIZ2/jytuu+Sv2SfVyX4QCuKGAZlPNkq1P7ABDAfCX19qJiRlvjfKVNx
	YzJjmOyfzSNLGbqZ9sTDqzHeqyFBK3nQueS7PEFyzg9RDWnXpBetHGs1j6uI8q1Lx9oC
	YA/1PizCyt8z//YY9jbbs9T32z867bhbIXgGrSGjfI6TroVgEJ73vXhdx5Vp3g4bwzSb
	X5y4lxUT6gw8EeZTU9LAJ5qPnuU60Q2ZqpvhRu3/ubZjJ/yIcYG3GtBkVqEnNHcKOZU1
	G564qJVGy0ZYCxAB/+CAZg8awtquFTvNA5fy+MQNrxoKGSZHxZB9p40/MvAPeBg8RTSh
	LRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JXgC6JOF4tzL5Cw0P8bOSIkyE0f9nVyoMzCXQqrHXg4=;
	b=tf27VrhBzXMiO8qE9/Z13Iu55O4D7wvxyCb/H7h7e0eiBA61HAk9Ue01CKJnVPRotA
	wn4s/DmG83l8PSzVs0bXhPxgQYI2r1EEdq6VZO9t90gpwPoFljLMsOrBrS1qk9N540Ic
	U6jXfNWwE0JR6ZzHpb3zF9BzbAxdthJ1+RElOCkqs75JTwx9MkBX1S/KkBwiB/lKmPvv
	7ntoTGO6rDAbe6fZ/bUqqnP0zIMo7T8YtkMzoObWEA11WKTNO3e+8vV+7trL9wzkWCt5
	M+QP4koDz4ZHu3y1VLqBaEWlX6ny+7mrjFzPyff5anAbLvADSlfZsxci0lyPVou3tJOx
	vVgQ==
X-Gm-Message-State: AOUpUlHbo5iKG7OA8zjQ4Y+Cf4porUMDxbV8WBj4k862kn9tkkWWWOSh
	13gLu+FFiN1rbznSF5VfRNppMUDB/6CIRWYmoRU=
X-Google-Smtp-Source: AAOMgpdVAytkqKFSUyQjdryytqSMDrY276uj6PqAWnphMFGiC8C2xZVV20fX5EVVyJ2gSLYBRs/xaXKxP2Jvi4b9mhs=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr3048475qke.406.1532635270522; 
	Thu, 26 Jul 2018 13:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
	<CAJTo0LbU0UhP6OzHJwJQBcFXw+y3+9f+1BxFiQX3FCbotxOtFQ@mail.gmail.com>
	<CAMKF1soP0u3xLKb=tjxNrojvQQ2PFx3O6N-aS_W4huuzJBMiFQ@mail.gmail.com>
	<CAJTo0LYt4MHCf1eUj3xB_B9E6TUZ2FP1kWH7N4gWZEzdzjEinw@mail.gmail.com>
In-Reply-To: <CAJTo0LYt4MHCf1eUj3xB_B9E6TUZ2FP1kWH7N4gWZEzdzjEinw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 13:00:44 -0700
Message-ID: <CAMKF1squc96h1BXF6_bKnp6fT2MdB0tkB0+F9mcRgGYPY5fJeg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Thu, 26 Jul 2018 20:01:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 1:23 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 July 2018 at 21:18, Khem Raj <raj.khem@gmail.com> wrote:
> > while I agree its due to a different behavior from pkgconf, the
> > solution is not relying on pkgconfig features
> > in itself is an improvement IMO unless you say its regressing builds
> > when not using pkgconfig
>
> This is a behavioural change between the two and personally I don't
> consider this a bug in pkgconfig, so pkgconf should do the same.
>
> Also it turns out that you can override variable lookups with
> environment variables in pkgconfig (see
> https://git.dereferenced.org/pkgconf/pkgconf/issues/2) so when pkgconf
> does this we can override the lookups without needing any patches.
>

I would tend to agree. I think it might be ok to defer these fixes for now

> Ross

