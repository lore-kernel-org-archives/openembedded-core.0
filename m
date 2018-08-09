Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1847078DE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 12:26:50 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id b15-v6so9410578oib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FVleEP22pNoeBh/y+CNjLhah2thLyFKfNS4lXL/0vUQ=;
	b=pL5hKJsmf6IjPTuiqR9daHZAdEmA9Fq0RAHW4TYunDYZk5PGt6z2PYcCxzk+VHB+oD
	p6lQHGnwkR2nxZczmyX2XUQsyDmAQKDSBc1KzdrSLDajMfqJN6ye1MpHpm8oPFuQ7hWw
	Pr6ZeL5ZFW48QseHUwQER+TOS2cm6T4QU/X703hI08S9ZfD4CRigyJEvfnEdcRlPmIIm
	BjQctueWy/3ekstsUSbVzKKOB3uktkO7zj3pv24BM3SPEru74xXwL0J5Pyo1lpmMaoM+
	HWgAYEHbHc0yPytGWgxFnE0tBFXxRV6Sv5fkbgKMOiv7S/Re2HNHTCn747PScWoW9ODx
	BCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FVleEP22pNoeBh/y+CNjLhah2thLyFKfNS4lXL/0vUQ=;
	b=ht/0FD8Z3gTlbGwUs4FNyh/yvadZACMQxCjINX0RwNv74JkSZ2RQ/SrdhgtYhs3YvC
	G1HZRYIfbjVwMw1q4KCEQRTaBH+UCv3Ay4unX4WBC82lwbjfVTZ2BVn3z027OK1vqjuC
	m8Stck0lNtx5mkes/+Q6R74pyNSNqgEiB9qrhYKIhKY4zzol9Sdg5clnN0TD7piqmj3y
	gGxsL+IuKv7MbuM7axpJCC+h9sHnxtlS37XyhpT1G17vf6XdUY0UCoUXQEyX0yqT2fZw
	hR3LDZSt2bTaTDtX49s3EzEQQMXfaj4sIDoByuJHPDPk34ji3LR1VrB+i0EInjIzKf+L
	4Rog==
X-Gm-Message-State: AOUpUlGW8AEuAODep1LtbUG6Y+HVijTUVqAjTL3QfhUg6R7MQirRvpLX
	gRvMfuMvE8kYb15lkd5xTYG7dLVxzIT7ytHeqKY=
X-Google-Smtp-Source: AA+uWPxFBZLLI2gjEFEekSGRg6LSCFHzVezsrtw0ijVWIGDyYDp4J8B+RKZh5922tPZpVuL6WQjHMdjtapZ9/iPOIAA=
X-Received: by 2002:aca:5754:: with SMTP id
	l81-v6mr2084377oib.100.1533817612024; 
	Thu, 09 Aug 2018 05:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Thu, 9 Aug 2018 05:26:51 -0700 (PDT)
In-Reply-To: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
References: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Aug 2018 14:26:51 +0200
Message-ID: <CANNYZj-vkpQjMoNy6JeKXp46Ghb-+waaYgVC+8fdNwHGifmzoA@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to upgrade Qt modules in daisy branch
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
X-List-Received-Date: Thu, 09 Aug 2018 12:26:51 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-09 12:10 GMT+02:00 Ankur Tyagi <ankur.tyagi85@gmail.com>:
> Our product is based upon 'daisy' branch (I know it's pretty old !) and now
> we have a need to support BLE in it (typical business case).
>
> My inner-self says it's the right time to upgrade everything but from
> business unit point of view, best would be to upgrade "just enough" to get
> BLE working.
>
> So I upgraded Bluez4.101 to Bluez5.46 which went well but when I started
> upgrading QtConnectivity from v5.4.1 to v5.11.0 then things started falling
> apart.
>
> It seems from v5.8 onward, Qt adopted new configuration system which is
> causing configuration and compilation failures when building QtConnectivity.
> Following change in recipe doesn't work.
>
> -PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,bluez4"
> +PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,bluez5"
>
>
> Is there a way I can upgrade QtConnectivity to v5.11 while staying on daisy
> branch ? Or is it just not possible to do so ?
>
> Any help is appreciated.

Staying close to upstream should be a continuous, ongoing activity,
and not a massive, disruptive effort when it's already too late :)

As for your specific need, it's basically not possible to tell what
you will need to fix and change. Recent version of Qt may need recent
versions of other things they depend on, and those recent other things
may pull in even more other recent things. They may even need a recent
C++ compiler which supports recent C++ standard, and when you bring in
that compiler, you will find that there's a ton of other things that
compiled before and need fixing now. The whole thing may quickly
unravel and become intractable - essentially you'll be upgrading the
whole stack while still calling it 'daisy'.

Alex

