Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id A5822612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:26:47 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id gf12so1842215vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 01:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=piQ8iSWPFJY7oNQDb1ar6CM+Cbvmc7elyatxBbsgBr4=;
	b=mO/Om8t5nNLlAKitlO9lmIsZYk6FS1squZFWU1tbOFjjoARQkmwNX6Qy3o+XEp+/HC
	7PnbGmlcpv+w8a8Wv74ly1unKFA4fs3O8ozfqC51OCop41qMggKrPCVGO88gr39Mlwxo
	A43WzsKlvchzpwdu2IjFAPzniVMQF55V6uCjgR13gVhlxsA3FLPyi88HZsFp1CNUWEB+
	OtEaMWMXhF2yo+4T5seTXTXSzxpnOC5CuPIlemteQsqxE5oIxAbAk4t/wOIgP1b3e8eC
	/SxwWMo/9VN+VLPe0f0vq7mqZBOGcZm7lUeCgqkPXo3i2MHRI5rTfzek5zBSbQOtzvdF
	0wmg==
X-Received: by 10.220.1.9 with SMTP id 9mr8234667vcd.37.1375086408149; Mon, 29
	Jul 2013 01:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 01:26:28 -0700 (PDT)
In-Reply-To: <51F610E7.9090905@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1374842117-24504-4-git-send-email-jukka.rissanen@linux.intel.com>
	<51F2C589.7080706@linux.intel.com> <51F610E7.9090905@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 09:26:28 +0100
Message-ID: <CAJTo0LamL5DztOFRna7hr7yJtMUBxqX=C8N5eH3j3DxveVQ_rg@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Gm-Message-State: ALoCoQl5BBqZRpGsIqQUE7qFkPRB0fudNy2VLvkfk7i/giBkzS+SJhcGcTot8khNqAMhwz/6rAiu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] ofono: Enable test scripts by default
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
X-List-Received-Date: Mon, 29 Jul 2013 08:26:47 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 07:51, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
>> I think you should be using the ptest here instead of test and inherit
>> ptest, please see the ptest.bbclass.
>>
>> I realize that this is not new code, but if we are going to changes this
>> we should use the new ptest mechanism.
>
> If I am reading https://wiki.yoctoproject.org/wiki/Ptest correctly, the
> ptest if for running the package test suite. Unfortunately the ofono-tests
> package is not for that purpose, it is just a bunch of useful python scripts
> for setting up cellular modem, context and monitoring ofono signals etc.
> Similar scripts are also found in connman and neard packages.

You're right Jukka, whilst ptest is something that everyone should be
considering it's for test suites that typically run at "make check",
these are not that.

Ross

