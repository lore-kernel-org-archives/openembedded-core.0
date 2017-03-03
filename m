Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 473C6775D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:58:34 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id c11so80380172uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H8M0V6KuUlcvrjxW06VcEu7rBu7GYtxOwy4MWt20E10=;
	b=XTuzPSSfM07ylO2lYlCHGYYDlplJsLFueOsCdzqbiJj5m/pi9+4uB5k2jfLe07M8PR
	rWgcgNlwgMDoJjvlkPcZ1gy8yoex+oVJTmtFMipTSy2RaYDMP93ToGRvbfBPnDYKxyX8
	7LB54BML01XLaD3AXYMNdhAy42Ngmjh5dBsciBc8n46j6GOtSGWUMq3bl3WqMZTm3C7L
	DjPdDrhDvTO12t7Z6ZLYMcLAZvpqMHjdvpUfj4u1k+8NmnDospi/UR5WmaJFKGrWWRsv
	BlsaKyaqmygTcmGp/jrrmM5SvIZP48pml2fXzi1T9HxYEdY5ASESLjQlxtl2YScBq0AX
	KmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H8M0V6KuUlcvrjxW06VcEu7rBu7GYtxOwy4MWt20E10=;
	b=nEzlmu2+Uczdaq8ht9YP+vX7AhACtXWBnzPVJ3nwJyUb0pGX3e4T5+I0xbtzv0WM7B
	cpI4t8I8rAthIe0G6G+brP+nCMMFjfn9nUf/tp/V1wn1ziApaUdfKRxhHYGpb12hVf3k
	6H430p9VfECmV0M1WY4jqcmYKJeIQUkVm8jSfb/2xc0PFVCSDc29eiqanqKg9j2aLM6H
	DxeeNdaFoIHZlEvod2S5bn+dO78QlS8XzRW2YBsf4zWMccCixEARCCqx2DfJxzzF/U/O
	3cI+4QuzHKGfARJNk5y4r9gIBOm0i6S/0qgNXPXkbQEyFuo7iJTLzmCoPtsxqBTnLmLV
	122Q==
X-Gm-Message-State: AMke39mG6hrEWYquD0+4tWEM1VsTwCR3b4yShCRJ5gg/UA/Wqx1hL8iufCuAP1k+izt1uH5Uk16DIPdhWy5Cbg==
X-Received: by 10.176.70.66 with SMTP id z2mr1893546uab.69.1488581915957; Fri,
	03 Mar 2017 14:58:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Fri, 3 Mar 2017 14:58:05 -0800 (PST)
In-Reply-To: <CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
	<CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Mar 2017 14:58:05 -0800
Message-ID: <CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Fri, 03 Mar 2017 22:58:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 2:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 March 2017 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > Enabling building the Intel Memory Protection Extension library for x86.
>> >
>>
>> hope this works on amd chips as well ?
>
>
> https://en.wikipedia.org/wiki/Intel_MPX
>
> It depends on new instructions, so you'll have to ask AMD. :)

OK if its not so then perhaps a bbappend in meta-intel is more appropriate.

>
> Ross

