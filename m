Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2896060636
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 13:27:02 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so3705133edb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 05:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kGgrYMmWGGoQq5F/5aqzXNTnZr2Yrsxp9rhTsWdaou4=;
	b=ubqPCvvfLcxeG2FCwATBu71CA0us+EDftkngvy9mSs2EwWBysWYD1g8yuo5UU3yGD0
	7zJcOBJ31iNkWQBPmjxgwoqi0uOtZ64MQJAAuCftDG/UF+8/gTxkqy1AM7DlfT30GpGM
	V0fC0m3YHpGqUsHM7vzMgmd8JwCkGe9pzYTsjMvGDU9JSkmKjfZgIOyclDe/s+WlNn/g
	1gnboLWfQHodv5QCdnIQICdfM51HBlI0zggmaxuDnS6eaLQYPTP7sDIh3rElMVF80Mta
	8VpEJJ6yJDyU3Fa7A53p5VJJS4tKXSncvIvVy/xWtG89Q7v/Ir/c/bY76TAQgHt5Hfdb
	KmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kGgrYMmWGGoQq5F/5aqzXNTnZr2Yrsxp9rhTsWdaou4=;
	b=gGs4GBFiV17T/dNoVSmgDYcXymJtD6IsHlVy0NgaXCgMu7r3B8rHwlpwuT3a1EqOSm
	WYGdjTux1O32QxCZ/m72Ol6WY86dgy7XRnn37C5PGwyxRKs3LmrksRO25F2+JzlIBxzE
	mHLoe2Fn3zOOM5G+HyU8ugYSNSmzN/axo1K7sSx9/KGAs/NtsyDMOmgL8kvgjQ3UaK2n
	VTMMKeRyM4EKEUbwP0rXrxA7MVjCIizdPw/eEQuBHli3pf1S658vhNFoYPqjIUm4U3JV
	9sSEaNQgm+9iPWTgftiHz+BL+H7yNx98UJkkn5Szs+UiLOYptytvulr+OzGdwSRfd2DP
	O5VQ==
X-Gm-Message-State: APjAAAUVRP4BfYSE+bJ7xRB7RDckgcpOJKVZh9+HbEDuTfUnn1K6rlX0
	ZVSd3olZTuiI0ToS10Hb58Y/iTXfN6+z55YMS/8=
X-Google-Smtp-Source: APXvYqyyQdZi3L7+FF/StuvypYzC8WvVOty2xc6sQ5ueTO7S6yGiTrPkU8VKPxA2CMeejEROQ8haw8ohwweqFEKp8H8=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr4667269edr.347.1582723622670; 
	Wed, 26 Feb 2020 05:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20200224200202.61426-1-bruce.ashfield@gmail.com>
	<beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
In-Reply-To: <beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Feb 2020 08:26:51 -0500
Message-ID: <CADkTA4NCvFGgq=dDBPs=Mi5qUbFqZ6C7Xy=KJp71+EVw-CsvWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Wed, 26 Feb 2020 13:27:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 11:47 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-02-24 at 15:02 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/5.2 to the latest korg -stable release that
> > comprises
> > the following commits:
>
> This was included in testing on the autobuilder and we saw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616
>
> and I'm not sure if they're from this?

Me either.

Hopefully one of the Wind River guys can have a look, otherwise, I'll
poke at it next week.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

