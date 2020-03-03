Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 341F5616EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 23:28:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a141so4688197wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 15:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HnPIqqFjdtJMB1tpNqRlYfS3OZAKVKcU2FR2CQ5Y+VM=;
	b=e2NMzDTlBspo+4k2LyvATImjwRV2gLt97V4q+IsAIlTIAznwNj+G/YH3sp8lx8IJ8b
	cG4o2eDj0yzM/MAB6pvv80DsTMw7knKfz0Be0gtLRScqnzgXH5hJkLJJtIPb1KsyWFOT
	TuiadHMuXBm5axmYtzlgTajqHzUKXOEVE50bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HnPIqqFjdtJMB1tpNqRlYfS3OZAKVKcU2FR2CQ5Y+VM=;
	b=Eqtl4ZMnOsyx+I8Y4M2shkGkLKxsp2tyOL1t2g6RtBn837zCf2Kz01QtUYVDu3HBbZ
	do37l4Zrx0qap3teduKIzYE4egHiKsGK0Q9kq8urqIiRWbSRDnRFF5Zg6nnAkjLxZ+bf
	uZxfXWuD7FhE7ULDOb7TkXWIw00itWlH+8mLMa3j/+5TGghinenPoURFuBDYVKZ4URGW
	C9Z3kKCaxLeSZ4I6hxMXA7baT5Z0zJKzo8/4nPfv4yIdkvqi3kjlZCW2gJ+2M61RRMG7
	UaHXxPDTWLBYum+68GZrVlDXLrvP6OmaZ3EIiqS1chzECIyc1/iUPiuU2DNXe9d9wMwZ
	cA7w==
X-Gm-Message-State: ANhLgQ1pdjnzpTHsbTkhwVORvfRpP9b8lJLrA/aluvwURANCrY0fTPxh
	I/4i3iT/BgIT4O6Wx26D3tyCgA==
X-Google-Smtp-Source: ADFU+vu3dWL7yNmZncJQc1x77vjWodhuKXptwgG+/JQ33mlr7yQgbck1m4AHkw/aFSce5xCo4IFqCQ==
X-Received: by 2002:a1c:a307:: with SMTP id m7mr40495wme.144.1583278085962;
	Tue, 03 Mar 2020 15:28:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a7sm37425063wrm.29.2020.03.03.15.28.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 15:28:05 -0800 (PST)
Message-ID: <94b6b796b1fef8eeb229cfed0e8467ef415d5221.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Mar 2020 23:28:04 +0000
In-Reply-To: <20200227205608.26788-3-akuster808@gmail.com>
References: <20200227205608.26788-1-akuster808@gmail.com>
	<20200227205608.26788-3-akuster808@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 2/2] bind: Update to latest ESV version 9.16
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
X-List-Received-Date: Tue, 03 Mar 2020 23:28:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-27 at 12:56 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Removed obsolete packageconfig options
> 
> License change to MPL-2.0
> https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE
> 
> Refreshed:
> bind-ensure-searching-for-json-headers-searches-sysr.patch
> 0001-named-lwresd-V-and-start-log-hide-build-options.patch
> 
> Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-
> lib.patch
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>

Do we need to upgrade dhcp too?

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1879
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1649

Cheers,

Richard


