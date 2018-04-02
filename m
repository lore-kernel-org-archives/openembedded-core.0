Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD7260234
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 21:57:08 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id q84so19547636iod.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2018 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=RIG+pkZf7ZbK0wrdRg1HXOMw5BawFQjD3TVzK06XC7o=;
	b=vcnXsnDYyP2QOmtBkqNHZdUjVwomLfmozCw5ZoHZsMCq7MV6qYiMVJ8JREwec+y7aV
	szGmEX63LrS9+n7QMG1pNDmV4NTRIMEhuf2CPytbtVI/u3vLshrJZ5lhc+ds89Z9FJY/
	Bf8+4NbSTounLlVSCs3gGxlAhiGHGyG5fGcuWnSSpIW8a6GOJs8Jb8EOiqFefvsgFdAK
	Oi5J2dotSUhXlm2yp6GdtdQYNIBCVBwJBmNVkNHPpjgxEdjMli1y8l/1iwv3Z570+pCV
	8c6w9NRf0BgO7Xu1gek05PtxaknDbalglXQ28nRb77rJk73VMFq7fv9OBbXEgzTaGJpj
	LbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=RIG+pkZf7ZbK0wrdRg1HXOMw5BawFQjD3TVzK06XC7o=;
	b=sXx4vAvPQ6ZLaF/8KIY35L4XM7Bpvqgau80lWLwqlfAnfTX7jxqVVjjR3UnTDyUBzJ
	iBKWsXj2uo6wy4Hjo8agIt48XcvjeeXn8DPO08AygGYam6aXFW3wutz9mWHow6ijTQCC
	GBYa5H1aT9sbPD/y6WgjYeJOu1R6q6i/xyKadMF9TJiLknxxgG6hUXu8U4sONhE5JHbA
	1m791oX2YFmZ/65tMSczSJ/SrVjP0RJBv6dFjY5uzCC18rC278IDIpabXXdgDx1YzDyD
	ERKc88WEboJVZ34lr5hE7p12XS6JuC1DzgglhbRw/mTBRq1ixwNFsKfNZSAfvtV1RuG6
	MdOg==
X-Gm-Message-State: ALQs6tAmFJxCmTPllqjniEHSM7k4IMe78enwOP1tcE2ukyBwasEnHURt
	Yi6Z2bA0KYJxj8uHH5JifVY=
X-Google-Smtp-Source: AIpwx494njkJWUd3LXPWabAxHqIIr0FasIz5Wm2mOU+T28Ex/byVEqZSwtghJeoxKjl173AnjcTyGQ==
X-Received: by 10.107.137.158 with SMTP id t30mr9667555ioi.230.1522706229383; 
	Mon, 02 Apr 2018 14:57:09 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id 18sm622413ios.71.2018.04.02.14.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 14:57:07 -0700 (PDT)
Date: Mon, 2 Apr 2018 17:57:05 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20180402215705.GA25121@linux-uys3>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Mon, 02 Apr 2018 21:57:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun 2018-04-01 @ 11:49:58 PM, Andreas Müller wrote:
> When running bitbake -cmenuconfig virtual/kernel I get a flood of
> undefined reference errors. Am I alone here?

Sadly, I think you might be.

	$ bitbake virtual/kernel -c menuconfig

works fine for me.

I assume you're doing this for something RaspberryPi-ish?

	Build Configuration:
	BB_VERSION           = "1.37.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "opensuse-42.3"
	TARGET_SYS           = "arm-oe-linux-gnueabi"
	MACHINE              = "raspberrypi3"
	DISTRO               = "nodistro"
	DISTRO_VERSION       = "nodistro.0"
	TUNE_FEATURES        = "arm armv7ve vfp thumb neon vfpv4 callconvention-hard cortexa7"
	TARGET_FPU           = "hard"
	meta-raspberrypi     = "master:63e53f919089027259a513dc2cd4b140789bf1a3"
	meta                 = "master:4cedddb83623c79980b354642dfeaf78218ca4b7"
	meta-oe              
	meta-gnome           
	meta-python          
	meta-networking      
	meta-multimedia      = "master:b9d1d8718834f7287e5a65373b952cbfe9ce83fe"
	meta-qt5             = "master:e60e849de1158c879bd2c150fe79b207cdac031a"
	meta-qt5-extra       = "master:a0cf057b2f335e8d2be9180f20770773334ec209"
	meta-realtime        = "master:250bc6eaa47e550c1db5e2b0ebd42d86ee43650e"
	meta-browser         = "master:d1c902440cba26a9d1271cfb914633c68ee3791c"

