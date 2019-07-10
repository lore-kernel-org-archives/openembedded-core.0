Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDD677EF10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:28:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so2749798wru.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=i6hrdU7sDwu/2x4dEj7MqlCJSjXXd++j32QNXEotqjs=;
	b=VarATO9TNHquTKm/HmLBTNhbudHPfoouoeEO641YMAxLAU1V5i/2SbB2zCtPjxE2v3
	s5WxwZo/Oxv810c0WFn3IHg+1EhhkRdUdn0Kl65pb9grEj/3TYUy9ji9BNFYHk08n6pQ
	p674l8fbSABkCPelYyc2hVAD/zWaw9cURaxjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=i6hrdU7sDwu/2x4dEj7MqlCJSjXXd++j32QNXEotqjs=;
	b=FEVx6rmmx1tD8SsMmr1jgeIjkYbsMzphfkfL5Rq7U0ASUd0evqSc681A9vieHzbv6l
	arGlTFL2EhsXv50wEN0WPOArFMw62+rnc8ZJbKoiGB0Uc6PMOg+fDCvxi/MaW3c6cwUx
	0TsfhtOaMHPvR4gwScladvLivwLN9eeyX0iDk2qLqVLvneTPmzhDQRH+k6h2Bp+i9rWO
	gcYssUNE3YhUHHySIv9GnBx7R53rXHKGmh9dFEuihMXRphbx5E/qzQ30Uvt8gaL5R6pe
	gIgOgR2/5VNTs0LSESH+uoWPgIMr4bcDU+/oSJlLh+le4grXG7ok+welk3qQGtEm3eqm
	Vj8w==
X-Gm-Message-State: APjAAAUF1cWXU87ZDHw0tyVlpfHVIDwWkaiScijM2lQFbO0Msj5wY2Go
	23SSXr+0m+sspdZBBXavt/QhJA==
X-Google-Smtp-Source: APXvYqw0pnSo4YVVfSePpiQ6t0KosQ93DnrR0lvpbvpTo8Zcq7m61eXGLs6jWFctu+bVFgzd1LWOag==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr25752954wri.224.1562768924447;
	Wed, 10 Jul 2019 07:28:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c3sm2178162wrx.19.2019.07.10.07.28.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 07:28:43 -0700 (PDT)
Message-ID: <ff3ad9df5905fed05c2a328e1fc541b29fd7e101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin
	=?ISO-8859-1?Q?Hundeb=F8ll?=
	<martin@geanix.com>, Ross Burton <ross.burton@intel.com>
Date: Wed, 10 Jul 2019 15:28:42 +0100
In-Reply-To: <6bfc6569a78a2a12f6172a7323f9fb1a6149a6b0.camel@linuxfoundation.org>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
	<df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
	<CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
	<6bfc6569a78a2a12f6172a7323f9fb1a6149a6b0.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:28:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-07-10 at 15:27 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Wed, 2019-07-10 at 10:21 -0400, Bruce Ashfield wrote:
> > On Wed, Jul 10, 2019 at 10:15 AM Martin Hundebøll <
> > martin@geanix.com>
> > 
> > 
> > Nope, I haven't seen that. But then again, all my machines have
> > realpath available.
> > 
> > As you hinted, building all of coreutils as a dependency for the
> > kernel is a bit heavy. We could make
> > realpath a host requirement,  or otherwise, split out realpath (but
> > you'd still need to build coreutils, so
> > that really doesn't help).
> > 
> > I'd lean towards just making it a host requirement .. but I'm sure
> > Richard can advise better than me
> > on the pro's and con's of the options.
> 
> realpath is in the standard HOSTTOOLS in bitbake.conf so its already
> required?

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/bitbake.conf?id=12e1a0de18fc05e68be8e6f1688c1499e37b076b

and yes, I'll have words with ross about commit messages :)

Cheers,

Richard


