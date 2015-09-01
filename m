Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 71DED76D96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 12:51:42 +0000 (UTC)
Received: by iog7 with SMTP id 7so70199958iog.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 05:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=UER5KgbPLrJIvEZGTCrO6pXqjp+7R6ukEl5nhO5FzSw=;
	b=KWkCmUODOpkfWWtcSsctsX9QW9dLusAs081+4T5dKfBPSWDTICT36k5rqham2MQYvM
	MxSCq3C0u8MbcTOFb6aSkLIBjOvcmsIbPEWP+OTPlYpXLd9hOruBS96CCee5JIkTxDKF
	w2IzZrBCgujR/XJoqlZYYKIn/ZNsceo4YnX6bFH7XIAnR+A4mzAFnDgHVdoMQiOKcGau
	4N9KuoKixP1h8XrNEApXyo/ILqkrx3RWrCG7tct0NOazuTQZ9RrQor9Se0uonVtir5F+
	cUf5qC9yiqBYLQkFaVguUPQRnmEQf8KMSyuHTXC8Rd4fO632g2BgwonyFCWI4vKvl3cA
	4ItQ==
X-Gm-Message-State: ALoCoQmWh2XAIt/XoBrgM5Zbz3drBtfS388LikVJLVk5oG9nSLf4mPvVLMh0doshRzszKU0GQ5up
MIME-Version: 1.0
X-Received: by 10.107.8.20 with SMTP id 20mr14732583ioi.94.1441111902874; Tue,
	01 Sep 2015 05:51:42 -0700 (PDT)
Received: by 10.107.39.84 with HTTP; Tue, 1 Sep 2015 05:51:42 -0700 (PDT)
In-Reply-To: <CABcZANkeKcXKumkxmMTwtw=wt4i5ja+brbeQEuLdLLLO4cVBcA@mail.gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
	<CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
	<55E4AE5F.9080804@windriver.com>
	<CABcZANkeKcXKumkxmMTwtw=wt4i5ja+brbeQEuLdLLLO4cVBcA@mail.gmail.com>
Date: Tue, 1 Sep 2015 13:51:42 +0100
Message-ID: <CAPhnLPDxbV7KrJQ4FdYq7pLm1gb1MyNNY7QBcqXxCbU0Oc=qPA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Tue, 01 Sep 2015 12:51:47 -0000
Content-Type: text/plain; charset=UTF-8

On 31 August 2015 at 21:18, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Mon, Aug 31, 2015 at 12:43 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>>
>> If that is the way we want to move forward, then my recommendation would
>> be to
>> add a new field for that.
>>
>> LICENSE-SRC = "source license list"
>> LICENSE = "declared license for the expected output of the build"
>> LICENSE_<package> = "The license for the items in this specific package"
>>
>> Where:
>>
>>  LICENSE ?= "${LICENSE-SRC}"
>>
>>  LICENSE_<package> ?= "${LICENSE}"
>>
>> I see a lot of potential work here, but I don't see the benefit though.
>>

My .02 cents.

I can see the benefit, slim as it may be. Here is why. We make a bit
of assumptions about what a person is creating with OE and what they
are releasing. I can see situations where people do things like use it
to release an image with both packages and the original source on it.
Being able to tell that would be beneficial for endusers I'm sure, but
my question is, how often does this happen? I don't know the answer to
that.

>> I don't know of any cases where someone has gotten in trouble, or even
>> questioned, when the build system has a slightly different license then
>> output
>> of the build.  The GNU build tools are definitely the biggest example I
>> can give
>> here.
>

As much as I agree, I don't think our standard should be if anyone has
gotten in trouble before, but rather is the metadata we're providing
technically correct.

>
> I would say we should introduce LICENSE-SRC, alter archiver.bbclass to use
> it, and set LICENSE-SRC ?= "${LICENSE}" instead. Much less work, but then we
> have a variable we can append to if we run into a case like that which we've
> discussed, without increasing work for the more common cases.

I tend to agree here. If LICENSE-SRC isn't set, just assume LICENSE.
Let's talk about this today in the meeting.

-b

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

