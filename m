Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id AB5D861788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 10:20:56 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so1009406vbg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 03:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/asUmje5+AmZJzjdaDecP2cUOHy+P7FdebHewwAFY8E=;
	b=bd21SpInICgr9Err4qlwn8MtzOND7ZOR+OIgcqyFS6avH1wZGxKntdRcxpO0Jnjr7F
	cxR2/SF1vXLAJ04DBRHPrx8I1lXXr7NhERpLPzHrcL+kJz9Sge9rMJ7MrcPY3BsfgZbf
	uoXenrrh0ERpfneLWrPcdHG3OUciFv9vj5PtXx2zDUGYqSCsrrVlDUta0L2F7gHPrLvL
	smjoNGiCNnN9rZk8CfJYInMPE31PDQCgA7DLt0X1mP3ou3j117r6V8f3W5Xp/StMdcWp
	0xDXOofWSG2TdtXmjvE5ohZttTT2MgGvAEI3ctuO4KaKhpZOcnqYjBOC3YwQ6mTD0DEM
	UUzg==
X-Gm-Message-State: ALoCoQmrSLRZsbHr1hE9G1M6qBsHX3gF7vd6ulFpqAnYdkz3dsXujFmge6om/mg9PTv/18ZIOTg/
X-Received: by 10.220.11.7 with SMTP id r7mr5224362vcr.12.1378376458357; Thu,
	05 Sep 2013 03:20:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 03:20:38 -0700 (PDT)
In-Reply-To: <20130905071133.GG11500@jama>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 11:20:38 +0100
Message-ID: <CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 10:20:57 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 08:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> I don't think this is right way to do it.
>
> It's good to have as many optional modules available in feed (so to
> enable many modules in configs - you never know what obscure device
> someone will try to test with qemu and one more module and package in
> feed has smaller overhead then need to change configs) and install
> only important modules by default in every image.

But isn't the range of devices supported on a particular qemu machine
incredibly limited?

I've also decided that maybe systemd isn't being quite as clever as it
should and maybe fixing it there is the real fix.

Ross

