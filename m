Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED4572677
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 12:06:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBH9fMTS011554
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Dec 2014 01:41:22 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Dec 2014 01:41:21 -0800
Message-ID: <54914FC0.9060202@windriver.com>
Date: Wed, 17 Dec 2014 17:41:20 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Fathi Boudra <fathi.boudra@linaro.org>
References: <cover.1415350038.git.kai.kang@windriver.com>	<1a6294d4421862267755ac8cd71ffd91cce16902.1415350038.git.kai.kang@windriver.com>	<CAJTo0LZqEAbtSdPfpb13VcC+JM99G_Rmv4wbcj=50aT83JRKgg@mail.gmail.com>	<54914493.2030600@windriver.com>
	<CAGNsrLBAhNGxjm8iLkx05PggsNjVo2dzzNo9kqbLRzu=-4Z2eA@mail.gmail.com>
In-Reply-To: <CAGNsrLBAhNGxjm8iLkx05PggsNjVo2dzzNo9kqbLRzu=-4Z2eA@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/24] libunwind: add aarch64 support
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
X-List-Received-Date: Wed, 17 Dec 2014 12:06:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月17日 17:23, Fathi Boudra wrote:
> On 17 December 2014 at 10:53, Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2014年12月09日 04:56, Burton, Ross wrote:
>>> On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:
>>>
>>>>     - Support-building-with-older-compilers (fix undefined reference to
>>>>       `unreachable' on older compilers)
>>>>
>>> This patch is missing a signed-off-by header, and considering that oe-core
>>> has gcc 4.9 do we still need this, or is it specific to a commercial
>>> product that is using an older toolchain?
> we still need this.
>
>> It is ok to drop this patch for gcc 4.9. I'll do it.
> no, it isn't ok to drop this patch. aarch64 support is still needed in
> libunwind.

I mean Support-building-with-older-compilers.patch. Do we still need it?

--Kai

>
>> --Kai
>>
>>> Ross
>>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>


-- 
Regards,
Neil | Kai Kang


