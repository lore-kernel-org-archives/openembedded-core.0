Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 81E7777338
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:22:35 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id p13so22795510ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0U7XpLc6du1vnJiW2JntOwMYJuaef910tomFlDC4WE0=;
	b=t+YZTrT47lkZHuTifkGZUHOJcDEBQRRyPIoIL38tDlo7dFVlnfsAeJ+haDlT5DNeHJ
	oljWleOpfpFb7IYDPbjxgXD/5wmOjrJnSoJ6IvjMjTwlbE8swixG6AuTbrjGodb4fxOE
	S2W+372iyJgfOSvWZFtubfHiOo+MNN8sfeC/uRgh9AQQ9UqBRclgBL40Qkka6usCmF7b
	zNjGOeyiZ5NhRG10YaTX1Rtmo/rVxGzY+GgqcMn27mgcAt8Du3NZoltga9SXK/eB290K
	hbaxVhMYx5ZPxzFdOUeGY+P7evLsyYmV+g8sWvaUPhpWVkYO3mjKTS4DSiihchCREfIs
	xDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0U7XpLc6du1vnJiW2JntOwMYJuaef910tomFlDC4WE0=;
	b=b9U7wzqVCa88pe21M3UVl/YL1+v90c1qG5TZebUCmPYQqwfGtkm+z75Zq1kKYbweAy
	FTiJhBWd2fxCpYpxtO0U9l7Qga8Fta0HF3aGlGf8503oMyfz74UPwte9f8hVXP81/LjG
	E05Yot5yhqKo7vY/xSbk4dRSfuFIm+Ztoev8VKGhPdqZDJGTcHZl5+cf7bLssFRtLaZO
	R3Q1bwv0Y0A0YByisbmauYT2vGWUijsL5QWNmiMo5cvl6EX8jKY+JcAmpg9Sokka3g62
	pJFlU1pbVsRv36ibGEO5mM5grpjS7SDAxF1lnO+iImuvAnAOB+yuANfFm8rZXGk1Ox9p
	ma4A==
X-Gm-Message-State: AIkVDXI8jgXRoEhoOoKo5J49X0sKvLTj255cYYW9RzvIfSxNDC88Sbb/R+/48vsCLN2JlQ==
X-Received: by 10.107.47.234 with SMTP id v103mr603465iov.172.1482247356492;
	Tue, 20 Dec 2016 07:22:36 -0800 (PST)
Received: from openSUSE-i7.site ([45.72.129.229])
	by smtp.gmail.com with ESMTPSA id
	y20sm10403111ioy.8.2016.12.20.07.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 07:22:36 -0800 (PST)
Date: Tue, 20 Dec 2016 10:22:33 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161220152233.GD11748@openSUSE-i7.site>
References: <CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
	<CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
	<CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
	<20161220151401.GB11748@openSUSE-i7.site>
	<CAJTo0LY1_qFxKqnQC4hggAL=g4iqf6a_iXfUXgv7-SdCX5b+yQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY1_qFxKqnQC4hggAL=g4iqf6a_iXfUXgv7-SdCX5b+yQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:22:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2016-12-20 @ 03:16:54 PM, Burton, Ross wrote:
> On 20 December 2016 at 15:14, Trevor Woerner <twoerner@gmail.com> wrote:
> 
> > So I only have the version 5 -config scripts, but my host has version 5 and
> > version 6 -config scripts. I'm guessing we need a dummy ncurses{w}6-config
> > script in the sysroot too (?)
> >
> 
> Yeah, that seems like a good diagnosis.  Can you knock up a patch as you
> can replicate?

No problem, doing that now.
Thanks for your awesome help!

