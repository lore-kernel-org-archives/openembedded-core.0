Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BA7A360043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 16:17:17 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so113592660pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SgEhCZyB3STjcMg0ZhJ550rD9Cyc/teezfKrnihMpK4=;
	b=OU8ZOMBVr80REMLhE14HAgfd6mWkxQwrqanTxrvCIdFlcSNxrU4vqpHOreqM8iVnG5
	kyKEehzEQPM1mGpJLg7HZpE+9ACj52saipyb54vvNQOjHOuBNa//nP66yfiVw++VR3Ln
	Jc8EP9mvujoy/xSZTTnIee7zzHLOzpvQjURHlSQV95xTKb3+57OF/jimOTeo3CDrjcTA
	DtX9hL3wQ9u7fi7PM7F8IHoCK/AG11+AUW6g6XYoUXn6fx7zn4Rr6KjC68ff0q1NDSxU
	b/MUpkvdIubslmVzCeocA/O+PAluVeM7kLPmyjQB6v+M9Q9zE4ZMnFtQWjPHX+MBS49M
	DoIw==
X-Received: by 10.68.92.5 with SMTP id ci5mr20111271pbb.109.1431361038439;
	Mon, 11 May 2015 09:17:18 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d?
	([2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d])
	by mx.google.com with ESMTPSA id d3sm13524721pbu.93.2015.05.11.09.17.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 09:17:17 -0700 (PDT)
Message-ID: <5550D60B.9050707@gmail.com>
Date: Mon, 11 May 2015 09:17:15 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<CAMKF1sriNnycqHYmhayqaGs2pD8mKAzrd5YLBVrZei4cYW7TNQ@mail.gmail.com>
In-Reply-To: <CAMKF1sriNnycqHYmhayqaGs2pD8mKAzrd5YLBVrZei4cYW7TNQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Mon, 11 May 2015 16:17:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2015 08:47 AM, Khem Raj wrote:
> On Sun, May 10, 2015 at 3:03 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I like the idea of a common include to handle this a lot better.
>>
>> FWIW, I tried gcc 5 on the autobuilder. The results were 141 failures so
>> far:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150
>>
>
> linux-yocto 3.14 needs to backport
> https://patchwork.ozlabs.org/patch/403787/ for all relvant branches
>
> For some ppc recipes failing with undefined .LCx smbols we need to not use -O2
> mips64 is new havent tried and tested those yet

arm64 kernel build failed don't recall how many packages.

- armin
>
>> Cheers,
>>
>> Richard

