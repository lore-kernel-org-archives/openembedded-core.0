Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20F427DB05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:55:13 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g3so4547952wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=dkIKcv4xCASNsdz117CNzoctwgh5SchZ69dy2DYGRZU=;
	b=XCi88bBsQihPSd1RWBrghYre/B4XDj/2Iaft+UQ9S2TMHgkAhSk0eMhy8xZ3GBY12I
	hpZLHIpgN8DuLkHmT+ePpLlV7iHyhi0l8jKCSDek9U9eM8JRAlHkTZ+Gbos3eiOn1LFF
	QuW04N0CAYjl/vviwEEjndpCypZDlhkKJ1RLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dkIKcv4xCASNsdz117CNzoctwgh5SchZ69dy2DYGRZU=;
	b=iBFKL5ODD26xPZXNWdg4UN5fLCrdd9MpC6Gcj2U0eo9T8txZLjXR1ycMinBxMX/VGQ
	jAtA8stLoWXpim6NKa2it7NpAuhWaJ2/ZS/AubfqQC4ku7MmM9cixshQMkGrPLFeeLDe
	9A++AUkbB40pADhJp5khSvmevqWt92GG8B12gY2YxU/jR+c43oAqz6s0x2Xk+k7yps2E
	3pQoc8Q5MqJv9+qIdznH0dIPfFsvP14b4fgk6yAgkIjDnZU6yYXQttmd9p2xFCHo99Ou
	uHcGpEIHLSNS8QtsMuLV2E0dvrXX8MAAnkLwmap3C9A6ePk00Gkcw7Y1YTPYb9BPW5lo
	X9Hw==
X-Gm-Message-State: APjAAAXbeJxD7Lx37ZXfKnMW+HyF7fgyOo0xpUZUcChiuoZsg/PjoU9f
	BHASAhErjV2TmEBImpftjbKApQ==
X-Google-Smtp-Source: APXvYqwlYKnh6f7VYB6+BWKMgsvZ82qFiuKifY7qG70YX4b0UD8jgUjVmSNKS0ce4KXM7/E3+ntKQw==
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr9846669wrs.234.1556286913950; 
	Fri, 26 Apr 2019 06:55:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z15sm17712820wrv.80.2019.04.26.06.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 06:55:13 -0700 (PDT)
Message-ID: <c05b9ebe4d9e79e34897851477e3c9b2a9e7602b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 14:55:12 +0100
In-Reply-To: <20190425135557.8967-1-fabio.berton@ossystems.com.br>
References: <20190425135557.8967-1-fabio.berton@ossystems.com.br>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [RFC, v5] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Fri, 26 Apr 2019 13:55:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-25 at 10:55 -0300, Fabio Berton wrote:
>   - Remove all non related meson patches
>   - Change radeon driver to r100
>   - Add python3-mako-native gettext-native to DEPENDS
> 
> Based on https://patchwork.openembedded.org/patch/158748/
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

I think this breaks musl at runtime:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/538/steps/7/logs/step1c

Specifically:

[     5.224] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1

Cheers,

Richard


