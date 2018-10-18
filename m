Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C658479C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 17:51:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x8-v6so19343267qka.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cmtIMf3asrCZGUbJeDpAq/AN97A+VxER5mx3IcWzb3Q=;
	b=JUfWxL7ZvtKto224fdk/WdziZAv2aq6d4cFUa6z2Hl3Jbpos5sq2LeDhsoI/dVYFMH
	tom8KKRzh+FalraBEeTU6aBs+v8FVxn7tGw+AcCkOFDsjCCkakRR3Or++buAtK21VGbG
	e0PAXh9peq5au5mZ57Oh8hgF6uRo9gxVNjhrN39EydYGTnnqGJAcwH8s1z4yPJFto2RZ
	Csk8x1sHu/hYIL8tN0ZQ0bDvqK8mSrwXP1pNR2dOKNqLnM6/f2cT1+ZhbFTiARa7ealH
	iVHRtTlnZXP7L8wbd3PhyynStP32L4NxT5JoRJPdtarxCpEwAE++wUOuGXPZPaD4kDje
	Ptig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cmtIMf3asrCZGUbJeDpAq/AN97A+VxER5mx3IcWzb3Q=;
	b=AMKGcfvmBfCxnPzDAYvDc+QkkgUXnWpEzouBKXSYHCDvSk0xVZye7Au1HLOFDFK/uW
	VMC0A0i3jjyPCdoc8Esvtof0bYoLoGTu1hgzdqhxVO2/i7P0M6n4sTg4Ic1Jkt1AqW/M
	HBx5v3TZNWMgCRZLHgbuudqzVMuuiNPZPQWZIQpAeMnAbTsg20z0i5Ht/p0e90PH/ypk
	MGQpqNR5FYCE+d/GrEALVj07EEc1THGqpCmKfieVw/k+C0aMkeTh64yJNJ6PiunerHTw
	qoCuoks1wcGOtMaqjyyK5oAZ7Xneb45SiwPLg0UTJtYlKVR1WyJbwRb9zO/hH5ekEZSs
	J+kA==
X-Gm-Message-State: ABuFfoibf8H1qwGUyZmqQU53NN1LOi5NeRZoL7bLKW8CfC8K4XhbPTH5
	lyhQx128w1MItxQ4rH7zxIXM+TkfBzSzcYFmpZQ=
X-Google-Smtp-Source: ACcGV62QmyR3EMS2x1srbEnzZKPqQq7p4+i0YVf4OdetHSRs5o7xdl9nHYCZbGwbmlMI4XNl/JGgK11L72c+rEGvl5M=
X-Received: by 2002:a37:31cf:: with SMTP id
	x198-v6mr29435841qkx.206.1539885091456; 
	Thu, 18 Oct 2018 10:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
	<20181017022220.20841-2-Randy.MacLeod@windriver.com>
	<a8a5a1b9c5b5f477c5d6a119564f86ae4a8df342.camel@linuxfoundation.org>
In-Reply-To: <a8a5a1b9c5b5f477c5d6a119564f86ae4a8df342.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Oct 2018 10:51:05 -0700
Message-ID: <CAMKF1spqvkXcedaEWQ-5qy_kCX4FLg5m2o0WA+nQzkRwUCeoPA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Thu, 18 Oct 2018 17:51:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 18, 2018 at 5:02 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On #if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
Tue, 2018-10-16 at 22:22 -0400, Randy MacLeod wrote:
> > Removed patches are all upstream.
> > Adjusted two patches due to rebase.
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> I set the autobuilder at this and it fails in musl in
> do_compile_ptest_base:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/126/steps/7/logs/step1b
>

yeah using  __GLIBC_PREREQ needs to be wrapped in

#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)

#endif

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

