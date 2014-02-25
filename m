Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id E4A5F6F167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:52:52 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id i8so207586qcq.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SLtjHnaWvif/0/JNxTgj8sva1yaDaJZyV5x2apBHOno=;
	b=WPUJxo4bHuc629DJZ7z2tiF27H936qRymKu7jzJz+T6b4XFj+ho/Cc0Ic9liBFbbk+
	snDhKtfDA3hVqUf5zEMp3ez1ks00FnM12cUCQx3J8a+NcQ8xDWTKH8r7jWc6tSqmAAyh
	EdSVp0F3ht4mYKZjbwy7ACqcrVix+4ijBqB9AO6tic07UWXEvv9SryMcCo/WIC38R239
	p7dfhWeEhRzqgRLlFKGrRg3kzBighc16tGX+Xdn/HKE7n8XwqHpSFSTC6cdsjzZ8v6W+
	aFPEX5Xcx6azcPL3n6Ti5nc8OVjy5+6mkcDDDd+bQ5hVBOxuDrHWBOUH0w1OPQgRwgDQ
	39gA==
X-Gm-Message-State: ALoCoQkp6CZUoYi2HQYso2zhqhzoRbNu/3bp/56zKk0mpTSYfmO6u1FPXtdVAM1pSTM6hVmEbz8c
X-Received: by 10.224.127.129 with SMTP id g1mr36237820qas.22.1393321963489;
	Tue, 25 Feb 2014 01:52:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 25 Feb 2014 01:52:23 -0800 (PST)
In-Reply-To: <CAMKF1spGuggEKfnLchYMeU0ounonupUhsLkC0wU_7S6nX-W8KQ@mail.gmail.com>
References: <1393253881.31769.6.camel@ted>
	<CAMKF1spGuggEKfnLchYMeU0ounonupUhsLkC0wU_7S6nX-W8KQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Feb 2014 09:52:23 +0000
Message-ID: <CAJTo0LY1+hNB9hfjDTkB3N2uQZfgRSkP64F8=cBQxGWerT3W_w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 09:52:54 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2014 05:46, Khem Raj <raj.khem@gmail.com> wrote:
>> b) We introduce an "autotools2" class and have recipes inherit that.
>> This version would default to separate builddirs. It does mean change to
>> all the "good" recipes rather than the broken ones though and hence a
>> fair bit of churn.
>
> probably a better migration path can happen over time. may be we can raname
> existing autotools.bbclass to autotoolsold and have autotools.bbclass
> default to S != B
> that way the recipes which break can inherit autotoolsold and can have quick fix
> then we can slowly remove inheriting autotoolsold and finally remove
> the class itself.

I really don't see the point of this churn.  If autotools defaults to
B!=S then the recipe is going to need changing anyway, and adding
B=${S} in the recipe is far lower impact than having a fork of
autotools.bbclass that has one change and would need to remain (and be
maintained) for several release cycles.

Ross

