Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3614E78F94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:01:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so722337wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qSk8NQl1ypf75q9zfgCGDXvdFhBLmdEWQz0h+J17gdw=;
	b=HLLJh/6bEjgLOfyyNrcsmFx17+lJVQwQv9b6m5AxMimV6h2U9NE+jVa22UnRzHlpZA
	NK4HwzPxbvW1Ke+JfEqU0kZ1lrIvV8zeAV2HfJ0DvMLr3rzXs78wF4xOdCYFzWeKopcN
	18XF9Y1W3GwkGjfA96WiaLsGJA5vVMtiwOFnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qSk8NQl1ypf75q9zfgCGDXvdFhBLmdEWQz0h+J17gdw=;
	b=Gng/R+zzZF90To6nBZEbTu0naHYWQq/1+HTB2JGXshVDS0fckoW/enbRe5hjjAzCZP
	9qy/zFLrCOuoCrow+g/FlGtuyvlpSQKUFVUlEVFog313pnqTQQNvbUU9TG8Oo7BAcq0/
	BlAMgutaZgL9xxNmR22ZyXRkSGJTA/h2Ira7EuJCaoieNRoABowSp/a8lVItVIOVc48O
	H+JCG6MOvmOWLX9DKCMrMkrYKq6sw/b8U4uBtgy8yShI+fBH2FJmvjhlYSbM5mju4A1T
	BdN3FCvxUI0r9xxkaNtRe1+79wdb1fgEMH1Y1Q7JG1IBbAX517nl/rODGmqh8XSm3xrs
	IIBA==
X-Gm-Message-State: AOUpUlE75NExH9RxO8mIUI0xmxg/EaCo6LpYaq+MQrJVzrF0ZdkX99FA
	aQBLXb5Z7dnMxSiqM2Fa72qbgQ==
X-Google-Smtp-Source: AA+uWPxcwZQlLd4PdmlgoreIAhLcIkkvqp21mB7qkdJKh9ReNZaJJCpvcG2FCR3EOs47iaUlpwHDHQ==
X-Received: by 2002:a1c:1bc2:: with SMTP id
	b185-v6mr14246363wmb.160.1534323689775; 
	Wed, 15 Aug 2018 02:01:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r13-v6sm548799wmf.35.2018.08.15.02.01.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Aug 2018 02:01:28 -0700 (PDT)
Message-ID: <5e2ac02ecd801f891a0c796051dabe801a93fbab.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jens Rehsack <rehsack@gmail.com>
Date: Wed, 15 Aug 2018 10:01:27 +0100
In-Reply-To: <C921E0A2-1F37-495E-982B-AB1FCEBBDB6D@gmail.com>
References: <33B9AF0C-D9AF-4714-B28C-F45A66E398E7@gmail.com>
	<6b107e710448191ecc7f638891dbf1837dbd8e8d.camel@linuxfoundation.org>
	<C921E0A2-1F37-495E-982B-AB1FCEBBDB6D@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Wed, 15 Aug 2018 09:01:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jens,

On Tue, 2018-08-14 at 18:37 +0200, Jens Rehsack wrote:
> I tried:
> 
> $ bitbake libxml-parser-perl-native nativesdk-libxml-parser-perl
> libxml-parser-perl
> 
> WARNING: Host distribution "ubuntu-18.04" has not been validated with
> this version of the build system; you may possibly experience
> unexpected failures. It is recommended that you use a tested
> distribution.
> Loading cache: 100%
> |####################################################################
> #####################################################################
> #############################| Time: 0:00:00
> Loaded 3693 entries from dependency cache.
> Parsing recipes: 100%
> |####################################################################
> #####################################################################
> ###########################| Time: 0:00:01
> Parsing of 2421 .bb files complete (2417 cached, 4 parsed). 3685
> targets, 100 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.39.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "wendy"
> DISTRO               = "gpw"
> DISTRO_VERSION       = "1.0.0"
> TUNE_FEATURES        = "arm armv7a vfp neon callconvention-hard
> cortexa8"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       =
> "master:e82d2edca398c392309713577859724900b20190"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
> meta-webserver       =
> "master:0691e134bf938e0712cf14d3a441bbba04727cea"
> meta-cpan            =
> "master:7ddb7aae38ad9c8fc850026de6636fbe2a4aabdd"
> meta-jens            =
> "master:92863f571a9b64aa5b6c6866db9eb0c8972a546f"
> meta-gpw             =
> "master:8679df6ae6a22b15bd4127c838915dcf087bf614"
> 
> Initialising tasks: 100%
> |####################################################################
> #####################################################################
> ########################| Time: 0:00:00
> Checking sstate mirror object availability: 100%
> |####################################################################
> #####################################################################
> | Time: 0:00:00
> Sstate summary: Wanted 155 Found 0 Missed 310 Current 96 (0% match,
> 38% complete)
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 1007 tasks of which 669 didn't need to
> be rerun and all succeeded.
> 
> Unfortunately I don't have a SuSE based build machine nor a
> reasonable MIPS setup to test - but can you please describe what I
> need to do to reproduce that error?
> Further: Ross complained regarding patch corruption by Apple Mail - I
> resent the patches on August, 8th (you replied that on August, 6th)
> using git-send-email. Did you fix the corrupted patch before?
> 
> I really want this thing being fixed - does it occurs anywhere else
> or can the reason the missing "--sysroot"?
> 
> When I restrict the additional sed commands to target only, how would
> that affect the nativesdk?

I was able to reproduce this if I move my host libexpat out the way
temporarily:

mv /usr/lib/x86_64-linux-gnu/libexpat.so{,.hide}

then:

bitbake libxml-parser-perl-native -c cleansstate
bitbake libxml-parser-perl-native

The issue is that some of our build workers don't have libexpat
installed and the linker isn't finding the native version, presumably
as the native case needs the -L search paths we add.

Hope that helps reproduce!

Cheers,

Richard




