Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C38276FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:17:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j68so393178pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=2ofeq4LbbQdNIQiq8StAtzDDQZRjrkAYqtT1r2u01SA=;
	b=McRhWgSSsYrEb2szXWWFvyGjny1XkMzf+pHEdwdOjg1invTbQjMV/FYPeKyQBchxxR
	jpxQ7bir2Gdss8X8uagiXfGMV3pTBiIvI6VbmhXDryVdjUeEyW2gCNYdBcR7i+Swx/Yi
	YpmAjzV62f2jB5mSmdYDJinwOeu2YpfZe1XPvjWA537ie/JScJBJO3ztHKfVKsk7XTVd
	8bPU7f3qL21PnlRVTCGybDxnRaK2MCwMeyV+JvRNufDljOxZui4Xa3sRUy8QZbWCJx4O
	KYsIXO6Q5VHmE6bWXxWzSIExqnxw1duj3fsdDS9kSuJTnNXDgsDL0IQfgygzfzXuFm9E
	t6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2ofeq4LbbQdNIQiq8StAtzDDQZRjrkAYqtT1r2u01SA=;
	b=Tl90M0F7xY5Fm1FvjI5YvbeoS2T9nK1Ps4vVPS1eEh9ecyY+twWh0Hzyn5jegslpqY
	JX+xuHuF4jDyDtb7TGhlojY6AGCwwZmYBV/gCi96wZ3roK98WAaYflN782IAP9WBFUT9
	Da+ASDhHFa1gMaOVDXEhTN2xDgPGGYYBpG4WqDi0Ch0yAXlNoyf26VgogbK4bm0pjoS2
	PmzdFwiXrdNWdDpHXmL9dRUsE7LATyq8KDhsYCYZG5wEZVMJyrp2/glraU5s/iOBtZLN
	7KIjLPms3xoD8PzIa9laoX0mCcEthhLdTy/LbV9j+m5UQygzv0fJBw5Ml/KOmORyo6X2
	tqjA==
X-Gm-Message-State: AHYfb5jPmgeCuqVl4oYG5tAN15/SOzB39+AVcPpVZELELkRIt/3zZQeG
	AGJt9EBCEuRK+h/U
X-Received: by 10.99.6.142 with SMTP id 136mr490900pgg.328.1502860622897;
	Tue, 15 Aug 2017 22:17:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:9b7:5cee:9e0b:bac6?
	([2601:202:4001:9ea0:9b7:5cee:9e0b:bac6])
	by smtp.gmail.com with ESMTPSA id v78sm35100pfd.121.2017.08.15.22.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 22:17:02 -0700 (PDT)
To: Alejandro Mery <amery@hanoverdisplays.com>,
	openembedded-core@lists.openembedded.org
References: <20170803223702.83936-1-amery@hanoverdisplays.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <25d7e91f-b139-a482-651d-e03bc652b47c@gmail.com>
Date: Tue, 15 Aug 2017 22:17:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803223702.83936-1-amery@hanoverdisplays.com>
Subject: Re: [poky][pyro][PATCH 0/1] backport IFF_LOWER_UP fix for 4.10+musl
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
X-List-Received-Date: Wed, 16 Aug 2017 05:17:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/03/2017 03:37 PM, Alejandro Mery wrote:
> From: Alejandro Mery <amery@geeks.cl>

merged to stagging,

thanks,
armin
> This commit cherry-picks a fix already applied to master and accepted upstream
>
> commit: 868486c238780ce4a11d9ec9a38e40cb6c1cfc01
>
> https://patchwork.openembedded.org/patch/141193/
>
> André Draszik (1):
>    linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
>
>   ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 46 ++++++++++++++++++++++
>   .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>


