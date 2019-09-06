Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id A8D0E7F3A1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 10:56:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q17so1353179wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=igPY9fkfxaSWFNe1xGONIz2mEscnU720CBDhsshWZCg=;
	b=h3/jxCyKTNDSsol+irUbHo7NLuWslzO+tH1aooTr9o4coXp6NnUWXu+FJwjR0ihvKs
	UNqOIYHR4ew61e6+fn0HLri88bz82S6zSark2j/lY11V2XN8KkuTVSrCK0G7NnSzLM8G
	I0dckwrjrs7fhgwKdNsOwqUFIJyQfdgMqDRQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=igPY9fkfxaSWFNe1xGONIz2mEscnU720CBDhsshWZCg=;
	b=l6PA2mEf/NDyntCtvfYHSsh7Q1O7cjHdEWBHymBMvjExfDndvfMZ35zzd3Phd6fy28
	a+GCLCYMtCTJoVrzdnFjwu/80eqZEFFraThGBFh9OyPLTAMjx5gfFsvnyBVllqTnrx/e
	J6EdTtOcu46Yo0SPfY3eqFTMgwtzdIVxVGt2rres+gKenFQWtal6dgaciaMcYJntcmIW
	g2VvRfFgTgFxVvNpbwMWomautay1/PYVbl5VYuU2D6BSRRfFIJXb02ZaJ5naHStCU/9s
	bxcSgYIEOUjneXznfpIF1RENgkbjcTmlQglEuyglgc6HEScjgJ4TlfL/9NzVXPRJPoRG
	xNfw==
X-Gm-Message-State: APjAAAUsnDZgRhn6kErwg8HSvirpiPSfU7r+u+C3HwJbqpHy98rf/5Kf
	E81FB1II8JkZ3tR/Hj4qApOZ4w==
X-Google-Smtp-Source: APXvYqxSJmZmRzpGbPa41ty5xm+kp4oYg4h+XcQpXuqmtT+3QvgIEWWoQFfypE6lkykD3pEB3Dn4Xg==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr2462418wrr.354.1567767389098; 
	Fri, 06 Sep 2019 03:56:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s26sm9148908wrs.63.2019.09.06.03.56.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 03:56:28 -0700 (PDT)
Message-ID: <8df1bb0c9e27121ec35c2e003fab2d498a09df1b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Michael Halstead <mhalstead@linuxfoundation.org>, Mark Asselstine
	<mark.asselstine@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2019 11:56:26 +0100
In-Reply-To: <c20767b7-a549-5075-20a0-ac115bbc1bbd@linuxfoundation.org>
References: <20190822155616.35046-1-mark.asselstine@windriver.com>
	<25701351.g1SN1yf5Qq@yow-masselst-lx1>
	<ed991280f92d2eaf14dadb912d86cd88601b2284.camel@linuxfoundation.org>
	<c20767b7-a549-5075-20a0-ac115bbc1bbd@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH][V2] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Fri, 06 Sep 2019 10:56:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-05 at 17:10 -0700, Michael Halstead wrote:
> On 9/5/19 2:27 PM, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2019-09-05 at 13:54 -0400, Mark Asselstine wrote:
> > > Richard, are you thinking we need to figure out the
> > > git.yoctoproject.org repo 
> > > before we can move ahead with merging this?
> > I would like to fix that, yes. I could ask Michael for help but I
> > do
> > have access to sort it myself too.
> > 
> > I'm also trying to sort out a few other issues before -next can
> > merge.
> > 
> > Since I'm failing to get to it,
> > 
> > Michael,
> > 
> > Could you clone:
> > 
> > https://github.com/masselstine/kernel-module-hello-world.git 
> > 
> > onto git.yp.org as a new repo and give write access to it for Mark,
> > myself, Bruce and Ross please?
> 
> This repo is ready at
> git@push.yoctoproject.org:kernel-module-hello-world for the four of
> you.
> 
> It is available read-only for anyone at,
> 
> git://git.yoctoproject.org/kernel-module-hello-world
> 
> and
> 
> https://git.yoctoproject.org/git/pokykernel-module-hello-world

Thanks Michael.

Mark: I tweaked your patch and its now merged (avoiding the typo
above!)

Cheers,

Richard


