Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C859079F8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 11:57:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so5198080wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 03:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EGAGk7u+2bl27UBIlwnk8p0LHWBcGwqeviTO7gEMsew=;
	b=YPxVduwRlh1IXqgr9JX1Qdeqn0U+TK5vJlkC4yQrwiMXFDntVSRr6XsKJLqudIcdcG
	QBjuD1GoorP/OHvGcqKSsrfUiE6S6vAMXg8rl29ZvzifNA8ce58nD8d9fDcn+KcT0IzF
	Fhp33Jx631Wn7WajbJ5RIn8misGK+D3CT2vqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EGAGk7u+2bl27UBIlwnk8p0LHWBcGwqeviTO7gEMsew=;
	b=IzI7AcqVpT5WF92A8teRlyr5hxJUx8+2jQDDGewL+zqZDaiJthCXmu3oko6R+s1CnW
	YW7La10W027pBGq/MVDmFf78jxC9Dfv7imU/9YEkj3KtbRc4MpnmKMS7hU/JBvi+4GrA
	D58H+A3bEUmMh9P/bCdSNRvO13FOhjp/CxdYMWSw0g58ha1XM7E83DaDiZ/7k8s1iTIm
	VFYUWORHHFxxeQ6roW2LFqsHOP+Y8JktMDn0ZNgkwwbx/yjT2Gkb8785dgL60EtOnznc
	pwzAloAPsQUtfQjEUdhTHwagzDmc6fDenPuKf9FqLcvfGle/o5Hla/ZHLG3EbZcC64sn
	O38g==
X-Gm-Message-State: AA+aEWZFRhwJgKp9yJDTBzoAHVIvObs9hVdvEzUciCmdS7BDzpL5gS8d
	3t+74V1pRHmTVEwsVzOwo1CTbg==
X-Google-Smtp-Source: AFSGD/V4tnt4tJ2OgEx+TFCEIKwEmbxFUOq/MpKTFmnC/Qf3w/Y5gAFpz67Qx2TKo31lsQjxgsfdXg==
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr2248586wrt.193.1544788622376; 
	Fri, 14 Dec 2018 03:57:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16sm4605103wrs.75.2018.12.14.03.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Dec 2018 03:57:01 -0800 (PST)
Message-ID: <e979391374175cfc7892e2ce464e88105c694bf4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 11:57:00 +0000
In-Reply-To: <20181214094319.2935-1-sno@netbsd.org>
References: <20181214094319.2935-1-sno@netbsd.org>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH] perl{,-native}: Update 5.24.4 -> 5.28.1
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
X-List-Received-Date: Fri, 14 Dec 2018 11:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 10:43 +0100, Jens Rehsack wrote:
> Update recipe for Perl Programming Language to 5.28.0:
> * update debian patches from perl_5.28.0-4.debian.tar.xz
> * re-introduce separation between platform specific and platform
>   independent library directories
> * introduce non-threaded Perl (by default), since it's up to 30%
>   faster
> * add alternatives for bundled bin/* scripts fof core-modules
> * add create_rdepends_inc() for rdepends.inc update
> 
> Changes in Perl Programming Language contained in this update:
> * https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perldelta.pod
> * 
> https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perl5280delta.pod
> * 
> https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perl5260delta.pod

Thanks for working on this. I gave it a run on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/38

So far I noticed several problems:

perl do_package_write_deb fails everywhere
perl fails to build on musl
perl do_package_qa gives many warnings

there could be further errors hidden in there. Certainly those ones
need addressing before we can retest.

Cheers,

Richard


