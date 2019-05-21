Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E71FE7E25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:28:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x64so2790528wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uy4lSuEQBauSBld6dW4jX7Wm4hdaPRHUO+hyje237Ak=;
	b=BkfKF3z1+xJ9sKMyPbn4pMdE+3aBcqoZdPEIZeEuk6VZDzrlICWxGV2a6lp81hZ1Wj
	u/uli1PnK3S1pNqtF0AkS1/xeZtzd48/dwSMgYv8bhv7eGRK0upjWs2jzmJMGbeIIGeX
	F9aO4DoUSejNfNxExWsCIwUTfYdie4oLutp90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uy4lSuEQBauSBld6dW4jX7Wm4hdaPRHUO+hyje237Ak=;
	b=dsILfWXbHdRvEtebTLcaqkRy2StSqHksl0SFdWz+C0oUmz6qxF19OSz0bfK8stRnx8
	+I7w6WnRX3R2R8AB0pxdBaMWHE85NQ8k7G2RcYUuUqvOKXPyU2oVAeF8psZlEQ2EIKaF
	RIrWxCREzCcNsU+883VMd5xQuY9tbcieBWNPmSlCS/dM7U90aQzaB9ogX/tcbjDh+Spy
	xRZu6+Fmbm/eDAq1LDaZlEos99nkAM4Ed9Rj7XPBcx5m+XE+9Cx0+N6QDfj7YPPYrnEe
	hdEGzEGR60pfDkQrPceqhTFvKLrKK16I+/s9X0+Fm5d7228gPKguRHf/bgl2PyofBNnv
	yPHQ==
X-Gm-Message-State: APjAAAXmQag4Rd2w0srYwXu+p2VupnXMNb8fTnV+4/5PyAKnKqlJqOoh
	5U6uhwuTmmrMfX+yXb+9lf6OxA==
X-Google-Smtp-Source: APXvYqyZi9koeCtLAgFOIg+TQ1xLowpCbfXrLx6/z/qc6KAfnxJa9OLVm97hYiZ/u2WuH7d5XxPiQQ==
X-Received: by 2002:a1c:3:: with SMTP id 3mr3442119wma.44.1558441740611;
	Tue, 21 May 2019 05:29:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j13sm17858059wru.78.2019.05.21.05.28.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 05:29:00 -0700 (PDT)
Message-ID: <8fdfdc3ba62711c9c3e6e391c8444e18d22e93b0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 13:28:58 +0100
In-Reply-To: <4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
References: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
	<20190516114914.12427-2-richard.purdie@linuxfoundation.org>
	<4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Tue, 21 May 2019 12:29:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-20 at 11:43 -0700, Khem Raj wrote:
> 
> On 5/16/19 4:49 AM, Richard Purdie wrote:
> > Avoid:
> > 
> > libgcc_s.so.1 must be installed for pthread_cancel to work
> > 
> > when running the ptest without libgcc.
> > 
> 
> this is interesting, do we get this error explicitly from running
> some 
> tests ?
> 
> I wonder why libgcc is not detected during rdep calculation time.

pthread_cancel doesn't directly link to anything in libgcc so there
isn't a dependency for the rdep calculations to find.

Ross has a work in progress where we'd notice binaries using
pthread_cancel and automatically add a libgcc dependency but its not
ready yet.

Cheers,

Richard


