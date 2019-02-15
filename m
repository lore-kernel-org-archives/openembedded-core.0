Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E886E7C710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 09:54:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z84so1823442wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 01:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=MYaCyKXPJ7yJQefXh6SywtcMmKShyJB5z0r4VUpessg=;
	b=dr/E1M3iLYgdVkW1ETJgP19ACiqzE9TlDlAIb8syRkBvij1ky+UtqWe7rNcxpolGnH
	vadWDjeOqRuXT7kggE33mVuablGSOBNAscsX5VHiqW6tyoRzK6KN8qc5Ah05y25GMih0
	PqDqD2V5b+lqH+ax7raG5N7rc/tg37HId0q9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MYaCyKXPJ7yJQefXh6SywtcMmKShyJB5z0r4VUpessg=;
	b=uiRRO56qf+p993lldtLVwFnS2MRDtPx3YLNhKbDFl74wRZnyRhrmhBDFjbmAurHvw5
	8ZSgljDHu6Lm+mFaaLduTQtEwqKFAhQ53geOEoq0Zu+2qjr60YPS3dTACQJb0mPRddz6
	hk9YSbh5SY+JOLan9MgnqOHJLoGdRmXXsaI3SAmW6o0MW/o6V2d6QrqTQ8SJGrC9rfah
	BI9DWmZkJMkFinHA8wY8Esm+6gSMvtSIw/YTkY1nLgwdNu6ctAiEsVeMrSuVim3wegdh
	4m6dVQovV5oltoO0ozHhpOyd0YiGam8dx1YSWvvyPvm3ZHKPDrMbgcgrNvgTERLypXwY
	GrCw==
X-Gm-Message-State: AHQUAuZxB/Jyg+cpD3SrcdMnxA3yfygI9TuuLQ6qvfp/oStKmEfVJyZu
	bhn61usLvWimr7RrDnaRRfDizw==
X-Google-Smtp-Source: AHgI3IbIY47naOHs/4jPTnEinyI0nANusSxWWkAikli63qMCvrw+LlZzaD3fSD3Vt2M3CRsfkQzNyA==
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr5917318wmk.152.1550224451518; 
	Fri, 15 Feb 2019 01:54:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm2862274wrw.39.2019.02.15.01.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 01:54:10 -0800 (PST)
Message-ID: <b4ef5c60f8cbd104d635965b7e2243734e356cc3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 09:54:09 +0000
In-Reply-To: <20190215073207.30036-2-anuj.mittal@intel.com>
References: <20190215073207.30036-1-anuj.mittal@intel.com>
	<20190215073207.30036-2-anuj.mittal@intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 09:54:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-15 at 15:32 +0800, Anuj Mittal wrote:
> * For changes, see:
> https://www.mesa3d.org/relnotes/18.3.3.html
> 
> * Convert from using autotools to meson and get rid of unnecessary
> patches.
> 
> * Include a patch to fix detection of host os combinations that we
> build
> for.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

This is good but I think you and Alex may need to work together to sort
out mesa-native which fails after this patchset and is needed by the
virtgl work (queued in -next).

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/221

Cheers,

Richard


