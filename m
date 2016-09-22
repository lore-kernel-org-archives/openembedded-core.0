Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7F971979
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 08:56:31 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id w84so239759160wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iOtQ1uECugYnyHHI3hyVehKEr19MwqvXwwyBIIiPG2M=;
	b=ktEcWuZErqnqoBcvnRWyoY30TI5rkbebfVcauLoQlQkjASoa51BdIz3wg3XFOU+Lbs
	NkHa4htqeCiEDo0fZ9hOtRBySvuHu+wznu1O6zzOwYNux5bFSo6r4FMkan1THV2oq/85
	ytDEXwD0CeGiuu09l+0w6T43ph2AgOkvgT7Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iOtQ1uECugYnyHHI3hyVehKEr19MwqvXwwyBIIiPG2M=;
	b=ZkggmLzvtx0Xspt81mXopgul5gnI41d019s5p9xbATy4KXsrKBXZ0mZINwhSMX31qL
	HPNu4so9bh74lS237rrM4VA0TAgQBdDydMu28fHWAmcewec44vVbqXpCk97Fw+aN+8Jh
	0Q6MqW0BGCkNHLWfMf94t/66tFoA3JZMq0ljNUdnLsudA1oLLAKw6J2kTYzdHTdGsiEB
	fek7eIp0BzqZOSVyCSj/kVN9F8dhhUrzczV9b9PC0m6S9ABaKAZgATuso5osA+eVbtfZ
	yqhNyA/IO86iJxGKPZPZRdGhxPCn1zg/lCHcpLL2ZBwgXj+zklbqBMCXie7u0J0Pwj5j
	zy8Q==
X-Gm-Message-State: AE9vXwPUyr2jtmvwvVD3pedXiRjip0+PsnnMJS6wMkzSLhFTNkFlgAhc3JfDnmPZwH2syYoMdDxgpjebHbjx1xBW
X-Received: by 10.28.188.198 with SMTP id m189mr7745142wmf.48.1474534592745;
	Thu, 22 Sep 2016 01:56:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.129.196 with HTTP; Thu, 22 Sep 2016 01:56:31 -0700 (PDT)
In-Reply-To: <d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
References: <1411725589-20460-1-git-send-email-fathi.boudra@linaro.org>
	<57E09AFD.4040006@windriver.com>
	<CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
	<d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 22 Sep 2016 11:56:31 +0300
Message-ID: <CAGNsrLBPAMwiSzA8X4M8ni+LUMA7x+oKMtTP1TVO0-U7c1vmeA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libunwind: add aarch64 support
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
X-List-Received-Date: Thu, 22 Sep 2016 08:56:32 -0000
Content-Type: text/plain; charset=UTF-8

On 20 September 2016 at 17:21, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2016-09-20 07:57 AM, Fathi Boudra wrote:
>>
>> Hi,
>>
>> On 20 September 2016 at 05:12, ChenQi <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>>
>>> On 09/26/2014 05:59 PM, Fathi Boudra wrote:
>>>>
>>>>
>>>> * pass --enable-debug-frame on aarch64 architecture
>>>
>>>
>>>
>>> Hi Fathi,
>>>
>>> I'm now dealing with a problem related to libunwind support on aarch64.
>>> Could you please tell me why '--enable-debug-frame' is needed for
>>> aarch64?
>>
>>
>> libunwind needs to be configured with --enable-debug-frame to prevent a
>> linkage error.
>> Note: --enable-debug-frame is automatically selected on ARM32, not on
>> ARM64.
>>

Admittedly, I haven't checked recently and things may have progressed upstream.
I'm going to double check with our toolchain guys.

> Thanks.
> We dropped the configuration flag and don't see any linking/linkage
> problems yet. Can you be more specific about the problems encountered?
>
> Our goal is to make tcmalloc from gperftools work on ARM64.
>
> ../Randy

