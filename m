Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B724747FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:30:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h2-v6so5096778wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e9/nLJ+M2PYMUgGRcvYaXmDEfB6tnI+MTz584UJu8VY=;
	b=fJlEB1cuHY83gX6WBUP/GGbDYG4XWCBSltgnFoPFDH+459t2zwUBlfDcPOab2wVwz/
	vAIwwF2AEz49vbCSYdMaL1BIZ+xH13bjM70UQ67EZ2gxPoPCwaY+C+DGVbs+FdKLVBU4
	2P24K5HzZDp1AZUbzgHeqY2erfRz3spdq0B7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e9/nLJ+M2PYMUgGRcvYaXmDEfB6tnI+MTz584UJu8VY=;
	b=Xke8W5RuNfZr1sCdBBhC0YyLtp9+BhPtWu68aN9xY3iqehstbwvgja1xGT4AilSj+N
	p0TeTMr4omRPzgO24m+3KNaGibPbeTmDR8JtDTaccPgjV2UNTSY1p3zCQlgS2/QLmgeD
	IoKRUM6qX2GzWK1170pAp4U12158p+TD5zW1c0J7tAUYOMQvBGNZxljGxsEC4P+hslQ/
	Yz+E8dACxpACsA7DmXKYehzebz0lxR70PcH8XVlR3oTneLZmHNbCqIapiNCpJyVaGoRs
	PR1VeZ+3+pqJIBzkO38RDbx4Yr2iUoQHOa176Rd7hqRfbMxKy2FyfJq4tfq1obI0DB7i
	5Ozw==
X-Gm-Message-State: AGRZ1gJI1AJdleysMgCflUUxtUnOdKmzGbZJMOlfn8QQfMJ6radJ3jnr
	IZc4n2Om7ohFO1H+Gx/RvYU9RQ==
X-Google-Smtp-Source: AJdET5eYlvtSzCgCfmm7wRueBHvommAXX+Sbpy/d643Ffxzdr3SV/6HOhSCG7wJQ8Z5yrNHNlB+1Bw==
X-Received: by 2002:a1c:19c2:: with SMTP id
	185-v6mr15506018wmz.4.1540830640942; 
	Mon, 29 Oct 2018 09:30:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm2113030wrs.67.2018.10.29.09.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 09:30:39 -0700 (PDT)
Message-ID: <08d89f07eca5ba249ab527f83f258cd45d7cb70d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>
Date: Mon, 29 Oct 2018 16:30:38 +0000
In-Reply-To: <CAMKF1sqhaOzFwUy2fjJwH9c2AZh39jbBMeSfZYOY3MkW_+kX7w@mail.gmail.com>
References: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
	<46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
	<3746db69-c37e-4500-4780-bfe24bdafdd2@windriver.com>
	<CAMKF1sqhaOzFwUy2fjJwH9c2AZh39jbBMeSfZYOY3MkW_+kX7w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Mon, 29 Oct 2018 16:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-29 at 09:18 -0700, Khem Raj wrote:
> On Tue, Oct 23, 2018 at 11:53 PM Changqing Li
> <changqing.li@windriver.com> wrote:
> > 
> > 
> > 
> > On 10/24/2018 02:04 PM, Richard Purdie wrote:
> > > On Wed, 2018-10-24 at 11:30 +0800, changqing.li@windriver.com
> > > wrote:
> > > > From: Changqing Li <changqing.li@windriver.com>
> > > > 
> > > > when do parallel build, like run "make install -j 48", openssl
> > > > will
> > > > do_install
> > > > failed with below error:
> > > > mv: cannot stat 'openssl/1.1.1-
> > > > r0/image/usr/lib/libcrypto.so.1.1.new': No such file or
> > > > directory
> > > > Makefile:318: recipe for target 'install_dev' failed
> > > > 
> > > > problem caused by target install_dev and target
> > > > install_runtime, both
> > > > installed
> > > > libcrypto.so.1.1, result in log:
> > > > *** Installing development files
> > > > ...
> > > > install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> > > > link /var/tmp/foo/lib/libcrypto.so ->
> > > > /var/tmp/foo/lib/libcrypto.so.1.1
> > > > ...
> > > > *** Installing runtime files
> > > > install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> > > > 
> > > > command in install_dev and install_runtime will have parallel
> > > > competition.
> > > > 
> > > > have create an issue to upstream:
> > > > 
https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> > > > 
> > > > but upstream won't support this condition, so use this fix as a
> > > > workaround to fix the problem.
> > > 
> > > This means that:
> > > 
> > > a) Upstream don't support parallel make install
> > > b) Reject patches fixing any bugs in parallel make install
> > > 
> > > This means the Upstream-Status should be rejected with the link
> > > above,
> > > not pending. It also means we may need to think about not using
> > > parallel install although since its working, its tempting to
> > > carry
> > > patches and keep using it if it works.
> > > 
> > > It may be worth pointing out to upstream that it is mostly
> > > working for
> > > us? I am a little worried they know something we don't about
> > > problems
> > > this could run into.
> > > 
> > > Cheers,
> > > 
> > > Richard
> > > 
> > > 
> > 
> > I will point out to upstream that it is mostly working for us,  and
> > ask upstream suggestion about potential problem of parallel build.
> > 
> > if upstream think no obvious potential problem can seen,  I will
> > change
> > upstream-status to reject and resend the patch.
> > 
> > if upstream recommend not to do parallel build,  I will add
> > something
> > like below
> > to stop parallel build for make install, and resend the patch, but
> > in
> > this case,  build
> > openssl  will very slow.
> > 
> > ifneq ($(filter install,$(MAKECMDGOALS)),)
> > .NOTPARALLEL:
> > endif
> 
> I think its best to convince or follow upstream here. Making install
> target as serial might be best approach if there are other issues
> with
> parallel install that upstream is uncomfortable with such a patch we
> should try to find more.

If you follow the upstream discussion they originally said no, then
they are possibly reconsidering after I explained more about the
situation. I've not seen a fix land yet but they did say they are
working on one.

If anyone wants to +1 them fixing it, feel free:

https://github.com/openssl/openssl/issues/7466#issuecomment-432938981

Cheers,

Richard




