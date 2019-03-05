Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DEBFA7C629
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 09:36:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so8631112wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 01:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=AQfCKF5xoYbEEoqY3XTZbxAsgqIjow2WPx3I91Mpvq0=;
	b=Pg1fKjXUJ5F6YwG6KqFc/fFPpuhPW3+Vidr4bcZDyfkd2TlkFjiLKsF2q8sltKD2AW
	P4FxdCQZjuNFn2imhaax3idMZbGoL2glzFV4qeKTUipdwF2FmoyJhz2OSMe2+eTBeYBm
	kAx2xJBtg2ReKZruAokDEUvUFAlAzkkzgQunQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AQfCKF5xoYbEEoqY3XTZbxAsgqIjow2WPx3I91Mpvq0=;
	b=HaP1JPFnasp76ozQTA99B7lJ+x4jOAMMbdq4ep+yeuTPKmpbE1OvwHWM3cQxj+pZMQ
	vIX6YO+zteDhIyqv3R4cYOrg8RW+cpf2XuC9cxXuCL6ROiunnuHxdINuZjWDgPChc+Ks
	yaiC0WWzVRForks8Ld7hqP+pK+5S5ehXDUEn99t/4ayosCelhgl1dYMyfxFFQhaXcfyN
	VHimPIOn/G1XHo9kFiF2XG9zNDISOyaxcgU4Wzdhn+cRLTZDoxCS06YGdIypiai02/iU
	z8IH9atAbjTQAbBaGuuRQ8/azN5IYEAf/mTzalDI/hW9L3tEGKKHmNNiEdBzvN+7ZCR2
	jT6g==
X-Gm-Message-State: APjAAAXT++gxiuxvxy2HVsId6bZtWTMBiXH/U4ychXs8rLO0n7buUVva
	TYeRnkbIq3kjiCLvBF7f67mpOw==
X-Google-Smtp-Source: APXvYqyWtChb/BgB5XkpOE+y4jHPpwTyMQo4YwfAVKL/96UvH2RqiI/ErJb+VljflNSYtEIflRgR0Q==
X-Received: by 2002:adf:a49c:: with SMTP id g28mr7361968wrb.147.1551778583543; 
	Tue, 05 Mar 2019 01:36:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v67sm13051373wmb.9.2019.03.05.01.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Mar 2019 01:36:22 -0800 (PST)
Message-ID: <2cb14ca8db048a9e6ce3eb3d6a3974f27e2402aa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Mar 2019 09:36:21 +0000
In-Reply-To: <2386661.BVp9O4DdDJ@localhost.localdomain>
References: <cover.1551735224.git.chris_larson@mentor.com>
	<2386661.BVp9O4DdDJ@localhost.localdomain>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] Improve logger setup in devtool/recipetool/scriptutils
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
X-List-Received-Date: Tue, 05 Mar 2019 09:36:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-05 at 16:50 +1300, Paul Eggleton wrote:
> On Tuesday, 5 March 2019 10:36:07 AM NZDT Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> > 
> > This improves logger setup in devtool and recipetool to send ERRORs
> > to 
> stderr,
> > the way bitbake itself does, and also sends WARNINGs there, as
> > those are
> > essentially out of band as well. This makes it easier to script
> > with devtool
> > and recipetool, as any *real* subcommand output can be more easily
> > captured
> > without having to manually filter out the cruft.
> > 
> > The following changes since commit
> > b11725db2d5549dc45d8ae36fbf94a5c8e342d69:
> > 
> >   xserver-xorg: Fix build errors with clang (2019-03-04 14:26:41
> > +0000)
> > 
> > are available in the Git repository at:
> > 
> >   git@github.com:kergoth/openembedded-core scriptutils-log-
> > improvements
> > 
> > for you to fetch changes up to
> > c4f37568236d2e3d8c40d57399d0b275ad5b7c8b:
> > 
> >   oe.scriptutils: also send WARNING to stderr (2019-03-04 21:31:00
> > +0000)
> > 
> > ----------------------------------------------------------------
> > Christopher Larson (4):
> >       oe.scriptutils: enable color in a more flexible way
> >       oe.scriptutils: add logger_setup_filters
> >       recipetool, devtool: set up the logging filters
> >       oe.scriptutils: also send WARNING to stderr
> > 
> 
> All of these look good to me.
> 
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Unfortunately there were a couple of issues on the autobuilder in the
devtool selftests with these applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/297

Cheers,

Richard



