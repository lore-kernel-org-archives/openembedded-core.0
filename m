Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAB060B52
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:22:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u9so441695wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2fH0OlE+pR4wSWar/+rRg3w2eoa2oTq+9QC2Gcy+7uY=;
	b=Mk3fBOrILqT+v3n2sa1G/fth9cwnWIUsB8EP88ABBLGapaARKhBp5eLtvh6mbcVXXV
	phrYKyxlUwz7xyA9Ys1vx1f9VxxzR/gnlOIsM9y8pEdUeiPJnYkfXCHV+2aTrDYjirCB
	ZKHSjRnF9dKyOByoyhze7QQ3u7cGL8NQyQa44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2fH0OlE+pR4wSWar/+rRg3w2eoa2oTq+9QC2Gcy+7uY=;
	b=CMUJzG4mB78YDgesCWJFaRrw81uBvCgjlKA/uBFhPky3LlHlh+qIm8JeR74f2d3y7M
	u87OX7wEUel19h7uLvC7AYxBPmRORzjpzVwGS3OX9UU8ESb+uBtEovZ19MCnjnkvdPnf
	Z1nlTbLEVziQLTVFGWTty6oz0joWWh0k5ixTnueH7HTfPHBOiPOssql/La73qjc30e1o
	JUGlpY4lGWP9dqtM3XQ1BpMk9mPCLdg0mRzDB84OQtbzVsFyQXGJYbc+hoNp6BJ2r/8a
	6POvRaVoxdndl6zMpWYBnhevVhvHICricUys6JQ/GNTk9LRkIbnI34w9cqmSAgMKzCR1
	bJrw==
X-Gm-Message-State: APjAAAXHKVKeFtkIaRQKzKRqpiIFYWBmWdb/ei3tHIi8sysBh08m7B4d
	lwIDvhWJ5WWBQNUwugjMisPbbg==
X-Google-Smtp-Source: APXvYqxG+70BESItx33FtPL2Kf2EQZr3++gaMoyFL05krLAI+BK4cdwAZH/nWqG3faFJyfVToAKYUQ==
X-Received: by 2002:a1c:e28a:: with SMTP id z132mr9687542wmg.157.1582982524926;
	Sat, 29 Feb 2020 05:22:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e1sm2154335wrx.90.2020.02.29.05.22.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:22:04 -0800 (PST)
Message-ID: <4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Feb 2020 13:22:02 +0000
In-Reply-To: <20200229064656.GA4045619@x230>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 13:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 07:46 +0100, Petr Vorel wrote:
> At least we know, that once we solve this problem, we can remove
> 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> 
> Please, how to reproduce this build locally? Is it:
> . oe-init-build-env
> TCLIBC=musl bitbake ltp

Yes, that should be enough.

> Or do I need to put something into config files conf/local.conf
> or conf/bblayers.conf ?
> 
> I need to double check if musl-fts is really built and whether the
> order of
> -lfts is correct. But all this has been solved even for static build
> for Buildroot,
> so I guess it's some issue related to openembedded. Unfortunately,
> I'm not much
> experienced in openembedded (stepped in, because nobody else has
> updated LTP
> package yet).
> 
> Khem, any idea, what can be wrong?

FWIW I'll run a build here and see if I can spot anything but I'm
trying to do other things today!

Cheers,

Richard


