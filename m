Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id BB845708AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:43:38 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id at20so7618971iec.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Yn52/4ra3oW96fG3gy0QcFQi+BIAm03ypgzH2/a/oe4=;
	b=Sg66cO7pD7RbJPsNanEliOTlxmdyrLvwfOP+pIDsr8E2QE82ndf8lD7aqeG3X81txc
	BAJw+zPX+3RhLH6EcPI53fouk+HIegrwmaymasYWGYOMvZdkK8erPdDPt26bbOVEfjTL
	ghqIQFQ7PjMZlMjFnz7kqIcJDuZWedJEfoUVMTLtjGZ0pOvihcuR5oD2nevwel5LDXSK
	jEmJutY1AEge1xzbsCjgaMSTpi22OovH/uUGA28vlr36gzWMX4JoiDB7mPY7TYXSVArc
	k1xtOsVHeaxJb7+IXWt1t7U0F1lt3YOmzpbmg2LX+4Pj1anRqlSv4yn82Pg5XHr2N4Lj
	+N9Q==
X-Received: by 10.42.90.74 with SMTP id j10mr778858icm.29.1406594619486; Mon,
	28 Jul 2014 17:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 17:43:09 -0700 (PDT)
In-Reply-To: <53D6EC88.1000001@windriver.com>
References: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1soxPmXjX6bbcto=c1qHvJB1bgdJdgTpz8dA-ibBp-7Tgg@mail.gmail.com>
	<53D6EC88.1000001@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 17:43:09 -0700
Message-ID: <CAMKF1so6G_mGW0jMXYS6Mf+PFVXQV8Vt=fkb=55Gc6p4LsRoTA@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: redefine a function
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
X-List-Received-Date: Tue, 29 Jul 2014 00:43:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 5:36 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>
> On 07/29/2014 01:25 AM, Khem Raj wrote:
>>
>> On Mon, Jul 28, 2014 at 4:01 AM,  <rongqing.li@windriver.com> wrote:
>>>
>>> +[PATCH] reimplement umul_ppmm to make it be able to building on mips64
>>> 64bit ABI
>>> +
>>> +Upstream-Status: Pending[This version was not maintained by upstream,
>>> larger versions have been fixed]
>>> +
>>
>>
>> if you mean newer release have been fixed then this patch should be
>> marked 'Backport'
>>
>
>
> newer releases are GPLv3, we can not backport patch from them

I see. So you did a clean room implementation then ? if not then
you could request the original patch author to release it under GPLv2
license for back portability

>
> -R
>
>>
>
> --
> Best Reagrds,
> Roy | RongQing Li

