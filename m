Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC7A6C357
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 10:18:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f2-v6so5506295wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=k1sFYW3EnjbO2/0dT3czb4jCJv8dH9Vk85jlfyk9Im4=;
	b=fIPm1ynU94Y0ZAbMBB6qtcqgob3ceZ7Q0Dv7n/KwLs0MVy6Cdtrv1xkix17wzhUDrS
	HKKcq9DiObLxRljHJpgej6Qfrui7q/0qqGTcq1mKTwugM+2kkeToArGwJDbkad7dhw1o
	gYg7aPYb2u/Er85EjrJ0LN8fwtvKAGhrtuMkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k1sFYW3EnjbO2/0dT3czb4jCJv8dH9Vk85jlfyk9Im4=;
	b=TwayS8r3dzhHOprFHfppExHbG3GEXnoW9qLc+OpyVgCmG5KJwbDaBSWFRicGGvCAcD
	tePHB20xzNIQB4/gSXFwKYi6oE0HQ22Uj8baDRGpU2ED0sWC9RoUgbVI9C7RNuK3ufpk
	zeNrSMsB7yp5cpSdROp0YVoLYeKw2pOb6MNwk0F+8fvHjEA1TGeVEoLvwGf5RRcEpdUc
	BlDy0jKTwRCCcjpyxOcGi9ZjyEIDHm88vKsCFXBMeqt8ovWm3fqFyjEHHl4GYhGkUey0
	pd3YeOQjq0lDCqOtEzdIyvr1BN2znjksb5MkIig2DDVaL9L2vvqNTY8o9Sn+Xkf1+wU+
	NVzg==
X-Gm-Message-State: AGRZ1gIYq7tUq4A550zGFF2C7ykA4llIRHhHGTEXAjNqZJH53f9WJP9X
	EUpEj5tgaBKsuZULtvhNHodNSULxwHE=
X-Google-Smtp-Source: AJdET5c5Qoh7pbQK8C6wzSMUtsOioyYDQk0xe0K09VkbLdFEDgy0HHAnufksHMjKvRhaHle5zlTVjA==
X-Received: by 2002:a1c:8d2:: with SMTP id
	201-v6mr4833458wmi.132.1541931483556; 
	Sun, 11 Nov 2018 02:18:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm12030050wrb.3.2018.11.11.02.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Nov 2018 02:18:02 -0800 (PST)
Message-ID: <b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Nov 2018 10:18:01 +0000
In-Reply-To: <2fd9b7ba-ca8e-fea4-c138-93f6f717f18d@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
	<a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
	<2fd9b7ba-ca8e-fea4-c138-93f6f717f18d@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Sun, 11 Nov 2018 10:18:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-11-10 at 10:22 +0800, Hongxu Jia wrote:
> On 2018/11/10 上午9:14, Hongxu Jia wrote:
> > 
> > > There are also other weird hangs being observed on the
> > > autobuilder 
> > > after these changes. I can't prove its this patchset but I am 
> > > suspicious and its something in master-next as things were
> > > working just 
> > > fine until we started poking around all this again :( 
> > > 
> > > 
https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio
> > >  
> > > 
https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio
> > >  
> 
> I am trying to catch the issue patches

I dropped all the rng pieces from -next and the current build is
looking a lot happier from a timeout perspective. It does seem to
mainly affect x86, particularly the x32 target for some reason but its
not exclusive to that.

Even if its kernel config or something like that, it still seems like
its a regression to cause hangs when we didn't have any before...

Cheers,

Richard


