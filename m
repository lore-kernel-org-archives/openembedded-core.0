Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 84B6461A56
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:41:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id a141so6871552wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=VY+m3llMpu+YUIoxKITMGoeIs8AJXUuKAr30FBSpSJs=;
	b=ApzSCihtzf4V9zpBnm8N3wvc7MD/rLjAAgtYmkHzH4hdIm62DNFxHK7DC14WRUHCY+
	aTm8f3122Ef/DJZXRfqTU6dzuyJQvAp8xZyuD189AAKjRkQpcO8D8GmczsrKnkWtK4HY
	TyIap2+iWuPKFXUaA0YLyZzj8p+908M99f3WPBhKp/yCTtMPO1BI1vVp/9K2z4nxcLoE
	4VDH6RJ9DoSaVXbrYiafJbyTea3nEfVYRoofuGBVJBqeqKKnexGr10C5Zoa3N0Af1Ql8
	pb5uGpQP7d/Slm9Lc6C0/1nV71k4Zl51itu3yWGEATgRVE/8f6u8Zo/QvqGCW4ONmUO4
	WCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=VY+m3llMpu+YUIoxKITMGoeIs8AJXUuKAr30FBSpSJs=;
	b=ki+YNhmnPr4ouZEXo+yEq2W/i1J3s3DRqoXXASSxaqYFXMicYUYc2ZUoTDBBTuhq/X
	72HV3RLJGEhU00l3cPNhtL1FCYLWAcMUzfiw58u+9GlLgzjbIafjuVv07w6cehdbYAd+
	UGfQewOpI/XGEwmuKv6camp/4RXiw+9Dh5bi4EIa4IQEn5Sr5jBAFEhSxHcgzJtZUgTV
	zQSA/N/igDrU2h+hFDEhbqNL2m9DSI/zrHrQ36FfYOzHfpAAwt70O07epKk182XZpJyx
	q1QX4qTtUMYGEV4EUb9RNl8tv525OIfTy1wFEOMpSs1yeYwNh3o1i+Bu5QJKM/ruOpFC
	viLg==
X-Gm-Message-State: APjAAAUX3LmW/fKpdpCR5cWIPea7TcQ9Z0urb7/Bm0BDowL/+DY2oiCA
	ns0pL47fbImJdV5kUVM0v0zt3lDfJWk=
X-Google-Smtp-Source: APXvYqyNk5DMpohI/OrctOI8QOMEpxc7fpQ4aHBCfxsGHNOJKbu1T2OEwur3MQVo5wceHKxr73+wVg==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
	x6mr10742060wmj.177.1583001685789; 
	Sat, 29 Feb 2020 10:41:25 -0800 (PST)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	x15sm6098899wmc.20.2020.02.29.10.41.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 10:41:25 -0800 (PST)
Date: Sat, 29 Feb 2020 19:41:23 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20200229184123.GC13422@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200229165146.1446912-1-petr.vorel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200229165146.1446912-1-petr.vorel@gmail.com>
Subject: Re: [PATCH v7 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 18:41:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Removed ffsb copying file and associated runtest file fs_ext4
> (both removed in this release).

It compiles OK on my workstation.
$ MACHINE=qemuarm TCLIBC=musl bitbake ltp
...
Loaded 1305 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.44.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "opensusetumbleweed-20200226"
TARGET_SYS           = "arm-oe-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "nodistro"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "ltp/20200120.v7:adbe622d75374a2dcba803c509ad6d43515c40d8"

Initialising tasks: 100% |########################################################################################################################################################################################################################################| Time: 0:00:00
Sstate summary: Wanted 299 Found 1 Missed 298 Current 99 (0% match, 25% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Tasks Summary: Attempted 1512 tasks of which 878 didn't need to be rerun and all succeeded.


Kind regards,
Petr

