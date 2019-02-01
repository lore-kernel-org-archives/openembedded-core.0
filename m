Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8097C7C4EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 15:11:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a62so6459683wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VXqOMuQjNKekqimtn7yjpOjyjrOdevxRNuzDtU4n1U0=;
	b=Mza6onYrSMFDKLc+ZbXSTxmw3ysI2p6KFfoXBS/EWP37z3EXCkkkD4yqIQY7auVkWd
	ICQlZohnTas41He8Yta3vCOR75CW6c2J9tMSAO1FhETn9e62zrptH1KXXesjkwhzHBhZ
	lHFTUYg9bbYQ/hWboPjqLSFR7AyuKul6rY6N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VXqOMuQjNKekqimtn7yjpOjyjrOdevxRNuzDtU4n1U0=;
	b=A6hEBWrb/BmD0qEsi7kuB50qbeV1yIpv3Va8K+8F5Vim4UrZTkKugtXOGR8ftVaPW4
	CeX4ZPOTbBB1IoKeKJvz7AwGrYGGUnLu4WI8wsuWMIKgHLkwEhFu3T6+/KrWa4CgP+o8
	vhTCUToDhDFipWooYtwOjAiSTUDwY8ecGcaKh2XmIZhS2lcVI+1G2TFS+NhFsp147X1O
	zyrnbICI8athLOIAPUE3btnqmLdZL4sza0USFK+bNAN7afcmTrj6XvKz746BIAHEcUIo
	ufg9veFwmXc6C77PPAezjZXTAT6iPdI1WdIdE3FjwLgs6Rwhj8ZkhvormEgetk/7lSn7
	ojiw==
X-Gm-Message-State: AHQUAuaT/KhUB608AxMInPYMzpJg1A3h5l0iVyGSZan3iuwnfMkepfGm
	iPhQZIidlj85dHcFU9OjSnFZZw==
X-Google-Smtp-Source: AHgI3IZI3fT3hUObQEpG/97aI4nOQfAbNyHgFscLyh7zzBJAFwoFxPh0bBhtrHhFK/U7NDe8RyCyFQ==
X-Received: by 2002:a1c:b70a:: with SMTP id h10mr2720074wmf.125.1549033908125; 
	Fri, 01 Feb 2019 07:11:48 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h62sm3011177wmf.11.2019.02.01.07.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Feb 2019 07:11:47 -0800 (PST)
Message-ID: <bdd564e02f5ce563143324988dbb78d8ef363c1c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 01 Feb 2019 15:11:41 +0000
In-Reply-To: <20190131065016.21887-6-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
	<20190131065016.21887-6-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 6/6] llvm: Upgrade to upcoming 8.0.0 release
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
X-List-Received-Date: Fri, 01 Feb 2019 15:11:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-30 at 22:50 -0800, Khem Raj wrote:
> License-Update: Copyright year updates from 2017-2019
> 
> Refresh patches to apply on new version
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ryInfo-Undefine-libc-functions-if-th.patch | 28 ++++----
>  ...-llvm-allow-env-override-of-exe-path.patch | 66 +++++++++++++++
> ----
>  meta/recipes-devtools/llvm/llvm_git.bb        | 25 ++++---
>  3 files changed, 83 insertions(+), 36 deletions(-)

Nearly, but:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/248

i.e. mesa needs its dependencies fixing/testing

Cheers,

Richard


