Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2537D4F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:40:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3G8eKOi012218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2019 01:40:20 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 16 Apr 2019 01:40:19 -0700
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
	<20190415093825.GB4317@localhost>
	<CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
	<20190415162156.GA16706@localhost>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB5960C.2030408@windriver.com>
Date: Tue, 16 Apr 2019 16:45:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190415162156.GA16706@localhost>
X-Originating-IP: [128.224.162.194]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Tue, 16 Apr 2019 08:40:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月16日 00:21, Adrian Bunk wrote:
> On Mon, Apr 15, 2019 at 07:19:13AM -0700, Khem Raj wrote:
>>
>> What are you trying to convey ? That’s what I mentioned before I began my
>> reply however to reiterate my point was if a package is not usually built
>> and tested with this combination which is evident because it fails to build
>> then how good would it be if we fix this error especially complex packages
>> like compilers so is it worth to fix them or disable Og for them
>
> Packages that usually get built and tested with -Og should be pretty rare,
> and these specific build failures are better at finding the rare packages
> that use -Werror than pointing at potential miscompilations.
>
>>From a distribution point of view, a package build with -Werror by
> default is arguably a bug since this frequently breaks when something
> is changed (usually the compiler version).
>
> -Og is better suited than the -O that was previously used for debugging,
> but are we talking about debug builds or production builds?
> If users would be using DEBUG_OPTIMIZATION in production builds that

Thanks Adrian and Khem's response!
We indeed don't use DEBUG_OPTIMIZATION in production build.

But still comes question: how to silence gcc-sanitizers build failure 
when debug build enabled?

Thanks,

> would be wrong - this will always be a mostly untested situation
> with an increased probability of hitting bugs noone else has seen
> before.
>
> cu
> Adrian
>

