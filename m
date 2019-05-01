Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4A98F7D906
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 11:34:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k23so1338965wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=G3nAuvBmlsBheAA4Vwu4ndvSGRCTItRFo3+dorRSvVY=;
	b=ReyORajUX81qS0+yD9FwadFD7wf/OsaEDaXIrFGfonDT15u865Htmo+L2Fzb0Mvofo
	HBwlzPcrvz9oCF7g0AK98EO3N+H2+Nkfftg6gScBeoenNB3uq48zMDvoQOCzn4h3C0it
	iC5Qn/CEbxZAzk0He2b32N23OqKUHswRH81lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=G3nAuvBmlsBheAA4Vwu4ndvSGRCTItRFo3+dorRSvVY=;
	b=d8psPwvhnKMSXiuXOTNLh3+qFPtIzlZt7s8iik8EMeQNqd9+GuncqgHmqTQpXmsVGk
	c/SYGXAUSOevzYwlhQ4NXPH4bTnPfYhM0w9ugkUhux9nXf231MPE3G4a8pl9+prgh+Hk
	fGH5WK0TUvQW2ZZN+/1oVKw5AW7FTnDpO9/QMGdIvsYeaWSe0k/lPLQu3OBcPHwzQaJm
	mXychj/ZDXTqCEziij9XJBx3wJbLWsqHwNQGnYodqDRAo1IYY3vxUQS70XIjJiu8qyxy
	q6lei9y9OMa7HvupNTWbmZqlk66egykPaxFTwBCwArVlxHdGsXnX3u54UY6BYzk3b68L
	0soA==
X-Gm-Message-State: APjAAAWYzr6T9Gurnm0Jhus35am/+E2eyj4zJr1AlxO5fuhezCST7G1M
	u4NdouH/buy2sbJ6pF4fFcfQiQ==
X-Google-Smtp-Source: APXvYqzq4xxJEDYP+gt1e5Eo/ebV6mbAiKhBqHRuGjiPwIOQ9FtH+UAGUxEqiCqOGK8VU9y45FoZmA==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr12961971wrm.197.1556710479099; 
	Wed, 01 May 2019 04:34:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f128sm6235494wme.28.2019.05.01.04.34.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 04:34:38 -0700 (PDT)
Message-ID: <593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 01 May 2019 12:34:37 +0100
In-Reply-To: <20190430192414.43383-1-raj.khem@gmail.com>
References: <20190430192414.43383-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Wed, 01 May 2019 11:34:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 12:24 -0700, Khem Raj wrote:
> Its already in RC phase now.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I ran this on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/429
http://errors.yoctoproject.org/Errors/Details/238976/

Basic summary:

a) gcc-source needs a maintainers.inc entry (selftest fail)
b) fortran selftest is broken
c) mdadm fails to compile
d) runtime test gpp2 fails
e) systemd fails to compile
f) on target runtime g++ compile tests fail


error from f and d look related:

Exception: Command cd ~/buildtest/lzip-1.19; make  failed with exit
code 2: g++  -Wall -W -O2 -c -o arg_parser.o arg_parser.cc
arg_parser.cc:20:10: fatal error: cstring: No such file or directory
   20 | #include <cstring>
      |          ^~~~~~~~~
compilation terminated.


DEBUG: Partial data from SSH call: /tmp/test.cpp:1:10: fatal error:
limits: No such file or directory
    1 | #include <limits>
      |          ^~~~~~~~
compilation terminated.

DEBUG: time: 1556703543.2447464, endtime: 1556703843.2447433

RESULTS - buildlzip.BuildLzipTest.test_lzip - Testcase 206: ERROR (0.79s)
RESULTS - gcc.GccCompileTest.test_gpp2_compile - Testcase 1142: FAILED (0.71s)

Build will look a lot happier with the on target C++ headers fixed! Not
too bad for a first pass :)

Cheers,

Richard


