Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC02675260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 07:34:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a8-v6so2674173wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ctw8XASpFJ47EYuqJpf//nXjYI07salBB6zTAuGcSk8=;
	b=fjZ9oS2ovtv4ZNbaVOYvEf3l8rRjroE/GL9m1Ibe3I5e8H/95dAYnkEywca2+3H0dJ
	BIFu/MVpFk9ZHJMCkdI3K9cb9uwJnh3SKYMG4nKB5CXBRbeYyQln+oAcWmEvZJQkFaTM
	MVCfzyncW5aGen12docxZOOjBOxqKqmFmJA4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ctw8XASpFJ47EYuqJpf//nXjYI07salBB6zTAuGcSk8=;
	b=n2aP5E1lNw3Eq68bIQy5cl4BmfoKzpaTW9vStp6jhBdpTpQcgLJnYCEg4q2z3daORM
	G5PK1M07cLGFrJ4Mm9NGdjBxBLDg6Xkaqay1RNQ4vouEo/sdzYogXcxOJlPGjEW6mOkZ
	+BW0h57myqZpmI2yKLCD+54XOcYO9P0WTMrcAdqVop7HLMqWeX77v10S9p9LMuLOzv/O
	TXLg9lmU5HK3LKrHF4rgcdeZfCCP/GRb2/RGz/2Mu/oHr5XT2HI+kpRG7UL0PMAvqmDJ
	LC9ym1VV1QSJB/tc79ki31/1Y8W/zl7Cwo5MFHSy1MXiTrQqenadpQ9aj94mdCVPT18j
	lfBg==
X-Gm-Message-State: ABuFfoiHNX25cBfhchCsSy6GuoG/U4nn+UGODF+oevs/pubyrz/Y1uWH
	vg20IEQymnY25cuOQbycEqWO4A==
X-Google-Smtp-Source: ACcGV63nee0/49hTwUYpvE9xnkbLjvaa7HReKy3d07rCpqg7WXg2im+nIg7MRFrylNUSInx1jL9ldA==
X-Received: by 2002:a1c:1694:: with SMTP id
	142-v6mr3683039wmw.113.1539934468239; 
	Fri, 19 Oct 2018 00:34:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r131-v6sm3697919wmb.32.2018.10.19.00.34.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Oct 2018 00:34:27 -0700 (PDT)
Message-ID: <87b2b6679d3ce495e99660d0978360fc01c65286.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Oct 2018 08:34:26 +0100
In-Reply-To: <fb27f898-4792-aba3-cc3e-c9c15204a003@windriver.com>
References: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
	<20181017022220.20841-2-Randy.MacLeod@windriver.com>
	<a8a5a1b9c5b5f477c5d6a119564f86ae4a8df342.camel@linuxfoundation.org>
	<CAMKF1spqvkXcedaEWQ-5qy_kCX4FLg5m2o0WA+nQzkRwUCeoPA@mail.gmail.com>
	<fb27f898-4792-aba3-cc3e-c9c15204a003@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Fri, 19 Oct 2018 07:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-18 at 19:12 -0400, Randy MacLeod wrote:
> For v2 I'll fix the build for musl and
> remove that unused patch that patchworks pointed out.
> 
> All the glibc builds succeeded except for arm and mips64
> which were not supported by the recipe. I'll check on that
> with the new version of valgrind at some point, likely on
> master-wr-> 2.6.1.
> 
> 
> 
> Here is the pass rate compared to 2.6-M3 QA run:
> 
> Test run:       qa-3.13   vg-3.14   vg-3.13
> 
> Tests ran       558       547       538
> Passed          215       287       201
> Failed          343       260       337
> Passrate 	38.53     52.5      37.4
> Last Passrate   49.1

Thanks, that at least suggests we are probably better off upgrading and
we can do so based on real data! :)

> where:
>    qa-3.13 is from the 2.6-M3 QA report
>    vg-3.14 is this update and
>    vg-3.13 is with this update removed using poky at:
>       3b77e7b785 systemtap: Fix issues from 4.0 upgrade
> 
> So the ptest results really are better and they are even
> better than the last pass rate that QA reported.
> Nonetheless, a 52.5% pass rate isn't good enough so
> I'll work on that for master-wr with backports to 2.6.1.
> 
> ../Randy
> 
> 
> 
> Some notes and more raw data than presented above.
> 
> BTW, I allocated 4G RAM to the qemu machine
> after running with the default and seeing the OOM killer
> run many times. I wonder if the QA test doesn't allocate
> enough RAM to deal with valgrind's high overhead.

Ross' comments based on Maxin's work looking at valgrind ptest were
that the tests do end up OOM a lot and aren't particularly
stable/predictable. More investigation is clearly needed to understand
what is going on...

Cheers,

Richard



