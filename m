Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9B27F7BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 16:08:51 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m26so34256847ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HowP3eDkRTU1c1j7PR3Ye+mIerStkEP47UhZuey3l7w=;
	b=pDs6q7xlwiy2IK7wQLWFZcvorHu56sOQpipwPf+19vMFOBH0ll2J80LEUD9TroQKY3
	PJSDSTI2kizugO0fYTuh8UQdZjlIQDEWkWwJMkjcyoycwSLBuxyiWvfRrlWJyxDgANTG
	BtScHzOShQuhYjo2JG0f/W7hKNBXA+HckKKnd8cbG0ZamSKa4tGFG7EuV067U4wcqD+9
	hYXDcwj8t1SJJ+QlqCAfJw/m3hUTvNp5vuqk/ssqDVhV9ZbHeC+/IDKrYYvgHU7ml7jb
	5aUDBThZOfu2DZo1G8WewaVT1Fmdm6NWYDGLHVHSS533mOWTT2uTBClzv8ZxVBYlj35h
	oxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HowP3eDkRTU1c1j7PR3Ye+mIerStkEP47UhZuey3l7w=;
	b=EqpKg7g7eLk9W4ywCOPD309sZkgZCFAInxTZ/AudriQfeFUlsu5HIbutZ9CnLyjTAv
	deiRtfUCPzmcztYTo15R9VowySBFpg4KFCP7MTg2mphIYgc0M1lwG7gQvrvxWEP86BKP
	hPqnS3BiiA1zgfmXqNRDDTool6boi8f7P0NwMxEeNrxNiliYIKTnsQorPEWaQeTZXArn
	FgGW4eG6nD6OPtS+PDA+x0ra7O2QvJmZ3ow/fMMQnLErRSgFJGb9Zof0ucSNqHohc+Hf
	L43w9GgN0SL7bYMe0QeXma9YR5/ncra3e7blcoaGBg791WH7ULyAzXr2FhyUAE16a3EK
	TyJw==
X-Gm-Message-State: APjAAAUeVk6Lg+8zUlSqfRKrutKQ/3t/vs0TmUbmzCg83FeIWXXb/35I
	UEwdUZWhDOuz26f3R8ni0oPPZ5ms40uaEH23dHo=
X-Google-Smtp-Source: APXvYqwhiqqqhVGYy8yZzWr2M/T4odHfh2kGhutfs1SdbkD4I2cRzCFDbcJOTZXGt99+dB0HDRsK/VrwCRS0a5RDCVs=
X-Received: by 2002:a2e:3608:: with SMTP id d8mr42041245lja.152.1577808531740; 
	Tue, 31 Dec 2019 08:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20191221063648.24227-1-alistair@alistair23.me>
	<20191221063648.24227-2-alistair@alistair23.me>
	<CAKmqyKN=9HZ78bGpsOumv9vDiWOsz59eUiNgBfH2ns+bhY1qUA@mail.gmail.com>
	<9e6b11194ab1d59e6a1eac574471cbf2a041aa31.camel@linuxfoundation.org>
In-Reply-To: <9e6b11194ab1d59e6a1eac574471cbf2a041aa31.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Dec 2019 08:08:25 -0800
Message-ID: <CAKmqyKOqKGHUOfYKWTYEQV5OGDrtYUWsCOut+gArKUjBuyBLHA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Tue, 31 Dec 2019 16:08:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 31, 2019 at 3:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-12-30 at 17:05 -0800, Alistair Francis wrote:
> > On Fri, Dec 20, 2019 at 10:36 PM Alistair Francis
> > <alistair@alistair23.me> wrote:
> > > Upgrade mesa to 19.3 and refresh the patches.
> > >
> > > As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are
> > > going
> > > to change the do_install and add a patch to libepoxy to use the new
> > > define.
> > >
> > > 1:
> > > https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> > >
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >
> > Ping!
>
> Sorry, the delay is that the patch is non-trivial and doesn't apply
> cleanly. I think I have it ready to test in -next now.

No worries, I just wanted to make sure it didn't slip through the
cracks. I'm sorry it didn't apply cleanly.

Alistair

>
> Cheers,
>
> Richard
>

