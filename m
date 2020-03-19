Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 773E5600A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 23:38:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h4so5472268wru.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=k17/MnVfZnECNOzMVpinSkMQ8dOvvBvU3UuS4Va7YXg=;
	b=DiGeXdg62Rpi3SaF2XyMwncgW1MFd0Nv3FjJhZnL5QldbC3qPSVfdNiTSJ+MAVc8WT
	6mxm+6yMuBc6GlIak2SQyLDOp7eXX6UNMf443ytvgoiD0lef5poHsYPmDHCZxsg2bqB4
	H7qj9fXSfQfarLxqK/PMcEMMXX9Vo1hothymw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=k17/MnVfZnECNOzMVpinSkMQ8dOvvBvU3UuS4Va7YXg=;
	b=uaVlx54lWt1VLYm8mAOgMu4Fy4RERWBKiNpuCtOAzCkPahOfIMT+7novrRDs7tx8cX
	TymXuP43XQotTX6FZl1eM744U/VReMHyeXhkJbiSQ+KMcQINIZ9EY7iUvqetD1MOD2/d
	rDUe2Yu4F8fwfLykDuYoZN9xzb6N8Mr4pE2J9e8N+lQLaobKCkZqxihJ2yPMrnF1yGA4
	pG6V87K54axxW4U//R8RZVJdt5S/Hl0ZY2ClLyddDctpAwReAOTjoxnBqSUJiUCkTr3h
	e2lCGKaQXB95ym3vtdG4K+3vnW1NjdgtiQ3rv6U9LLoHJawScbnI7FIJxxS+S/s2wELz
	cqMQ==
X-Gm-Message-State: ANhLgQ3wnlnMLO1JMEA1KP1NbFeSjXOL5Q92vhPD0mDQHQS2lo3PR0Ec
	x5KgJKw+EvOM1tAHmz6vqp+wag==
X-Google-Smtp-Source: ADFU+vvXeMfkxnwozOvSClxGpfRggmlQDhV1FlUQCx/8jAt5CSwqqSQQcTh9H2axKkR2VztTTCcOLA==
X-Received: by 2002:adf:84a3:: with SMTP id 32mr3149990wrg.378.1584661098102; 
	Thu, 19 Mar 2020 16:38:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z188sm2934541wme.46.2020.03.19.16.38.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 16:38:17 -0700 (PDT)
Message-ID: <c574ae14be64e888fd15102e7145c4d4867667ea.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Mar 2020 23:38:15 +0000
In-Reply-To: <CAMRc=MeF5beTkadXL6WGJhq-AsXTxu_4WC2c+sFeMqm+EsgaHQ@mail.gmail.com>
References: <20200319164403.29605-1-brgl@bgdev.pl>
	<21fcbda1e8b274ba75534159179ca9535c618d68.camel@linuxfoundation.org>
	<CAMRc=MeF5beTkadXL6WGJhq-AsXTxu_4WC2c+sFeMqm+EsgaHQ@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Jerome Neanne <jneanne@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: Re: [RFC PATCH 0/2] image.bbclass: support two-stage deployment of image artifacts
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
X-List-Received-Date: Thu, 19 Mar 2020 23:38:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-19 at 19:20 +0100, Bartosz Golaszewski wrote:
> If we'll really get to a point where we need to create a hierarchy of
> multiple levels of image deployment, then maybe we should switch to
> deploying each image right after it is created in its dedicated
> do_image_<type> task, then we could really fine-tune the inter-task
> dependencies. But we're not there yet and IMO currently it would be
> overkill. The rule of thumb for me is not to add new interfaces
> nobody asks for.

Going back in time I'm the person who split the image pieces off from
do_rootfs and split the different image commands into different tasks.
I did this for several reasons but one was we were developing new task
dependency code inside the image construction which was just crazy.

I was wondering about the option of having the image task deploy the
image earlier. I think that could be made to work. I think conceptually
it makes more sense architecturally than adding in arbitrary new task
levels to the existing structure.

> This also makes your argument about adding a third category purely
> theoretical: I don't see how we would need another category of images
> anytime soon.

I often think things like that but then new use cases come along...

> Please do - I'm open for other ideas. Just please keep in mind:
> there's obviously a problem with the current approach. I described it
> in detail and it turned out Quentin had encountered it too and dealt
> with it using a nasty workaround (fitImage deployed by the image
> recipe and not the kernel). I'd like to fix it upstream and proposed
> a solution that is IMO not horrible. I'd appreciate if we could reach
> a compromise that wouldn't leave us with downstream hacks.

I do understand there is a problem. We also have problems with people
not understanding the code as it works today. Your proposal adds
something else with is hard to explain to users ("Is my image simple or
composed?") and whilst we can and do add complexity where we need to,
I'm not yet convinced this change makes enough sense to have it.

Changing the way image deployment works would in many ways be much
easier for people to understand and makes the system more flexible
without adding problematic terminology.

> Please also note that sometimes "gets the job done" really is better
> than not solving problems. Just look at initcall levels in the linux
> kernel - they are similar to what I proposed here and serve as a
> surrogate for real dependencies.

We have piles of "get the job done" and also need to sometimes take a
step back and see if we can do something better. Right now I think your
proposal makes things worse and will be hard to explain to people. My
instinct is we can do better here.

Cheers,

Richard


