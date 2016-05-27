Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6680071951
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 13:53:05 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id xk12so40359672pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 06:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=zAoJ6TnmnxcFuI1ejrcFHJXj1wMB1ETtYb8lhvMnqn4=;
	b=iGcdct4XT8spChQO939w02QdbuKa2ysy9nKuWBoSzI/2fgc9jDHXH+CaSRWyDdguQX
	bzdHGaDklQJ7Jnt2j3PptaF7DZDvV3wmiSahFKc5b+lbt6MNBbMAa7r2gFvCJvcYvzNP
	+AvkUE3G/sX2KFvszWwPCGB+V7qG8LiFAj9EzHvun+M5DraUN47y9GuKw1yWfY83gGbK
	V7Qc2+OZdmxyBE6Q7EShOoimh1GQOQ+Jxd3lrnbdacfc079lRfUv7Lr4mGtuWUYz47zv
	lALBUfCJv6mNVhUw7CSgrulPLSeW9Sukw896Yqo75kS+8B7BRwswKaa1eMk3U/rbH28Y
	NJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=zAoJ6TnmnxcFuI1ejrcFHJXj1wMB1ETtYb8lhvMnqn4=;
	b=KxosSGzWE20BLyJPllH7t+9InPGoX18LbakoWSxlVoUM9M7np5E0vIbTMCEN4Q42cb
	8n0RMIlISyTJek2EmJo8BWHtSZr5LezyHRa0SdOJMNNAl8K93PhJ3UrqS/nz8F5plWWK
	xTA19FHNeoc3Yn2x+3y7m1qJKLuJiQOmJi8lrE4UCJtp+vocg9re8P2YqaaVWOhJo7xW
	FFoT9RLtC3si1W5LtILVIGLxBuR0zQtXNa46LTQmTAhK58M3e8IFENhUw1S0KVJyoc7/
	0zubJVLwIZlwPTKsBpDN4fiRjofDTldf8WOHXGzFZiA0f2LJu5OdDF7wMONoSgUE64l+
	fkYQ==
X-Gm-Message-State: ALyK8tLuEr8Cpe1b/IqpAnM6z3/xgUxF2BHpDHeKfEefpLMFKfSir+KhudXLuqN+/JoqZw==
X-Received: by 10.66.66.234 with SMTP id i10mr23072762pat.114.1464357185774;
	Fri, 27 May 2016 06:53:05 -0700 (PDT)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	x19sm14042779pfi.81.2016.05.27.06.53.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 06:53:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id b124so42148169pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 06:53:03 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.104.133 with SMTP id d127mr22730538pfc.112.1464357183570; 
	Fri, 27 May 2016 06:53:03 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 06:53:03 -0700 (PDT)
In-Reply-To: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
Date: Fri, 27 May 2016 10:53:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoccCkbF1Mv5VfC2OH-TFGPRkcW6jgGqd_7Hkkog2b+_g@mail.gmail.com>
Message-ID: <CAP9ODKoccCkbF1Mv5VfC2OH-TFGPRkcW6jgGqd_7Hkkog2b+_g@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 27 May 2016 13:53:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 27, 2016 at 10:43 AM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
> Upgrade U-Boot to the latest upstream version.
> Add a patch to unbreak build on some toolchains.
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> ---
...
> +++ b/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
> @@ -0,0 +1,48 @@
> +From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
> +From: Peng Fan <van.freenix@gmail.com>
> +Date: Thu, 28 Apr 2016 10:07:53 +0800
> +Subject: [PATCH] video: ipu_common: fix build error
> +
> +Some toolchains fail to build
> +"clk->rate = (u64)(clk->parent->rate * 16) / div;"
> +And the cast usage is wrong.
> +
> +Use the following code to fix the issue,
> +"
> +  do_div(parent_rate, div);
> +  clk->rate = parent_rate;
> +"
> +
> +Upstream-Status: Inappropriate [comes from upstream's branch]

Is this a backport? If such, please fix the value.

...

Besides that, it looks fine :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

