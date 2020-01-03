Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 856757DDA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 11:18:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so8253189wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nqvkPbE74EgCWEQN3kPLEfuskXFQj1RoVIhrvW99mJ4=;
	b=JiNVx1dwPnWTCPParxl8r/T+v2WksdJ7EV6iRL3dXkGu1RnUz6UMtDCFp7iS2a6Ppl
	pYVT2csAxyfg1ljeUb/Bx2fc0+Fs9WdMQSqBZ5VlpRA7z8OxIC4yfz9EPrF1V5dGglbU
	LJuTgBKoHpJ1ZwQJcazeCHQk3SfUqUAta3RRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nqvkPbE74EgCWEQN3kPLEfuskXFQj1RoVIhrvW99mJ4=;
	b=RlIaeQLbeQKaHi65jizEXgC1ozLcm+3Kd3XhW8Rw6xxbsUoGZuxqzGFHe62ojHwIPK
	kdnSeYmhk6HCue38k+Vc0z8K6f8+tuWhCn0AOB/pzfJ7xScqmwc2gFD2k+W5CoJvxhJx
	OBlLvExYQeWomYVfZDDC933jBcrTIACeL9kKlW0g05XVr5dvVfa/r50nn+P2DT8Ya30V
	L7t/3aJSOnfklYgWehMYru4lhRoEBsjfiq/H+qicJI7nBpkUOAeSOqLhMSS6VOwcmA1V
	wXPsErTTwQWB+WldooAOMkWUQzeLsonmtlbe+cfYexG6nW3rw4A3hLL8zAu+dQme+rYd
	X1+g==
X-Gm-Message-State: APjAAAV1z26YDJFrUGYqbMPr0iFVCLvkwG1/LSKC6DlmboLm7uhn53lV
	9kGp2ogPZklaIpVe+FIuGgH9Tg==
X-Google-Smtp-Source: APXvYqxJR4RkxYNq+6aFjRn3OcTEBYWtt8BMYgZRvb4zF8F4hu5rh5eO3XVdLxnwlT90MvD5e7RBBA==
X-Received: by 2002:a1c:145:: with SMTP id 66mr19815379wmb.11.1578050306100;
	Fri, 03 Jan 2020 03:18:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm11464039wmj.38.2020.01.03.03.18.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 03:18:24 -0800 (PST)
Message-ID: <b2fa4667eafee81a7ca69ebfcb4861b3bc4bfe96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
Date: Fri, 03 Jan 2020 11:18:22 +0000
In-Reply-To: <0619cd66-1a7e-78a2-964d-8bafdc97e025@denx.de>
References: <20200103101536.2561-1-sbabic@denx.de>
	<67936cf2c289480b0a9b94b7ca52ba2e061c0fad.camel@linuxfoundation.org>
	<0619cd66-1a7e-78a2-964d-8bafdc97e025@denx.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH V3] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Fri, 03 Jan 2020 11:18:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-03 at 12:05 +0100, Stefano Babic wrote:
> On 03/01/20 11:40, Richard Purdie wrote:
> > On Fri, 2020-01-03 at 11:15 +0100, Stefano Babic wrote:
> > > libubootenv is a replacement for u-boot-fw-utils. It is
> > > hardware-independent and provides fw_printenv and fw_setenv tools
> > > that
> > > are full compatible with the ones provided by U-Boot. A library
> > > is
> > > provided to access the environment from an own application.
> > > License is LGPL-2.1 and this allow to link the library to
> > > proprietary
> > > code. The user of the tools should install the configuration file
> > > "fw_env.config", as he is already used to with u-boot-fw-utils.
> > > The
> > > configuration file is compatible with u-boot-fw-utils.
> > > 
> > > +PROVIDES += "u-boot-fw-utils"
> > > +RPROVIDES_${PN} += "u-boot-fw-utils"
> > 
> > What is the ultimate intention/end goal here? Does this replace u-
> > boot-
> > fw-utils? 
> 
> Frankly speaking, yes. The topic was discussed more as a year ago on
> U-Boot's ML, and libubootenv is the result of this (long) discussion:
> 	
> http://u-boot.10912.n7.nabble.com/SWUpdate-U-Boot-environment-library-dependency-tt340530.html#none
> 
> One of the major goal is to solve the fragile connection between u-
> boot U-Boot's ML, and libubootenv is the result of this (long)
> discussion:

> has always been a pitfall, specially when projects sets a custom BSP
> layer replacing U-Boot with a custom recipe, and then people wonder
> why board is bricked. Licensing (LGPL2.1 instead of GPLv2) is another
> major goal, too, that libubootenv solves.

Thanks, this was a leading question as I suspected this might be the
case. I think there will be less push back from people about a new
recipe if it is clear its a replacement, it has the backing of upstream
and it has compatibility, all of which seems to be the case.

People on this list won't have seen the other discussion so this is
important context to add for them. Its worth putting in the commit
message too since others may look at the commit later to find out what
they need to do to migrate.

> > Should we remove the other recipe?
> 
> libubootenv is thought to be full compatible with u-boot-fw-utils,
> and it was already pushed in many projects. So yes, my proposal and
> final goal is then to drop u-boot-fw-utils.
> 
> Anyway, I do not know if you prefer to have a "transition" time with
> both recipes or it is fine for you to drop soon u-boot-fw-utils.

My personal perspective in this context is we should replace. The
PROVIDES you add means the original recipe is effectively masked out
anyway.

Your patch needs to update the maintainers.inc file to reflect the new
recipe name (it would fail in testing now as it doesn't add a
maintainer for the new recipe).

Cheers,

Richard






