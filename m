Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F20557F691
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 21:26:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so2407966wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=5uu1NZT5I7Xfjdzt5KxmN/r1xcObpHmcqPgcGk63Vfk=;
	b=Q9HCiynoodAGS9QEX7aPbWIpOJAWxBkc9KxMf/wMNi+voeQkIkwrL8fXdz1M20reBI
	4No8juqBpoie7ekrczauzh0OOfNW/iCyKISiTgnnY4suqXcpPhnjjTSiN78/XvEln8JV
	FDmiQgh5Ktp7zJ4+ekRgHFWFKQPxuPP+nUlX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5uu1NZT5I7Xfjdzt5KxmN/r1xcObpHmcqPgcGk63Vfk=;
	b=D6WrSAAQY3GaQpXrWxw0tLGaiUBpHzJMdyktjNkjQXYTiNNu2b6m5bBKOOaKbXHSWk
	w/TlPQCxl4IbWOrpdSHhWGyGkXapR25K4ajojhYJDMvAWCrm0o7ZPQD5punzEYhJALFd
	aJDX/HeuEVWdcCQFpTnzYTDs/PWQHxbA2g7xvu8YyaU9NmmVDxo0RMech0cit0kYE4qF
	nW5IGilbYsmcabqLE5PZOYiuGaxwNVNtqhfRoSKqtkCN/ixwGFQlKixai2RPdLGY0xw3
	ysVY90HtfTkfAHfbM/jPe6rlF1VIwbg6KWvctAxj+3jSNjXXvKAaAwjmd6TmrHDJA/Hd
	/0Cg==
X-Gm-Message-State: APjAAAXY4ByvjGdRhd+BsV1C7nGvFLt2mHJUK9nyoKpg5KdNTd2j4Wtj
	T9ZinFoXumEPH98xGAcqbX6f0A==
X-Google-Smtp-Source: APXvYqwnEIhK6YZZCuUjL/CuXxNUbBanGUp1oQ3Q1TzS2vEnk7hoiTejuhXT08a844YVL14h/l3CTA==
X-Received: by 2002:a5d:630f:: with SMTP id i15mr5086819wru.226.1571433987572; 
	Fri, 18 Oct 2019 14:26:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r140sm7653007wme.47.2019.10.18.14.26.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 14:26:26 -0700 (PDT)
Message-ID: <da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Oct 2019 22:26:25 +0100
In-Reply-To: <CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Fri, 18 Oct 2019 21:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-10-18 at 20:49 +0200, Alexander Kanavin wrote:
> I certainly don't mean to ignore those reports, it's just that due to
> my ongoing health problems, and having to dedicate most of my energy
> to the day job (https://mbition.io/en/home/), I am not currently able
> to work on the upstream issues in a timely manner the way I used to
> when maintaining core was actually my day job (at Intel).
> 
> The question of how much effort people who update things in core
> should allocate to fixing 'other' layers has been a conflict point
> for a long time. I'd prefer to see more aggressive
> blacklisting/removal of recipes that no one has an interest in fixing
> and updating.

If anything this would be my fault for merging things despite there
being concerns raised. I have to admit I'd seen other patches and
therefore erroneously thought the issues we mostly resolved.

Should OE-Core block on all issues being resolved before merging? I'm
torn on that, I realise there are pros and cons.

It takes most of my time/energy to track the issues with core without
trying to remember that patch X breaks layer Y and that I need a report
back on that combination before I then find a patch and merge it.

So sorry, I probably shouldn't have taken this :/. 

There is a fundamental issue with having enough people to help work on
these things though and requiring more work for changes to be merged
isn't going to help. I wish I knew what would help.

Cheers,

Richard





