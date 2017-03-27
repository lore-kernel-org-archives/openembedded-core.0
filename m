Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E36A072F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490628053; x=1522164053;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=H4qHqDf5Q3Ap6df8CyjVArmChLP1p3KXdzLnh0tmqFA=;
	b=H5ke2ESh4Lw21zpq7jpJi3q/W0FsaDmONXTlyGqrujNWhy2Xu3s3GFXP
	ZIJKoLgLjgKi2rbAwVPZUzkwbG7xUQ==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 08:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="81078311"
Received: from unknown (HELO [10.219.128.124]) ([10.219.128.124])
	by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2017 08:20:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, juro.bystricky@intel.com
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
	<1490621920.13980.265.camel@linuxfoundation.org>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <6a17c688-b9ee-6b02-12fd-6797c24174bb@linux.intel.com>
Date: Mon, 27 Mar 2017 09:22:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1490621920.13980.265.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/3] oeqa/runtime: Import custom targets
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
X-List-Received-Date: Mon, 27 Mar 2017 15:20:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 27/03/17 07:38, Richard Purdie wrote:
> On Fri, 2017-03-24 at 15:06 -0700, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> This series allows to import custom targets to be used with runtime
>> testing.
>> Now is possible to have a target in <layer>/lib/oeqa/core/target and
>> testimage and testexport can use such target using TEST_TARGET
>> variable.
>>
>> To register a custom target you just need use decorate a target class
>> with
>> registerTarget, and set "targetName" attribute to the name that will
>> be used
>> by TEST_TARGET variable.
> Unfortunately something about this series break oe-selftest:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/229/st
> eps/Running%20oe-selftest/logs/stdio
>
> It doesn't do it in isolation, that test run by itself is fine. When
> run as part of oe-selftest it breaks though. I did bisect it down to
> this series and things have all built fine after I dropped these 3
> patches.
>
> So we'll have to figure out what is happening here...

I'm very sorry that you have to do a bisect to find this out :(

I did run selftest in my workstation to avoid this thing but it seems
it wasn't enough.

The problem is when importing the modules with
oe-test (outside bitbake). I did check it with python 3.4 but I didn't
test it with 3.5 so, I'll start with that.

Regards,
Mariano
>
> Cheers,
>
> Richard


