Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8776A606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 14:01:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u11E1kvS023309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 1 Feb 2016 06:01:46 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Feb 2016 06:01:45 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
	<718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
	<56AC1101.70209@windriver.com>
	<B88596E1-A5F6-4199-89D8-194E48A06742@gmail.com>
	<1454151423.10340.84.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56AF6538.9010000@windriver.com>
Date: Mon, 1 Feb 2016 22:01:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454151423.10340.84.camel@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Mon, 01 Feb 2016 14:01:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2016 06:57 PM, Richard Purdie wrote:
> On Fri, 2016-01-29 at 18:36 -0800, Khem Raj wrote:
>>> On Jan 29, 2016, at 5:25 PM, Hongxu Jia <hongxu.jia@windriver.com>
>>> wrote:
>>>
>>> On 01/30/2016 01:47 AM, Peter Kjellerstedt wrote:
>>>> Wouldn't it be better to swap the first and second commit and
>>>> then
>>>> move the addition of -gno-record-debug-prefix-map to the other
>>>> commit
>>>> where -fdebug-prefix-map are added.
>>> OK
>>>
>>>> You must also remember that not all use the compiler provided by
>>>> OE-Core, so adding -gno-record-debug-prefix-map unconditionally
>>>> to
>>>> DEBUG_CFLAGS will break with unpatched compilers... (This also
>>>> indicates that "Upstream-Status: Inappropriate [oe specific]" may
>>>> not be quite right if you want this to be supported by other
>>>> compiler versions).
>>> Agree, we should conditionally add -gno-record-debug-prefix-map to
>>> support other compiler. Thank you for pointing it out.
>> its not only non gcc compilers, we also have gcc 4.9 still.
> I think we do likely need to patch 4.9. For other compilers than that,
> or other compilers, I'd suggest that people can either define a set of
> DEBUG_CFLAGS, or set:
>
> DEBUG_CFLAGS_remove = "-gno-record-debug-prefix-map"
>
> to avoid problems. I'm not sure making it conditional in some way is
> any better than just using the above line.

Got it, I will do it in V4.

//Hongxu


> Cheers,
>
> Richard


