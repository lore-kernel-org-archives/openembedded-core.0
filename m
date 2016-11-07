Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 588D7719D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:43:05 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id q130so168992128qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MXf49/zFuEkr2ZnupDMZ53cTSigkvySN/z3CXsdymiA=;
	b=Xr2mREC2NQCOZKLFzIcgtw2ifvJMnDCWEM+fsvBxxAggBd9kBCaNArOLxOf1g2wFrt
	GOmYCv9KixEN4u+c6dFATSS2Qx/zWeeWDjTaCiB8JbyyyDsbbDvrTvs4hh+JpJMWZxoL
	nskxAgrpIqWSPxwiEZ070LpEiOlVzcJOc7TiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MXf49/zFuEkr2ZnupDMZ53cTSigkvySN/z3CXsdymiA=;
	b=e9iy28/SzXysHuM3yWlpI9wGce6QP2rUn5B73PUNK/Ypysxb3ZZeDY5fhBKvdHD94H
	s9ryEym+t9jfwAKb6UPAba+QcO/4TYosUAgPw3nqLTImTGlepqzrsOY8NrAcqDRW2efT
	7yp8PIe9HoxXWckBJAsD45OwjsdlLyo/0iBw2jUx7CHwoV+/Bl1CrzAbF9jtAVaFrX9s
	VavO8tl5/q77ptxjHGkLuVpcZ3vlaHmpLirgD1xtKQKKx6Phuzak5WTOokPdPA0nwnTB
	hvXkEvFqFMXJygs37K4oekuZSjDyeS1Ri/jWNApWoR6mxHLq8Fu21Mom4SkPVsJSwnr4
	fM2Q==
X-Gm-Message-State: ABUngvfh1In/GX3nM8RBJGBdkpGjwDNldLVpPpPGNsF7qXL/7sVJl7k8QalS5DV6mEWE//emF/In6JZbTClLnGl0
X-Received: by 10.55.48.72 with SMTP id w69mr6412926qkw.320.1478511786892;
	Mon, 07 Nov 2016 01:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Mon, 7 Nov 2016 01:42:46 -0800 (PST)
In-Reply-To: <CAJTo0LbiSBPq3ZHKmmHYpoM+GZWcOgDNyJy3-Cd4XhRxF9Lt1w@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
	<1478304597.3662.28.camel@pbcl.net>
	<CAJTo0LaKjNiFY3Z41Zk0Ln1fH_mLBF+hjKhr46+f3tewO5bTow@mail.gmail.com>
	<CAJTo0LbiSBPq3ZHKmmHYpoM+GZWcOgDNyJy3-Cd4XhRxF9Lt1w@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 7 Nov 2016 10:42:46 +0100
Message-ID: <CAP71WjyP-GE7evimye661zy-L4G7VdAwNX_8-6qOVSTj1y11eg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Mon, 07 Nov 2016 09:43:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 7, 2016 at 10:30 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 November 2016 at 09:28, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Ah.  I might (cough) have a hybrid stable/testing setup as I needed a
>> newer kernel.  I'll have a look.
>
>
> $ grep -r getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/asm/unistd_x32.h:#define __NR_getrandom (__X32_SYSCALL_BIT
> + 318)
> x86_64-linux-gnu/asm/unistd_64.h:#define __NR_getrandom 318
> x86_64-linux-gnu/asm/unistd_32.h:#define __NR_getrandom 355
>
> That's better.  Thanks Phil.

great. Does that mean that this patch can be merged or do you have any
other issue?

It's needed to get the android tools -native.. and we will need a
backport on morty too (but we will send that separately).

