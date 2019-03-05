Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 621857C420
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:25:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so11204342wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=akdfRiaFuyIWPYQU8EV7KoqmvD7/bcq3LLcrpK3VyK4=;
	b=cnytF1fRp91i8cS9ycOcGHy0bEkHpsh/uN7Hgqaseczk53X6EeZTT2m3M14I7x9AnF
	k/lMW184+fpjb74NDr0OMgh/agUsndslPPgbdDkytAWHti10LI2Qp429ZwYHfoZ948th
	I1x0zypgVtWOkxs9IkJmedNF3LIUny1ckTkf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=akdfRiaFuyIWPYQU8EV7KoqmvD7/bcq3LLcrpK3VyK4=;
	b=UvGf4oMK7uucQcmlVr81Nm+MNcTiHVIUTv315iimGS8yEeJpbmKGcD2g9V+qTwMRq/
	6Sg730Rj26VW74Q0qYG+Vs0Hm1FOf9dBmB71+CTilFgRbO9UJsyxl8Sa2Kh1H0VQd1wW
	NZzuVv0E8/6/NdbKoAnfcDlN1j/QKBkPDJX8EiofuDc98QHvfJdacWxd7kqQtR/yFDJ1
	e1Tgok9k9LXmTEZhRb4CIblt+daZqDwQpWq8UAvhjGsg0JwxrUGO5x3JgulLGdd9YfVR
	WOT7v69JP8f+yjzSQ+Qy7o0gTa6AQHTTcU5QyCXz3FuuJcX/MM4guJSUP0f9l29MyvqY
	qGoQ==
X-Gm-Message-State: APjAAAWuL01TCMgtFkwvpwWhIZ3BAUOvFesJ0DJv7Ovtn5oJotdIP07c
	zBZ/xt+9+t7IaB+a9/Ssix0OAA==
X-Google-Smtp-Source: APXvYqxZwViHHliPkx7Fj2hbSGpAtBGZAJ0W+FQHlkNuMAZioHGYYQhu5wJQ/sTfuXC0ZEJNesWCsg==
X-Received: by 2002:adf:dd12:: with SMTP id a18mr684148wrm.4.1551824721069;
	Tue, 05 Mar 2019 14:25:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a22sm4958wmj.35.2019.03.05.14.25.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 05 Mar 2019 14:25:20 -0800 (PST)
Message-ID: <2b95a256f053b81a43dc3f3c17c9649f1e5756f5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Hongxu Jia
	<hongxu.jia@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Armin Kuster
	(akuster808@gmail.com)" <akuster808@gmail.com>
Date: Tue, 05 Mar 2019 22:25:18 +0000
In-Reply-To: <aaee4a7c-c9ae-9f76-39af-b262324d87d6@prevas.dk>
References: <1541753661-9999-1-git-send-email-hongxu.jia@windriver.com>
	<aaee4a7c-c9ae-9f76-39af-b262324d87d6@prevas.dk>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] rng-tools: Fix crazy defaults
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
X-List-Received-Date: Tue, 05 Mar 2019 22:25:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-05 at 07:03 +0000, Rasmus Villemoes wrote:
> On 09/11/2018 09.54, Hongxu Jia wrote:
> >  Before=sysinit.target
> >  
> >  [Service]
> > -ExecStart=@SBINDIR@/rngd -f -r /dev/urandom
> > +ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
> >  SuccessExitStatus=66
> >  
> >  [Install]
> > 
> 
> This has been applied to master, but please apply this to thud as
> well -
> feeding the kernel's entropy pool from that same entropy pool is of
> course utter nonsense, but since rngd is also _crediting those bytes
> with providing real bits of entropy_ (ioctl RNDADDENTROPY) makes it a
> security issue.

Thanks for pointing this out, I've backported this to thud after
discussion with Armin.

Cheers,

Richard


