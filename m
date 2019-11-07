Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17C077F998
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:00:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l17so3363133wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Qb4WE/iqI6CGAOJKI08/Q/VBAbgi8S5FaIFoe2KG8AQ=;
	b=WjeO4JyS/aALdW5kMr8+ZGjp+FmInTrnBoT4Wwg3kVmPvvWxgoypraOX5sVYBOeHyt
	tiDzMla7yGO0RUrsmLtRACY5Wd15cz4QXZQ0ay+hvw7JCzlVjDlj34FlQGI20eUHIZB3
	wvTjBwC4TuemVSxzCgzGzohwVNu+7apU3Rquk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Qb4WE/iqI6CGAOJKI08/Q/VBAbgi8S5FaIFoe2KG8AQ=;
	b=ZmA6JAIETCzLxSyQRuCAwebTVDZpJSCzGg8EqIiFM93FYNBi9+YaRBgJGpaOAIf74Q
	A0i4TrMD5RSCg3o2bTSdKcrAAEWtdSbGCXv7b1U+eBP2WN9fbnVUK7NWEWL9ucYL90oJ
	jaoawkp0e2SNUqw6AaFhmwgzhcv+zl0ZY3CNOztDajWAwSbN7RuSR5HrAT7Pc8QPC1s5
	ps8X8SqEo4UW791q9QTNYKKA6IGt2dRB2unt6XUzwhuP/3Nd8+epLSWnr7UZE0qi1oTJ
	wmmax4tys+T892btr60WsplJBTcIQOFoesg+dSZtuJyynft46IWHnroMXVYUouTgfAfT
	ZZIQ==
X-Gm-Message-State: APjAAAVVVtY7HqFYoBGUgw4rs38OOfIequyNDNl2awnemY1ds04Z8lPJ
	L4tMddW0M2SOz/D8EXTCkFKQCw==
X-Google-Smtp-Source: APXvYqyXNEBXrjb6L0x5We3oHVEraQcY5EC3dWR3kL495qnTmLFV/cu9WFv0dck+KcMLWnl/phH3Zw==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr4745477wmd.171.1573164008731;
	Thu, 07 Nov 2019 14:00:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 65sm6102201wrs.9.2019.11.07.14.00.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 14:00:08 -0800 (PST)
Message-ID: <2ef86d8b6ef53be5b1c21241db0cf41a083a5f09.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Thu, 07 Nov 2019 22:00:06 +0000
In-Reply-To: <9a596cbde910fd63d5fdb4344403bd2b63243fe0.camel@andred.net>
References: <20191107094033.33950-1-git@andred.net>
	<CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
	<8002dca6398624337867ed88608e7156e6f943e4.camel@andred.net>
	<d3db0ce8182373d0f4e76427de741e93d839a3d1.camel@linuxfoundation.org>
	<9a596cbde910fd63d5fdb4344403bd2b63243fe0.camel@andred.net>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 22:00:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-11-07 at 15:41 +0000, André Draszik wrote:
> On Thu, 2019-11-07 at 14:08 +0000, Richard Purdie wrote:
> > On Thu, 2019-11-07 at 14:01 +0000, André Draszik wrote:
> > > On Thu, 2019-11-07 at 13:26 +0100, Alexander Kanavin wrote:
> > > > I would rather keep the option to disable openssl, but simply
> > > > switch it on by default
> > > 
> > > Why complicate things, what's the use-case? If
> > > libevent_openssl.so is
> > > not
> > > used by anything, that library will not be pulled in, as it is a
> > > separate package now.
> > 
> > Build time dependencies and hence build speed?
> > 
> > It sounds trivial but all these inter-dependencies do mount up so
> > if we
> > don't need it, keeping things minimal has advantages.
> > 
> > If there is a security issue in openssl, its one more thing that
> > would
> > have to be regenerated if a CVE fix were added too...
> 
> What about helping make network connections more secure by enabling
> ssl by default? Is yocto really advocating the use of unencrypted
> connections?

No. Information like that about impact would help sway this discussion
and should probably be in the commit message. Its a question of why as
well as what and how.

> If build time is the argument, why is stack protection enabled by
> default in the compiler?
> Why do other packages have OpenSSL support enabled by default?
> 
> I could go on, but I don't care enough, v2 sent :-)

It is important, I suspect the commit message needs more info to help
ensure we make informed decisions...

Cheers,

Richard



