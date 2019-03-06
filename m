Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECEFC7C3F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 23:05:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c13so5467199wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KKcOs1IuEUTsxiGEg3retv5JoA6SZLoHxuQes/cTs+A=;
	b=d5Xk8rMSXImlicqRk9WvstscYOPD+cCPIbT4lDBslp4NbMCsSsralmX/ysKCHW9lu2
	UYUmGhnPY1XyC3ZEVHfNNhiGlUvwuGIIOLP9CZqPsjKqHz6NTI0IYu/yKf8ssUqNkqL5
	n5CohKIAG7zPNWVX17Sy0ciP3r12hlsEJ/wg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KKcOs1IuEUTsxiGEg3retv5JoA6SZLoHxuQes/cTs+A=;
	b=jEZ2Ee8WkRvOsWIwuLhxjY1JHG2xCKYvSsOiUHtEdZFhKWts6MB8K9Si7wxNwtl7sS
	20zoReV9lpKtS7SAtAx+ciczR/MJdehR6dtV/N6wZDpN6XAW86OHKJDUPgep5Z2zFarL
	cSVXakc4oXwFsD9Q1KrrghYSdIfZcLAOEtY59cBrmgd+cY8yG9iMLAbOx+mR2/4rhk2b
	EFj3f0fPBFwuD8x5ttT88IJRhNFG/+uA7O+wc1bxwhKoowFTeKo5eNDa/3N2eBvgFUo7
	UgqYGtDjX5ifvAYwp5i2bNq0RxW/MQ3LeBzMy1d8aMUYgDRmYfAoQ1NF2POX34mujvnl
	QRrA==
X-Gm-Message-State: APjAAAUkHNA7JBkrhOb/Ezh8WChdy1ocravQDQpPCFyXfXj0GeXxY25k
	BNr6PsrV8EE6GFuAvVTwxenH7w==
X-Google-Smtp-Source: APXvYqzhzQeVBPHH11+lkJ6VTsj+tDh9mWkf6Dp8OCQDHm61f/BeeB1OlTlzSMGQtZMCLrS7zz4XGw==
X-Received: by 2002:a1c:e0d7:: with SMTP id x206mr3898815wmg.152.1551913556546;
	Wed, 06 Mar 2019 15:05:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m15sm1884658wrx.30.2019.03.06.15.05.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 06 Mar 2019 15:05:55 -0800 (PST)
Message-ID: <088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Date: Wed, 06 Mar 2019 23:05:54 +0000
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Wed, 06 Mar 2019 23:05:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-06 at 11:37 -0500, bruce.ashfield@gmail.com wrote:
> The -rc8 of the kernel pushed this out a week longer than I would
> have liked, but luckily the -dev kernel has been running 5.0 for
> quite a while, so most of the issues had been worked out already.
> 
> In this series we have the bump of the libc-headers to 5.0, I've
> built all arches for both musl and glibc, with no issues popping
> up due to the headers bump. A few patches were dropped, since they
> are now upstream.
> 
> I've also introduce the 5.0 versioned recipe in this series and
> adjusted the two machines that still have a preferred version to
> use it. Again, this was built and booted on all arches and over
> several image types (minimal, sato, kernel-dev).
> 
> As usual lttng was tweaked to work with 5.0, but I was able to
> keep it on the same 2.10 stable branch and only pull in a few
> pending patches that haven't been formally released yet.
> 
> Once we get the h/w reference boards, and reference distros moved
> to 4.19 and 5.0, I'll send a follow up patch to remove 4.18
> from master.
> 
> I'll send follow up patches to the yocto-bsps and poky as
> appropriate, but until the last few issues are resolved, they can
> stay out of tree.
> 
> I captured as many details as possible in the commit messages of
> the individual patches.

Thanks Bruce!

Just to summarise where we're at:

a) The runtime stap tests fail everywhere, we probably need systemtap 
   patches.
b) Issue with KMACHINE_qemuarm = "qemuarma15" not working, blocks 
   qemuarm armv7 switch
c) qemumips and qemuppc:
   https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/365/steps/7/logs/step1c
   https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/365/steps/7/logs/step1c
   RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED 
d) perf do_compile race seen on qemuarm64 (didn't reproduce locally):
   https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/366/steps/7/logs/step1b
e) qemuarm64 graphics startup issue

Cheers,

Richard


