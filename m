Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 01B2078A02
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 22:58:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so5777654wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 15:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s8EQUbRrOVvncpukmAIRG2Xjkpzr3+JeP5/GYXwGt/g=;
	b=aBWtwMDyAt2Knag3Y6CPBAx3sKnY+twwEVB9V0Wmj0msnbcRUrP9FPXVytFiwt6+UV
	vp9AWQUSP+6ao6EJjyOi+8b/Wllbl667ovGB9eMt/v41yz51FschUx+FVplJVl/Qws4/
	5MWJs+Au52KRK70GkEdYE3flPOMgxfNpCwBFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s8EQUbRrOVvncpukmAIRG2Xjkpzr3+JeP5/GYXwGt/g=;
	b=mMp/WKu2xgZn8g9G6+2JPDjHC/6dBQ2yVwTbMDAKg0pV10O3JrUyh57RwmRJKr0fRW
	kwL0CU42rTsTqSeevU8RHiae9goSvyg6RRINHTztbsAybUcsbL/mBQiaXrWv8O7KtuAC
	8YZel9XIkH6ePzwJAx+3ECVIcph+U9Fc4ceGg/ril9hyFz0xCmAM/b/hBPfvd//IryrC
	Ms+1NFDAVsTMySsnecnYeBV2HT2bORTaHWL0wMWLaw+Ca/JL1l8JFM4K8+DomzSScgNg
	vQNASiKLZFTdjn10D2mseRyTSfciVTbYXGzbbkdg9jQZx2MnoABcn1oF6+cLTGjBwhPO
	/y5g==
X-Gm-Message-State: APzg51A8/A82jdMK4BiFJB3mHEQjlDRz4GnNvcCWuIRKVsN+TRn0lqwd
	oppfjD8tLtH43JW7Ojhw2qlROg==
X-Google-Smtp-Source: ANB0VdavO9GjNHUwvK+0AXb77bAxMUznAsEZLtktvW3mDmU43g995ZP47aYXdvkObrun1OCW+I8DtA==
X-Received: by 2002:a1c:3a08:: with SMTP id
	h8-v6mr9710190wma.126.1536101912591; 
	Tue, 04 Sep 2018 15:58:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	72-v6sm78653wrb.48.2018.09.04.15.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Sep 2018 15:58:31 -0700 (PDT)
Message-ID: <fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 04 Sep 2018 23:58:30 +0100
In-Reply-To: <CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 04 Sep 2018 22:58:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
> I pointed this earlier before merge as well
> meta-openembedded has 40 odd recipes failing due to openssl 1.1
> upgrade

Sorry, I think I missed something somewhere as I thought the
indications were the bigger problems like qt5 were working now :/.

> http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50
> 
> so obvious fix was to keep them pinned to openssl10 and i created
> couple of fixes
> to start
> 
> https://patchwork.openembedded.org/patch/154517/
> https://patchwork.openembedded.org/patch/154516/
> 
> and the effects are showing up where sysroot task now starts to fail
> for dependent
> recipes here
> 
> http://errors.yoctoproject.org/Errors/Details/190427/
> http://errors.yoctoproject.org/Errors/Details/190433/
> 
> in meta-oe certain recipes can be upgraded and we can get openssl 1.1
> support
> but others like the two examples I cited above do not have openSSL
> 1.1 port.
> so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being
> able to
> co-exist.

The latter link is php 7.2 which should have openssl 1.1 support
(https://bugs.php.net/bug.php?id=72360).

For the former, libgdata doesn't have an openssl depends so I guessed
at liboauth pulling it in which does have an openssl 1.1 patch at: 
https://github.com/x42/liboauth/issues/9

Cheers,

Richard


