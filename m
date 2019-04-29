Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id ECD307DBAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 21:22:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o4so6184010wra.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Tu2Y/v/u33tsT67euUOuOout+BIbSp5rdWVhOt6wun4=;
	b=aYgQUuObq47isJx16aVIFJ4FisinNEQM0W//ea4WKIPJxthbNoaGGxYJFbaegyjysz
	cWi9FLTQQg2FvOFHbQnU5AFiBS09okylPGd88yc8tt+ihJ8LDePcg7ZLjXIAGGb4BsEC
	Lh03Ow+qssBSwGMgHaSGdMgi2SFlTJZ029luc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Tu2Y/v/u33tsT67euUOuOout+BIbSp5rdWVhOt6wun4=;
	b=jgxu1mWKatQQKAZgdcLTd3XYHe9npFmAqT4spRR9zGgJHcE+op9dymLnIIsfZCngC1
	UFkXo/GlibwxhY8kAe/zKnxjwm6YyQvO1Lp9AxMyRqS8l7KLWijF9FC1QmAmTwlLp49B
	5KGunVXo0OS16K6yx/ByxB5v9WifK7WPvllOMQGHOl6v7YP/u5B9cJQsFlIoEtUl5t1G
	d8fwgxGTt9FOhHRslebGd5zb8o1QKUUS3J3giYEi5mzoKcJkp+eDtcns9o0rvLzNfRjE
	wYZjgburxwl2vFLJp33qASSJbQUzB2txN1JXehZBH+YPR2Aya82dL93X5Oe0+Z28YUU7
	335A==
X-Gm-Message-State: APjAAAV2NUV0l2knW5g8zpG53sIBgHIdLdfL2TQ4k+21br5SDWSaV/r8
	oRV9J7a0Jhs+SgcyB3zYYHSDjg==
X-Google-Smtp-Source: APXvYqzyc4h0ucr6Faf2S4ruNFn9pn4BQgmhFQZiIbPpTThaeTi9HKYAcHPtSCNGnjQq5/LVGB7I0A==
X-Received: by 2002:adf:dd85:: with SMTP id x5mr15776849wrl.172.1556572960687; 
	Mon, 29 Apr 2019 14:22:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 67sm675817wmz.41.2019.04.29.14.22.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Apr 2019 14:22:39 -0700 (PDT)
Message-ID: <19fa74d55f965241b227fd1e63241be600f93b5a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Alexander
	Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2019 22:22:38 +0100
In-Reply-To: <CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
	<323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
	<CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Mon, 29 Apr 2019 21:22:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-29 at 22:53 +0200, Andreas Müller wrote:
> On Mon, Apr 29, 2019 at 10:26 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2019-04-29 at 16:07 +0200, Andreas Müller wrote:
> > > This should fix build on ancient hosts
> > > 
> > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > 
> > This fixed debian9 but didn't fix centos7 :(
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/150
> > 
> > > checking for a sed that does not truncate output... (cached) sed
> > > checking whether g++  supports C++14 features by default... no
> > > checking whether g++  supports C++14 features with
> > > -std=gnu++14... no
> > > checking whether g++  supports C++14 features with
> > > -std=gnu++1y... no
> > > checking whether g++  supports C++14 features with -std=c++14...
> > > no
> > > checking whether g++  supports C++14 features with +std=c++14...
> > > no
> > > checking whether g++  supports C++14 features with -h
> > > std=c++14... no
> > > checking whether g++  supports C++14 features with -std=c++1y...
> > > no
> > > checking whether g++  supports C++14 features with +std=c++1y...
> > > no
> > > checking whether g++  supports C++14 features with -h
> > > std=c++1y... no
> > > configure: error: *** A compiler with support for C++14 language
> > features is required.
> > 
> I expected that - turns nightmarish..
> 
> > So we may have to look at reverting, or perhaps just adding a vte-
> > native recipe with an older version of vte?
> I have no problem with this but is it a good idea to run self test
> with a different version as the target one?

They're totally different uses so whilst I'd normally be cautious, I'm
not sure it matters so much here.

> What about Ross' suggestion:
> > 3. Don't use vte in qemu when building under virgl.  The gtk
> > PACKAGECONFIG turns on vte support unconditionally but from
> > glancing
> > at the qemu code that isn't a requirement.
> Question: If this is accepted and works properly - could we get rid
> of vte-native then?

I've cc'd Alex, I'm sure there was a good reason we did this. I think
it was to avoid having to have a GL enabled X display so I suspect this
isn't an option.

> Let's decide some option: I really would like to close this and I
> have no problem with either way - gnome-terminal can wait. Gnome
> stuff just hobby to me and for test I can add recent vte in my
> personal meta-verse.

Agreed, we need to make a decision, I'm just making sure we have all
the options and then we "just" need to figure out which one to go for.

vte-native of an older version is looking like the best option unless
Alex says I'm mis-remembering...

Cheers,

Richard


