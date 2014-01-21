Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5523760155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 09:40:34 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id e4so5293221wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 01:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VnOGwycEPg4U7U1c0mhLcIUq/re0kUzDC1Ocnt9O+TE=;
	b=G5OPenPwSvGGb6X1Ir0i4PtcR6rMSjTq/gFMQA7tRIlHVgWcBo174cOmng/h6ZsK+h
	aNveibOQxAQOCvdPA9UmpIJIpctbzApzCmK0ZwlqAPxxeG9ln6A6QNYz/STtBrpB1OFR
	EMXpCodfINPIKfF1AxjD4VuctSWE4107hoRS7itxbF6nsZdgSS6W9yahHlzH0l6POesh
	oKlW42RflXH1zlDOJs9Y5+ukNEzKElZqM8jpdTVJKRWf1MkpQbaoLQ6KliTJ5BxZvH65
	H9fg2ZLPlKEf2IiOucGE6XQCbtRszFwuj5V4+HLIV7bqUqqPMyHwBQZdH6t9HKFDhrkK
	n1qw==
X-Gm-Message-State: ALoCoQlG1dQ5gqey9wk8jVd8DRt/kDXtENmZUrVGz8urPnLxeMY/pgtNvLZDGmNe4GmJlIpkfIqi
X-Received: by 10.194.2.70 with SMTP id 6mr18154484wjs.25.1390297234530;
	Tue, 21 Jan 2014 01:40:34 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id z1sm6641754wjq.19.2014.01.21.01.40.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 01:40:34 -0800 (PST)
Message-ID: <52DE4091.8000104@linaro.org>
Date: Tue, 21 Jan 2014 10:40:33 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>	<CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>	<52D7A5F0.6090501@linaro.org>	<CAP9ODKq+XKYP3ae=2tFdj5BATBUHUt6E-Wq8SzMpPebt9cN51g@mail.gmail.com>	<38155A0E-22FF-4A3A-916A-5C0D2C256AA9@linaro.org>
	<CAP9ODKoLqJ63=wKJpbE3ezEN2QXO0We_yJcmdRL9qoCc0zp1+A@mail.gmail.com>
In-Reply-To: <CAP9ODKoLqJ63=wKJpbE3ezEN2QXO0We_yJcmdRL9qoCc0zp1+A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Tue, 21 Jan 2014 09:40:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2014 11:47 AM, Otavio Salvador wrote:
> On Thu, Jan 16, 2014 at 8:46 AM, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
>
>     Op 16 jan. 2014, om 11:38 heeft Otavio Salvador
>     <otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>> het
>     volgende geschreven:
>      > On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi <koen.kooi@linaro.org
>     <mailto:koen.kooi@linaro.org>> wrote:
>      > On 01/15/2014 12:22 PM, Otavio Salvador wrote:
>      > On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org
>     <mailto:koen.kooi@linaro.org>
>      > <mailto:koen.kooi@linaro.org <mailto:koen.kooi@linaro.org>>> wrote:
>      >
>      >     I've limited it to 64bit targets, but to be honest debug
>     splitting
>      >     doesn't make sense for grub since it won't run in your rootfs and
>      >     attaching gdb is pretty much impossible.
>      >
>      >     Signed-off-by: Koen Kooi <koen.kooi@linaro.org
>     <mailto:koen.kooi@linaro.org>
>      >     <mailto:koen.kooi@linaro.org <mailto:koen.kooi@linaro.org>>>
>      >
>      >
>      >
>      > I'd prefer to remove the debug systems than skip the split. What
>     others
>      > think?
>      >
>      > I'm not sure what you mean by that, do you mean using
>     INHIBIT_PACKAGE_STRIP or something else?
>      >
>      >
>      > Yes and be sure it has been stripped during build.
>
>     That seems to be a lot more work for the same effect. Stripping
>     isn't the problem, it's debugedit trying to do its magic that fails.
>
>
> Well, if not stripped the symbols will be left in the binaries which is
> not expected.

I've looked into package.bbclass and it's a classic case of code not 
matching docs :(

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

