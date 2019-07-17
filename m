Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88EEA7ECC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:57:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l2so21682988wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IgzLPvAo1QRjxj8z4TY6DF0yTfc0xqDk8IH5cN7kF8c=;
	b=GukQvgNktWuLYr/J3Jo+R9nvns1DjQE+9vvZIiHIOlVyeVQHJ1JALGQS5KNfVpHm+z
	qjzJDkluep+PCfyMfj9vjoiUOIKH8gfhTD/BQe83glTxXtWQLDWB10k4EBLqw6O2BC3q
	jyvYBK7Kd/1uOi9T3IQeFYgtBT0V7LsvriNFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IgzLPvAo1QRjxj8z4TY6DF0yTfc0xqDk8IH5cN7kF8c=;
	b=j4PEZlfhBfo6gvqMFz9mIZd5eoN5EYayjfXXNmp85/eQfh5heDiRfhMEV46+LmhbW/
	FXykQmK+KmYNpowO7kBF+R7B5nSa7NNg0gNMxkH3awC8rhH/TB7SNJnJJ3q2IykpLnLJ
	lUFC7XL3BFtudiE5lHrwdT4HbozX+qNZK7fKStoYTu/HCBYspAc26LdfrpWc7nCk/Qlc
	qaFk66WokaXsVx36vv7Mex5qRpptsiEphCYW14W5WgtfnBfKBhKfa9KS0Symh5UZ3REB
	/vzXcx3eyIvve/zG0C9J11AWq24yEwwfbZH+1tdQlJpsIVlvCeBN4cr1Qrd6yjWj528z
	7SWg==
X-Gm-Message-State: APjAAAVQvxoHSFHrMpWQ8qnYeaXe28iOJeylSSS4u+MYbgIt0VbkcE7v
	mLSBGOTnew6gISUcHKlwbDZ8kQ==
X-Google-Smtp-Source: APXvYqw0MrZKjnAcxP4+e2RCq9Pvplk2Y7lqKWj8mdD6P4gklmbZxu4zxO8r+fceuvP/zspv/1WR4w==
X-Received: by 2002:a1c:a514:: with SMTP id o20mr37127118wme.149.1563361065093;
	Wed, 17 Jul 2019 03:57:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y18sm23456574wmi.23.2019.07.17.03.57.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 03:57:44 -0700 (PDT)
Message-ID: <5fc8a130cfb17be80c146dec31ab5ffd71eea247.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ulrich =?ISO-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
Date: Wed, 17 Jul 2019 11:57:42 +0100
In-Reply-To: <6rlfwx2atq.fsf@pengutronix.de>
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
	<6rlfwx2atq.fsf@pengutronix.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: =?ISO-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Wed, 17 Jul 2019 10:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-07-17 at 12:51 +0200, Ulrich Ölmann wrote:
> Hi Richard,
> 
> On Wed, Jul 17 2019 at 11:19 +0200, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-07-16 at 15:54 +0200, Ulrich Ölmann wrote:  
> > > [...] 
> > > -PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
> > > +PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
> > > [...] 
> > > +PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
> > > +PACKAGECONFIG[reproducible] =
> > > "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
> > 
> > This fails in OE-Core since zstd isn't present and you've enabled
> > that
> > by default:
> > 
> > e.g.:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/827
> > 
> > (but many other similar failures).
> > 
> > Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
> > default.
> 
> see my reply to Adrian: what do you think of transplanting the zstd
> recipe from meta-rauc to OE-core?

I think right now that zstd is not common enough to be something for
oe-core. If multiple people reply and disagree I'm willing to reasses
that but that's my feeling right now...

Cheers,

Richard


