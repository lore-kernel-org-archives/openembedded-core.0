Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86F4E605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 08:24:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d15so12305638wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 00:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=p38ktQ4GKMQnQ68eQUNBtPFZVPshUejPrF0tNE+Enjs=;
	b=c4sIs6aLQM/gwZrLZT9P4rLbvuRG9FMYKYauS6hM28N6hPu+aRHgUzW+uxCidvY6mU
	bBW5QRglW1eph+bXrlBY7smEL8Bi8uzYW4wAKkKr6WbEc9Qod40FMpGfCHiSO5t6TMIU
	vtxzp3jcyd9NrVj1r8uQ02PtbQ/yJzl5Swa0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p38ktQ4GKMQnQ68eQUNBtPFZVPshUejPrF0tNE+Enjs=;
	b=F638RrHgGirLWQ9NXvon6suUb5Z99R3gKqUb/GOqhGjuIGrdUiBYzC5S7rPLvPdPJh
	AUUqzx01wxq8lvJ9yQMrg0ADosJDoKR2Uv+ZLXytQNo7gt7ccbl29k0miAzVbg7ICw+u
	WuiHFu0pVPSi7QHFNeSx5JchtIKjPN4ReQUNkQRn7pBC7ePkqeorAosOLkMXZo5eWFx4
	X2NgEidiLnIyGDwSWInKgLC/HFPAHBiHSNmn7pC1+gskzT8h4Qi6FyPijzD6t+Zzzxft
	1ymD4E2q5VaPKUEcYIDht0x0duzq+pFbC6MSOVfRadOlL3kk6Ts8nhMkmgfFAF/h54WD
	5/VQ==
X-Gm-Message-State: AHQUAuaeji3inTH2Yi2Y5nZ3O339kBg8WrEAhG9LLzpoQckM+k+uNUQj
	yrDhY96f0P272a/u4Fa4EtrH4Q==
X-Google-Smtp-Source: AHgI3IbSZiQPvlsV7X9F43UwgGnIs1yFU61cbSNSoMOmEKCu0DRoOhjJ5JkILbhcUZHp+DkwEA0Grg==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr2885588wmj.151.1550305450062; 
	Sat, 16 Feb 2019 00:24:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm4750587wrv.20.2019.02.16.00.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 00:24:09 -0800 (PST)
Message-ID: <65094bcd2eb9cbd4bcff181e8e6976c893562bf0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2019 08:24:07 +0000
In-Reply-To: <47d7a2fb-57a2-1f37-25be-1140a2e038ed@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<5753a5096418e3f0800b7120ac4a6c5a75bac119.camel@linuxfoundation.org>
	<47d7a2fb-57a2-1f37-25be-1140a2e038ed@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sat, 16 Feb 2019 08:24:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 08:51 +0100, Andrej Valek wrote:
> Hello Richard
> 
> I have set-up new build (master-next):
> 
> Build Configuration:
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "qemuarm"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.6+snapshot-20190215"
> TUNE_FEATURES        = "arm armv5 thumb dsp"
> TARGET_FPU           = "soft"
> meta
> meta-poky
> meta-yocto-bsp       =
> "master-next:227617e923ce25ee266df51828ac4cce4524d95a"
> 
> Building tooks lot of hours from scratch. I have expected the same
> error, but build was successful.
> DEBUG: Python function do_rootfs finished
> 
> Is it possible to provide some more detailed error log, to identify,
> what's really going there.

Which packaging backend did you use? I have a feeling this is specific
to ipk and deb, not sure why yet...

Cheers,

Richard


